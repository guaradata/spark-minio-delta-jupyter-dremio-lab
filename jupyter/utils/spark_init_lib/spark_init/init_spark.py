# init_spark.py
from pyspark.sql import SparkSession

def create_spark_session(session_name):
    spark = SparkSession.builder \
        .appName(session_name) \
        .master("spark://spark-master:7077") \
        .config("spark.executor.memory", "512mb") \
        .config("spark.cores.max", "3") \
        .config("spark.jars.packages", "io.delta:delta-spark_2.12:3.2.0,io.delta:delta-storage:3.2.0,org.antlr:antlr4-runtime:4.9.3,org.apache.hadoop:hadoop-aws:3.3.4,com.amazonaws:aws-java-sdk-bundle:1.12.262") \
        .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension") \
        .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog") \
        .config("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem") \
        .config("spark.hadoop.fs.s3a.endpoint", "http://minio:9000") \
        .config("spark.hadoop.fs.s3a.aws.credentials.provider", "org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider") \
        .config("spark.hadoop.fs.s3a.access.key", "accesskey") \
        .config("spark.hadoop.fs.s3a.secret.key", "secretkey") \
        .config("spark.hadoop.fs.s3a.path.style.access", "true") \
        .config("spark.hadoop.fs.s3a.connection.ssl.enabled", "false") \
        .config("spark.sql.catalogImplementation", "hive") \
        .config("hive.metastore.uris", "thrift://hive-metastore:9083") \
        .config("spark.hadoop.hive.metastore.warehouse.dir", "s3a://wba/warehouse") \
        .getOrCreate()
    return spark