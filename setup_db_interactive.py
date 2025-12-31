"""
Interactive Database Setup Script
This script will prompt for your PostgreSQL password
"""

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import os
import getpass

def main():
    print("="*50)
    print("JOB MATCHING SYSTEM - DATABASE SETUP")
    print("="*50)
    print()
    
    # Get password from user
    print("Please enter your PostgreSQL password:")
    db_password = getpass.getpass("Password: ")
    
    DB_USER = 'postgres'
    DB_HOST = 'localhost'
    DB_PORT = '5432'
    DB_NAME = 'job_matching'
    
    # Step 1: Create database
    print("\nStep 1: Creating database...")
    try:
        conn = psycopg2.connect(
            user=DB_USER,
            password=db_password,
            host=DB_HOST,
            port=DB_PORT,
            database='postgres'
        )
        conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cursor = conn.cursor()
        
        cursor.execute("SELECT 1 FROM pg_catalog.pg_database WHERE datname = %s", (DB_NAME,))
        exists = cursor.fetchone()
        
        if not exists:
            cursor.execute(f"CREATE DATABASE {DB_NAME}")
            print(f"✅ Database '{DB_NAME}' created successfully")
        else:
            print(f"ℹ️  Database '{DB_NAME}' already exists")
        
        cursor.close()
        conn.close()
    except Exception as e:
        print(f"❌ Error: {e}")
        return
    
    print()
    
    # Step 2: Execute SQL files
    print("Step 2: Loading database schema and data...")
    sql_files = [
        'database_setup.sql',
        'jobs_data.sql',
        'job_skills_mapping.sql'
    ]
    
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    for sql_file in sql_files:
        filepath = os.path.join(script_dir, sql_file)
        if os.path.exists(filepath):
            try:
                conn = psycopg2.connect(
                    user=DB_USER,
                    password=db_password,
                    host=DB_HOST,
                    port=DB_PORT,
                    database=DB_NAME
                )
                cursor = conn.cursor()
                
                with open(filepath, 'r', encoding='utf-8') as f:
                    sql = f.read()
                    cursor.execute(sql)
                
                conn.commit()
                cursor.close()
                conn.close()
                
                print(f"✅ Executed: {os.path.basename(filepath)}")
            except Exception as e:
                print(f"❌ Error executing {filepath}: {e}")
                return
        else:
            print(f"⚠️  File not found: {sql_file}")
    
    print()
    
    # Step 3: Verify
    print("Step 3: Verifying database setup...")
    try:
        conn = psycopg2.connect(
            user=DB_USER,
            password=db_password,
            host=DB_HOST,
            port=DB_PORT,
            database=DB_NAME
        )
        cursor = conn.cursor()
        
        cursor.execute("SELECT COUNT(*) FROM companies")
        company_count = cursor.fetchone()[0]
        
        cursor.execute("SELECT COUNT(*) FROM skills")
        skill_count = cursor.fetchone()[0]
        
        cursor.execute("SELECT COUNT(*) FROM jobs")
        job_count = cursor.fetchone()[0]
        
        cursor.execute("SELECT COUNT(*) FROM job_skills")
        job_skill_count = cursor.fetchone()[0]
        
        cursor.close()
        conn.close()
        
        print("\n" + "="*50)
        print("DATABASE SETUP VERIFICATION")
        print("="*50)
        print(f"✅ Companies: {company_count}")
        print(f"✅ Skills: {skill_count}")
        print(f"✅ Jobs: {job_count}")
        print(f"✅ Job-Skill Mappings: {job_skill_count}")
        print("="*50)
        
        if company_count > 0 and skill_count > 0 and job_count > 0:
            print("\n🎉 Database setup completed successfully!")
            
            # Save password to a config file for app.py
            print("\n" + "="*50)
            print("IMPORTANT: Update app.py with your password")
            print("="*50)
            print(f"Edit app.py, line 17, and change:")
            print(f"    'password': 'postgres',")
            print(f"to:")
            print(f"    'password': '{db_password}',")
            print("="*50)
        else:
            print("\n⚠️  Warning: Some tables are empty")
            
    except Exception as e:
        print(f"❌ Error verifying setup: {e}")

if __name__ == "__main__":
    main()
