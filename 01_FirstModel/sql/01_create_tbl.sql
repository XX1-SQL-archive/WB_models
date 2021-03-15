-- Datenbank anlegen
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

-- Tabelle anlegen
CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DESCRIBE cats;