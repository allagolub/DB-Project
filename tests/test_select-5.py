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
    assert select_df.shape == (10, 5)
    categories = select_df['category_id'].unique()
    for category in categories:
        filtered_df = select_df.loc[select_df['category_id'] == category].sort_values(by='price')
        for i in range(1, len(filtered_df)):
            assert filtered_df.iloc[i]['price'] > filtered_df.iloc[i-1]['price']
            assert filtered_df.iloc[i]['row_num'] >= filtered_df.iloc[i-1]['row_num']
        assert filtered_df['price'].sum() == filtered_df.iloc[0]['sum_price']








