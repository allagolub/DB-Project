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
    assert select_df.shape == (4, 4)
    prev_date = None
    prev_rank = None
    for _, row in select_df.iterrows():
        if prev_date is not None:
            assert prev_date >= row['date']
        if prev_rank is not None:
            assert row['rank'] >= prev_rank
        prev_date = row['date']
        prev_rank = row['rank']






