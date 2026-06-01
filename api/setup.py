from setuptools import setup, find_packages

setup(
    name="toxscreen-api",
    version="1.0.0",
    packages=find_packages(),
    python_requires=">=3.12",
    install_requires=[
        "fastapi>=0.111.0",
        "uvicorn>=0.29.0",
        "sqlalchemy>=2.0.30",
        "pydantic>=2.7.1",
    ],
)
