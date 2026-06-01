"""Pytest configuration and fixtures."""
import pytest
from fastapi.testclient import TestClient
from app.main import app

@pytest.fixture
def client():
    """Create test client."""
    return TestClient(app)

@pytest.fixture
def sample_smiles():
    """Sample SMILES strings for testing."""
    return {
        "aspirin": "CC(=O)Oc1ccccc1C(=O)O",
        "ibuprofen": "CC(C)CC1=CC=C(C=C1)C(C)C(=O)O",
        "paracetamol": "CC(=O)NC1=CC=C(C=C1)O",
        "invalid": "INVALID_SMILES"
    }
