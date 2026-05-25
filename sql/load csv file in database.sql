-- Load in this exact order (dependencies first)
COPY aisles FROM 'E:\Instacard Project\data from kaggle\archive\aisles.csv'
  DELIMITER ',' CSV HEADER;

COPY departments FROM 'E:\Instacard Project\data from kaggle\archive\departments.csv'
  DELIMITER ',' CSV HEADER;

COPY products FROM 'E:\Instacard Project\data from kaggle\archive\products.csv'
  DELIMITER ',' CSV HEADER;

COPY orders FROM 'E:\Instacard Project\data from kaggle\archive\orders.csv'
  DELIMITER ',' CSV HEADER;

COPY order_products_prior FROM 'E:\Instacard Project\data from kaggle\archive\order_products__prior.csv'
  DELIMITER ',' CSV HEADER;

COPY order_products_train FROM 'E:\Instacard Project\data from kaggle\archive\order_products__train.csv'
  DELIMITER ',' CSV HEADER;