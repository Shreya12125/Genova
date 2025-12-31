-- Map skills to jobs

-- Engineering Jobs Skills Mapping
-- Senior Civil Engineer (job_id 1)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(1, (SELECT skill_id FROM skills WHERE skill_name = 'Civil Engineering'), 'Required'),
(1, (SELECT skill_id FROM skills WHERE skill_name = 'Project Management'), 'Required'),
(1, (SELECT skill_id FROM skills WHERE skill_name = 'AutoCAD'), 'Required'),
(1, (SELECT skill_id FROM skills WHERE skill_name = 'Structural Analysis'), 'Preferred'),
(1, (SELECT skill_id FROM skills WHERE skill_name = 'Leadership'), 'Required');

-- Structural Engineer (job_id 2)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(2, (SELECT skill_id FROM skills WHERE skill_name = 'Structural Analysis'), 'Required'),
(2, (SELECT skill_id FROM skills WHERE skill_name = 'AutoCAD'), 'Required'),
(2, (SELECT skill_id FROM skills WHERE skill_name = 'MATLAB'), 'Preferred'),
(2, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');

-- Construction Project Manager (job_id 3)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(3, (SELECT skill_id FROM skills WHERE skill_name = 'Project Management'), 'Required'),
(3, (SELECT skill_id FROM skills WHERE skill_name = 'Construction Management'), 'Required'),
(3, (SELECT skill_id FROM skills WHERE skill_name = 'Blueprint Reading'), 'Required'),
(3, (SELECT skill_id FROM skills WHERE skill_name = 'Leadership'), 'Required'),
(3, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Mechanical Design Engineer (job_id 4)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(4, (SELECT skill_id FROM skills WHERE skill_name = 'Mechanical Design'), 'Required'),
(4, (SELECT skill_id FROM skills WHERE skill_name = 'CAD'), 'Required'),
(4, (SELECT skill_id FROM skills WHERE skill_name = 'SolidWorks'), 'Required'),
(4, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');

-- HVAC Engineer (job_id 5)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(5, (SELECT skill_id FROM skills WHERE skill_name = 'HVAC'), 'Required'),
(5, (SELECT skill_id FROM skills WHERE skill_name = 'Mechanical Design'), 'Required'),
(5, (SELECT skill_id FROM skills WHERE skill_name = 'AutoCAD'), 'Preferred'),
(5, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required');

-- Senior Mechanical Engineer (job_id 6)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(6, (SELECT skill_id FROM skills WHERE skill_name = 'Mechanical Design'), 'Required'),
(6, (SELECT skill_id FROM skills WHERE skill_name = 'Project Management'), 'Required'),
(6, (SELECT skill_id FROM skills WHERE skill_name = 'CAD'), 'Required'),
(6, (SELECT skill_id FROM skills WHERE skill_name = 'Leadership'), 'Required');

-- Electrical Engineer (job_id 7)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(7, (SELECT skill_id FROM skills WHERE skill_name = 'Electrical Engineering'), 'Required'),
(7, (SELECT skill_id FROM skills WHERE skill_name = 'Circuit Design'), 'Required'),
(7, (SELECT skill_id FROM skills WHERE skill_name = 'AutoCAD'), 'Preferred'),
(7, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');

-- Circuit Design Engineer (job_id 8)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(8, (SELECT skill_id FROM skills WHERE skill_name = 'Circuit Design'), 'Required'),
(8, (SELECT skill_id FROM skills WHERE skill_name = 'Electrical Engineering'), 'Required'),
(8, (SELECT skill_id FROM skills WHERE skill_name = 'MATLAB'), 'Preferred'),
(8, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required');

-- Power Systems Engineer (job_id 9)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(9, (SELECT skill_id FROM skills WHERE skill_name = 'Electrical Engineering'), 'Required'),
(9, (SELECT skill_id FROM skills WHERE skill_name = 'Circuit Design'), 'Required'),
(9, (SELECT skill_id FROM skills WHERE skill_name = 'Project Management'), 'Preferred');

-- Structural Analysis Engineer (job_id 10)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(10, (SELECT skill_id FROM skills WHERE skill_name = 'Structural Analysis'), 'Required'),
(10, (SELECT skill_id FROM skills WHERE skill_name = 'AutoCAD'), 'Required'),
(10, (SELECT skill_id FROM skills WHERE skill_name = 'MATLAB'), 'Preferred'),
(10, (SELECT skill_id FROM skills WHERE skill_name = 'Civil Engineering'), 'Required');

-- Quality Control Engineer (job_id 11)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(11, (SELECT skill_id FROM skills WHERE skill_name = 'Quality Control'), 'Required'),
(11, (SELECT skill_id FROM skills WHERE skill_name = 'Six Sigma'), 'Preferred'),
(11, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required'),
(11, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');

-- Automotive Design Engineer (job_id 12)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(12, (SELECT skill_id FROM skills WHERE skill_name = 'CAD'), 'Required'),
(12, (SELECT skill_id FROM skills WHERE skill_name = 'Mechanical Design'), 'Required'),
(12, (SELECT skill_id FROM skills WHERE skill_name = 'SolidWorks'), 'Required'),
(12, (SELECT skill_id FROM skills WHERE skill_name = 'Project Management'), 'Preferred');

-- CAD Engineer (job_id 13)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(13, (SELECT skill_id FROM skills WHERE skill_name = 'CAD'), 'Required'),
(13, (SELECT skill_id FROM skills WHERE skill_name = 'AutoCAD'), 'Required'),
(13, (SELECT skill_id FROM skills WHERE skill_name = 'SolidWorks'), 'Preferred'),
(13, (SELECT skill_id FROM skills WHERE skill_name = 'Blueprint Reading'), 'Required');

-- IT Jobs Skills Mapping
-- Data Engineer (job_id 22)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(22, (SELECT skill_id FROM skills WHERE skill_name = 'Python'), 'Required'),
(22, (SELECT skill_id FROM skills WHERE skill_name = 'SQL'), 'Required'),
(22, (SELECT skill_id FROM skills WHERE skill_name = 'AWS'), 'Required'),
(22, (SELECT skill_id FROM skills WHERE skill_name = 'Data Analysis'), 'Required'),
(22, (SELECT skill_id FROM skills WHERE skill_name = 'MongoDB'), 'Preferred');

-- Machine Learning Engineer (job_id 23)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(23, (SELECT skill_id FROM skills WHERE skill_name = 'Machine Learning'), 'Required'),
(23, (SELECT skill_id FROM skills WHERE skill_name = 'Python'), 'Required'),
(23, (SELECT skill_id FROM skills WHERE skill_name = 'Data Analysis'), 'Required'),
(23, (SELECT skill_id FROM skills WHERE skill_name = 'AWS'), 'Preferred');

-- Data Analyst (job_id 24)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(24, (SELECT skill_id FROM skills WHERE skill_name = 'Data Analysis'), 'Required'),
(24, (SELECT skill_id FROM skills WHERE skill_name = 'SQL'), 'Required'),
(24, (SELECT skill_id FROM skills WHERE skill_name = 'Python'), 'Preferred'),
(24, (SELECT skill_id FROM skills WHERE skill_name = 'Excel'), 'Required'),
(24, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required');

-- Cloud Architect (job_id 25)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(25, (SELECT skill_id FROM skills WHERE skill_name = 'AWS'), 'Required'),
(25, (SELECT skill_id FROM skills WHERE skill_name = 'Azure'), 'Required'),
(25, (SELECT skill_id FROM skills WHERE skill_name = 'Cloud Computing'), 'Required'),
(25, (SELECT skill_id FROM skills WHERE skill_name = 'DevOps'), 'Preferred'),
(25, (SELECT skill_id FROM skills WHERE skill_name = 'Leadership'), 'Required');

-- DevOps Engineer (job_id 26)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(26, (SELECT skill_id FROM skills WHERE skill_name = 'DevOps'), 'Required'),
(26, (SELECT skill_id FROM skills WHERE skill_name = 'Docker'), 'Required'),
(26, (SELECT skill_id FROM skills WHERE skill_name = 'Kubernetes'), 'Required'),
(26, (SELECT skill_id FROM skills WHERE skill_name = 'AWS'), 'Required'),
(26, (SELECT skill_id FROM skills WHERE skill_name = 'Git'), 'Required');

-- Cloud Security Engineer (job_id 27)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(27, (SELECT skill_id FROM skills WHERE skill_name = 'Cybersecurity'), 'Required'),
(27, (SELECT skill_id FROM skills WHERE skill_name = 'AWS'), 'Required'),
(27, (SELECT skill_id FROM skills WHERE skill_name = 'Cloud Computing'), 'Required'),
(27, (SELECT skill_id FROM skills WHERE skill_name = 'Network Administration'), 'Preferred');

-- Cybersecurity Analyst (job_id 28)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(28, (SELECT skill_id FROM skills WHERE skill_name = 'Cybersecurity'), 'Required'),
(28, (SELECT skill_id FROM skills WHERE skill_name = 'Network Administration'), 'Required'),
(28, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required'),
(28, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');

-- Security Engineer (job_id 29)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(29, (SELECT skill_id FROM skills WHERE skill_name = 'Cybersecurity'), 'Required'),
(29, (SELECT skill_id FROM skills WHERE skill_name = 'Network Administration'), 'Required'),
(29, (SELECT skill_id FROM skills WHERE skill_name = 'Python'), 'Preferred');

-- Full Stack Developer (job_id 33)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(33, (SELECT skill_id FROM skills WHERE skill_name = 'JavaScript'), 'Required'),
(33, (SELECT skill_id FROM skills WHERE skill_name = 'React'), 'Required'),
(33, (SELECT skill_id FROM skills WHERE skill_name = 'Node.js'), 'Required'),
(33, (SELECT skill_id FROM skills WHERE skill_name = 'SQL'), 'Required'),
(33, (SELECT skill_id FROM skills WHERE skill_name = 'Git'), 'Required');

-- Frontend Developer (job_id 34)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(34, (SELECT skill_id FROM skills WHERE skill_name = 'JavaScript'), 'Required'),
(34, (SELECT skill_id FROM skills WHERE skill_name = 'React'), 'Required'),
(34, (SELECT skill_id FROM skills WHERE skill_name = 'Git'), 'Required');

-- Backend Developer (job_id 35)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(35, (SELECT skill_id FROM skills WHERE skill_name = 'Node.js'), 'Required'),
(35, (SELECT skill_id FROM skills WHERE skill_name = 'SQL'), 'Required'),
(35, (SELECT skill_id FROM skills WHERE skill_name = 'MongoDB'), 'Preferred'),
(35, (SELECT skill_id FROM skills WHERE skill_name = 'Git'), 'Required');

-- Database Administrator (job_id 38)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(38, (SELECT skill_id FROM skills WHERE skill_name = 'SQL'), 'Required'),
(38, (SELECT skill_id FROM skills WHERE skill_name = 'MongoDB'), 'Preferred'),
(38, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');

-- Software Engineer (job_id 40)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(40, (SELECT skill_id FROM skills WHERE skill_name = 'Java'), 'Required'),
(40, (SELECT skill_id FROM skills WHERE skill_name = 'Python'), 'Required'),
(40, (SELECT skill_id FROM skills WHERE skill_name = 'SQL'), 'Required'),
(40, (SELECT skill_id FROM skills WHERE skill_name = 'Git'), 'Required'),
(40, (SELECT skill_id FROM skills WHERE skill_name = 'Agile'), 'Preferred');

-- Java Developer (job_id 41)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(41, (SELECT skill_id FROM skills WHERE skill_name = 'Java'), 'Required'),
(41, (SELECT skill_id FROM skills WHERE skill_name = 'SQL'), 'Required'),
(41, (SELECT skill_id FROM skills WHERE skill_name = 'Git'), 'Required'),
(41, (SELECT skill_id FROM skills WHERE skill_name = 'Agile'), 'Preferred');

-- HR Jobs Skills Mapping
-- Senior Recruiter (job_id 48)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(48, (SELECT skill_id FROM skills WHERE skill_name = 'Recruitment'), 'Required'),
(48, (SELECT skill_id FROM skills WHERE skill_name = 'Talent Acquisition'), 'Required'),
(48, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required'),
(48, (SELECT skill_id FROM skills WHERE skill_name = 'Microsoft Office'), 'Required');

-- Talent Acquisition Manager (job_id 49)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(49, (SELECT skill_id FROM skills WHERE skill_name = 'Talent Acquisition'), 'Required'),
(49, (SELECT skill_id FROM skills WHERE skill_name = 'Recruitment'), 'Required'),
(49, (SELECT skill_id FROM skills WHERE skill_name = 'Leadership'), 'Required'),
(49, (SELECT skill_id FROM skills WHERE skill_name = 'Project Management'), 'Required');

-- HR Consultant (job_id 51)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(51, (SELECT skill_id FROM skills WHERE skill_name = 'Employee Relations'), 'Required'),
(51, (SELECT skill_id FROM skills WHERE skill_name = 'Performance Management'), 'Required'),
(51, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required'),
(51, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');

-- HR Business Partner (job_id 52)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(52, (SELECT skill_id FROM skills WHERE skill_name = 'Employee Relations'), 'Required'),
(52, (SELECT skill_id FROM skills WHERE skill_name = 'Organizational Development'), 'Required'),
(52, (SELECT skill_id FROM skills WHERE skill_name = 'Leadership'), 'Required'),
(52, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Technical Recruiter (job_id 54)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(54, (SELECT skill_id FROM skills WHERE skill_name = 'Recruitment'), 'Required'),
(54, (SELECT skill_id FROM skills WHERE skill_name = 'Talent Acquisition'), 'Required'),
(54, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Payroll Manager (job_id 57)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(57, (SELECT skill_id FROM skills WHERE skill_name = 'Payroll Management'), 'Required'),
(57, (SELECT skill_id FROM skills WHERE skill_name = 'Labor Law'), 'Required'),
(57, (SELECT skill_id FROM skills WHERE skill_name = 'Excel'), 'Required'),
(57, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required');

-- Benefits Administrator (job_id 58)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(58, (SELECT skill_id FROM skills WHERE skill_name = 'Benefits Administration'), 'Required'),
(58, (SELECT skill_id FROM skills WHERE skill_name = 'HRIS'), 'Preferred'),
(58, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Compensation Analyst (job_id 59)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(59, (SELECT skill_id FROM skills WHERE skill_name = 'Compensation Analysis'), 'Required'),
(59, (SELECT skill_id FROM skills WHERE skill_name = 'Excel'), 'Required'),
(59, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required'),
(59, (SELECT skill_id FROM skills WHERE skill_name = 'HR Analytics'), 'Preferred');

-- Training and Development Manager (job_id 60)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(60, (SELECT skill_id FROM skills WHERE skill_name = 'Training and Development'), 'Required'),
(60, (SELECT skill_id FROM skills WHERE skill_name = 'Leadership'), 'Required'),
(60, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required'),
(60, (SELECT skill_id FROM skills WHERE skill_name = 'Presentation Skills'), 'Required');

-- Employee Relations Manager (job_id 62)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(62, (SELECT skill_id FROM skills WHERE skill_name = 'Employee Relations'), 'Required'),
(62, (SELECT skill_id FROM skills WHERE skill_name = 'Conflict Resolution'), 'Required'),
(62, (SELECT skill_id FROM skills WHERE skill_name = 'Labor Law'), 'Required'),
(62, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- HR Analytics Manager (job_id 66)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(66, (SELECT skill_id FROM skills WHERE skill_name = 'HR Analytics'), 'Required'),
(66, (SELECT skill_id FROM skills WHERE skill_name = 'Excel'), 'Required'),
(66, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required'),
(66, (SELECT skill_id FROM skills WHERE skill_name = 'HRIS'), 'Preferred');

-- HRIS Manager (job_id 73)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(73, (SELECT skill_id FROM skills WHERE skill_name = 'HRIS'), 'Required'),
(73, (SELECT skill_id FROM skills WHERE skill_name = 'Project Management'), 'Required'),
(73, (SELECT skill_id FROM skills WHERE skill_name = 'Analytical Skills'), 'Required');

-- Teacher Jobs Skills Mapping
-- Elementary School Teacher (job_id 74)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(74, (SELECT skill_id FROM skills WHERE skill_name = 'Lesson Planning'), 'Required'),
(74, (SELECT skill_id FROM skills WHERE skill_name = 'Classroom Management'), 'Required'),
(74, (SELECT skill_id FROM skills WHERE skill_name = 'Student Assessment'), 'Required'),
(74, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Middle School Math Teacher (job_id 75)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(75, (SELECT skill_id FROM skills WHERE skill_name = 'Lesson Planning'), 'Required'),
(75, (SELECT skill_id FROM skills WHERE skill_name = 'Classroom Management'), 'Required'),
(75, (SELECT skill_id FROM skills WHERE skill_name = 'Student Assessment'), 'Required'),
(75, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');

-- Curriculum Developer (job_id 77)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(77, (SELECT skill_id FROM skills WHERE skill_name = 'Curriculum Development'), 'Required'),
(77, (SELECT skill_id FROM skills WHERE skill_name = 'Lesson Planning'), 'Required'),
(77, (SELECT skill_id FROM skills WHERE skill_name = 'Educational Technology'), 'Preferred'),
(77, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Instructional Coordinator (job_id 78)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(78, (SELECT skill_id FROM skills WHERE skill_name = 'Curriculum Development'), 'Required'),
(78, (SELECT skill_id FROM skills WHERE skill_name = 'Educational Leadership'), 'Required'),
(78, (SELECT skill_id FROM skills WHERE skill_name = 'Training and Development'), 'Required'),
(78, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- STEM Teacher (job_id 80)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(80, (SELECT skill_id FROM skills WHERE skill_name = 'STEM Education'), 'Required'),
(80, (SELECT skill_id FROM skills WHERE skill_name = 'Lesson Planning'), 'Required'),
(80, (SELECT skill_id FROM skills WHERE skill_name = 'Classroom Management'), 'Required'),
(80, (SELECT skill_id FROM skills WHERE skill_name = 'Educational Technology'), 'Preferred');

-- Online Teacher (job_id 83)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(83, (SELECT skill_id FROM skills WHERE skill_name = 'Online Teaching'), 'Required'),
(83, (SELECT skill_id FROM skills WHERE skill_name = 'Educational Technology'), 'Required'),
(83, (SELECT skill_id FROM skills WHERE skill_name = 'Lesson Planning'), 'Required'),
(83, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Instructional Designer (job_id 84)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(84, (SELECT skill_id FROM skills WHERE skill_name = 'Curriculum Development'), 'Required'),
(84, (SELECT skill_id FROM skills WHERE skill_name = 'Educational Technology'), 'Required'),
(84, (SELECT skill_id FROM skills WHERE skill_name = 'Online Teaching'), 'Preferred'),
(84, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Special Education Teacher (job_id 88)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(88, (SELECT skill_id FROM skills WHERE skill_name = 'Special Education'), 'Required'),
(88, (SELECT skill_id FROM skills WHERE skill_name = 'Child Psychology'), 'Required'),
(88, (SELECT skill_id FROM skills WHERE skill_name = 'Differentiated Instruction'), 'Required'),
(88, (SELECT skill_id FROM skills WHERE skill_name = 'Classroom Management'), 'Required');

-- ESL Teacher (job_id 90)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(90, (SELECT skill_id FROM skills WHERE skill_name = 'ESL Teaching'), 'Required'),
(90, (SELECT skill_id FROM skills WHERE skill_name = 'Lesson Planning'), 'Required'),
(90, (SELECT skill_id FROM skills WHERE skill_name = 'Classroom Management'), 'Required'),
(90, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required');

-- Educational Technology Specialist (job_id 92)
INSERT INTO job_skills (job_id, skill_id, importance_level) VALUES
(92, (SELECT skill_id FROM skills WHERE skill_name = 'Educational Technology'), 'Required'),
(92, (SELECT skill_id FROM skills WHERE skill_name = 'Training and Development'), 'Required'),
(92, (SELECT skill_id FROM skills WHERE skill_name = 'Communication'), 'Required'),
(92, (SELECT skill_id FROM skills WHERE skill_name = 'Problem Solving'), 'Required');
