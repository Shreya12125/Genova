import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from app import extract_skills_from_text, get_matching_jobs

# Test skill extraction
test_resume_text = """
John Doe
Software Engineer

Skills:
- Python programming
- Machine Learning
- Data Analysis
- SQL databases
- JavaScript
- React.js
- Docker containers
- AWS cloud services
- Git version control

Experience:
5 years of software development experience
"""

print("Testing skill extraction...")
extracted_skills = extract_skills_from_text(test_resume_text)
print(f"Extracted skills: {extracted_skills}")

print("\nTesting job matching...")
matching_jobs = get_matching_jobs(extracted_skills, limit=5)
print(f"Number of matching jobs: {len(matching_jobs)}")

if matching_jobs:
    print("Sample matching job:")
    job = matching_jobs[0]
    print(f"- {job['job_title']} at {job['company_name']}")
    print(f"- Matched skills: {job['matched_skills_count']}/{job['total_required_skills']}")
    print(f"- Match percentage: {job['match_percentage']}%")
else:
    print("No matching jobs found!")
