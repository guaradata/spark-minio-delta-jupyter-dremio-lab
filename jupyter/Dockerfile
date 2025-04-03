# Use the official Jupyter PySpark notebook as the base image
FROM jupyter/pyspark-notebook:x86_64-spark-3.5.0

# Install delta-spark
RUN pip install delta-spark deltalake

# run the Jupyter notebook with --LabApp.token=''
CMD ["start-notebook.sh", "--LabApp.token=''"]