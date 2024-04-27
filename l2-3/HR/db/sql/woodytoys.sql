USE 'woodyHR';

CREATE USER 'wt-user'@'php' IDENTIFIED BY 'wt-pwd';
GRANT SELECT ON `woodyHR`.* TO 'wt-user'@'php';

CREATE TABLE humains (
    id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    humain_firstname VARCHAR(255) DEFAULT NULL,
    humain_surname VARCHAR(255) DEFAULT NULL,
    groupe VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY (id)
) AUTO_INCREMENT=1;

INSERT INTO humains (humain_firstname, humain_surname, groupe) 
VALUES 
    ('Gaspard', 'Derruine', 'l2-3'),
    ('Léon', 'de Ryckel', 'l2-3'),
    ('Lilian', 'Devroye', 'l2-3'),
    ('Hugo', 'Noppe', 'l2-3');
