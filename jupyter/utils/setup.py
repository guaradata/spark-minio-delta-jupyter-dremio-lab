from setuptools import setup, find_packages

setup(
    name="spark-utils",
    version="0.1.0",
    description="Utilitários para manipulação de arquivos no HDFS via Spark JVM",
    author="Seu Nome",
    packages=find_packages(),
    python_requires=">=3.6",
)