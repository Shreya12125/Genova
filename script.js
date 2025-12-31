// === Big 5 Personality Questions ===
const questions = [
  {
    id: 1,
    trait: "openness",
    question: "When learning a new technology, I prefer to:",
    options: [
      { label: "Build something first", value: 5, description: "Jump into a project and learn by doing" },
      { label: "Take a course first", value: 1, description: "Study the fundamentals before applying" },
      { label: "Mix of both", value: 3, description: "Quick overview then hands-on practice" }
    ]
  },
  {
    id: 2,
    trait: "conscientiousness",
    question: "How do you approach job applications?",
    options: [
      { label: "Apply early & often", value: 5, description: "Get my name out there quickly" },
      { label: "Perfect then apply", value: 1, description: "Wait until resume/skills are polished" },
      { label: "Balanced approach", value: 3, description: "Apply while continuously improving" }
    ]
  },
  {
    id: 3,
    trait: "extraversion",
    question: "When stuck on a problem, I typically:",
    options: [
      { label: "Ask for help immediately", value: 5, description: "Reach out to community or mentors" },
      { label: "Figure it out alone", value: 1, description: "Research and debug independently" },
      { label: "Try first, then ask", value: 3, description: "Give it a solid attempt before seeking help" }
    ]
  },
  {
    id: 4,
    trait: "agreeableness",
    question: "What motivates you more in a project?",
    options: [
      { label: "Helping others", value: 5, description: "Building something that solves real problems" },
      { label: "Personal growth", value: 1, description: "Learning new skills and technologies" },
      { label: "Both equally", value: 3, description: "Balance of impact and learning" }
    ]
  },
  {
    id: 5,
    trait: "neuroticism",
    question: "How do you handle job rejections?",
    options: [
      { label: "Move on quickly", value: 1, description: "It's a numbers game, keep going" },
      { label: "Analyze deeply", value: 5, description: "Understand what went wrong before continuing" },
      { label: "Brief reflection", value: 3, description: "Quick review then move forward" }
    ]
  },
  {
    id: 6,
    trait: "risk_tolerance",
    question: "When considering a career change, you:",
    options: [
      { label: "Take the leap", value: 5, description: "Embrace uncertainty and dive in" },
      { label: "Plan extensively", value: 1, description: "Secure everything before transitioning" },
      { label: "Calculated risk", value: 3, description: "Have a backup but willing to try" }
    ]
  },
  {
    id: 7,
    trait: "learning_style",
    question: "Your ideal learning environment is:",
    options: [
      { label: "Project-based", value: 5, description: "Real-world challenges and building" },
      { label: "Structured courses", value: 1, description: "Step-by-step curriculum and assessments" },
      { label: "Hybrid approach", value: 3, description: "Courses with practical exercises" }
    ]
  },
  {
    id: 8,
    trait: "application_timing",
    question: "When do you feel ready to apply for a role?",
    options: [
      { label: "Meet 50% requirements", value: 5, description: "Apply early and learn on the job" },
      { label: "Meet 90%+ requirements", value: 1, description: "Only when fully qualified" },
      { label: "Meet ~70% requirements", value: 3, description: "Confident in core skills, can learn the rest" }
    ]
  }
];

// === State ===
let currentPage = 'landing';
let currentQuestion = 0;
let answers = {};
let uploadedFile = null;
let candidateSkills = [];
let matchingJobs = [];
let currentUser = null; // { email, role, company_id }
let authMode = 'login'; // 'login' or 'signup'
let authRole = 'applicant'; // 'applicant' or 'company'
let selectedJobId = null;

// API Configuration
const API_BASE_URL = 'http://localhost:5000';

// === Sample Data (fallback) ===
const sampleSkills = ['Python', 'Machine Learning', 'Data Analysis', 'Pandas', 'NumPy', 'Excel', 'SQL', 'Git'];
const missingSkillsList = ['Docker', 'AWS', 'REST APIs'];

// === Page Navigation ===
function showPage(pageName) {
  document.querySelectorAll('.page').forEach(page => page.classList.remove('active'));
  document.getElementById('page-' + pageName).classList.add('active');
  currentPage = pageName;
  window.scrollTo(0, 0);

  if (pageName === 'auth') {
    // Reset auth state message when opening auth page
    const authMessage = document.getElementById('authMessage');
    if (authMessage) authMessage.textContent = '';
  }

  if (pageName === 'personality') {
    currentQuestion = 0;
    answers = {};
    renderQuestion();
  }

  if (pageName === 'results') {
    renderResults();
  }
}

// === File Upload ===
const uploadZone = document.getElementById('uploadZone');
const fileInput = document.getElementById('fileInput');
const fileInfo = document.getElementById('fileInfo');
const continueBtn = document.getElementById('continueBtn');

uploadZone.addEventListener('click', () => fileInput.click());

uploadZone.addEventListener('dragover', (e) => {
  e.preventDefault();
  uploadZone.classList.add('dragover');
});

uploadZone.addEventListener('dragleave', () => {
  uploadZone.classList.remove('dragover');
});

uploadZone.addEventListener('drop', (e) => {
  e.preventDefault();
  uploadZone.classList.remove('dragover');
  const files = e.dataTransfer.files;
  if (files.length) handleFile(files[0]);
});

fileInput.addEventListener('change', () => {
  if (fileInput.files.length) handleFile(fileInput.files[0]);
});

async function handleFile(file) {
  if (file.type !== 'application/pdf') {
    alert('Please upload a PDF file');
    return;
  }
  
  uploadedFile = file;
  fileInfo.innerHTML = `✅ ${file.name} (${(file.size / 1024).toFixed(1)} KB)`;
  fileInfo.classList.remove('hidden');
  
  // Show loading state
  continueBtn.disabled = true;
  const btnText = continueBtn.querySelector('.btn-text');
  const btnLoader = continueBtn.querySelector('.btn-loader');
  btnText.textContent = 'Analyzing Resume...';
  btnLoader.classList.remove('hidden');
  
  // Upload and analyze resume
  try {
    await uploadAndAnalyzeResume(file);
    btnText.textContent = 'Continue to Personality Test';
    btnLoader.classList.add('hidden');
    continueBtn.disabled = false;
  } catch (error) {
    console.error('Error analyzing resume:', error);
    fileInfo.innerHTML = `⚠️ Error analyzing resume. Using sample data.`;
    fileInfo.style.background = 'rgba(245, 158, 11, 0.1)';
    fileInfo.style.borderColor = 'rgba(245, 158, 11, 0.3)';
    fileInfo.style.color = 'var(--warning)';
    btnText.textContent = 'Continue Anyway';
    btnLoader.classList.add('hidden');
    continueBtn.disabled = false;
    // Use sample data as fallback
    candidateSkills = sampleSkills;
  }
}

// Upload resume to backend for analysis
async function uploadAndAnalyzeResume(file) {
  const formData = new FormData();
  formData.append('resume', file);
  
  const response = await fetch(`${API_BASE_URL}/upload-resume`, {
    method: 'POST',
    body: formData
  });
  
  if (!response.ok) {
    throw new Error('Failed to analyze resume');
  }
  
  const data = await response.json();
  console.log('Resume analysis:', data);
  
  // Store extracted skills and matching jobs
  candidateSkills = data.candidate_skills || [];
  matchingJobs = data.matching_jobs || [];
  
  // Update file info with skills count
  fileInfo.innerHTML = `✅ ${file.name} - Found ${candidateSkills.length} skills, ${matchingJobs.length} matching jobs`;
}

// === Auth & Users ===
function setAuthMode(mode) {
  authMode = mode;
  const loginTab = document.getElementById('authTabLogin');
  const signupTab = document.getElementById('authTabSignup');
  if (!loginTab || !signupTab) return;

  loginTab.classList.toggle('active', mode === 'login');
  signupTab.classList.toggle('active', mode === 'signup');

  const submitBtn = document.getElementById('authSubmitBtn');
  if (submitBtn) {
    submitBtn.textContent = mode === 'login' ? 'Login' : 'Sign Up';
  }
}

function setAuthRole(role) {
  authRole = role;
  const applicantBtn = document.getElementById('roleApplicantBtn');
  const companyBtn = document.getElementById('roleCompanyBtn');
  const companyFields = document.getElementById('companyFields');

  if (applicantBtn && companyBtn) {
    applicantBtn.classList.toggle('active', role === 'applicant');
    companyBtn.classList.toggle('active', role === 'company');
  }
  if (companyFields) {
    companyFields.classList.toggle('hidden', role !== 'company');
  }
}

async function submitAuth(event) {
  event.preventDefault();
  const emailEl = document.getElementById('authEmail');
  const passwordEl = document.getElementById('authPassword');
  const messageEl = document.getElementById('authMessage');
  const submitBtn = document.getElementById('authSubmitBtn');

  if (!emailEl || !passwordEl || !submitBtn) return;

  const email = emailEl.value.trim();
  const password = passwordEl.value;

  if (!email || !password) {
    if (messageEl) messageEl.textContent = 'Please enter email and password.';
    return;
  }

  let payload = { email, password };
  let endpoint = '/login';

  if (authMode === 'signup') {
    endpoint = '/signup';
    payload.role = authRole;
    if (authRole === 'company') {
      payload.company_name = (document.getElementById('companyName')?.value || '').trim();
      payload.industry = (document.getElementById('companyIndustry')?.value || '').trim();
      payload.location = (document.getElementById('companyLocation')?.value || '').trim();
    }
  }

  submitBtn.disabled = true;
  submitBtn.textContent = authMode === 'login' ? 'Logging in...' : 'Creating account...';
  if (messageEl) messageEl.textContent = '';

  try {
    const resp = await fetch(`${API_BASE_URL}${endpoint}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload)
    });

    const data = await resp.json();
    if (!resp.ok) {
      throw new Error(data.error || 'Request failed');
    }

    currentUser = data.user || null;
    if (messageEl) messageEl.textContent = data.message || 'Success';

    // Redirect based on role
    if (currentUser && currentUser.role === 'company') {
      const welcome = document.getElementById('companyWelcome');
      if (welcome && currentUser.email) {
        welcome.textContent = `Logged in as ${currentUser.email}. Post jobs for your company.`;
      }
      showPage('company');
    } else {
      showPage('upload');
    }
  } catch (err) {
    console.error('Auth error:', err);
    if (messageEl) messageEl.textContent = err.message || 'Something went wrong.';
  } finally {
    submitBtn.disabled = false;
    submitBtn.textContent = authMode === 'login' ? 'Login' : 'Sign Up';
  }
}

// === Personality Test ===
function renderQuestion() {
  const q = questions[currentQuestion];
  const progress = ((currentQuestion + 1) / questions.length) * 100;

  document.getElementById('questionCount').textContent = `Question ${currentQuestion + 1} of ${questions.length}`;
  document.getElementById('progressPercent').textContent = `${Math.round(progress)}%`;
  document.getElementById('progressFill').style.width = `${progress}%`;
  document.getElementById('questionText').textContent = q.question;

  const optionsContainer = document.getElementById('optionsContainer');
  optionsContainer.innerHTML = q.options.map(opt => `
    <button class="option-btn ${answers[q.id] === opt.value ? 'selected' : ''}" onclick="selectOption(${opt.value})">
      <div class="option-radio">
        <div class="option-radio-inner"></div>
      </div>
      <div class="option-content">
        <h4>${opt.label}</h4>
        <p>${opt.description}</p>
      </div>
    </button>
  `).join('');

  document.getElementById('backBtn').disabled = currentQuestion === 0;
  document.getElementById('nextBtn').disabled = !answers[q.id];
  document.getElementById('nextBtn').textContent = currentQuestion === questions.length - 1 ? 'See Results →' : 'Next →';
}

function selectOption(value) {
  const q = questions[currentQuestion];
  answers[q.id] = value;
  renderQuestion();
}

function nextQuestion() {
  if (currentQuestion < questions.length - 1) {
    currentQuestion++;
    renderQuestion();
  } else {
    showPage('results');
  }
}

function prevQuestion() {
  if (currentQuestion > 0) {
    currentQuestion--;
    renderQuestion();
  }
}

// === Results ===
function calculateProfile() {
  const learningStyleScore = (answers[1] || 3) + (answers[7] || 3);
  const riskToleranceScore = (answers[2] || 3) + (answers[6] || 3) + (answers[8] || 3);

  const learning_style = learningStyleScore >= 6 ? 'project_first' : learningStyleScore <= 4 ? 'course_first' : 'hybrid';
  const risk = riskToleranceScore >= 10 ? 'high' : riskToleranceScore <= 6 ? 'low' : 'medium';

  return { learning_style, risk };
}

function renderResults() {
  const profile = calculateProfile();
  
  // Use analyzed skills or fallback to sample
  const displaySkills = candidateSkills.length > 0 ? candidateSkills : sampleSkills;
  const topJob = matchingJobs.length > 0 ? matchingJobs[0] : null;

  // Skills
  document.getElementById('skillsTags').innerHTML = displaySkills.map(s => `<span class="skill-tag">${s}</span>`).join('');

  // Match Score Animation
  let score = 0;
  const targetScore = topJob ? Math.round(topJob.match_percentage) : 62;
  const scoreInterval = setInterval(() => {
    score += 2;
    if (score >= targetScore) {
      score = targetScore;
      clearInterval(scoreInterval);
    }
    document.getElementById('scoreValue').textContent = `${score}%`;
    document.getElementById('scoreCircle').style.background = `conic-gradient(var(--primary) ${score * 3.6}deg, rgba(255,255,255,0.1) 0deg)`;
  }, 30);
  
  // Update job title if we have real data
  if (topJob) {
    document.querySelector('.score-label').textContent = `${topJob.job_title} @ ${topJob.company_name}`;
  }

  // Missing Skills
  const displayMissingSkills = topJob && topJob.missing_skills ? topJob.missing_skills : missingSkillsList;
  document.getElementById('missingSkills').innerHTML = `
    <span class="label">Missing:</span>
    ${displayMissingSkills.map(s => `<span>${s}</span>`).join('')}
  `;

  // Learning Style
  const learningData = {
    project_first: {
      title: '⚡ Project-First Learner',
      desc: 'You learn best by building. We recommend starting with hands-on projects to fill skill gaps.',
      recs: ['Build a containerized ML API with Docker & FastAPI', 'Deploy a data pipeline to AWS Lambda', 'Create a REST API with authentication']
    },
    course_first: {
      title: '📚 Structured Learner',
      desc: 'You prefer solid foundations. We recommend completing courses before building projects.',
      recs: ['Docker & Kubernetes Fundamentals', 'AWS Solutions Architect Associate', 'API Design & Development']
    },
    hybrid: {
      title: '🎯 Hybrid Learner',
      desc: 'You balance theory and practice. We recommend course summaries followed by mini-projects.',
      recs: ['Quick crash course → Small project → Full course if needed']
    }
  };

  const learning = learningData[profile.learning_style];
  document.getElementById('learningTitle').textContent = learning.title;
  document.getElementById('learningDesc').textContent = learning.desc;
  document.getElementById('learningRecs').innerHTML = learning.recs.map(r => `
    <div class="rec-item"><span>💡</span> ${r}</div>
  `).join('');

  // Application Strategy
  const strategyData = {
    high: {
      title: '🚀 Early Applicant Strategy',
      desc: "You're comfortable with risk. Apply to roles even at 50% match — your confidence will shine in interviews.",
      timing: 'Apply immediately while building missing skills',
      volume: 'High volume: 5-10 applications per week'
    },
    low: {
      title: '🎯 Prepared Applicant Strategy',
      desc: 'You prefer certainty. Focus on building all required skills before applying to maximize success rate.',
      timing: 'Apply after completing skill roadmap',
      volume: 'Targeted: 2-3 high-match applications per week'
    },
    medium: {
      title: '⚖️ Balanced Application Strategy',
      desc: 'You take calculated risks. Apply to ~70% match roles while actively building remaining skills.',
      timing: 'Apply now to stretch roles, save dream jobs for later',
      volume: 'Moderate: 3-5 applications per week'
    }
  };

  const strategy = strategyData[profile.risk];
  document.getElementById('strategyTitle').textContent = strategy.title;
  document.getElementById('strategyDesc').textContent = strategy.desc;
  document.getElementById('strategyTiming').textContent = strategy.timing;
  document.getElementById('strategyVolume').textContent = strategy.volume;

  // Failure Reason
  document.getElementById('reasonCard').innerHTML = `
    <p>Your resume shows strong Python and ML skills, but lacks <strong>deployment experience</strong> (Docker, AWS) and <strong>API development</strong> knowledge which are critical for this Software Engineer role. Consider building and deploying a project to demonstrate these skills.</p>
  `;

  // Roadmap
  let roadmap = [];
  if (profile.learning_style === 'project_first') {
    roadmap = [
      { week: 'Week 1', title: 'Docker Project', desc: 'Containerize an existing Python app' },
      { week: 'Week 2', title: 'Build REST API', desc: 'Create FastAPI backend with Docker' },
      { week: 'Week 3', title: 'AWS Deployment', desc: 'Deploy to AWS and document the process' },
      { week: 'Week 4', title: profile.risk === 'high' ? 'Apply Aggressively' : 'Apply to Matches', desc: profile.risk === 'high' ? 'Send 10+ applications with new portfolio' : 'Target 5 high-match positions' }
    ];
  } else if (profile.learning_style === 'course_first') {
    roadmap = [
      { week: 'Week 1-2', title: 'Docker Course', desc: 'Complete Docker fundamentals certification' },
      { week: 'Week 3', title: 'AWS Essentials', desc: 'Cloud practitioner basics' },
      { week: 'Week 4', title: 'API Development', desc: 'REST API design course' },
      { week: 'Week 5-6', title: 'Portfolio Project', desc: 'Build comprehensive demo project' }
    ];
  } else {
    roadmap = [
      { week: 'Week 1', title: 'Docker Crash Course + Mini Project', desc: 'Quick tutorial then containerize a simple app' },
      { week: 'Week 2', title: 'API Fundamentals + Build', desc: 'Learn REST basics, build small API' },
      { week: 'Week 3', title: 'AWS Quick Start + Deploy', desc: 'Essential AWS services, deploy your projects' },
      { week: 'Week 4', title: 'Apply & Iterate', desc: 'Start applications while polishing portfolio' }
    ];
  }

  document.getElementById('roadmap').innerHTML = roadmap.map(r => `
    <div class="roadmap-week">
      <span class="week-label">${r.week}</span>
      <div class="week-content">
        <strong>${r.title}</strong>
        <p>${r.desc}</p>
      </div>
    </div>
  `).join('');
  
  // Render matching jobs list
  renderJobsList();

  // Console output for debugging
  console.log('Personality Profile:', profile);
  console.log('Matching Jobs:', matchingJobs);
}

// Render jobs list
function renderJobsList() {
  const jobsListContainer = document.getElementById('jobsList');
  
  if (!jobsListContainer) return;

  if (!matchingJobs || matchingJobs.length === 0) {
    jobsListContainer.innerHTML = `
      <div style="text-align: center; padding: 40px; color: var(--foreground-muted);">
        <p>No matching jobs found. The backend server may not be running or no jobs match your skills.</p>
        <p style="font-size: 0.9rem; margin-top: 8px;">Make sure PostgreSQL and Flask are running.</p>
      </div>
    `;
    return;
  }
  
  const getMatchClass = (percentage) => {
    if (percentage >= 70) return 'high';
    if (percentage >= 50) return 'medium';
    return 'low';
  };

  jobsListContainer.innerHTML = matchingJobs.map(job => {
    const shortDesc = job.job_description
      ? job.job_description.slice(0, 140) + (job.job_description.length > 140 ? '...' : '')
      : '';

    return `
      <div class="job-item" onclick="openJobModal(${job.job_id})">
        <div class="job-header">
          <div class="job-info">
            <h4>${job.job_title}</h4>
            <div class="job-company">${job.company_name} • ${job.industry}</div>
            <div class="job-location">📍 ${job.location}</div>
          </div>
          <div class="job-match">
            <span class="match-badge ${getMatchClass(job.match_percentage)}">
              ${Math.round(job.match_percentage)}% Match
            </span>
          </div>
        </div>
        
        <div class="job-details">
          <div class="job-detail-item">
            <span>💼</span>
            <span>${job.experience_required}</span>
          </div>
          <div class="job-detail-item">
            <span>💰</span>
            <span>${job.salary_range}</span>
          </div>
          <div class="job-detail-item">
            <span>🎯</span>
            <span>${job.matched_skills_count}/${job.total_required_skills} skills matched</span>
          </div>
        </div>
        
        ${shortDesc ? `<p style="color: var(--foreground-muted); font-size: 0.9rem; margin-bottom: 12px;">${shortDesc}</p>` : ''}
      </div>
    `;
  }).join('');
}

function openJobModal(jobId) {
  const modal = document.getElementById('jobModal');
  if (!modal) return;

  const job = matchingJobs.find(j => j.job_id === jobId);
  if (!job) return;

  selectedJobId = jobId;

  const titleEl = document.getElementById('modalJobTitle');
  const companyEl = document.getElementById('modalCompany');
  const locationEl = document.getElementById('modalLocation');
  const descEl = document.getElementById('modalDescription');
  const skillsEl = document.getElementById('modalSkills');
  const applyMsg = document.getElementById('applyMessage');

  if (titleEl) titleEl.textContent = job.job_title;
  if (companyEl) companyEl.textContent = `${job.company_name} • ${job.industry}`;
  if (locationEl) locationEl.textContent = job.location ? `📍 ${job.location}` : '';
  if (descEl) descEl.textContent = job.job_description || 'No description available.';
  if (applyMsg) applyMsg.textContent = '';

  if (skillsEl) {
    const allSkills = [
      ...(job.matched_skills || []).map(s => ({ name: s, type: 'matched' })),
      ...(job.missing_skills || []).map(s => ({ name: s, type: 'missing' }))
    ];

    skillsEl.innerHTML = allSkills.map(s => `
      <span class="job-skill-tag ${s.type === 'matched' ? 'matched' : 'missing'}">${s.name}</span>
    `).join('');
  }

  modal.classList.remove('hidden');
}

function closeJobModal() {
  const modal = document.getElementById('jobModal');
  if (modal) modal.classList.add('hidden');
}

function applyToJob() {
  const msgEl = document.getElementById('applyMessage');
  if (!selectedJobId) {
    if (msgEl) msgEl.textContent = 'Something went wrong. Please close and reopen this job.';
    return;
  }
  const job = matchingJobs.find(j => j.job_id === selectedJobId);
  const companyName = job ? job.company_name : 'this company';
  if (msgEl) msgEl.textContent = `Application recorded for ${companyName}. (Demo only)`;
}

// Resume builder submit
async function submitBuiltResume(event) {
  event.preventDefault();
  const skillsEl = document.getElementById('builderSkills');
  const messageEl = document.getElementById('builderMessage');
  const submitBtn = document.getElementById('builderSubmitBtn');

  if (!skillsEl || !submitBtn) return;

  const skills = skillsEl.value.split(',').map(s => s.trim()).filter(Boolean);
  if (skills.length === 0) {
    if (messageEl) messageEl.textContent = 'Please enter at least one skill.';
    return;
  }

  submitBtn.disabled = true;
  submitBtn.textContent = 'Analyzing skills...';
  if (messageEl) messageEl.textContent = '';

  try {
    const resp = await fetch(`${API_BASE_URL}/match-skills`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ skills })
    });
    const data = await resp.json();
    if (!resp.ok) {
      throw new Error(data.error || 'Failed to analyze skills');
    }

    candidateSkills = data.candidate_skills || skills;
    matchingJobs = data.matching_jobs || [];

    if (messageEl) {
      messageEl.textContent = `Found ${candidateSkills.length} skills and ${matchingJobs.length} matching jobs.`;
    }

    // Proceed to personality test
    showPage('personality');
  } catch (err) {
    console.error('Resume builder error:', err);
    if (messageEl) messageEl.textContent = err.message || 'Something went wrong.';
  } finally {
    submitBtn.disabled = false;
    submitBtn.textContent = 'Analyze & Continue to Personality Test';
  }
}

// Company job submit
async function submitJob(event) {
  event.preventDefault();
  const msgEl = document.getElementById('jobMessage');
  const submitBtn = document.getElementById('jobSubmitBtn');

  if (!submitBtn) return;

  if (!currentUser || currentUser.role !== 'company') {
    if (msgEl) msgEl.textContent = 'Please login as a company user first.';
    showPage('auth');
    return;
  }

  const title = document.getElementById('jobTitle')?.value.trim();
  const category = document.getElementById('jobCategory')?.value.trim();
  const location = document.getElementById('jobLocation')?.value.trim();
  const experience = document.getElementById('jobExperience')?.value.trim();
  const salary = document.getElementById('jobSalary')?.value.trim();
  const description = document.getElementById('jobDescription')?.value.trim();
  const skillsRaw = document.getElementById('jobSkills')?.value || '';
  const skills = skillsRaw.split(',').map(s => s.trim()).filter(Boolean);

  if (!title || !description || skills.length === 0) {
    if (msgEl) msgEl.textContent = 'Please fill job title, description, and at least one skill.';
    return;
  }

  submitBtn.disabled = true;
  submitBtn.textContent = 'Posting job...';
  if (msgEl) msgEl.textContent = '';

  try {
    const resp = await fetch(`${API_BASE_URL}/jobs`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        user_email: currentUser.email,
        job_title: title,
        job_category: category,
        location,
        experience_required: experience,
        salary_range: salary,
        job_description: description,
        skills
      })
    });
    const data = await resp.json();
    if (!resp.ok) {
      throw new Error(data.error || 'Failed to create job');
    }

    if (msgEl) msgEl.textContent = 'Job posted successfully.';
    // Optionally clear the form
    document.getElementById('jobTitle').value = '';
    document.getElementById('jobCategory').value = '';
    document.getElementById('jobLocation').value = '';
    document.getElementById('jobExperience').value = '';
    document.getElementById('jobSalary').value = '';
    document.getElementById('jobDescription').value = '';
    document.getElementById('jobSkills').value = '';
  } catch (err) {
    console.error('Job submit error:', err);
    if (msgEl) msgEl.textContent = err.message || 'Something went wrong.';
  } finally {
    submitBtn.disabled = false;
    submitBtn.textContent = 'Post Job';
  }
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
  showPage('landing');
});
