#!/bin/bash
# ==============================================
# ToxScreen - Day 1 Complete Verification
# ==============================================

PASS=0
FAIL=0
TOTAL=0

check() {
    TOTAL=$((TOTAL + 1))
    if [ $1 -eq 0 ]; then
        echo "  ✅ $2"
        PASS=$((PASS + 1))
    else
        echo "  ❌ $2"
        FAIL=$((FAIL + 1))
    fi
}

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   ToxScreen Day 1 - Complete Verification ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# ---- SYSTEM ----
echo "📦 SYSTEM REQUIREMENTS"
echo "─────────────────────────────────────────"
uname -m | grep -q aarch64
check $? "ARM64 architecture detected"

free -h | awk '/Mem:/ {print $2}' | grep -q G
check $? "RAM detected"

df -h / | awk 'NR==2 {print $5}' | grep -q %
check $? "Disk space available"
echo ""

# ---- DOCKER ----
echo "🐳 DOCKER"
echo "─────────────────────────────────────────"
docker --version > /dev/null 2>&1
check $? "Docker installed"

docker compose version > /dev/null 2>&1
check $? "Docker Compose installed"

docker compose ps 2>/dev/null | grep -q toxscreen-postgres
check $? "PostgreSQL container running"

docker compose ps 2>/dev/null | grep -q toxscreen-redis
check $? "Redis container running"

docker compose ps 2>/dev/null | grep -q toxscreen-api
check $? "API container running"
echo ""

# ---- API ----
echo "🔌 API ENDPOINTS"
echo "─────────────────────────────────────────"
HEALTH=$(curl -s http://localhost:8000/api/health 2>/dev/null)
echo "$HEALTH" | grep -q "healthy"
check $? "Health endpoint (/api/health)"

ROOT=$(curl -s http://localhost:8000/ 2>/dev/null)
echo "$ROOT" | grep -q "ToxScreen"
check $? "Root endpoint (/)"

curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/api/docs | grep -q 200
check $? "API docs accessible (/api/docs)"

curl -s http://localhost:8000/api/v1/info 2>/dev/null | grep -q "v1"
check $? "API v1 info endpoint"
echo ""

# ---- PYTHON ----
echo "🐍 PYTHON & PACKAGES"
echo "─────────────────────────────────────────"
python --version 2>/dev/null | grep -q "3.1[2-9]"
check $? "Python 3.12+ installed"

python -c "import fastapi" 2>/dev/null
check $? "FastAPI package"

python -c "import rdkit; print(rdkit.__version__)" 2>/dev/null | grep -q "202"
check $? "RDKit package"

python -c "import torch" 2>/dev/null
check $? "PyTorch package"

python -c "import sklearn" 2>/dev/null
check $? "Scikit-learn package"

python -c "import numpy" 2>/dev/null
check $? "NumPy package"

python -c "import sqlalchemy" 2>/dev/null
check $? "SQLAlchemy package"

python -c "import xgboost" 2>/dev/null
check $? "XGBoost package"
echo ""

# ---- NODE.JS ----
echo "📦 NODE.JS & FRONTEND"
echo "─────────────────────────────────────────"
node --version > /dev/null 2>&1
check $? "Node.js installed"

pnpm --version > /dev/null 2>&1
check $? "pnpm installed"

[ -f frontend/package.json ]
check $? "Frontend package.json exists"

[ -d frontend/node_modules ]
check $? "Frontend node_modules exists"

[ -d frontend/src ]
check $? "Frontend src directory exists"
echo ""

# ---- GIT ----
echo "🔧 GIT CONFIGURATION"
echo "─────────────────────────────────────────"
git config --global user.name | grep -q "sris02846-bit"
check $? "Git user.name configured"

git config --global user.email | grep -q "sris02846"
check $? "Git user.email configured"

git log --oneline -1 2>/dev/null | grep -q .
check $? "At least one commit made"

git remote -v 2>/dev/null | grep -q origin
check $? "Git remote configured"
echo ""

# ---- PROJECT STRUCTURE ----
echo "📁 PROJECT STRUCTURE"
echo "─────────────────────────────────────────"
[ -d api/app ]
check $? "API app directory"

[ -d api/app/routers ]
check $? "API routers directory"

[ -d api/app/services ]
check $? "API services directory"

[ -d api/tests ]
check $? "API tests directory"

[ -f api/app/main.py ]
check $? "API main.py exists"

[ -f api/requirements.txt ]
check $? "API requirements.txt exists"

[ -f docker-compose.yml ]
check $? "docker-compose.yml exists"

[ -f .env ]
check $? ".env file exists"

[ -f .gitignore ]
check $? ".gitignore exists"

[ -f README.md ]
check $? "README.md exists"
echo ""

# ---- TESTS ----
echo "🧪 TESTS"
echo "─────────────────────────────────────────"
cd api
python -m pytest tests/ -q --tb=no 2>/dev/null
check $? "API tests passing"
cd ..
echo ""

# ---- SUMMARY ----
echo "╔══════════════════════════════════════════╗"
echo "║              DAY 1 SUMMARY               ║"
echo "╠══════════════════════════════════════════╣"
printf "║  ✅ Passed:  %2d / %2d                       ║\n" $PASS $TOTAL
printf "║  ❌ Failed:  %2d / %2d                       ║\n" $FAIL $TOTAL
echo "╚══════════════════════════════════════════╝"

if [ $FAIL -eq 0 ]; then
    echo ""
    echo "  🎉 PERFECT! Day 1 is 100% COMPLETE!"
    echo ""
    echo "  Next steps (Day 2):"
    echo "    - Design database schema"
    echo "    - Implement PubChem connector"
    echo "    - Build CIP data structure"
    echo "    - Create SMILES validator"
    echo ""
else
    echo ""
    echo "  ⚠️  $FAIL item(s) need attention."
    echo "  Review the ❌ items above and fix them."
    echo ""
fi
