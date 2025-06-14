# 🧙 MDS lab: Agnostic Data Platform 🧙

<h1 align="center">
  <a
    target="_blank"
    href="https://github.com/guaradata/mds-lab"
  >
    <img
      align="center"
      alt="Arquitetura de dados monderna"
      src="https://github.com/guaradata/mds-lab/blob/main/docs/img/mds-lab.jpg?raw=true"
      style="height: 50%;"
    />
  </a>
</h1>

## 🧠 Introdução

### O que é Modern Data Stack (MDS)?

Conhecido em português como "Pilha de Dados Moderna" ou "Arquitetura de Dados Moderna", o MDS representa um ecossistema de tecnologias projetadas para otimizar o gerenciamento, processamento e análise de dados em escala. Neste contexto, a arquitetura apresentada utiliza componentes-chave como MinIO (armazenamento objeto compatível com S3), PostgreSQL (metadados do Hive), Apache Hive (metastore e consultas SQL), Apache Spark (processamento distribuído), Kyuubi (gateway SQL para Spark), JupyterLab (análise interativa) e Dremio (camada semântica e aceleração de consultas).

Essa combinação reflete os princípios do MDS: escalabilidade (com workers Spark distribuídos), flexibilidade (integração entre ferramentas open-source) e governança (metadados centralizados no Hive Metastore). Ao adotar containers Docker, a stack também garante portabilidade e isolamento, permitindo que pipelines de dados sejam executados desde ingestão (MinIO) até análise (Jupyter/Dremio) em um ambiente unificado.

### Destaques da arquitetura

- **Camada de Armazenamento:** MinIO como repositório econômico e compatível com cloud.

- **Metadados:** PostgreSQL + Hive Metastore para rastreabilidade de tabelas.

- **Processamento:** Spark com cluster multi-worker para paralelização de tarefas.

- **Acesso e Análise:** JupyterLab (notebooks), Kyuubi (SQL via Spark), e Dremio (otimização de queries).

Essa pilha é especialmente adequada para cenários que demandam dados lakehouse, combinando recursos de data lakes (armazenamento flexível) com warehouses (gestão estruturada).

## 📌 Objetivos

### Visão Geral

Este projeto implementa uma **Pilha de Dados Moderna (Modern Data Stack - MDS)** simplificada usando containers Docker, destinada exclusivamente para:

- Aprendizado de arquiteturas de dados modernas
- Experimentação com ferramentas open-source
- Desenvolvimento de habilidades em engenharia e análise de dados

### 🛠 Componentes da Stack

| Ferramenta         | Função Principal                          | Porta  | Observações                          |
|--------------------|------------------------------------------|-------|--------------------------------------|
| **MinIO**          | Armazenamento objeto (S3-compatível)     | 9000  | Bucket padrão: `wba`                 |
| **PostgreSQL**     | Metastore do Hive                        | 5432  | Usuário/senha: `admin`               |
| **Hive Metastore** | Gerenciamento de metadados               | 9083  | Integrado com MinIO e Spark          |
| **Spark Cluster**  | Processamento distribuído (1 master + 3 workers) | 7077, 8080 | 1GB memória por worker  |
| **JupyterLab**     | Análise interativa                       | 8888  | Pré-configurado com Spark            |
| **Dremio**         | Camada semântica e aceleração de queries | 9047  | Conecta a MinIO e Hive               |
| **Kyuubi**         | Gateway SQL para Spark                   | 10009 | Alternativa ao Hive Server           |

### ⚠️ Limitações Intencionais (Fins Educacionais)

- **Autenticação simplificada**: Credenciais padrão em todos serviços
- **Recursos limitados**: Configuração mínima para rodar em máquinas locais
- **Sem HA/Failover**: Single-point-of-failure em vários componentes
- **Sem monitoramento**: Não inclui Prometheus/Grafana

## 🎯 Casos de Estudo Recomendados

1. **Pipeline ETL Básico**
   - Ingestão de dados CSV para MinIO;
   - Criação de tabelas no Hive Metastore;
   - Transformação com Spark.

2. **Comparativo de Performance**
   - Queries SQL via Hive Server vs Kyuubi vs Dremio;
   - Impacto do número de workers Spark.

3. **Governança de Metadados**
   - Rastreamento de linhagem de dados;
   - Evolução de schemas (schema evolution).

## 👀 Testando o projeto

### 🏣 Estrutura

```
├── docs/                          # Documentação do projeto
│   ├── diagram                    # Arquitetura do projeto em diagrama
│   └── img                        # Imagem do diagrama
├── hive/                          # Configurações do Hive
│   ├── hadoop-libs                # Bibliotecas necessárias para o Hive
│   ├── hive-config                # Script de inicialização
│   └── Dockerfile                 # Imagem do Hive
├── jupyter/                       # Configurações do Jupyter
│   ├── notebooks/                 # Jupyter notebooks
│   │   └── Start.ipynb            # Notebook de exemplo
│   ├── build-spark.sh             # Script de compilação do Spark
│   ├── utils                      # Bibliotecas utilitárias
│   │   └── spark_fs_lib           # Classes para simular DButils
│   │   └── spark_init_lib         # Configurações iniciais do Spark
│   └── Dockerfile                 # Imagem do Jupyter
├── kyuubi/                        # Configurações do Kyuubi
│   ├── kyuubi-libs/               # Configurações da imagem 
│   │   ├── kyuubi-extension.jar   # Biblioteca necessária
│   │   └── libs-download.sh       # Biblioteca necessária
│   └── kyuubi-defaults.conf       # Parâmetros de inicialização
└── spark/                         # Configurações do Spark
    └── spark-config/              # Conjunto de configurações
        ├── hive-site.xml          # Configurações do Hive para o Spark
        └── spark-defaults.conf    # Configurações base do Spark
```

### 🪛 Ferramentas base

- [Docker Desktop](https://www.docker.com/get-started);
- [Git](https://git-scm.com/downloads).

### 📚 Bibliotecas e artefatos necessários

#### Opção 1

O Jupyter requer o Spark 2.12:3.5.1 compilado com Scala 2.12. Como essa versão não está disponível nos repositórios comuns, é necessário realizar a compilação e compactação do arquivo em formato .tgz **(Obs: É necessário ter o Java JDK 8 ou 11)**. Para isso, você pode executar o script por meio do comando abaixo:

```bash
./jupyter/build-spark.sh
```

O arquivo compilado estará dentro da pasta spark com o nome **spark-3.5.1-bin-custom-build.tgz**.

#### Opção 2

É possível fazer o download do arquivo .tgz já compilado, acessando a seguinte url: [spark-3.5.1-bin-custom-build.tgz](https://drive.google.com/file/d/1zXxbpS8-Nf2j9xnCx0FGPpBK5DocOcBe/view)

### Iniciando o laboratório

1. Clone este repositório com o seguinte comando:

```bash
git clone https://github.com/guaradata/mds-lab.git
```

2. Adicione o arquivo **spark-3.5.1-bin-custom-build.tgz** dentro da pasta jupyter;

3. Execute o comando Docker:

```bash
docker-compose up --build
```

**Obs: a primeira execução é demorada, pois é necessário baixar todas as imagens utilizadas por este laboratório**

## 🔦 DButils e Spark init

Os notebooks Jupyter contam com duas bibliotecas customizadas disponíveis: spark_fs e spark_init.
A biblioteca spark_fs é um utilitário que simula, de forma simplificada, o comportamento do dbutils do Databricks. Ela disponibiliza métodos como ls, mkdirs, rm, cp e exists, que podem ser utilizados para operações básicas no sistema de arquivos.
Já a biblioteca spark_init oferece uma abstração para facilitar a inicialização da conexão entre o Jupyter e o cluster Spark.

## 🔩 Portas de acesso dos principais serviços

Abaixo estão listados os principais serviços disponíveis no ambiente local, juntamente com os links de acesso e suas respectivas portas. Esses serviços compõem a infraestrutura de processamento e gerenciamento de dados, oferecendo interfaces web para monitoramento, exploração e controle dos recursos.

| Serviço       | Acesso                                                                                  |
| ------------- | ---------------------------------------------------------------------------------------- |
| Spark Master  | [Acesso Spark](http://localhost:8080/) — Interface de monitoramento do cluster Spark.   |
| Jupyter       | [Acesso Jupyter](http://localhost:8888/lab/tree/work/Start.ipynb) — Ambiente interativo para notebooks Python e Spark. |
| Dremio        | [Acesso Dremio](http://localhost:9047/) — Plataforma de virtualização de dados com interface SQL. |
| Portainer     | [Acesso Portainer](http://localhost:9090/) — Gerenciador gráfico de containers Docker.  |
| Minio         | [Acesso Minio](http://localhost:9001/login) — Interface de gerenciamento de objetos S3 compatível. |
| Kyuubi        | [Acesso Kyuubi](http://localhost:10099/) — Interface de administração para sessões SQL sobre Spark. |

## 🐺 Versões

### 🔝 Imagens Docker

| Imagem        | Versão                                        |
| ------------- | ----------------------------------------------|
| minio         | latest                                        |
| postgres      | 10-alpine                                     |
| apache/hive   | 3.1.3                                         |
| bitnami/spark | 3.5.1                                         |
| apache/kyuubi | 1.9.0-spark                                   |
| jupyter       | pyspark-notebook:x86_64-spark-3.5.0           |
| dremio        | dremio/dremio-oss                             |

### 🦊 Bibliotecas nos conteineres

| Dependencias      | MinIO       | Hive        | Spark                 | Kyuubi                | Jupyter               | Dremio      |
| -------------     | ----------- | ----------- | --------------------- | --------------------- | --------------------- | ----------- |
| Hadoop Common     | -           | 3.1.0       | 3.3.4                 | 3.3.4                 | -                     | -           |
| Hadoop AWS        | -           | 3.1.0       | 3.3.4                 | 3.3.4                 | 3.3.4                 | -           |
| AWS SDK Bundle    | -           | 1.11.271    | 1.12.262              | 1.12.262              | 1.12.262              | -           |
| Delta Lake Core   | -           | -           | delta-core_2.12:3.2.0 | delta-core_2.12:3.2.0 | delta-core_2.12:3.2.0 | -           |
| Delta Lake Storage| -           | -           | delta-storage:3.2.0   | delta-storage:3.2.0   | delta-storage:3.2.0   | -           |
| Apache Spark      | -           | -           | 3.5.1                 | 3.5.1                 | 3.5.1                 | -           |
| ANTLR 4 Runtime   | -           | -           | 4.9.3                 | 4.9.3                 | 4.9.3                 | -           |

## 🥶 Referências

### Repositórios

- [1] - <https://github.com/kemonoske/spark-minio-delta-lakehouse-docker>
- [2] - <https://github.com/dgkatz/trino-hive-superset-docker>
- [3] - <https://github.com/le-oasis/docker-airflow-spark>
- [4] - <https://github.com/kemonoske/spark-minio-delta-lakehouse-docker>
- [5] - <https://github.com/cluster-apps-on-docker/spark-standalone-cluster-on-docker>
- [6] - <https://github.com/experientlabs/spark-dp-101>
- [7] - <https://github.com/experientlabs/spark_delta_hive_metastore>
- [8] - <https://github.com/elijahfhopp/simple-superset-compose>
- [9] - <https://github.com/wlcamargo/spark_opensource_vs_proprietary>
- [10] - <https://github.com/pcbimon/spark-minio-delta-lakehouse-docker>
- [11] - <https://github.com/edvaldo-gutierres/data-lab>
- [12] - <https://github.com/guaradata/etl-mds-marketing>

### Artigos

- [1] - <https://medium.com/@MarinAgli1/setting-up-a-spark-standalone-cluster-on-docker-in-layman-terms-8cbdc9fdd14b>
- [2] - <https://medium.com/@sanjeets1900/hadoop-hive-and-hue-with-postgress-metastore-from-scratch-fd4425d13831>
- [3] - <https://medium.com/@mariusz_kujawski/cloud-agnostic-data-platform-3aedd6d0eb3b>
