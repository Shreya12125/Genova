-- Job Matching System Database Schema

-- Drop existing tables if they exist
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS job_skills CASCADE;
DROP TABLE IF EXISTS jobs CASCADE;
DROP TABLE IF EXISTS companies CASCADE;
DROP TABLE IF EXISTS skills CASCADE;

-- Create Companies table
CREATE TABLE companies (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    industry VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    description TEXT
);

-- Create Skills table
CREATE TABLE skills (
    skill_id SERIAL PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50)
);

-- Create Jobs table
CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    company_id INTEGER REFERENCES companies(company_id),
    job_title VARCHAR(255) NOT NULL,
    job_category VARCHAR(100) NOT NULL,
    experience_required VARCHAR(50),
    salary_range VARCHAR(100),
    job_description TEXT,
    location VARCHAR(255)
);

-- Create Job Skills junction table
CREATE TABLE job_skills (
    job_skill_id SERIAL PRIMARY KEY,
    job_id INTEGER REFERENCES jobs(job_id) ON DELETE CASCADE,
    skill_id INTEGER REFERENCES skills(skill_id),
    importance_level VARCHAR(20) DEFAULT 'Required',
    UNIQUE(job_id, skill_id)
);

-- Create Users table for authentication
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('applicant','company')),
    company_id INTEGER REFERENCES companies(company_id)
);

-- Insert Skills for different categories
INSERT INTO skills (skill_name, category) VALUES
-- Engineering Skills
('AutoCAD', 'Engineering'),
('SolidWorks', 'Engineering'),
('MATLAB', 'Engineering'),
('CAD', 'Engineering'),
('Mechanical Design', 'Engineering'),
('Civil Engineering', 'Engineering'),
('Structural Analysis', 'Engineering'),
('Project Management', 'General'),
('Electrical Engineering', 'Engineering'),
('Circuit Design', 'Engineering'),
('HVAC', 'Engineering'),
('Construction Management', 'Engineering'),
('Blueprint Reading', 'Engineering'),
('Quality Control', 'Engineering'),
('Six Sigma', 'General'),

-- IT Skills
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
('Agile', 'General'),
('Scrum', 'General'),

-- HR Skills
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

-- Teacher Skills
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

-- General/Soft Skills
('Communication', 'General'),
('Leadership', 'General'),
('Problem Solving', 'General'),
('Teamwork', 'General'),
('Time Management', 'General'),
('Critical Thinking', 'General'),
('Analytical Skills', 'General'),
('Microsoft Office', 'General'),
('Excel', 'General'),
('Presentation Skills', 'General');

-- Insert Companies (50 companies across 4 categories)

-- Engineering Companies (13 companies)
INSERT INTO companies (company_name, industry, location, description) VALUES
('TechBuild Engineering', 'Engineering', 'New York, NY', 'Leading construction and civil engineering firm'),
('MechaniPro Solutions', 'Engineering', 'Houston, TX', 'Mechanical engineering and design services'),
('ElectroDesign Corp', 'Engineering', 'San Francisco, CA', 'Electrical and electronics engineering'),
('StructureTech', 'Engineering', 'Chicago, IL', 'Structural engineering and analysis'),
('AutoDesign Systems', 'Engineering', 'Detroit, MI', 'Automotive engineering and design'),
('GreenEnergy Engineering', 'Engineering', 'Seattle, WA', 'Renewable energy engineering solutions'),
('AeroSpace Dynamics', 'Engineering', 'Los Angeles, CA', 'Aerospace engineering and manufacturing'),
('Civil Works Inc', 'Engineering', 'Boston, MA', 'Civil infrastructure and urban planning'),
('Industrial Mechanics', 'Engineering', 'Pittsburgh, PA', 'Industrial and mechanical engineering'),
('Precision Engineering', 'Engineering', 'Austin, TX', 'Precision manufacturing and engineering'),
('HydroTech Engineers', 'Engineering', 'Denver, CO', 'Water resources and hydraulic engineering'),
('BuildRight Engineering', 'Engineering', 'Phoenix, AZ', 'Construction management and engineering'),
('PowerGrid Solutions', 'Engineering', 'Atlanta, GA', 'Electrical power systems engineering');

-- IT Companies (13 companies)
INSERT INTO companies (company_name, industry, location, description) VALUES
('DataStream Technologies', 'Information Technology', 'San Jose, CA', 'Big data and analytics solutions'),
('CloudNine Systems', 'Information Technology', 'Seattle, WA', 'Cloud computing and infrastructure'),
('CyberGuard Security', 'Information Technology', 'Washington, DC', 'Cybersecurity and threat protection'),
('DevOps Masters', 'Information Technology', 'San Francisco, CA', 'DevOps consulting and implementation'),
('AI Innovations Lab', 'Information Technology', 'Boston, MA', 'Artificial intelligence and machine learning'),
('WebCraft Solutions', 'Information Technology', 'Austin, TX', 'Web development and digital solutions'),
('NetWork Pro Services', 'Information Technology', 'Dallas, TX', 'Network infrastructure and management'),
('MobileTech Apps', 'Information Technology', 'Los Angeles, CA', 'Mobile application development'),
('Database Experts', 'Information Technology', 'Chicago, IL', 'Database design and management'),
('SoftwareCraft Inc', 'Information Technology', 'New York, NY', 'Custom software development'),
('TechSupport Plus', 'Information Technology', 'Miami, FL', 'IT support and consulting'),
('CodeGenius Labs', 'Information Technology', 'Portland, OR', 'Software engineering and development'),
('QuantumCloud Services', 'Information Technology', 'San Diego, CA', 'Cloud-native application development');

-- HR Companies (12 companies)
INSERT INTO companies (company_name, industry, location, description) VALUES
('TalentFirst Consulting', 'Human Resources', 'New York, NY', 'Executive recruitment and talent management'),
('PeopleWorks HR', 'Human Resources', 'Chicago, IL', 'Full-service HR consulting'),
('RecruitPro Solutions', 'Human Resources', 'Los Angeles, CA', 'Recruitment and staffing services'),
('HR Excellence Group', 'Human Resources', 'Boston, MA', 'HR strategy and organizational development'),
('PayrollMasters Inc', 'Human Resources', 'Dallas, TX', 'Payroll and benefits administration'),
('TrainingSphere', 'Human Resources', 'Atlanta, GA', 'Corporate training and development'),
('WorkPlace Dynamics', 'Human Resources', 'Seattle, WA', 'Employee relations and workplace culture'),
('CompensationPro', 'Human Resources', 'San Francisco, CA', 'Compensation and benefits consulting'),
('HR Analytics Corp', 'Human Resources', 'Denver, CO', 'HR data analytics and insights'),
('TalentBridge', 'Human Resources', 'Phoenix, AZ', 'Talent acquisition and management'),
('EmployeeFirst Solutions', 'Human Resources', 'Minneapolis, MN', 'Employee engagement and retention'),
('HR Tech Innovators', 'Human Resources', 'Austin, TX', 'HRIS and HR technology solutions');

-- Education/Teacher Companies (12 companies)
INSERT INTO companies (company_name, industry, location, description) VALUES
('BrightFuture Academy', 'Education', 'Boston, MA', 'K-12 private education institution'),
('LearnSmart Schools', 'Education', 'New York, NY', 'Progressive education and curriculum development'),
('STEM Excellence Institute', 'Education', 'San Francisco, CA', 'STEM-focused educational programs'),
('GlobalTeach Network', 'Education', 'Chicago, IL', 'Online education platform and teacher training'),
('MontessoriPlus Schools', 'Education', 'Los Angeles, CA', 'Montessori education methodology'),
('SpecialEd Experts', 'Education', 'Seattle, WA', 'Special education services and support'),
('Language Learning Center', 'Education', 'Miami, FL', 'ESL and language education'),
('EduTech Solutions', 'Education', 'Austin, TX', 'Educational technology and digital learning'),
('Classical Academy Group', 'Education', 'Denver, CO', 'Classical education approach'),
('Arts & Sciences School', 'Education', 'Portland, OR', 'Arts-integrated education'),
('TestPrep Academy', 'Education', 'Washington, DC', 'Test preparation and tutoring services'),
('Future Leaders School', 'Education', 'Atlanta, GA', 'Leadership-focused education programs');
