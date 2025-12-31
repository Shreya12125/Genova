# Quick Start Guide

Get the job matching system up and running in 5 minutes!

## Prerequisites

- PostgreSQL installed and running
- Python 3.7+ installed
- A PDF resume to test

## Step-by-Step Setup

### 1. Install Dependencies (1 minute)

```bash
pip install PyPDF2 psycopg2-binary Flask flask-cors
```

### 2. Setup Database (2 minutes)

**Option A: Interactive Setup (Recommended)**

```bash
python setup_db_interactive.py
```

This will:
- Create the `job_matching` database (if it does not exist)
- Run `database_setup.sql`, `jobs_data.sql`, and `job_skills_mapping.sql`
- Load real companies, jobs, skills, and mappings across all 4 categories
- Verify the setup

**Option B: Manual Setup**

```bash
# Create database
psql -U postgres -c "CREATE DATABASE job_matching;"

# Load data
psql -U postgres -d job_matching -f database_setup.sql
psql -U postgres -d job_matching -f jobs_data.sql
psql -U postgres -d job_matching -f job_skills_mapping.sql
```

### 3. Update Database Password (if needed)

If your PostgreSQL password is not `postgres`, update it in two places:

1. `setup_database.py` (line 12):
   ```python
   DB_PASSWORD = 'your_password_here'
   ```

2. `app.py` (line 17):
   ```python
   'password': 'your_password_here'
   ```

### 4. Start the Backend (30 seconds)

```bash
python app.py
```

Make sure you updated the database password in `app.py` as instructed by the interactive setup script.

You should see:
```
 * Running on http://127.0.0.1:5000
```
dated the database password in `app.py` as instructed by the interactive setup script.

You should see:
dated the database password in `app.py` as instructed by the interactive setup script.

You should see:
dated the database password in `app.py` as instructed by the interactive setup script.

You should see:
dated the database password in `app.py` as instructed by the interactive setup script.

You should see:
```
 * Running on http://127.0.0.1:5000
```

### 5. Open the Frontend (30 seconds)

Simply double-click `index.html` or open it in your browser.

Alternatively, use a local server:
```bash
python -m http.server 8000
# Then visit http://localhost:8000
```

## Test the System

1. **Click "Get Started"** or "Demo" on the landing page
2. **Upload a PDF resume** from the dataset:
   - Engineering: `archive\data\data\ENGINEERING\10030015.pdf`
   - IT: `archive\data\data\INFORMATION-TECHNOLOGY\[any file].pdf`
   - HR: `archive\data\data\HR\[any file].pdf`
   - Teacher: `archive\data\data\TEACHER\[any file].pdf`

3. **Wait for analysis** - The system will extract skills and match jobs
4. **Take the personality test** - Answer 8 questions
5. **View your results** - See matching jobs with skills gaps!

## What You Should See

After uploading a resume:
- ✅ Skills extracted from your resume (e.g., 10-15 skills)
- ✅ 10-20 matching jobs with percentages
- ✅ Missing skills for each position
- ✅ Personalized career roadmap
- ✅ Complete job listings with salary and location

## Common Issues

### "Database connection failed"
- Make sure PostgreSQL is running
- Check password in `app.py`
- Verify database exists: `psql -U postgres -l`

### "No matching jobs found"
- Make sure Flask backend is running (`python app.py`)
- Check browser console for errors (F12)
- Verify data loaded: `psql -U postgres -d job_matching -c "SELECT COUNT(*) FROM jobs;"`

### "Error analyzing resume"
- The system will use sample data as fallback
- Check Flask terminal for error messages
- Ensure PDF is valid and not corrupted

## Sample Resumes

Test with resumes from the dataset:
```
C:\Users\Admin\Downloads\Ai verse\archive\data\data\
```

Categories available:
- **ENGINEERING**: 450 resumes
- **INFORMATION-TECHNOLOGY**: IT professional resumes  
- **HR**: Human resources resumes
- **TEACHER**: Education professional resumes

## What's in the Database?

- **50 Companies** across 4 industries
- **100+ Jobs** with real requirements
- **70+ Skills** (Engineering, IT, HR, Teaching)
- Realistic salary ranges and locations

## Next Steps

1. Try different resumes from different categories
2. Experiment with the personality test
3. Check the matching algorithm in `app.py`
4. View jobs in database:
   ```sql
   psql -U postgres -d job_matching
   SELECT * FROM jobs LIMIT 10;
   ```

## Need Help?

Check the full documentation in `README.md` for:
- Detailed API documentation
- Database schema
- Troubleshooting guide
- Advanced features

## System Architecture

```
Resume (PDF) 
    ↓
Flask Backend (app.py)
    ↓
Skill Extraction (PyPDF2 + Regex)
    ↓
PostgreSQL Database Query
    ↓
Job Matching Algorithm
    ↓
JSON Response
    ↓
Frontend Display (HTML/CSS/JS)
```

Enjoy your AI-powered job matching system! 🚀
