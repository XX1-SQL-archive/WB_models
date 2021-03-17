-- Tabellen, ohne Daten

-- Servants: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `srv_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Products: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- ServantsProducts
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
ENGINE = InnoDB