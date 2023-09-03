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


def test_select(select_df):
    assert select_df.shape == (7, 2)
    assert select_df["name"].tolist() == ["Watches", "Rings", "Bracelets", "Earrings", "Necklaces", "Charms", "Pendants"]
    assert select_df["sum"].tolist() == [91875, 11370, 10600, 3347, 1750, 120, 100]




