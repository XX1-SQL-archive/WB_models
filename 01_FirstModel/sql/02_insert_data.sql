-- Template 
#INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (NULL, NULL, NULL);

-- "zu Fuß"
INSERT INTO `mydb`.`cats` (`cat_name`, `fur_color`) VALUES ("Grizabella", "white");
INSERT INTO `mydb`.`cats` (`cat_name`, `fur_color`) VALUES ("Alonzo", "grey");

-- aus INSERTS
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, 'Rum Tum Tugger', 'striped');
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, 'Gus', 'grey');

SELECT * FROM mydb.cats;