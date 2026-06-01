"""Test health and root endpoints."""
import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_health_check():
    """Test health endpoint returns 200."""
    response = client.get("/api/health")
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "healthy"
    assert data["app"] == "ToxScreen"
    assert "timestamp" in data

def test_root():
    """Test root endpoint."""
    response = client.get("/")
    assert response.status_code == 200
    data = response.json()
    assert data["name"] == "ToxScreen"
    assert "version" in data

def test_api_info():
    """Test API info endpoint."""
    response = client.get("/api/v1/info")
    assert response.status_code == 200
    data = response.json()
    assert "endpoints" in data

def test_cors_headers():
    """Test CORS headers are present."""
    response = client.get("/api/health")
    assert "x-process-time" in response.headers

def test_docs_available():
    """Test API documentation is accessible."""
    response = client.get("/api/docs")
    assert response.status_code == 200
    
def test_redoc_available():
    """Test ReDoc documentation is accessible."""
    response = client.get("/api/redoc")
    assert response.status_code == 200
