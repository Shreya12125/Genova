import pandas as pd

# Load the dataset
file_path = r"C:\Users\Admin\Downloads\archive (1)\all_job_post.csv"
df = pd.read_csv(file_path)

# Print all job titles
for title in df['job_title']:
    print(title)
