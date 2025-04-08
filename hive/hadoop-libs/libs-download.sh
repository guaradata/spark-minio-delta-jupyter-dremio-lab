#!/bin/bash

SCALA_VERSION=2.12
HADOOP_CLIENT_API_VERSION=3.1.0
AWS_SDK_BUNDLE=1.11.271

curl "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_CLIENT_API_VERSION/hadoop-aws-$HADOOP_CLIENT_API_VERSION.jar" -o hadoop-aws-$HADOOP_CLIENT_API_VERSION.jar
curl "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/$AWS_SDK_BUNDLE/aws-java-sdk-bundle-$AWS_SDK_BUNDLE.jar" -o aws-java-sdk-bundle-$AWS_SDK_BUNDLE.jar