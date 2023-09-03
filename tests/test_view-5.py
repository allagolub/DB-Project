import os
import pytest
import numpy as np
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
    assert select_df.shape == (10, 4)
    assert select_df['product_id'].tolist() == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert select_df['name'].tolist() == ["April Birthstone Heart Dangle Charm",
                                          "Freshwater Pearl Necklace in Sterling Silver, 32",
                                          "LA PANTHÈRE DE CARTIER WATCH",
                                          "Earrings made of white gold with diamonds",
                                          "FIOREVER RING",
                                          "Bangle in White Gold with Diamond Accents",
                                          "Blue Pansy Flower Pendant",
                                          "Daisy Flower Ring",
                                          "Pandora Brilliance Lab-created Diamond Stud Earrings",
                                          "Sparkling Pavé Round Charm"]
    assert select_df['num_orders'].tolist() == [2, 1, 1, 2, 0, 4, 1, 0, 0, 0]
    assert select_df['avg_order_amount'].isnull().sum() == 4
    assert select_df['avg_order_amount'].iloc[0] == 2068.5
    assert select_df['avg_order_amount'].iloc[1] == 1880.0
    assert select_df['avg_order_amount'].iloc[2] == 91975.0
    assert select_df['avg_order_amount'].iloc[3] == 7572.0
    assert select_df['avg_order_amount'].iloc[5] == 11284.25
    assert select_df['avg_order_amount'].iloc[6] == 12887.0




