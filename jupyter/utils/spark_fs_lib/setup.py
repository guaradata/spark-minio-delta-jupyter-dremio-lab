from setuptools import setup, find_packages

setup(
    name="spark_fs",
    version="0.1.0",
    description="Utilitários para manipulação de arquivos no HDFS via Spark JVM",
    author="Ivan Barbosa Pinheiro",
    packages=find_packages(),
    python_requires=">=3.6",
)