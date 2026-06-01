.PHONY: help install dev test build clean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install all dependencies
	@echo "Installing Python dependencies..."
	cd api && pip install -r requirements.txt
	@echo "Installing Node dependencies..."
	cd frontend && pnpm install

dev: ## Start development environment
	docker compose up -d postgres redis
	sleep 5
	cd api && uvicorn app.main:app --reload --host 0.0.0.0 --port 8000 &
	cd frontend && pnpm dev

stop: ## Stop all services
	docker compose down
	pkill -f uvicorn
	pkill -f "pnpm dev"

test: ## Run all tests
	cd api && pytest tests/ -v --cov=app
	cd frontend && pnpm test

build: ## Build for production
	docker compose -f docker-compose.prod.yml build

clean: ## Clean all generated files
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	rm -rf frontend/.next
	rm -rf api/dist
	rm -rf node_modules

db-migrate: ## Run database migrations
	cd api && alembic upgrade head

db-reset: ## Reset database (WARNING: deletes all data)
	docker compose down -v postgres
	docker compose up -d postgres
	sleep 5
	cd api && alembic upgrade head

logs: ## Show logs
	docker compose logs -f
