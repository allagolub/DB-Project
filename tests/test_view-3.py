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
    assert set(select_df.columns) == {'product_name', 'seller_name', 'seller_country'}
    assert select_df.shape == (10, 3)
    assert select_df['product_name'].tolist() == ["April Birthstone Heart Dangle Charm",
                                                 "Freshwater Pearl Necklace in Sterling Silver, 32",
                                                 "LA PANTHÈRE DE CARTIER WATCH",
                                                 "Earrings made of white gold with diamonds",
                                                 "FIOREVER RING",
                                                  "Bangle in White Gold with Diamond Accents",
                                                  "Blue Pansy Flower Pendant",
                                                  "Daisy Flower Ring",
                                                  "Pandora Brilliance Lab-created Diamond Stud Earrings",
                                                  "Sparkling Pavé Round Charm"]
    assert select_df['seller_name'].tolist() == ["Seller 2", "Seller 3", "Seller 4", "Seller 5", "Seller 6", "Seller 7",
                                                 "Seller 8", "Seller 9", "Seller 10", "Seller 11"]

