-- 02 Tabellen, mit Inserts
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE mydb;
USE mydb;

/*  SERVANTS */
-- Servants: CREATE
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `srv_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Servants: Struktur
DESCRIBE servants;

-- Servants: Inserts
INSERT INTO `mydb`.`servants` (`id`, `srv_name`, `yrs_served`) VALUES (DEFAULT, "Peter", 4);
INSERT INTO `mydb`.`servants` (`id`, `srv_name`, `yrs_served`) VALUES (DEFAULT, "Holger", 2);

-- Servants: Inhalte
SELECT * FROM servants;

/*  PRODUCTS */

-- Products: CREATE
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Products: Struktur
DESCRIBE products;

-- Products: Inserts
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Whiskas|Lachs", 2.75);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Whiskas|Huhn", 2.80);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Felix|Jelly", 3.75);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Felix|Sauce", 3.80);

-- Products: Inhalte
SELECT * FROM products;

/*  SERVANTS:PRODUCTS - Kaufprozesse */
-- ServantsProducts: Create
CREATE TABLE IF NOT EXISTS `mydb`.`products_has_servants` (
  `products_id` INT NOT NULL,
  `servants_id` INT NOT NULL,
  PRIMARY KEY (`products_id`, `servants_id`),
  INDEX `fk_products_has_servants_servants1_idx` (`servants_id` ASC) VISIBLE,
  INDEX `fk_products_has_servants_products_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_has_servants_products`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_servants_servants1`
    FOREIGN KEY (`servants_id`)
    REFERENCES `mydb`.`servants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ServantsProducts: Struktur
DESCRIBE products_has_servants;

-- ServantsProducts: Inserts
INSERT INTO `mydb`.`products_has_servants` (`products_id`, `servants_id`) VALUES (2, 1);
INSERT INTO `mydb`.`products_has_servants` (`products_id`, `servants_id`) VALUES (3, 1);
INSERT INTO `mydb`.`products_has_servants` (`products_id`, `servants_id`) VALUES (1, 2);
INSERT INTO `mydb`.`products_has_servants` (`products_id`, `servants_id`) VALUES (2, 2);
INSERT INTO `mydb`.`products_has_servants` (`products_id`, `servants_id`) VALUES (3, 2);
INSERT INTO `mydb`.`products_has_servants` (`products_id`, `servants_id`) VALUES (4, 2);

-- ServantsProducts: Inhalte
SELECT * FROM products_has_servants;
