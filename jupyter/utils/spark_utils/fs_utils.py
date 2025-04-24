class FSUtils:
    def __init__(self, spark):
        self._spark = spark
        self._jvm = spark._jvm
        self._hadoop_conf = spark._jsc.hadoopConfiguration()

    def _get_filesystem(self, path):
        path_obj = self._jvm.org.apache.hadoop.fs.Path(path)
        return path_obj.getFileSystem(self._hadoop_conf)

    def ls(self, path):
        try:
            fs = self._get_filesystem(path)
            path_obj = self._jvm.org.apache.hadoop.fs.Path(path)
            statuses = fs.listStatus(path_obj)
            return [{
                "path": file_status.getPath().toString(),
                "is_dir": file_status.isDirectory(),
                "size": file_status.getLen()
            } for file_status in statuses]
        except Exception as e:
            print(f"Erro ao listar {path}: {str(e)}")
            return []

    def mkdirs(self, path):
        try:
            fs = self._get_filesystem(path)
            path_obj = self._jvm.org.apache.hadoop.fs.Path(path)
            return fs.mkdirs(path_obj)
        except Exception as e:
            print(f"Erro ao criar diretório {path}: {str(e)}")
            return False

    def rm(self, path, recursive=False):
        try:
            fs = self._get_filesystem(path)
            path_obj = self._jvm.org.apache.hadoop.fs.Path(path)
            return fs.delete(path_obj, recursive)
        except Exception as e:
            print(f"Erro ao remover {path}: {str(e)}")
            return False

    def cp(self, src, dest, recursive=False):
        try:
            fs_src = self._get_filesystem(src)
            fs_dest = self._get_filesystem(dest)
            src_path = self._jvm.org.apache.hadoop.fs.Path(src)
            dest_path = self._jvm.org.apache.hadoop.fs.Path(dest)

            self._jvm.org.apache.hadoop.fs.FileUtil.copy(
                fs_src, src_path,
                fs_dest, dest_path,
                recursive,
                self._hadoop_conf
            )
            return True
        except Exception as e:
            print(f"Erro ao copiar {src} para {dest}: {str(e)}")
            return False

    def exists(self, path):
        try:
            fs = self._get_filesystem(path)
            path_obj = self._jvm.org.apache.hadoop.fs.Path(path)
            return fs.exists(path_obj)
        except Exception as e:
            print(f"Erro ao verificar existência de {path}: {str(e)}")
            return False
