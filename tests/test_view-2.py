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
    assert select_df.shape == (10, 2)
    assert select_df["name"].tolist() == ["Tiffany & Co.","Cartier", "Bvlgari", "Pandora",
                                          'Jewelry House "Estet', "Boucheron", "Graff", "Piaget", "Harry Winston", "Mikimoto"]
    assert select_df["country"].tolist() == ["USA", "France", "Italy", "Denmark", "Russia", "France", "UK", "Switzerland", "USA", "Japan"]

