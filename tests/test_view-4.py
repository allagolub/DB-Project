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
    assert set(select_df.columns) == {'order_id', 'buyer_name', 'seller_name',
                                      'product_name', 'amount', 'country', 'status', 'date'}
    assert select_df['order_id'].tolist() == [0, 0, 1, 2, 2, 3, 3, 3, 4, 5, 6]
    assert select_df['buyer_name'].tolist() == ["John Doe", "John Doe", "Jane Doe", "Bob Smith", "Bob Smith",
                                                "Alice Jones", "Alice Jones", "Alice Jones", "Mike Johnson", "John Smith", "Jane Smith"]
    assert select_df['seller_name'].tolist() == ["Seller 2", "Seller 3", "Seller 4", "Seller 5", "Seller 2", "Seller 5",
                                                 "Seller 7", "Seller 8", "Seller 7", "Seller 7", "Seller 7"]
    assert select_df['product_name'].tolist() == ["April Birthstone Heart Dangle Charm",
                                                 "Freshwater Pearl Necklace in Sterling Silver, 32",
                                                 "LA PANTHÈRE DE CARTIER WATCH",
                                                 "Earrings made of white gold with diamonds",
                                                 "April Birthstone Heart Dangle Charm",
                                                 "Earrings made of white gold with diamonds",
                                                 "Bangle in White Gold with Diamond Accents",
                                                 "Blue Pansy Flower Pendant",
                                                 "Bangle in White Gold with Diamond Accents",
                                                 "Bangle in White Gold with Diamond Accents",
                                                 "Bangle in White Gold with Diamond Accents"]
    assert select_df['amount'].tolist() == [1880, 1880, 91975, 2257, 2257, 12887, 12887, 12887, 10750, 10750, 10750]
    assert select_df['country'].tolist() == ["UK", "UK", "Russia", "USA", "USA", "France", "France",
                                             "France", "USA", "USA", "USA"]
    assert select_df['status'].tolist() == ["In progress", "In progress", "In progress", "Completed", "Completed", "Pending",
                                            "Pending", "Pending", "Completed", "Completed", "Pending"]
    assert select_df['date'].astype(str).tolist() == ['2022-07-01', '2022-07-01', '2022-08-11', '2022-01-01', '2022-01-01', '2022-09-07',
                                          '2022-09-07', '2022-09-07', '2022-02-12', '2021-11-12', '2022-09-12']







