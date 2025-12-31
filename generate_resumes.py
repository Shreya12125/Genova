import random
import os
from reportlab.lib.pagesizes import letter
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, ListFlowable, ListItem
from reportlab.lib.units import inch

# Comprehensive skill dictionary from app.py
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

# Fake skills not in the dictionary
FAKE_SKILLS = [
    'Quantum Computing', 'Telekinesis', 'Time Travel', 'Alien Language Translation',
    'Superhero Management', 'Dragon Training', 'Magic Potion Brewing', 'Invisibility Cloak Design',
    'Parallel Universe Navigation', 'Mind Reading', 'Weather Control', 'Shape Shifting',
    'Teleportation Engineering', 'Crystal Ball Programming', 'Wand Crafting', 'Potion Analysis'
]

def generate_resume_data(resume_id):
    """Generate synthetic resume data"""
    first_names = ['John', 'Jane', 'Michael', 'Sarah', 'David', 'Emily', 'Robert', 'Lisa', 'James', 'Maria']
    last_names = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez']

    name = f"{random.choice(first_names)} {random.choice(last_names)}"
    experience_years = random.randint(1, 20)
    education = random.choice(['Bachelor of Science in Computer Science', 'Master of Business Administration',
                               'Bachelor of Engineering', 'PhD in Artificial Intelligence', 'Associate Degree in IT'])
    location = random.choice(['New York, NY', 'San Francisco, CA', 'Austin, TX', 'Seattle, WA', 'Boston, MA'])

    # Determine skill type for this resume
    skill_type = random.choice(['full_match', 'partial_match', 'no_match'])

    if skill_type == 'full_match':
        # All skills from SKILL_KEYWORDS
        num_skills = random.randint(3, 8)
        skills = random.sample(list(SKILL_KEYWORDS.keys()), num_skills)
    elif skill_type == 'partial_match':
        # Mix of real and fake skills
        num_real = random.randint(1, 4)
        num_fake = random.randint(1, 3)
        real_skills = random.sample(list(SKILL_KEYWORDS.keys()), num_real)
        fake_skills = random.sample(FAKE_SKILLS, num_fake)
        skills = real_skills + fake_skills
    else:  # no_match
        # Only fake skills
        num_fake = random.randint(2, 5)
        skills = random.sample(FAKE_SKILLS, num_fake)

    return {
        'id': resume_id,
        'name': name,
        'skills': skills,
        'experience_years': experience_years,
        'education': education,
        'location': location
    }

def create_pdf_resume(resume_data, filename):
    """Create a PDF resume"""
    doc = SimpleDocTemplate(filename, pagesize=letter)
    styles = getSampleStyleSheet()

    # Custom styles
    title_style = ParagraphStyle('Title', parent=styles['Heading1'], fontSize=18, spaceAfter=20)
    heading_style = ParagraphStyle('Heading', parent=styles['Heading2'], fontSize=14, spaceAfter=10)
    normal_style = styles['Normal']

    story = []

    # Name
    story.append(Paragraph(resume_data['name'], title_style))
    story.append(Spacer(1, 0.25*inch))

    # Contact Info (placeholder)
    story.append(Paragraph(f"Location: {resume_data['location']}", normal_style))
    story.append(Paragraph("Email: example@email.com | Phone: (123) 456-7890", normal_style))
    story.append(Spacer(1, 0.25*inch))

    # Professional Summary
    story.append(Paragraph("Professional Summary", heading_style))
    summary = f"Experienced professional with {resume_data['experience_years']} years of experience in various fields. Skilled in {', '.join(resume_data['skills'][:3])} and more."
    story.append(Paragraph(summary, normal_style))
    story.append(Spacer(1, 0.25*inch))

    # Skills
    story.append(Paragraph("Skills", heading_style))
    skill_items = [ListItem(Paragraph(skill, normal_style)) for skill in resume_data['skills']]
    story.append(ListFlowable(skill_items, bulletType='bullet'))
    story.append(Spacer(1, 0.25*inch))

    # Experience
    story.append(Paragraph("Professional Experience", heading_style))
    experience_text = f"{resume_data['experience_years']} years of professional experience in relevant fields."
    story.append(Paragraph(experience_text, normal_style))
    story.append(Spacer(1, 0.25*inch))

    # Education
    story.append(Paragraph("Education", heading_style))
    story.append(Paragraph(resume_data['education'], normal_style))

    doc.build(story)

def main():
    """Generate 15 synthetic resumes as PDFs"""
    os.makedirs('synthetic_resumes', exist_ok=True)

    for i in range(1, 16):
        resume_data = generate_resume_data(i)
        filename = f"synthetic_resumes/resume_{i}.pdf"
        create_pdf_resume(resume_data, filename)
        print(f"Generated {filename}")

if __name__ == "__main__":
    main()
