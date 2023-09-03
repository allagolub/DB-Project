import os
import pytest
from . import execute_sql_to_df
from . import read_sql


@pytest.fixture()
def select_script():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path)


@pytest.fixture()
def select_df(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script
    )


def test_view(select_df):
    assert select_df.shape == (10, 3)
    assert select_df["firstname"].tolist() == ["John", "Jane", "Bob", "Alice", "Mike", "John", "Jane",
                                          "Bob", "Alice", "Mike"]
    assert select_df["surname"].tolist() == ["Doe", "Doe", "Smith", "Jones", "Johnson", "Smith",
                                             "Smith", "Doe", "Smith", "Smith"]
    assert select_df["email"].tolist() == ["joh***@ex***", "jan***@ex***", "bob***@ex***", "ali***@ex***", "mik***@ex***",
                                           "joh***@ex***", "jan***@ex***", "bob***@ex***", "ali***@ex***", "mik***@ex***"]



