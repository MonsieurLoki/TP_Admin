USE 'woodytoys';

CREATE USER 'wt-user'@'php' IDENTIFIED BY 'wt-pwd';
GRANT SELECT ON `woodytoys`.* TO 'wt-user'@'php';

CREATE TABLE products (
    id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(255) DEFAULT NULL,
    product_price DECIMAL(10,2) DEFAULT NULL,
    PRIMARY KEY (id)
) AUTO_INCREMENT=1;

INSERT INTO products (product_name, product_price) 
VALUES 
    ('Set de 100 cubes multicolores', 50),
    ('Yoyo', 10),
    ('Circuit de billes', 75),
    ('Arc à flèches', 20),
    ('Maison de poupées', 150);
