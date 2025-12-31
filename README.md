# MIDCOURSE
### Market-Aware Agentic AI System for Adaptive Career Decision-Making

---

## Overview

MIDCOURSE is an Agentic AI–powered career intelligence system that helps students and early professionals understand **why job applications fail** and **what to do next**.

Unlike traditional platforms that only provide match scores or static advice, MIDCOURSE reasons over rejections, analyzes real job market requirements, plans corrective actions, and continuously adapts career strategy using feedback.

---

## Problem Statement

Students repeatedly apply for jobs and internships but receive rejections without clear explanations.

Existing systems:
- Show only resume match scores
- List job opportunities without guidance
- Provide generic chatbot advice
- Recommend courses without context
- Do not learn from failures

As a result, users are left confused after every rejection.

---

## Solution

MIDCOURSE acts as a **career co-pilot** that:
- Explains why a rejection happened
- Identifies exact skill and role gaps
- Prioritizes skills based on market demand
- Plans the next best career action autonomously
- Converts skill gaps into portfolio-ready projects
- Improves recommendations using feedback

---

## Why Agentic AI

MIDCOURSE follows a true Agentic AI loop:

Observe → Reason → Plan → Act → Learn

The system:
- Observes resumes, job requirements, and market data
- Reasons about failures and skill gaps
- Plans corrective career actions
- Acts by generating projects and roadmaps
- Learns from outcomes to improve future decisions

This makes MIDCOURSE an adaptive decision-making agent, not a static recommender.

---

## System Workflow

1. User uploads resume and selects target role  
2. Resume skills are extracted  
3. Job requirements are analyzed  
4. Resume–job match score is calculated  
5. Rejection reasons are explained  
6. Market skill demand is analyzed  
7. Agent plans next best action  
8. Skill-to-project roadmap is generated  
9. Feedback improves future strategies  

---

## Database Design

**Database Name:** `job_matching`

### Core Tables
- `companies` – company and industry details  
- `jobs` – job roles linked to companies  
- `skills` – centralized skill repository  
- `job_skills` – job-to-skill requirement mapping  
- `users` – applicant and company roles  

This structured database represents the real job market environment that the agent reasons over.

---

## Data Source Strategy

- Job requirements are collected from publicly available job postings
- Scraping is performed offline for stability and ethics
- No synthetic job descriptions are generated
- User resumes are uploaded and parsed locally

---

## Technologies Used

### AI & Reasoning
- Large Language Models (LLMs)
- Rule-based reasoning logic
- Agentic decision loop

### Backend
- Python
- FastAPI
- PostgreSQL
- psycopg2

### Data Processing
- pdfplumber / PyPDF2
- BeautifulSoup
- Regex-based skill extraction

### Frontend / Demo
- Streamlit or React
- Postman (API testing)

---

## Key Innovations

- Failure-first career reasoning
- Market-aware skill prioritization
- Personality-aware strategy planning
- Skill-to-project execution instead of generic advice
- Continuous learning from outcomes

---

## Hackathon Alignment

- Strong Agentic AI architecture
- Autonomous decision-making
- Explainable reasoning
- Real-world student impact
- Modular and scalable design

---

## Future Enhancements

- Live job market scraping with schedulers
- Resume version tracking
- Interview feedback integration
- Multi-agent collaboration
- Cloud deployment

---

## One-Line Pitch

MIDCOURSE is a market-aware Agentic AI system that learns from resume rejections, explains why they happen, and autonomously adapts career strategy until the user becomes job-ready.
