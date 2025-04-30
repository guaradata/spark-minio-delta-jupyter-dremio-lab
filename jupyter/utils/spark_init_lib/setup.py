from setuptools import setup, find_packages

setup(
    name="spark_init",
    version="0.1.0",
    description="Inicialização padronizada do Spark com Delta, MinIO e Hive",
    author="Ivan Barbosa Pinheiro",
    packages=find_packages(),
    python_requires=">=3.6"
)
