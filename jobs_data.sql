-- Insert Jobs for all 50 companies

-- Engineering Jobs (40+ jobs for 13 companies)
INSERT INTO jobs (company_id, job_title, job_category, experience_required, salary_range, job_description, location) VALUES
-- TechBuild Engineering (company_id 1)
(1, 'Senior Civil Engineer', 'ENGINEERING', '5-7 years', '$80,000 - $120,000', 'Lead civil engineering projects including infrastructure development', 'New York, NY'),
(1, 'Structural Engineer', 'ENGINEERING', '3-5 years', '$70,000 - $95,000', 'Design and analyze structural systems for buildings', 'New York, NY'),
(1, 'Construction Project Manager', 'ENGINEERING', '7-10 years', '$90,000 - $130,000', 'Manage construction projects from planning to completion', 'New York, NY'),

-- MechaniPro Solutions (company_id 2)
(2, 'Mechanical Design Engineer', 'ENGINEERING', '3-5 years', '$75,000 - $100,000', 'Design mechanical systems and components using CAD software', 'Houston, TX'),
(2, 'HVAC Engineer', 'ENGINEERING', '2-4 years', '$65,000 - $85,000', 'Design and optimize HVAC systems for commercial buildings', 'Houston, TX'),
(2, 'Senior Mechanical Engineer', 'ENGINEERING', '5-8 years', '$85,000 - $115,000', 'Lead mechanical engineering projects and mentor junior engineers', 'Houston, TX'),

-- ElectroDesign Corp (company_id 3)
(3, 'Electrical Engineer', 'ENGINEERING', '2-4 years', '$70,000 - $95,000', 'Design electrical systems and circuits for various applications', 'San Francisco, CA'),
(3, 'Circuit Design Engineer', 'ENGINEERING', '3-5 years', '$80,000 - $105,000', 'Develop and test circuit designs for electronic products', 'San Francisco, CA'),
(3, 'Power Systems Engineer', 'ENGINEERING', '4-6 years', '$85,000 - $110,000', 'Design and analyze electrical power distribution systems', 'San Francisco, CA'),

-- StructureTech (company_id 4)
(4, 'Structural Analysis Engineer', 'ENGINEERING', '3-5 years', '$75,000 - $100,000', 'Perform structural analysis and design for complex projects', 'Chicago, IL'),
(4, 'Quality Control Engineer', 'ENGINEERING', '2-4 years', '$65,000 - $85,000', 'Ensure quality standards in engineering projects', 'Chicago, IL'),

-- AutoDesign Systems (company_id 5)
(5, 'Automotive Design Engineer', 'ENGINEERING', '3-6 years', '$80,000 - $110,000', 'Design automotive components using CAD and engineering software', 'Detroit, MI'),
(5, 'CAD Engineer', 'ENGINEERING', '2-4 years', '$70,000 - $90,000', 'Create detailed CAD models and technical drawings', 'Detroit, MI'),

-- Other Engineering Companies
(6, 'Renewable Energy Engineer', 'ENGINEERING', '3-5 years', '$80,000 - $105,000', 'Design renewable energy systems and solutions', 'Seattle, WA'),
(7, 'Aerospace Engineer', 'ENGINEERING', '4-7 years', '$90,000 - $125,000', 'Design and test aerospace components and systems', 'Los Angeles, CA'),
(8, 'Civil Infrastructure Engineer', 'ENGINEERING', '3-5 years', '$75,000 - $100,000', 'Plan and design civil infrastructure projects', 'Boston, MA'),
(9, 'Industrial Engineer', 'ENGINEERING', '2-4 years', '$70,000 - $95,000', 'Optimize industrial processes and manufacturing systems', 'Pittsburgh, PA'),
(10, 'Manufacturing Engineer', 'ENGINEERING', '3-5 years', '$75,000 - $100,000', 'Improve manufacturing processes and precision engineering', 'Austin, TX'),
(11, 'Hydraulic Engineer', 'ENGINEERING', '3-6 years', '$80,000 - $105,000', 'Design water resources and hydraulic systems', 'Denver, CO'),
(12, 'Construction Engineer', 'ENGINEERING', '2-5 years', '$70,000 - $95,000', 'Oversee construction projects and ensure compliance', 'Phoenix, AZ'),
(13, 'Electrical Power Engineer', 'ENGINEERING', '4-6 years', '$85,000 - $115,000', 'Design electrical power grid and distribution systems', 'Atlanta, GA');

-- IT Jobs (50+ jobs for 13 companies)
INSERT INTO jobs (company_id, job_title, job_category, experience_required, salary_range, job_description, location) VALUES
-- DataStream Technologies (company_id 14)
(14, 'Data Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$90,000 - $120,000', 'Build and maintain data pipelines and analytics infrastructure', 'San Jose, CA'),
(14, 'Machine Learning Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$100,000 - $140,000', 'Develop ML models and AI solutions', 'San Jose, CA'),
(14, 'Data Analyst', 'INFORMATION-TECHNOLOGY', '2-4 years', '$75,000 - $95,000', 'Analyze large datasets and create insights', 'San Jose, CA'),

-- CloudNine Systems (company_id 15)
(15, 'Cloud Architect', 'INFORMATION-TECHNOLOGY', '5-8 years', '$110,000 - $150,000', 'Design cloud infrastructure on AWS and Azure', 'Seattle, WA'),
(15, 'DevOps Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$95,000 - $125,000', 'Implement DevOps practices and CI/CD pipelines', 'Seattle, WA'),
(15, 'Cloud Security Engineer', 'INFORMATION-TECHNOLOGY', '4-6 years', '$100,000 - $135,000', 'Secure cloud environments and implement security best practices', 'Seattle, WA'),

-- CyberGuard Security (company_id 16)
(16, 'Cybersecurity Analyst', 'INFORMATION-TECHNOLOGY', '2-4 years', '$80,000 - $110,000', 'Monitor and protect against cyber threats', 'Washington, DC'),
(16, 'Security Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$95,000 - $125,000', 'Implement security solutions and conduct vulnerability assessments', 'Washington, DC'),
(16, 'Penetration Tester', 'INFORMATION-TECHNOLOGY', '3-5 years', '$90,000 - $120,000', 'Conduct security testing and penetration testing', 'Washington, DC'),

-- DevOps Masters (company_id 17)
(17, 'Senior DevOps Engineer', 'INFORMATION-TECHNOLOGY', '5-7 years', '$105,000 - $140,000', 'Lead DevOps initiatives and automation', 'San Francisco, CA'),
(17, 'Infrastructure Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$90,000 - $120,000', 'Manage infrastructure using Docker and Kubernetes', 'San Francisco, CA'),

-- AI Innovations Lab (company_id 18)
(18, 'AI Research Engineer', 'INFORMATION-TECHNOLOGY', '3-6 years', '$110,000 - $150,000', 'Research and develop AI algorithms and models', 'Boston, MA'),
(18, 'Python Developer', 'INFORMATION-TECHNOLOGY', '2-4 years', '$85,000 - $110,000', 'Develop Python-based applications and tools', 'Boston, MA'),

-- WebCraft Solutions (company_id 19)
(19, 'Full Stack Developer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$90,000 - $120,000', 'Develop web applications using React and Node.js', 'Austin, TX'),
(19, 'Frontend Developer', 'INFORMATION-TECHNOLOGY', '2-4 years', '$80,000 - $105,000', 'Build responsive user interfaces with React and JavaScript', 'Austin, TX'),
(19, 'Backend Developer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$85,000 - $115,000', 'Develop server-side applications with Node.js and databases', 'Austin, TX'),

-- NetWork Pro Services (company_id 20)
(20, 'Network Administrator', 'INFORMATION-TECHNOLOGY', '2-5 years', '$70,000 - $95,000', 'Manage and maintain network infrastructure', 'Dallas, TX'),
(20, 'Network Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$80,000 - $110,000', 'Design and implement network solutions', 'Dallas, TX'),

-- MobileTech Apps (company_id 21)
(21, 'Mobile App Developer', 'INFORMATION-TECHNOLOGY', '2-4 years', '$85,000 - $110,000', 'Develop mobile applications for iOS and Android', 'Los Angeles, CA'),
(21, 'React Native Developer', 'INFORMATION-TECHNOLOGY', '2-4 years', '$85,000 - $115,000', 'Build cross-platform mobile apps using React Native', 'Los Angeles, CA'),

-- Database Experts (company_id 22)
(22, 'Database Administrator', 'INFORMATION-TECHNOLOGY', '3-5 years', '$85,000 - $110,000', 'Manage SQL and NoSQL databases', 'Chicago, IL'),
(22, 'Database Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$90,000 - $115,000', 'Design database schemas and optimize queries', 'Chicago, IL'),

-- SoftwareCraft Inc (company_id 23)
(23, 'Software Engineer', 'INFORMATION-TECHNOLOGY', '2-5 years', '$85,000 - $115,000', 'Develop custom software solutions using Java and Python', 'New York, NY'),
(23, 'Java Developer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$90,000 - $120,000', 'Build enterprise Java applications', 'New York, NY'),

-- TechSupport Plus (company_id 24)
(24, 'IT Support Specialist', 'INFORMATION-TECHNOLOGY', '1-3 years', '$55,000 - $75,000', 'Provide technical support and troubleshooting', 'Miami, FL'),
(24, 'Systems Administrator', 'INFORMATION-TECHNOLOGY', '2-4 years', '$70,000 - $90,000', 'Manage IT systems and infrastructure', 'Miami, FL'),

-- CodeGenius Labs (company_id 25)
(25, 'Software Development Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$95,000 - $125,000', 'Design and develop scalable software systems', 'Portland, OR'),
(25, 'Technical Lead', 'INFORMATION-TECHNOLOGY', '5-7 years', '$110,000 - $145,000', 'Lead development teams and architect solutions', 'Portland, OR'),

-- QuantumCloud Services (company_id 26)
(26, 'Cloud Native Developer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$95,000 - $125,000', 'Build cloud-native applications on AWS', 'San Diego, CA'),
(26, 'Kubernetes Engineer', 'INFORMATION-TECHNOLOGY', '3-5 years', '$100,000 - $130,000', 'Deploy and manage containerized applications', 'San Diego, CA');

-- HR Jobs (35+ jobs for 12 companies)
INSERT INTO jobs (company_id, job_title, job_category, experience_required, salary_range, job_description, location) VALUES
-- TalentFirst Consulting (company_id 27)
(27, 'Senior Recruiter', 'HR', '4-6 years', '$75,000 - $100,000', 'Lead recruitment efforts for executive positions', 'New York, NY'),
(27, 'Talent Acquisition Manager', 'HR', '5-8 years', '$85,000 - $115,000', 'Manage talent acquisition strategies and teams', 'New York, NY'),
(27, 'Executive Search Consultant', 'HR', '5-7 years', '$90,000 - $120,000', 'Find and place executive-level candidates', 'New York, NY'),

-- PeopleWorks HR (company_id 28)
(28, 'HR Consultant', 'HR', '3-5 years', '$70,000 - $95,000', 'Provide HR consulting services to clients', 'Chicago, IL'),
(28, 'HR Business Partner', 'HR', '4-6 years', '$80,000 - $105,000', 'Partner with business leaders on HR strategy', 'Chicago, IL'),
(28, 'Organizational Development Specialist', 'HR', '3-5 years', '$75,000 - $100,000', 'Design and implement OD initiatives', 'Chicago, IL'),

-- RecruitPro Solutions (company_id 29)
(29, 'Technical Recruiter', 'HR', '2-4 years', '$65,000 - $85,000', 'Recruit technical talent for IT and engineering roles', 'Los Angeles, CA'),
(29, 'Recruitment Coordinator', 'HR', '1-3 years', '$50,000 - $65,000', 'Coordinate recruitment activities and scheduling', 'Los Angeles, CA'),

-- HR Excellence Group (company_id 30)
(30, 'HR Manager', 'HR', '5-7 years', '$85,000 - $110,000', 'Manage HR operations and strategy', 'Boston, MA'),
(30, 'Performance Management Specialist', 'HR', '3-5 years', '$70,000 - $90,000', 'Develop performance management systems', 'Boston, MA'),

-- PayrollMasters Inc (company_id 31)
(31, 'Payroll Manager', 'HR', '4-6 years', '$75,000 - $95,000', 'Oversee payroll operations and compliance', 'Dallas, TX'),
(31, 'Benefits Administrator', 'HR', '2-4 years', '$60,000 - $80,000', 'Manage employee benefits programs', 'Dallas, TX'),
(31, 'Compensation Analyst', 'HR', '3-5 years', '$70,000 - $90,000', 'Analyze compensation structures and market data', 'Dallas, TX'),

-- TrainingSphere (company_id 32)
(32, 'Training and Development Manager', 'HR', '4-6 years', '$80,000 - $105,000', 'Design and deliver corporate training programs', 'Atlanta, GA'),
(32, 'Learning and Development Specialist', 'HR', '2-4 years', '$65,000 - $85,000', 'Create training content and facilitate workshops', 'Atlanta, GA'),

-- WorkPlace Dynamics (company_id 33)
(33, 'Employee Relations Manager', 'HR', '4-6 years', '$80,000 - $105,000', 'Manage employee relations and resolve conflicts', 'Seattle, WA'),
(33, 'HR Generalist', 'HR', '2-4 years', '$60,000 - $80,000', 'Handle various HR functions and employee support', 'Seattle, WA'),

-- CompensationPro (company_id 34)
(34, 'Compensation and Benefits Manager', 'HR', '5-7 years', '$90,000 - $120,000', 'Lead compensation and benefits strategy', 'San Francisco, CA'),
(34, 'Total Rewards Analyst', 'HR', '3-5 years', '$75,000 - $95,000', 'Analyze total rewards programs and market trends', 'San Francisco, CA'),

-- HR Analytics Corp (company_id 35)
(35, 'HR Analytics Manager', 'HR', '4-6 years', '$85,000 - $110,000', 'Lead HR analytics and data-driven decision making', 'Denver, CO'),
(35, 'People Analytics Specialist', 'HR', '2-4 years', '$70,000 - $90,000', 'Analyze HR data and create workforce insights', 'Denver, CO'),

-- TalentBridge (company_id 36)
(36, 'Talent Management Specialist', 'HR', '3-5 years', '$70,000 - $95,000', 'Develop talent management programs', 'Phoenix, AZ'),
(36, 'Onboarding Coordinator', 'HR', '1-3 years', '$50,000 - $65,000', 'Coordinate new hire onboarding processes', 'Phoenix, AZ'),

-- EmployeeFirst Solutions (company_id 37)
(37, 'Employee Engagement Manager', 'HR', '4-6 years', '$80,000 - $105,000', 'Design and implement engagement initiatives', 'Minneapolis, MN'),
(37, 'Culture and Engagement Specialist', 'HR', '2-4 years', '$65,000 - $85,000', 'Foster positive workplace culture', 'Minneapolis, MN'),

-- HR Tech Innovators (company_id 38)
(38, 'HRIS Manager', 'HR', '4-6 years', '$85,000 - $110,000', 'Manage HRIS systems and implementations', 'Austin, TX'),
(38, 'HR Technology Specialist', 'HR', '2-4 years', '$70,000 - $90,000', 'Support HR technology tools and systems', 'Austin, TX');

-- Teacher/Education Jobs (35+ jobs for 12 companies)
INSERT INTO jobs (company_id, job_title, job_category, experience_required, salary_range, job_description, location) VALUES
-- BrightFuture Academy (company_id 39)
(39, 'Elementary School Teacher', 'TEACHER', '2-5 years', '$50,000 - $70,000', 'Teach K-5 students with engaging curriculum', 'Boston, MA'),
(39, 'Middle School Math Teacher', 'TEACHER', '3-5 years', '$55,000 - $75,000', 'Teach mathematics to middle school students', 'Boston, MA'),
(39, 'High School Science Teacher', 'TEACHER', '3-5 years', '$55,000 - $75,000', 'Teach science courses to high school students', 'Boston, MA'),

-- LearnSmart Schools (company_id 40)
(40, 'Curriculum Developer', 'TEACHER', '3-5 years', '$60,000 - $80,000', 'Design innovative curriculum materials', 'New York, NY'),
(40, 'Instructional Coordinator', 'TEACHER', '4-6 years', '$65,000 - $85,000', 'Coordinate instructional programs and support teachers', 'New York, NY'),
(40, 'Educational Consultant', 'TEACHER', '5-7 years', '$70,000 - $95,000', 'Provide consulting on education best practices', 'New York, NY'),

-- STEM Excellence Institute (company_id 41)
(41, 'STEM Teacher', 'TEACHER', '2-5 years', '$60,000 - $80,000', 'Teach STEM subjects with hands-on approach', 'San Francisco, CA'),
(41, 'Robotics Instructor', 'TEACHER', '2-4 years', '$55,000 - $75,000', 'Teach robotics and engineering concepts', 'San Francisco, CA'),
(41, 'Science Curriculum Specialist', 'TEACHER', '4-6 years', '$65,000 - $85,000', 'Develop STEM curriculum and training', 'San Francisco, CA'),

-- GlobalTeach Network (company_id 42)
(42, 'Online Teacher', 'TEACHER', '2-4 years', '$50,000 - $70,000', 'Teach online courses to students worldwide', 'Chicago, IL'),
(42, 'Instructional Designer', 'TEACHER', '3-5 years', '$65,000 - $85,000', 'Design online learning experiences', 'Chicago, IL'),
(42, 'Teacher Trainer', 'TEACHER', '4-6 years', '$60,000 - $80,000', 'Train teachers on best practices and technology', 'Chicago, IL'),

-- MontessoriPlus Schools (company_id 43)
(43, 'Montessori Teacher', 'TEACHER', '2-5 years', '$50,000 - $70,000', 'Teach using Montessori methodology', 'Los Angeles, CA'),
(43, 'Preschool Teacher', 'TEACHER', '1-3 years', '$40,000 - $55,000', 'Teach preschool-aged children', 'Los Angeles, CA'),

-- SpecialEd Experts (company_id 44)
(44, 'Special Education Teacher', 'TEACHER', '3-5 years', '$60,000 - $80,000', 'Support students with special needs', 'Seattle, WA'),
(44, 'Learning Support Specialist', 'TEACHER', '2-4 years', '$55,000 - $75,000', 'Provide learning support and interventions', 'Seattle, WA'),

-- Language Learning Center (company_id 45)
(45, 'ESL Teacher', 'TEACHER', '2-4 years', '$50,000 - $70,000', 'Teach English as a Second Language', 'Miami, FL'),
(45, 'Language Instructor', 'TEACHER', '2-4 years', '$50,000 - $70,000', 'Teach foreign languages to students', 'Miami, FL'),

-- EduTech Solutions (company_id 46)
(46, 'Educational Technology Specialist', 'TEACHER', '3-5 years', '$65,000 - $85,000', 'Integrate technology into education', 'Austin, TX'),
(46, 'Digital Learning Coach', 'TEACHER', '2-4 years', '$55,000 - $75,000', 'Coach teachers on digital learning tools', 'Austin, TX'),

-- Classical Academy Group (company_id 47)
(47, 'Classical Education Teacher', 'TEACHER', '2-5 years', '$50,000 - $70,000', 'Teach using classical education methods', 'Denver, CO'),
(47, 'Humanities Teacher', 'TEACHER', '3-5 years', '$55,000 - $75,000', 'Teach humanities and liberal arts', 'Denver, CO'),

-- Arts & Sciences School (company_id 48)
(48, 'Arts Teacher', 'TEACHER', '2-4 years', '$50,000 - $70,000', 'Teach visual and performing arts', 'Portland, OR'),
(48, 'Integrated Curriculum Teacher', 'TEACHER', '3-5 years', '$55,000 - $75,000', 'Teach arts-integrated curriculum', 'Portland, OR'),

-- TestPrep Academy (company_id 49)
(49, 'Test Prep Instructor', 'TEACHER', '1-3 years', '$45,000 - $65,000', 'Prepare students for standardized tests', 'Washington, DC'),
(49, 'Academic Tutor', 'TEACHER', '1-3 years', '$40,000 - $60,000', 'Provide one-on-one tutoring support', 'Washington, DC'),

-- Future Leaders School (company_id 50)
(50, 'Leadership Education Teacher', 'TEACHER', '3-5 years', '$55,000 - $75,000', 'Teach leadership skills and character development', 'Atlanta, GA'),
(50, 'Student Success Coach', 'TEACHER', '2-4 years', '$50,000 - $70,000', 'Coach students on academic and personal success', 'Atlanta, GA');
