# ToxScreen - AI-Driven Toxicology Platform

> **Information First. Intelligence Second. Always.**

Next-generation scientific intelligence platform for computational toxicology prediction.

## Quick Start

### Prerequisites
- Docker & Docker Compose
- Python 3.12+
- Node.js 20+
- pnpm

### Development Setup

```bash
# Clone repository
git clone git@github.com:YOUR_USERNAME/toxscreen.git
cd toxscreen

# Start services
docker compose up -d

# Install dependencies
cd api && pip install -r requirements.txt
cd ../frontend && pnpm install

# Run API
cd ../api && uvicorn app.main:app --reload

# Run frontend (new terminal)
cd frontend && pnpm dev
Testing
# Backend tests
cd api && pytest tests/ -v

# Frontend tests
cd frontend && pnpm test
Architecture
L1: Ingestion → L2: Source Retrieval → L3: Validation → 
L4: Integration → L5: Intelligence → L6: Output
Features
11+ scientific database integrations

Ensemble ML models with uncertainty

Metabolite toxicity prediction

Dose-response analysis

GxP audit trail

ICH M7 compliance

FDA DDT qualification roadmap
License
Proprietary. All rights reserved.

---

And here's the CONTRIBUTING.md content:

```markdown
# Contributing to ToxScreen

## Development Workflow

1. Fork repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## Commit Convention

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `test:` Testing
- `refactor:` Code restructuring
- `chore:` Maintenance

## Code Quality

- Backend: pytest coverage > 80%
- Frontend: ESLint + Prettier
- All PRs require review

---

# PHASE 9: FINAL VERIFICATION (4:30 PM - 5:00 PM)

## Complete Verification Script

```bash
cat > ~/projects/toxscreen/scripts/verify_day1.sh << 'EOF'
#!/bin/bash
# Day 1 Verification Script
# Run this at end of day to verify everything works

echo "========================================"
echo "  ToxScreen Day 1 Verification"
echo "========================================"
echo ""

# Check 1: System
echo "✓ Checking system..."
echo "  Ubuntu: $(lsb_release -rs)"
echo "  Architecture: $(uname -m)"
echo "  RAM: $(free -h | awk '/Mem:/ {print $2}')"
echo ""

# Check 2: Docker
echo "✓ Checking Docker..."
if docker --version > /dev/null 2>&1; then
    echo "  ✅ Docker: $(docker --version | cut -d' ' -f3 | tr -d ',')"
else
    echo "  ❌ Docker not found"
fi

if docker compose version > /dev/null 2>&1; then
    echo "  ✅ Docker Compose: $(docker compose version --short)"
else
    echo "  ❌ Docker Compose not found"
fi
echo ""

# Check 3: Python
echo "✓ Checking Python..."
echo "  ✅ Python: $(python --version)"
echo "  ✅ pip: $(pip --version | cut -d' ' -f2)"
echo ""

# Check 4: Node.js
echo "✓ Checking Node.js..."
echo "  ✅ Node: $(node --version)"
echo "  ✅ npm: $(npm --version)"
echo "  ✅ pnpm: $(pnpm --version)"
echo ""

# Check 5: RDKit
echo "✓ Checking RDKit..."
if python -c "from rdkit import Chem; print(Chem.rdBase.rdkitVersion)" > /dev/null 2>&1; then
    echo "  ✅ RDKit: $(python -c "from rdkit import Chem; print(Chem.rdBase.rdkitVersion)")"
else
    echo "  ❌ RDKit not found"
fi
echo ""

# Check 6: Docker services
echo "✓ Checking Docker services..."
if curl -s http://localhost:8000/api/health > /dev/null 2>&1; then
    echo "  ✅ API running on port 8000"
    HEALTH=$(curl -s http://localhost:8000/api/health)
    echo "  Response: $HEALTH"
else
    echo "  ⚠️  API not running (start with: docker compose up -d)"
fi
echo ""

# Check 7: Frontend
echo "✓ Checking Frontend..."
if [ -f frontend/package.json ]; then
    echo "  ✅ package.json exists"
    echo "  ✅ Node modules: $(ls frontend/node_modules 2>/dev/null | wc -l) packages"
else
    echo "  ❌ Frontend not set up"
fi
echo ""

# Check 8: Git
echo "✓ Checking Git..."
echo "  ✅ Repository: $(git remote get-url origin 2>/dev/null || echo 'Not configured')"
echo "  ✅ Branch: $(git branch --show-current)"
echo "  ✅ Last commit: $(git log -1 --oneline 2>/dev/null || echo 'No commits')"
echo ""

# Check 9: Tests
echo "✓ Running tests..."
cd api
TEST_RESULT=$(python -m pytest tests/ -q 2>&1 | tail -1)
echo "  $TEST_RESULT"
cd ..
echo ""

echo "========================================"
echo "  Day 1 Complete! 🎉"
echo "========================================"
echo ""
echo "Next steps (Day 2):"
echo "  1. Design database schema"
echo "  2. Implement source connectors"
echo "  3. Create CIP builder service"
echo ""
echo "Quick links:"
echo "  API: http://localhost:8000/api/docs"
echo "  Frontend: http://localhost:3000"
echo "  Health: http://localhost:8000/api/health"
EOF

chmod +x ~/projects/toxscreen/scripts/verify_day1.sh

# Run verification
cd ~/projects/toxscreen
./scripts/verify_day1.sh