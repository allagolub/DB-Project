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
    assert select_df.shape == (7, 2)
    assert select_df['category_name'].tolist() == ["Charms", "Pendants", "Earrings",
                                                     "Necklaces", "Rings", "Bracelets", "Watches"]
    assert select_df['average_price'].tolist() == [60.0, 100.0, 1673.5, 1750.0, 5685.0, 10600.0, 91875.0]


