import psycopg2
from psycopg2.extras import execute_values
import pandas as pd
import os

# Database configuration
DB_CONFIG = {
    'dbname': 'job_matching',
    'user': 'postgres',
    'password': '',  # Change this to your PostgreSQL password
    'host': 'localhost',
    'port': '5432'
}

def create_tables():
    """Create database tables"""
    commands = [
        """
        CREATE TABLE IF NOT EXISTS companies (
            company_id SERIAL PRIMARY KEY,
            company_name VARCHAR(255) NOT NULL,
            industry VARCHAR(255),
            location VARCHAR(255)
        )
        """,
        """
        CREATE TABLE IF NOT EXISTS users (
            user_id SERIAL PRIMARY KEY,
            email VARCHAR(255) UNIQUE NOT NULL,
            password_hash VARCHAR(255) NOT NULL,
            role VARCHAR(20) NOT NULL CHECK (role IN ('applicant','company')),
            company_id INTEGER REFERENCES companies(company_id)
        )
        """,
        """
        CREATE TABLE IF NOT EXISTS skills (
            skill_id SERIAL PRIMARY KEY,
            skill_name VARCHAR(255) UNIQUE NOT NULL,
            category VARCHAR(100)
        )
        """,
        """
        CREATE TABLE IF NOT EXISTS jobs (
            job_id SERIAL PRIMARY KEY,
            company_id INTEGER REFERENCES companies(company_id),
            job_title VARCHAR(255) NOT NULL,
            job_category VARCHAR(100),
            experience_required VARCHAR(100),
            salary_range VARCHAR(100),
            job_description TEXT,
            location VARCHAR(255),
            posted_date DATE DEFAULT CURRENT_DATE,
            is_active BOOLEAN DEFAULT TRUE
        )
        """,
        """
        CREATE TABLE IF NOT EXISTS job_skills (
            job_skill_id SERIAL PRIMARY KEY,
            job_id INTEGER REFERENCES jobs(job_id),
            skill_id INTEGER REFERENCES skills(skill_id),
            importance_level VARCHAR(20) DEFAULT 'required',
            UNIQUE(job_id, skill_id)
        )
        """
    ]

    conn = None
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()

        for command in commands:
            cur.execute(command)

        conn.commit()
        print("Tables created successfully")

    except (Exception, psycopg2.DatabaseError) as error:
        print(f"Error creating tables: {error}")
    finally:
        if conn is not None:
            conn.close()

def populate_skills():
    """Populate skills table with comprehensive skill list"""
    skills_data = [
        # Engineering Skills
        ('AutoCAD', 'Engineering'),
        ('SolidWorks', 'Engineering'),
        ('MATLAB', 'Engineering'),
        ('CAD', 'Engineering'),
        ('Mechanical Design', 'Engineering'),
        ('Civil Engineering', 'Engineering'),
        ('Structural Analysis', 'Engineering'),
        ('Project Management', 'Engineering'),
        ('Electrical Engineering', 'Engineering'),
        ('Circuit Design', 'Engineering'),
        ('HVAC', 'Engineering'),
        ('Construction Management', 'Engineering'),
        ('Blueprint Reading', 'Engineering'),
        ('Quality Control', 'Engineering'),
        ('Six Sigma', 'Engineering'),

        # IT Skills
        ('Python', 'IT'),
        ('Java', 'IT'),
        ('JavaScript', 'IT'),
        ('React', 'IT'),
        ('Node.js', 'IT'),
        ('SQL', 'IT'),
        ('MongoDB', 'IT'),
        ('AWS', 'IT'),
        ('Azure', 'IT'),
        ('Docker', 'IT'),
        ('Kubernetes', 'IT'),
        ('DevOps', 'IT'),
        ('Machine Learning', 'IT'),
        ('Data Analysis', 'IT'),
        ('Cybersecurity', 'IT'),
        ('Network Administration', 'IT'),
        ('Cloud Computing', 'IT'),
        ('Git', 'IT'),
        ('Agile', 'IT'),
        ('Scrum', 'IT'),
        ('Pandas', 'IT'),
        ('TensorFlow', 'IT'),
        ('PyTorch', 'IT'),

        # HR Skills
        ('Recruitment', 'HR'),
        ('Talent Acquisition', 'HR'),
        ('Employee Relations', 'HR'),
        ('Performance Management', 'HR'),
        ('HRIS', 'HR'),
        ('Payroll Management', 'HR'),
        ('Training and Development', 'HR'),
        ('Labor Law', 'HR'),
        ('Benefits Administration', 'HR'),
        ('Organizational Development', 'HR'),
        ('Conflict Resolution', 'HR'),
        ('Compensation Analysis', 'HR'),
        ('HR Analytics', 'HR'),
        ('Onboarding', 'HR'),

        # Teacher Skills
        ('Curriculum Development', 'Education'),
        ('Lesson Planning', 'Education'),
        ('Classroom Management', 'Education'),
        ('Student Assessment', 'Education'),
        ('Educational Technology', 'Education'),
        ('Special Education', 'Education'),
        ('Child Psychology', 'Education'),
        ('Differentiated Instruction', 'Education'),
        ('Parent Communication', 'Education'),
        ('STEM Education', 'Education'),
        ('ESL Teaching', 'Education'),
        ('Online Teaching', 'Education'),
        ('Educational Leadership', 'Education'),

        # General Skills
        ('Communication', 'General'),
        ('Leadership', 'General'),
        ('Problem Solving', 'General'),
        ('Teamwork', 'General'),
        ('Time Management', 'General'),
        ('Critical Thinking', 'General'),
        ('Analytical Skills', 'General'),
        ('Microsoft Office', 'General'),
        ('Excel', 'General'),
        ('Presentation Skills', 'General')
    ]

    conn = None
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()

        # Insert skills, ignore duplicates
        execute_values(cur,
            "INSERT INTO skills (skill_name, category) VALUES %s ON CONFLICT (skill_name) DO NOTHING",
            skills_data
        )

        conn.commit()
        print("Skills populated successfully")

    except (Exception, psycopg2.DatabaseError) as error:
        print(f"Error populating skills: {error}")
    finally:
        if conn is not None:
            conn.close()

def populate_companies():
    """Populate companies table with sample companies"""
    companies_data = [
        ('TechCorp Inc.', 'Technology', 'San Francisco, CA'),
        ('DataSys Solutions', 'Technology', 'Austin, TX'),
        ('InnovateLabs', 'Technology', 'Seattle, WA'),
        ('GlobalTech', 'Technology', 'New York, NY'),
        ('SmartSoft', 'Software', 'Boston, MA'),
        ('BuildRight Construction', 'Construction', 'Chicago, IL'),
        ('EngSolutions', 'Engineering', 'Denver, CO'),
        ('EduFuture Academy', 'Education', 'Los Angeles, CA'),
        ('HealthTech Systems', 'Healthcare', 'Miami, FL'),
        ('FinanceFlow Inc.', 'Finance', 'Dallas, TX')
    ]

    conn = None
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()

        execute_values(cur,
            "INSERT INTO companies (company_name, industry, location) VALUES %s",
            companies_data
        )

        conn.commit()
        print("Companies populated successfully")

    except (Exception, psycopg2.DatabaseError) as error:
        print(f"Error populating companies: {error}")
    finally:
        if conn is not None:
            conn.close()

def populate_jobs():
    """Populate jobs table with sample jobs"""
    jobs_data = [
        # Software Engineer jobs
        (1, 'Senior Software Engineer', 'IT', '3-5 years', '$120,000 - $160,000',
         'We are looking for a Senior Software Engineer to join our team. You will be responsible for designing, developing, and maintaining software applications.',
         'San Francisco, CA'),

        (1, 'Full Stack Developer', 'IT', '2-4 years', '$90,000 - $130,000',
         'Join our development team as a Full Stack Developer. You will work on both frontend and backend technologies to build scalable web applications.',
         'San Francisco, CA'),

        (2, 'Data Scientist', 'IT', '2-4 years', '$110,000 - $150,000',
         'We seek a Data Scientist to analyze complex datasets and build predictive models. Experience with Python, ML libraries, and SQL required.',
         'Austin, TX'),

        (2, 'Machine Learning Engineer', 'IT', '3-5 years', '$130,000 - $170,000',
         'Looking for an ML Engineer to develop and deploy machine learning models at scale. Experience with TensorFlow, PyTorch, and cloud platforms.',
         'Austin, TX'),

        (3, 'DevOps Engineer', 'IT', '3-5 years', '$115,000 - $155,000',
         'We need a DevOps Engineer to manage our infrastructure and CI/CD pipelines. Experience with Docker, Kubernetes, and AWS required.',
         'Seattle, WA'),

        (3, 'Cloud Architect', 'IT', '5+ years', '$140,000 - $180,000',
         'Seeking a Cloud Architect to design and implement cloud solutions. Deep expertise in AWS/Azure and infrastructure as code.',
         'Seattle, WA'),

        # Engineering jobs
        (6, 'Mechanical Engineer', 'Engineering', '2-4 years', '$75,000 - $95,000',
         'Design and develop mechanical systems and components. Experience with CAD software and mechanical design principles required.',
         'Denver, CO'),

        (6, 'Civil Engineer', 'Engineering', '3-5 years', '$80,000 - $105,000',
         'Work on civil engineering projects including structural design and project management. PE license preferred.',
         'Denver, CO'),

        (7, 'Construction Project Manager', 'Engineering', '5+ years', '$95,000 - $125,000',
         'Manage construction projects from planning to completion. Experience with project management tools and construction processes.',
         'Chicago, IL'),

        # Education jobs
        (8, 'High School Teacher', 'Education', '1-3 years', '$50,000 - $70,000',
         'Teach high school subjects and develop curriculum. Experience with classroom management and student assessment.',
         'Los Angeles, CA'),

        (8, 'Educational Technology Specialist', 'Education', '2-4 years', '$65,000 - $85,000',
         'Implement and manage educational technology solutions. Experience with LMS systems and digital learning tools.',
         'Los Angeles, CA'),

        # HR jobs
        (9, 'HR Business Partner', 'HR', '3-5 years', '$85,000 - $115,000',
         'Partner with business leaders to develop HR strategies. Experience in employee relations and performance management.',
         'Miami, FL'),

        (10, 'Talent Acquisition Specialist', 'HR', '2-4 years', '$60,000 - $80,000',
         'Manage recruitment processes and build talent pipelines. Experience with ATS systems and recruitment best practices.',
         'Dallas, TX')
    ]

    conn = None
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()

        execute_values(cur,
            """INSERT INTO jobs (company_id, job_title, job_category, experience_required, salary_range, job_description, location)
               VALUES %s""",
            jobs_data
        )

        conn.commit()
        print("Jobs populated successfully")

    except (Exception, psycopg2.DatabaseError) as error:
        print(f"Error populating jobs: {error}")
    finally:
        if conn is not None:
            conn.close()

def populate_job_skills():
    """Populate job_skills table with skill requirements for each job"""
    job_skills_data = [
        # Job 1: Senior Software Engineer
        (1, 'Python', 'required'),
        (1, 'JavaScript', 'required'),
        (1, 'SQL', 'required'),
        (1, 'Git', 'required'),
        (1, 'Docker', 'preferred'),
        (1, 'AWS', 'preferred'),

        # Job 2: Full Stack Developer
        (2, 'JavaScript', 'required'),
        (2, 'React', 'required'),
        (2, 'Node.js', 'required'),
        (2, 'SQL', 'required'),
        (2, 'Git', 'required'),
        (2, 'MongoDB', 'preferred'),

        # Job 3: Data Scientist
        (3, 'Python', 'required'),
        (3, 'Machine Learning', 'required'),
        (3, 'Data Analysis', 'required'),
        (3, 'SQL', 'required'),
        (3, 'Pandas', 'required'),
        (3, 'Excel', 'preferred'),

        # Job 4: Machine Learning Engineer
        (4, 'Python', 'required'),
        (4, 'Machine Learning', 'required'),
        (4, 'TensorFlow', 'required'),
        (4, 'AWS', 'required'),
        (4, 'Docker', 'required'),
        (4, 'Git', 'required'),

        # Job 5: DevOps Engineer
        (5, 'Docker', 'required'),
        (5, 'Kubernetes', 'required'),
        (5, 'AWS', 'required'),
        (5, 'DevOps', 'required'),
        (5, 'Python', 'preferred'),
        (5, 'Git', 'required'),

        # Job 6: Cloud Architect
        (6, 'AWS', 'required'),
        (6, 'Cloud Computing', 'required'),
        (6, 'Docker', 'required'),
        (6, 'Kubernetes', 'required'),
        (6, 'Python', 'preferred'),
        (6, 'DevOps', 'required'),

        # Job 7: Mechanical Engineer
        (7, 'CAD', 'required'),
        (7, 'Mechanical Design', 'required'),
        (7, 'SolidWorks', 'preferred'),
        (7, 'Project Management', 'preferred'),
        (7, 'MATLAB', 'preferred'),

        # Job 8: Civil Engineer
        (8, 'Civil Engineering', 'required'),
        (8, 'CAD', 'required'),
        (8, 'Structural Analysis', 'required'),
        (8, 'Project Management', 'required'),
        (8, 'Blueprint Reading', 'preferred'),

        # Job 9: Construction Project Manager
        (9, 'Project Management', 'required'),
        (9, 'Construction Management', 'required'),
        (9, 'Civil Engineering', 'preferred'),
        (9, 'CAD', 'preferred'),
        (9, 'Quality Control', 'preferred'),

        # Job 10: High School Teacher
        (10, 'Curriculum Development', 'required'),
        (10, 'Lesson Planning', 'required'),
        (10, 'Classroom Management', 'required'),
        (10, 'Student Assessment', 'required'),
        (10, 'Communication', 'required'),

        # Job 11: Educational Technology Specialist
        (11, 'Educational Technology', 'required'),
        (11, 'Curriculum Development', 'required'),
        (11, 'Online Teaching', 'preferred'),
        (11, 'Communication', 'required'),
        (11, 'Problem Solving', 'preferred'),

        # Job 12: HR Business Partner
        (12, 'Employee Relations', 'required'),
        (12, 'Performance Management', 'required'),
        (12, 'Communication', 'required'),
        (12, 'Conflict Resolution', 'required'),
        (12, 'HR Analytics', 'preferred'),

        # Job 13: Talent Acquisition Specialist
        (13, 'Recruitment', 'required'),
        (13, 'Talent Acquisition', 'required'),
        (13, 'Communication', 'required'),
        (13, 'HRIS', 'preferred'),
        (13, 'Onboarding', 'preferred')
    ]

    conn = None
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()

        # First get skill_id for each skill name
        for job_id, skill_name, importance in job_skills_data:
            cur.execute("SELECT skill_id FROM skills WHERE skill_name = %s", (skill_name,))
            skill_result = cur.fetchone()
            if skill_result:
                skill_id = skill_result[0]
                cur.execute(
                    "INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES (%s, %s, %s) ON CONFLICT DO NOTHING",
                    (job_id, skill_id, importance)
                )

        conn.commit()
        print("Job skills populated successfully")

    except (Exception, psycopg2.DatabaseError) as error:
        print(f"Error populating job skills: {error}")
    finally:
        if conn is not None:
            conn.close()

def main():
    """Main function to set up the database"""
    print("Setting up job matching database...")

    try:
        create_tables()
        populate_skills()
        populate_companies()
        populate_jobs()
        populate_job_skills()

        print("\nDatabase setup completed successfully!")
        print("You can now run your Flask API and it should find matching jobs.")

    except Exception as e:
        print(f"Error during database setup: {e}")

if __name__ == "__main__":
    main()
