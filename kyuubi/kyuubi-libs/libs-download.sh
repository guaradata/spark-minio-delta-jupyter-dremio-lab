#!/bin/bash

SCALA_VERSION=2.12
HADOOP_CLIENT_API_VERSION=3.3.4
AWS_SDK_BUNDLE=1.12.262
DELTA_LAKE_VERSION=3.1.0


curl "https://repo1.maven.org/maven2/io/delta/delta-spark_$SCALA_VERSION/$DELTA_LAKE_VERSION/delta-spark_$SCALA_VERSION-$DELTA_LAKE_VERSION.jar" -o delta-spark_$SCALA_VERSION-$DELTA_LAKE_VERSION.jar

curl "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_CLIENT_API_VERSION/hadoop-aws-$HADOOP_CLIENT_API_VERSION.jar" -o hadoop-aws-$HADOOP_CLIENT_API_VERSION.jar

curl "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/$AWS_SDK_BUNDLE/aws-java-sdk-bundle-$AWS_SDK_BUNDLE.jar" -o aws-java-sdk-bundle-$AWS_SDK_BUNDLE.jar

curl "https://repo1.maven.org/maven2/io/delta/delta-storage/3.1.0/delta-storage-3.1.0.jar" -o delta-storage-3.1.0.jar

curl "https://repo1.maven.org/maven2/org/antlr/antlr4-runtime/4.9.3/antlr4-runtime-4.9.3.jar" -o antlr4-runtime-4.9.3.jar

curl "https://repo1.maven.org/maven2/org/scala-lang/scala-library/2.12.17/scala-library-2.12.17.jar" -o scala-library-2.12.17.jar

curl "https://repo1.maven.org/maven2/org/apache/kyuubi/kyuubi-spark-sql-engine_2.12/1.10.1/kyuubi-spark-sql-engine_2.12-1.10.1.jar" -o kyuubi-spark-sql-engine_2.12-1.10.1.jar

curl "https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/5.0.0/jakarta.servlet-api-5.0.0.jar" -o jakarta.servlet-api-5.0.0.jar

curl "https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar" -o javax.servlet-api-4.0.1.jar

curl "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-client-api/3.3.6/hadoop-client-api-3.3.6.jar" -o hadoop-client-api-3.3.6.jar

curl "https://repo1.maven.org/maven2/org/apache/spark/spark-sql_2.12/3.5.2/spark-sql_2.12-3.5.2.jar" -o spark-sql_2.12-3.5.2.jar

curl "https://repo1.maven.org/maven2/org/apache/spark/spark-repl_2.12/3.5.2/spark-repl_2.12-3.5.2.jar" -o spark-repl_2.12-3.5.2.jar

curl "https://repo1.maven.org/maven2/org/scala-lang/scala-compiler/2.12.19/scala-compiler-2.12.19.jar" -o scala-compiler-2.12.19.jar

curl "https://repo1.maven.org/maven2/org/scala-lang/scala-reflect/2.12.19/scala-reflect-2.12.19.jar" -o scala-reflect-2.12.19.jar

curl "https://repo1.maven.org/maven2/org/apache/kyuubi/kyuubi-server_2.12/1.10.0/kyuubi-server_2.12-1.10.0.jar" -o kyuubi-server_2.12-1.10.0.jar

curl "https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.36/slf4j-api-1.7.36.jar" -o slf4j-api-1.7.36.jar

curl https://repo1.maven.org/maven2/org/slf4j/slf4j-log4j12/1.7.36/slf4j-log4j12-1.7.36.jar -o slf4j-log4j12-1.7.36.jar

curl https://repo1.maven.org/maven2/org/apache/commons/commons-lang3/3.12.0/commons-lang3-3.12.0.jar -o commons-lang3-3.12.0.jar

curl "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.6/hadoop-common-3.3.6.jar" -o hadoop-common-3.3.6.jar

curl "https://repo1.maven.org/maven2/com/ctc/wstx/woodstox-core/6.4.0/woodstox-core-6.4.0.jar" -o woodstox-core-6.4.0.jar

curl "https://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17.jar" -o log4j-1.2.17.jar