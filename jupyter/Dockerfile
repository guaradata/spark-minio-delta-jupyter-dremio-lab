# Base image com Jupyter e PySpark
FROM jupyter/pyspark-notebook:x86_64-spark-3.5.0

USER root

# Remover o Spark existente
RUN rm -rf /usr/local/spark

# Copia o Spark buildado externamente
COPY spark-3.5.1-bin-custom-build.tgz /tmp/

# Extrai o Spark compilado
RUN tar -xzf /tmp/spark-3.5.1-bin-custom-build.tgz -C /usr/local/ && \
    mv /usr/local/spark-3.5.1-bin-custom-build /usr/local/spark && \
    rm /tmp/spark-3.5.1-bin-custom-build.tgz

# Define SPARK_HOME
ENV SPARK_HOME=/usr/local/spark
ENV PATH=$SPARK_HOME/bin:$PATH

COPY ./utils/ /tmp/

RUN pip install --upgrade jupyterlab

# Copia os arquivos necessários
COPY requirements.txt /tmp/requirements.txt

# Instala todas as dependências de uma vez
RUN pip install -r /tmp/requirements.txt

# Instala o pacote com pip
RUN pip install /tmp/spark_fs_lib/
RUN pip install /tmp/spark_init_lib/

# Volta para o usuário padrão do Jupyter
USER $NB_UID

# run the Jupyter notebook with --LabApp.token=''
CMD ["start-notebook.sh", "--LabApp.token=''"]