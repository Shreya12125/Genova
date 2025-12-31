# AI Job Matching System

A comprehensive job matching system that analyzes resumes, matches them with jobs in a PostgreSQL database, and provides personalized career insights.

## Features

- **Resume Analysis**: Upload PDF resumes and automatically extract skills
- **Job Matching**: Match candidate skills with 100+ jobs from 50 companies across 4 categories
- **Skill Gap Analysis**: Identify missing skills for each job opportunity
- **Interactive Frontend**: Beautiful HTML/CSS interface with real-time job matching
- **Personality Assessment**: Get personalized career strategies based on personality
- **Career Roadmap**: Receive customized learning paths

## Tech Stack

- **Backend**: Python Flask
- **Database**: PostgreSQL
- **PDF Parsing**: PyPDF2
- **Frontend**: HTML, CSS, JavaScript
- **API**: RESTful API with CORS support

## Database Structure

The system includes:
- **50 Companies** across 4 industries:
  - Engineering (13 companies)
  - Information Technology (13 companies)
  - Human Resources (12 companies)
  - Education/Teaching (12 companies)

- **100+ Jobs** with realistic requirements
- **70+ Skills** categorized by industry
- Complete job-skills mapping

## Setup Instructions

### 1. Install PostgreSQL

Make sure PostgreSQL is installed and running on your system.

**Windows**: Download from https://www.postgresql.org/download/windows/

**Default credentials**:
- Username: `postgres`
- Password: `postgres` (change in `app.py` if different)
- Port: `5432`

### 2. Create Database

Open PostgreSQL command line (psql) or pgAdmin and run:

```sql
CREATE DATABASE job_matching;
```

### 3. Set up Database Schema and Data

Navigate to the project directory and run the SQL files in order:

```bash
# Using psql command line
psql -U postgres -d job_matching -f database_setup.sql
psql -U postgres -d job_matching -f jobs_data.sql
psql -U postgres -d job_matching -f job_skills_mapping.sql
```

Or using pgAdmin:
1. Connect to the `job_matching` database
2. Open Query Tool
3. Run each SQL file in order

### 4. Install Python Dependencies

```bash
pip install PyPDF2 psycopg2-binary Flask flask-cors
```

### 5. Update Database Configuration (if needed)

Edit `app.py` and update the database credentials:

```python
DB_CONFIG = {
    'dbname': 'job_matching',
    'user': 'postgres',
    'password': 'your_password_here',  # Change this
    'host': 'localhost',
    'port': '5432'
}
```

### 6. Start the Flask Backend

```bash
python app.py
```

The API will run on `http://localhost:5000`

### 7. Open the Frontend

Simply open `index.html` in your web browser. The application will automatically connect to the Flask backend.

**Alternative**: Use a local server:
```bash
# Using Python
python -m http.server 8000

# Then visit http://localhost:8000
```

## Usage

### 1. Upload Resume
- Click "Get Started" or "Demo"
- Upload a PDF resume
- The system will analyze it and extract skills

### 2. Take Personality Test
- Answer 8 quick questions
- Get personalized learning and application strategies

### 3. View Results
- See extracted skills from your resume
- View top matching jobs with match percentages
- Identify missing skills for each position
- Get personalized career roadmap

## API Endpoints

### `POST /upload-resume`
Upload a resume and get matching jobs

**Request**: 
- Form data with `resume` file (PDF)

**Response**:
```json
{
  "message": "Resume analyzed successfully",
  "candidate_skills": ["Python", "SQL", "..."],
  "total_skills_found": 10,
  "matching_jobs": [
    {
      "job_id": 1,
      "job_title": "Data Engineer",
      "company_name": "DataStream Technologies",
      "match_percentage": 75.5,
      "matched_skills": ["Python", "SQL"],
      "missing_skills": ["Docker", "AWS"],
      "salary_range": "$90,000 - $120,000",
      "location": "San Jose, CA"
    }
  ],
  "total_matches": 15
}
```

### `GET /jobs`
Get all jobs in database

### `GET /skills`
Get all skills in database

### `GET /health`
Health check endpoint

## Resume Dataset

The system analyzes resumes from the dataset located at:
```
C:\Users\Admin\Downloads\Ai verse\archive\data\data
```

Categories:
- `ENGINEERING/` - 450+ engineering resumes
- `HR/` - HR professional resumes
- `INFORMATION-TECHNOLOGY/` - IT resumes
- `TEACHER/` - Education resumes

## Skill Detection

The system uses keyword matching to detect skills from resumes. It recognizes:

- **Engineering**: AutoCAD, SolidWorks, MATLAB, CAD, Mechanical Design, etc.
- **IT**: Python, Java, JavaScript, React, AWS, Docker, Kubernetes, etc.
- **HR**: Recruitment, HRIS, Payroll, Performance Management, etc.
- **Teaching**: Curriculum Development, Classroom Management, ESL, etc.
- **General**: Communication, Leadership, Problem Solving, etc.

## Database Queries

### View all companies:
```sql
SELECT * FROM companies ORDER BY industry, company_name;
```

### View all jobs:
```sql
SELECT j.job_title, c.company_name, j.job_category, j.salary_range
FROM jobs j
JOIN companies c ON j.company_id = c.company_id
ORDER BY c.company_name;
```

### View job skills:
```sql
SELECT j.job_title, s.skill_name, js.importance_level
FROM jobs j
JOIN job_skills js ON j.job_id = js.job_id
JOIN skills s ON js.skill_id = s.skill_id
WHERE j.job_id = 1;
```

### Find jobs by skill:
```sql
SELECT DISTINCT j.job_title, c.company_name
FROM jobs j
JOIN companies c ON j.company_id = c.company_id
JOIN job_skills js ON j.job_id = js.job_id
JOIN skills s ON js.skill_id = s.skill_id
WHERE s.skill_name = 'Python';
```

## Troubleshooting

### Database Connection Error
- Ensure PostgreSQL is running
- Check credentials in `app.py`
- Verify database `job_matching` exists

### No Jobs Returned
- Check if SQL files were executed successfully
- Verify data in tables: `SELECT COUNT(*) FROM jobs;`
- Ensure Flask server is running

### CORS Error
- Make sure Flask app is running with CORS enabled
- Check browser console for errors

### PDF Parsing Error
- Ensure PDF is not password protected
- Try with a simpler PDF resume
- Check PDF is valid and not corrupted

## Future Enhancements

- Machine learning-based skill extraction
- Resume scoring and optimization suggestions
- Interview preparation resources
- Company reviews and culture fit analysis
- Salary negotiation insights
- Application tracking system

## License

This project is for educational purposes.

## Contributors
Shreya Sriram
Vikasini S 
Neha Jacob
Nandana Thachilath M
Built with AI assistance using real job market data and industry-standard technologies.

