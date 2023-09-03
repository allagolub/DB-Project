-- Manufacturer
INSERT INTO cd.manufacturer VALUES (0, 'Tiffany & Co.', 'USA');
INSERT INTO cd.manufacturer VALUES (1, 'Cartier', 'France');
INSERT INTO cd.manufacturer VALUES (2,'Bvlgari', 'Italy');
INSERT INTO cd.manufacturer VALUES (3,'Pandora', 'Denmark');
INSERT INTO cd.manufacturer VALUES (4, 'Jewelry House "Estet', 'Russia');
INSERT INTO cd.manufacturer VALUES (5,'Boucheron', 'France');
INSERT INTO cd.manufacturer VALUES (6,'Graff', 'UK');
INSERT INTO cd.manufacturer VALUES (7,'Piaget', 'Switzerland');
INSERT INTO cd.manufacturer VALUES (8,'Harry Winston', 'USA');
INSERT INTO cd.manufacturer VALUES (9,'Mikimoto', 'Japan');

-- Category
INSERT INTO cd.category VALUES (0, 'Rings');
INSERT INTO cd.category VALUES (1, 'Earrings');
INSERT INTO cd.category VALUES (2,'Necklaces');
INSERT INTO cd.category VALUES (3,'Pendants');
INSERT INTO cd.category VALUES (4,'Bracelets');
INSERT INTO cd.category VALUES (5,'Watches');
INSERT INTO cd.category VALUES (6,'Charms');

-- Seller
INSERT INTO cd.seller VALUES (0, 'Seller 1', 'Switzerland');
INSERT INTO cd.seller VALUES (1, 'Seller 2', 'Russia');
INSERT INTO cd.seller VALUES (2, 'Seller 3', 'UK');
INSERT INTO cd.seller VALUES (3, 'Seller 4', 'UK');
INSERT INTO cd.seller VALUES (4, 'Seller 5', 'UK');
INSERT INTO cd.seller VALUES (5, 'Seller 6', 'Germany');
INSERT INTO cd.seller VALUES (6, 'Seller 7', 'Russia');
INSERT INTO cd.seller VALUES (7, 'Seller 8', 'Russia');
INSERT INTO cd.seller VALUES (8, 'Seller 9', 'UK');
INSERT INTO cd.seller VALUES (9, 'Seller 10', 'Italy');
INSERT INTO cd.seller VALUES (10, 'Seller 11', 'Italy');

-- Product
INSERT INTO cd.product VALUES (0, 'April Birthstone Heart Dangle Charm', 50,
                               'Representing the month of April, this heart-shaped dangle charm is hand-finished in sterling silver',
                               6, 1, 3);
INSERT INTO cd.product VALUES (1, 'Freshwater Pearl Necklace in Sterling Silver, 32', 1750,
                               'Sterling silver with a freshwater cultured pearl',
                               2, 2, 0);
INSERT INTO cd.product VALUES (2, 'LA PANTHÈRE DE CARTIER WATCH', 91875,
                               'Rose gold 750/1000 case set with 128 brilliant-cut diamonds totalling 1.08 carat',
                               5, 3, 1);
INSERT INTO cd.product VALUES (3, 'Earrings made of white gold with diamonds', 2057,
                               'Made of 585 white gold with diamonds',
                               1, 4, 4);
INSERT INTO cd.product VALUES (4, 'FIOREVER RING', 11300,
                               'Fiorever 18 kt white gold ring set with a central round brilliant-cut diamond and pavé diamonds.',
                               0, 5, 2);
INSERT INTO cd.product VALUES (5, 'Bangle in White Gold with Diamond Accents', 10600,
                               '18k white gold with round brilliant diamonds',
                               4, 6, 0);
INSERT INTO cd.product VALUES (6, 'Blue Pansy Flower Pendant', 100,
                               'Hand-finished in sterling silver, each pansy pendant is completely unique.',
                               3, 7,  3);
INSERT INTO cd.product VALUES (7, 'Daisy Flower Ring', 70,
                               'Dazzling Pandora daisy ring crafted in sterling silver',
                               0, 8, 3);
INSERT INTO cd.product VALUES (8, 'Pandora Brilliance Lab-created Diamond Stud Earrings', 1290,
                               'A pair of solid 14k white gold stud earrings each hand set with a 0.50 carat lab-created diamond.',
                               1, 9, 3);
INSERT INTO cd.product VALUES (9, 'Sparkling Pavé Round Charm', 70,
                               'This spherical sterling silver charm is set with a total of 88 clear cubic zirconia stones',
                               6, 10, 3);



-- Delivery
INSERT INTO cd.delivery VALUES ('USA',  150, 21);
INSERT INTO cd.delivery VALUES ('France', 130, 14);
INSERT INTO cd.delivery VALUES ('Italy', 100, 10);
INSERT INTO cd.delivery VALUES ('Denmark', 100, 10);
INSERT INTO cd.delivery VALUES ('Russia', 100, 14);
INSERT INTO cd.delivery VALUES ('UK', 80, 5);
INSERT INTO cd.delivery VALUES ('Switzerland', 100, 7);
INSERT INTO cd.delivery VALUES ('Japan', 130, 21);
INSERT INTO cd.delivery VALUES ('Germany', 100, 7);
INSERT INTO cd.delivery VALUES ('Spain', 130, 21);

-- Buyer
INSERT INTO cd.buyer VALUES (0, 'John', 'Doe', 'johndoe@example.com');
INSERT INTO cd.buyer VALUES (1,  'Jane', 'Doe', 'janedoe@example.com');
INSERT INTO cd.buyer VALUES (2, 'Bob', 'Smith', 'bobsmith@example.com');
INSERT INTO cd.buyer VALUES (3, 'Alice', 'Jones', 'alicejones@example.com');
INSERT INTO cd.buyer VALUES (4, 'Mike', 'Johnson', 'mikejohnson@example.com');
INSERT INTO cd.buyer VALUES (5, 'John', 'Smith', 'johnsmith@example.com');
INSERT INTO cd.buyer VALUES (6,  'Jane', 'Smith', 'janesmith@example.com');
INSERT INTO cd.buyer VALUES (7, 'Bob', 'Doe', 'bobdoe@example.com');
INSERT INTO cd.buyer VALUES (8, 'Alice', 'Smith', 'alicesmith@example.com');
INSERT INTO cd.buyer VALUES (9, 'Mike', 'Smith', 'mikesmith@example.com');

-- Orders
INSERT INTO cd.orders VALUES (0, 0, 'UK', 'In progress', '2022-07-01', 1880);
INSERT INTO cd.orders VALUES (1, 1, 'Russia', 'In progress', '2022-08-11', 91975);
INSERT INTO cd.orders VALUES (2, 2, 'USA', 'Completed', '2022-01-01', 2257);
INSERT INTO cd.orders VALUES (3, 3, 'France', 'Pending', '2022-09-07', 12887);
INSERT INTO cd.orders VALUES (4, 4, 'USA', 'Completed', '2022-02-12', 10750);
INSERT INTO cd.orders VALUES (5, 5, 'USA', 'Completed', '2021-11-12', 10750);
INSERT INTO cd.orders VALUES (6, 6, 'USA', 'Pending', '2022-09-12', 10750);

-- Ordered_products
INSERT INTO cd.ordered_products VALUES (0, 0);
INSERT INTO cd.ordered_products VALUES (1, 0);
INSERT INTO cd.ordered_products VALUES (2, 1);
INSERT INTO cd.ordered_products VALUES (3, 2);
INSERT INTO cd.ordered_products VALUES (0, 2);
INSERT INTO cd.ordered_products VALUES (3, 3);
INSERT INTO cd.ordered_products VALUES (5, 3);
INSERT INTO cd.ordered_products VALUES (6, 3);
INSERT INTO cd.ordered_products VALUES (5, 4);
INSERT INTO cd.ordered_products VALUES (5, 5);
INSERT INTO cd.ordered_products VALUES (5, 6);

-- Product_history
INSERT INTO cd.product_history VALUES (2, 80000, '2020-01-01');
INSERT INTO cd.product_history VALUES (3, 2000, '2019-01-01');
INSERT INTO cd.product_history VALUES (4, 14000, '2018-01-01');
INSERT INTO cd.product_history VALUES (1, 1000, '2020-01-01');




