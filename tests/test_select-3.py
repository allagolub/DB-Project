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
    assert select_df.shape == (10, 4)
    manufacturers = select_df['name']
    for manufacturer in manufacturers:
        df = select_df.query(f"name == '{manufacturer}'")
        if df.empty:
            continue
        avg_price = df['average_price'].iloc[0]
        expected_avg_price = df['price'].mean()
        assert avg_price == expected_avg_price





