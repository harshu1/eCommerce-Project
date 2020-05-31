--<ScriptOptions statementTerminator=";"/>

ALTER TABLE `shopping_cart_db`.`categories` DROP PRIMARY KEY;

ALTER TABLE `shopping_cart_db`.`lines_item` DROP PRIMARY KEY;

ALTER TABLE `shopping_cart_db`.`orders` DROP PRIMARY KEY;

ALTER TABLE `shopping_cart_db`.`customers` DROP PRIMARY KEY;

ALTER TABLE `shopping_cart_db`.`carts` DROP PRIMARY KEY;

ALTER TABLE `shopping_cart_db`.`products` DROP PRIMARY KEY;

ALTER TABLE `shopping_cart_db`.`lines_item` DROP INDEX `shopping_cart_db`.`lines_item_orders_fk_idx`;

ALTER TABLE `shopping_cart_db`.`products` DROP INDEX `shopping_cart_db`.`products_categories_fk`;

ALTER TABLE `shopping_cart_db`.`lines_item` DROP INDEX `shopping_cart_db`.`lines_item_products_fk_idx`;

ALTER TABLE `shopping_cart_db`.`carts` DROP INDEX `shopping_cart_db`.`carts_customers_fk_idx`;

ALTER TABLE `shopping_cart_db`.`lines_item` DROP INDEX `shopping_cart_db`.`lines_item_carts_fk_idx`;

ALTER TABLE `shopping_cart_db`.`orders` DROP INDEX `shopping_cart_db`.`orders_customers_fk_idx`;

DROP TABLE `shopping_cart_db`.`products`;

DROP TABLE `shopping_cart_db`.`categories`;

DROP TABLE `shopping_cart_db`.`lines_item`;

DROP TABLE `shopping_cart_db`.`orders`;

DROP TABLE `shopping_cart_db`.`customers`;

DROP TABLE `shopping_cart_db`.`carts`;

CREATE TABLE `shopping_cart_db`.`categories` (
	`idcategory` INT NOT NULL,
	`description` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`idcategory`)
);

CREATE TABLE `shopping_cart_db`.`lines_item` (
	`idlines_item` BIGINT NOT NULL,
	`idorder` BIGINT,
	`idproduct` BIGINT NOT NULL,
	`quantity` INT NOT NULL,
	`price` DECIMAL(10 , 2) NOT NULL,
	`idcart` BIGINT NOT NULL,
	PRIMARY KEY (`idlines_item`)
);

CREATE TABLE `shopping_cart_db`.`orders` (
	`idorder` BIGINT NOT NULL,
	`ordered` DATETIME NOT NULL,
	`status` VARCHAR(20) NOT NULL,
	`idcustomer` BIGINT NOT NULL,
	`total` DECIMAL(10 , 2) NOT NULL,
	PRIMARY KEY (`idorder`)
);

CREATE TABLE `shopping_cart_db`.`customers` (
	`idcustomer` BIGINT NOT NULL,
	`first_name` VARCHAR(50) NOT NULL,
	`last_name` VARCHAR(50) NOT NULL,
	`username` VARCHAR(50) NOT NULL,
	`password` VARCHAR(256) NOT NULL,
	PRIMARY KEY (`idcustomer`)
);

CREATE TABLE `shopping_cart_db`.`carts` (
	`idcarts` BIGINT NOT NULL,
	`idcustomer` BIGINT NOT NULL,
	`subtotal` DECIMAL(10 , 2) NOT NULL,
	PRIMARY KEY (`idcarts`)
);

CREATE TABLE `shopping_cart_db`.`products` (
	`idproduct` BIGINT NOT NULL,
	`description` VARCHAR(100) NOT NULL,
	`price` DECIMAL(10 , 2) NOT NULL,
	`idcategory` INT,
	PRIMARY KEY (`idproduct`)
);

CREATE INDEX `lines_item_products_fk_idx` ON `shopping_cart_db`.`lines_item` (`idproduct` ASC);

CREATE INDEX `carts_customers_fk_idx` ON `shopping_cart_db`.`carts` (`idcustomer` ASC);

CREATE INDEX `lines_item_carts_fk_idx` ON `shopping_cart_db`.`lines_item` (`idcart` ASC);

CREATE INDEX `lines_item_orders_fk_idx` ON `shopping_cart_db`.`lines_item` (`idorder` ASC);

CREATE INDEX `products_categories_fk` ON `shopping_cart_db`.`products` (`idcategory` ASC);

CREATE INDEX `orders_customers_fk_idx` ON `shopping_cart_db`.`orders` (`idcustomer` ASC);

