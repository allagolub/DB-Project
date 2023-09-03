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
    assert select_df.shape == (10, 6)
    grouped_df = select_df.groupby('category_id')
    for _, group in grouped_df:
        for index, row in group.iterrows():
            assert row['sum_price'] == group['price'].sum()
            if row['row_num'] == 1:
                continue
            assert row['price'] > row['prev_price']









