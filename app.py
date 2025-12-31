from flask import Flask, request, jsonify
from flask_cors import CORS
import psycopg2
from psycopg2.extras import RealDictCursor
import PyPDF2
import io
import re
from collections import Counter
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
CORS(app)

# Database configuration
DB_CONFIG = {
    'dbname': 'job_matching',
    'user': 'postgres',
    'password': 'dummy',  # Change this to your PostgreSQL password
    'host': 'localhost',
    'port': '5432'
}

# Comprehensive skill dictionary for matching
SKILL_KEYWORDS = {
    # Engineering Skills
    'AutoCAD': ['autocad', 'auto cad', 'cad'],
    'SolidWorks': ['solidworks', 'solid works'],
    'MATLAB': ['matlab', 'mat lab'],
    'CAD': ['cad', 'computer aided design'],
    'Mechanical Design': ['mechanical design', 'mechanical engineering design'],
    'Civil Engineering': ['civil engineering', 'civil engineer'],
    'Structural Analysis': ['structural analysis', 'structural design'],
    'Project Management': ['project management', 'project manager', 'pmp'],
    'Electrical Engineering': ['electrical engineering', 'electrical engineer', 'electronics'],
    'Circuit Design': ['circuit design', 'circuit analysis', 'pcb design'],
    'HVAC': ['hvac', 'heating ventilation', 'air conditioning'],
    'Construction Management': ['construction management', 'construction manager'],
    'Blueprint Reading': ['blueprint', 'technical drawing', 'reading blueprints'],
    'Quality Control': ['quality control', 'quality assurance', 'qa', 'qc'],
    'Six Sigma': ['six sigma', 'lean six sigma', 'lean'],
    
    # IT Skills
    'Python': ['python', 'django', 'flask', 'pandas', 'numpy'],
    'Java': ['java', 'spring', 'hibernate', 'j2ee'],
    'JavaScript': ['javascript', 'js', 'ecmascript'],
    'React': ['react', 'reactjs', 'react.js'],
    'Node.js': ['node', 'nodejs', 'node.js', 'express'],
    'SQL': ['sql', 'mysql', 'postgresql', 'oracle', 't-sql', 'plsql'],
    'MongoDB': ['mongodb', 'mongo', 'nosql'],
    'AWS': ['aws', 'amazon web services', 'ec2', 's3', 'lambda'],
    'Azure': ['azure', 'microsoft azure'],
    'Docker': ['docker', 'containerization', 'container'],
    'Kubernetes': ['kubernetes', 'k8s'],
    'DevOps': ['devops', 'ci/cd', 'continuous integration', 'continuous deployment'],
    'Machine Learning': ['machine learning', 'ml', 'deep learning', 'neural networks', 'ai'],
    'Data Analysis': ['data analysis', 'data analytics', 'analytics'],
    'Cybersecurity': ['cybersecurity', 'cyber security', 'information security', 'infosec'],
    'Network Administration': ['network administration', 'network admin', 'networking'],
    'Cloud Computing': ['cloud computing', 'cloud', 'cloud infrastructure'],
    'Git': ['git', 'github', 'gitlab', 'version control'],
    'Agile': ['agile', 'scrum master', 'kanban'],
    'Scrum': ['scrum', 'sprint'],
    
    # HR Skills
    'Recruitment': ['recruitment', 'recruiting', 'hiring'],
    'Talent Acquisition': ['talent acquisition', 'talent management'],
    'Employee Relations': ['employee relations', 'labor relations'],
    'Performance Management': ['performance management', 'performance review', 'appraisal'],
    'HRIS': ['hris', 'hr information system', 'workday', 'successfactors'],
    'Payroll Management': ['payroll', 'payroll processing'],
    'Training and Development': ['training and development', 'l&d', 'learning and development'],
    'Labor Law': ['labor law', 'employment law'],
    'Benefits Administration': ['benefits administration', 'benefits', 'compensation'],
    'Organizational Development': ['organizational development', 'od', 'change management'],
    'Conflict Resolution': ['conflict resolution', 'mediation'],
    'Compensation Analysis': ['compensation analysis', 'salary analysis'],
    'HR Analytics': ['hr analytics', 'people analytics', 'workforce analytics'],
    'Onboarding': ['onboarding', 'new hire orientation'],
    
    # Teacher Skills
    'Curriculum Development': ['curriculum development', 'curriculum design'],
    'Lesson Planning': ['lesson planning', 'lesson plans'],
    'Classroom Management': ['classroom management', 'behavior management'],
    'Student Assessment': ['student assessment', 'evaluation', 'grading'],
    'Educational Technology': ['educational technology', 'edtech', 'technology integration'],
    'Special Education': ['special education', 'special ed', 'iep'],
    'Child Psychology': ['child psychology', 'child development'],
    'Differentiated Instruction': ['differentiated instruction', 'differentiation'],
    'Parent Communication': ['parent communication', 'parent engagement'],
    'STEM Education': ['stem education', 'stem', 'science education'],
    'ESL Teaching': ['esl', 'english as a second language', 'tefl', 'tesol'],
    'Online Teaching': ['online teaching', 'remote teaching', 'virtual classroom'],
    'Educational Leadership': ['educational leadership', 'instructional leadership'],
    
    # General Skills
    'Communication': ['communication', 'verbal', 'written communication'],
    'Leadership': ['leadership', 'team lead', 'management'],
    'Problem Solving': ['problem solving', 'troubleshooting', 'critical thinking'],
    'Teamwork': ['teamwork', 'team player', 'collaboration'],
    'Time Management': ['time management', 'organization', 'prioritization'],
    'Critical Thinking': ['critical thinking', 'analytical thinking'],
    'Analytical Skills': ['analytical', 'analysis', 'analytical skills'],
    'Microsoft Office': ['microsoft office', 'ms office', 'word', 'powerpoint'],
    'Excel': ['excel', 'microsoft excel', 'spreadsheet'],
    'Presentation Skills': ['presentation', 'public speaking', 'presenting']
}

def get_db_connection():
    """Create database connection"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        return conn
    except Exception as e:
        print(f"Database connection error: {e}")
        return None

def extract_text_from_pdf(pdf_file):
    """Extract text from PDF file"""
    try:
        pdf_reader = PyPDF2.PdfReader(io.BytesIO(pdf_file.read()))
        text = ""
        for page in pdf_reader.pages:
            text += page.extract_text()
        return text.lower()
    except Exception as e:
        print(f"PDF extraction error: {e}")
        return ""

def extract_skills_from_text(text):
    """Extract skills from resume text"""
    found_skills = set()
    text_lower = text.lower()

    for skill_name, keywords in SKILL_KEYWORDS.items():
        for keyword in keywords:
            keyword_lower = keyword.lower()
            # For single-word keywords, use word boundaries
            if ' ' not in keyword_lower:
                pattern = r'\b' + re.escape(keyword_lower) + r'\b'
            else:
                # For multi-word keywords, allow more flexible matching
                pattern = r'\b' + re.escape(keyword_lower).replace(r'\ ', r'\s+') + r'\b'
                # Also try without word boundaries for phrases
                if not re.search(pattern, text_lower):
                    pattern = re.escape(keyword_lower)

            if re.search(pattern, text_lower):
                found_skills.add(skill_name)
                break

    return list(found_skills)

def get_matching_jobs(skills, limit=20):
    """Find jobs matching the given skills"""
    conn = get_db_connection()
    if not conn:
        return []
    
    # Normalize skills list to ensure consistent matching
    normalized_skills = [s.strip() for s in skills if s and isinstance(s, str)]
    
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cursor:
            # Create a query to find jobs with matching skills
            query = """
                WITH matched_skills AS (
                    SELECT 
                        j.job_id,
                        j.job_title,
                        j.job_category,
                        j.experience_required,
                        j.salary_range,
                        j.job_description,
                        j.location,
                        c.company_name,
                        c.industry,
                        s.skill_name,
                        js.importance_level,
                        COUNT(*) OVER (PARTITION BY j.job_id) as total_required_skills,
                        SUM(CASE WHEN s.skill_name = ANY(%s) THEN 1 ELSE 0 END) 
                            OVER (PARTITION BY j.job_id) as matched_skills_count
                    FROM jobs j
                    JOIN companies c ON j.company_id = c.company_id
                    JOIN job_skills js ON j.job_id = js.job_id
                    JOIN skills s ON js.skill_id = s.skill_id
                )
                SELECT DISTINCT
                    job_id,
                    job_title,
                    job_category,
                    experience_required,
                    salary_range,
                    job_description,
                    location,
                    company_name,
                    industry,
                    matched_skills_count,
                    total_required_skills,
                    ROUND((matched_skills_count::float / total_required_skills::float * 100)::numeric, 2) as match_percentage
                FROM matched_skills
                WHERE matched_skills_count > 0
                ORDER BY matched_skills_count DESC, match_percentage DESC
                LIMIT %s;
            """
            
            cursor.execute(query, (normalized_skills, limit))
            jobs = cursor.fetchall()
            
            # Get detailed skills for each job
            for job in jobs:
                # Get all required skills for this job
                cursor.execute("""
                    SELECT s.skill_name, js.importance_level
                    FROM job_skills js
                    JOIN skills s ON js.skill_id = s.skill_id
                    WHERE js.job_id = %s
                """, (job['job_id'],))
                
                all_job_skills = cursor.fetchall()
                job['required_skills'] = [skill['skill_name'] for skill in all_job_skills]
                job['matched_skills'] = [skill for skill in job['required_skills'] if skill in skills]
                job['missing_skills'] = [skill for skill in job['required_skills'] if skill not in skills]
            
            return jobs
    
    except Exception as e:
        print(f"Query error: {e}")
        return []
    finally:
        conn.close()

@app.route('/')
def home():
    return jsonify({
        'message': 'Job Matching API',
        'endpoints': {
            '/upload-resume': 'POST - Upload resume and get matching jobs',
            '/jobs': 'GET - Get all jobs',
            '/skills': 'GET - Get all skills'
        }
    })

@app.route('/upload-resume', methods=['POST'])
def upload_resume():
    """Handle resume upload and return matching jobs"""
    if 'resume' not in request.files:
        return jsonify({'error': 'No resume file provided'}), 400
    
    resume_file = request.files['resume']
    
    if resume_file.filename == '':
        return jsonify({'error': 'No file selected'}), 400
    
    if not resume_file.filename.endswith('.pdf'):
        return jsonify({'error': 'Only PDF files are supported'}), 400
    
    try:
        # Extract text from PDF
        resume_text = extract_text_from_pdf(resume_file)
        
        # Extract skills from resume
        candidate_skills = extract_skills_from_text(resume_text)
        
        if not candidate_skills:
            return jsonify({
                'message': 'No recognized skills found in resume',
                'candidate_skills': [],
                'matching_jobs': []
            })
        
        # Find matching jobs
        matching_jobs = get_matching_jobs(candidate_skills)
        
        return jsonify({
            'message': 'Resume analyzed successfully',
            'candidate_skills': candidate_skills,
            'total_skills_found': len(candidate_skills),
            'matching_jobs': matching_jobs,
            'total_matches': len(matching_jobs)
        })
    
    except Exception as e:
        print(f"Error processing resume: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/match-skills', methods=['POST'])
def match_skills():
    """Match jobs based on a provided list of skills (no resume upload)."""
    data = request.get_json() or {}
    skills = data.get('skills', [])

    if not isinstance(skills, list) or not skills:
        return jsonify({'error': 'skills must be a non-empty list'}), 400

    try:
        matching_jobs = get_matching_jobs(skills)
        return jsonify({
            'message': 'Skills analyzed successfully',
            'candidate_skills': skills,
            'total_skills_found': len(skills),
            'matching_jobs': matching_jobs,
            'total_matches': len(matching_jobs)
        })
    except Exception as e:
        print(f"Error matching skills: {e}")
        return jsonify({'error': str(e)}), 500


def create_job(data):
    """Create a new job posted by a company user"""
    required_fields = ['user_email', 'job_title', 'job_description']
    for field in required_fields:
        if not data.get(field):
            return jsonify({'error': f'Missing required field: {field}'}), 400

    user_email = data['user_email']
    job_title = data['job_title']
    job_category = data.get('job_category') or 'General'
    experience_required = data.get('experience_required')
    salary_range = data.get('salary_range')
    job_description = data['job_description']
    location = data.get('location')
    skills = data.get('skills', [])

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cursor:
            # Find the user and ensure they are a company user
            cursor.execute(
                "SELECT user_id, role, company_id FROM users WHERE email = %s",
                (user_email,)
            )
            user = cursor.fetchone()
            if not user:
                return jsonify({'error': 'User not found'}), 404

            if user['role'] != 'company':
                return jsonify({'error': 'Only company users can create jobs'}), 403

            company_id = user['company_id']

            # If company_id is not set (older users), optionally create/find company by name
            if not company_id and data.get('company_name'):
                company_name = data['company_name']
                industry = data.get('industry') or 'General'
                company_location = data.get('company_location') or location

                cursor.execute(
                    "SELECT company_id FROM companies WHERE company_name = %s",
                    (company_name,)
                )
                existing = cursor.fetchone()
                if existing:
                    company_id = existing['company_id']
                else:
                    cursor.execute(
                        """INSERT INTO companies (company_name, industry, location)
                            VALUES (%s, %s, %s)
                            RETURNING company_id""",
                        (company_name, industry, company_location)
                    )
                    company_id = cursor.fetchone()['company_id']

                # Update user with this company_id for future use
                cursor.execute(
                    "UPDATE users SET company_id = %s WHERE user_id = %s",
                    (company_id, user['user_id'])
                )

            if not company_id:
                return jsonify({'error': 'Company information missing for this user'}), 400

            # Insert the job
            cursor.execute(
                """INSERT INTO jobs (company_id, job_title, job_category,
                           experience_required, salary_range, job_description, location)
                   VALUES (%s, %s, %s, %s, %s, %s, %s)
                   RETURNING job_id""",
                (company_id, job_title, job_category,
                 experience_required, salary_range, job_description, location)
            )
            job_id = cursor.fetchone()['job_id']

            # Insert required skills if provided
            for raw_skill in skills:
                skill_name = (raw_skill or '').strip()
                if not skill_name:
                    continue

                # Find or create the skill
                cursor.execute(
                    "SELECT skill_id FROM skills WHERE skill_name = %s",
                    (skill_name,)
                )
                skill_row = cursor.fetchone()
                if skill_row:
                    skill_id = skill_row['skill_id']
                else:
                    cursor.execute(
                        """INSERT INTO skills (skill_name, category)
                            VALUES (%s, %s)
                            RETURNING skill_id""",
                        (skill_name, 'General')
                    )
                    skill_id = cursor.fetchone()['skill_id']

                cursor.execute(
                    """INSERT INTO job_skills (job_id, skill_id, importance_level)
                        VALUES (%s, %s, %s)
                        ON CONFLICT (job_id, skill_id) DO NOTHING""",
                    (job_id, skill_id, 'Required')
                )

            conn.commit()

            return jsonify({
                'message': 'Job created successfully',
                'job_id': job_id
            }), 201
    except Exception as e:
        conn.rollback()
        print(f"Error creating job: {e}")
        return jsonify({'error': str(e)}), 500
    finally:
        conn.close()


@app.route('/jobs', methods=['GET', 'POST'])
def jobs_handler():
    """Get all jobs or create a new job"""
    if request.method == 'POST':
        data = request.get_json() or {}
        return create_job(data)

    # GET: existing logic to return jobs
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500
    
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute("""
                SELECT 
                    j.job_id,
                    j.job_title,
                    j.job_category,
                    j.experience_required,
                    j.salary_range,
                    j.location,
                    c.company_name,
                    c.industry
                FROM jobs j
                JOIN companies c ON j.company_id = c.company_id
                ORDER BY j.job_id
                LIMIT 100;
            """)
            jobs = cursor.fetchall()
            return jsonify({'jobs': jobs, 'total': len(jobs)})
    
    except Exception as e:
        print(f"Query error: {e}")
        return jsonify({'error': str(e)}), 500
    finally:
        conn.close()


@app.route('/skills', methods=['GET'])
def get_all_skills():
    """Get all skills from database"""
    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500
    
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute("""
                SELECT skill_id, skill_name, category
                FROM skills
                ORDER BY category, skill_name;
            """)
            skills = cursor.fetchall()
            return jsonify({'skills': skills, 'total': len(skills)})
    
    except Exception as e:
        print(f"Query error: {e}")
        return jsonify({'error': str(e)}), 500
    finally:
        conn.close()

@app.route('/signup', methods=['POST'])
def signup():
    """Register a new applicant or company user"""
    data = request.get_json() or {}

    email = (data.get('email') or '').strip()
    password = data.get('password')
    role = (data.get('role') or '').strip().lower()

    if not email or not password or role not in ('applicant', 'company'):
        return jsonify({'error': 'email, password, and valid role (applicant/company) are required'}), 400

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cursor:
            # If company user, create or link company record
            company_id = None
            if role == 'company':
                company_name = (data.get('company_name') or '').strip()
                industry = (data.get('industry') or 'General').strip()
                location = (data.get('location') or '').strip()

                if not company_name:
                    return jsonify({'error': 'company_name is required for company users'}), 400

                cursor.execute(
                    "SELECT company_id FROM companies WHERE company_name = %s",
                    (company_name,)
                )
                existing_company = cursor.fetchone()
                if existing_company:
                    company_id = existing_company['company_id']
                else:
                    cursor.execute(
                        """INSERT INTO companies (company_name, industry, location)
                            VALUES (%s, %s, %s)
                            RETURNING company_id""",
                        (company_name, industry, location)
                    )
                    company_id = cursor.fetchone()['company_id']

            password_hash = generate_password_hash(password)

            cursor.execute(
                """INSERT INTO users (email, password_hash, role, company_id)
                    VALUES (%s, %s, %s, %s)
                    RETURNING user_id, email, role, company_id""",
                (email, password_hash, role, company_id)
            )
            user = cursor.fetchone()
            conn.commit()

            return jsonify({'message': 'User created successfully', 'user': user}), 201
    except psycopg2.IntegrityError as e:
        conn.rollback()
        print(f"Signup integrity error: {e}")
        return jsonify({'error': 'User with this email already exists'}), 400
    except Exception as e:
        conn.rollback()
        print(f"Signup error: {e}")
        return jsonify({'error': str(e)}), 500
    finally:
        conn.close()

@app.route('/login', methods=['POST'])
def login():
    """Authenticate an existing user"""
    data = request.get_json() or {}
    email = (data.get('email') or '').strip()
    password = data.get('password')

    if not email or not password:
        return jsonify({'error': 'email and password are required'}), 400

    conn = get_db_connection()
    if not conn:
        return jsonify({'error': 'Database connection failed'}), 500

    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute(
                "SELECT user_id, email, password_hash, role, company_id FROM users WHERE email = %s",
                (email,)
            )
            user = cursor.fetchone()
            if not user or not check_password_hash(user['password_hash'], password):
                return jsonify({'error': 'Invalid email or password'}), 401

            # Remove password_hash before returning
            user.pop('password_hash', None)
            return jsonify({'message': 'Login successful', 'user': user})
    except Exception as e:
        print(f"Login error: {e}")
        return jsonify({'error': str(e)}), 500
    finally:
        conn.close()

@app.route('/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    conn = get_db_connection()
    if conn:
        conn.close()
        return jsonify({'status': 'healthy', 'database': 'connected'})
    else:
        return jsonify({'status': 'unhealthy', 'database': 'disconnected'}), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)
