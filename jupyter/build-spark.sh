#!/bin/bash

set -e  # Encerra se qualquer comando falhar

# Configurações
SPARK_VERSION="v3.5.1"
HADOOP_VERSION="3.3.5"
SCALA_VERSION="2.12"
SPARK_DIR="spark"

# === Verificar JAVA_HOME ===
if [[ -z "$JAVA_HOME" ]]; then
  JAVA_PATH=$(readlink -f $(which java) || true)
  if [[ -z "$JAVA_PATH" ]]; then
    echo "❌ Java não encontrado. Instale o Java JDK 8 ou 11 e tente novamente."
    exit 1
  fi
  JAVA_HOME=$(dirname $(dirname $(dirname "$JAVA_PATH")))
  echo "🔧 Definindo JAVA_HOME como $JAVA_HOME"
  export JAVA_HOME
  export PATH="$JAVA_HOME/bin:$PATH"
fi

# === Clonar o Spark se não existir ===
if [ ! -d "$SPARK_DIR" ]; then
  echo "📥 Clonando Apache Spark..."
  git clone https://github.com/apache/spark.git "$SPARK_DIR"
fi

cd "$SPARK_DIR"

# === Checkout na versão desejada ===
echo "📦 Fazendo checkout para a versão $SPARK_VERSION..."
git fetch --tags
git checkout "$SPARK_VERSION"

# === Gerar pasta dist com make-distribution.sh incluindo suporte a Hive ===
echo "📦 Gerando distribuição do Spark $SPARK_VERSION com suporte a Hive com Scala $SCALA_VERSION e Hadoop $HADOOP_VERSION..."
./dev/make-distribution.sh \
  --name custom-build \
  --pip \
  --tgz \
  -Pscala-${SCALA_VERSION} \
  -Phadoop-3 \
  -Phive \
  -Phive-thriftserver \
  -Dhadoop.version=${HADOOP_VERSION} \
  -DskipTests

echo "✅ Build finalizado com sucesso!"
echo "📁 Distribuição gerada em: spark-${SPARK_VERSION}-bin-custom-build.tgz"
