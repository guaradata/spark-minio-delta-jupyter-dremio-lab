from .fs_utils import FSUtils

class DBUtils:
    def __init__(self, spark):
        self.fs = FSUtils(spark)

def init_spark_utils(spark):
    return DBUtils(spark)
