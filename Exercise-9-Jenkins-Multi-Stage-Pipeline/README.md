# Exercise 9: Jenkins Multi-Stage Pipeline

## Objective
Create and execute a Jenkins Pipeline that performs multiple stages: Build, Test, and Deploy for a sample Python Flask application.

## Files
- `app.py` — Flask app returning `"Hello, Jenkins Multi-Stage Pipeline!"`
- `test_app.py` — unittest verifying status 200 and correct response body
- `Jenkinsfile` — 4-stage pipeline: Build → Deploy → Run Application → Test Application
- `requirements.txt` — `flask==2.1.2`

## How to Run

### Test Locally
```bash
pip3 install flask==2.1.2
python3 -m unittest test_app.py -v
# Expected: Ran 1 test in 0.012s — OK
```

### Jenkins Pipeline
1. Create Pipeline job in Jenkins
2. Set SCM to your Git repo
3. Script path: `Exercise-9-Jenkins-Multi-Stage-Pipeline/Jenkinsfile`
4. Build Now → all 4 stages should pass

## Expected Output
```
Hello, Jenkins Multi-Stage Pipeline!
.
----------------------------------------------------------------------
Ran 1 test in 0.012s

OK
```

## Screenshots
- `screenshots/01_pytest_and_jenkinsfile.png` — unittest OK + Jenkinsfile content
- `screenshots/02_pipeline_stages.png` — Jenkins pipeline stages
