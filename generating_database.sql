-- -----------------------------------------------------
-- Schema hotel_industry
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_industry` DEFAULT CHARACTER SET utf8 ;
USE `hotel_industry` ;

-- -----------------------------------------------------
-- Table `hotel_industry`.`rooms_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_industry`.`rooms_types` ;

CREATE TABLE IF NOT EXISTS `hotel_industry`.`rooms_types` (
  `type_id` VARCHAR(3) NOT NULL,
  `type` VARCHAR(35) NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_industry`.`hotels`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_industry`.`hotels` ;

CREATE TABLE IF NOT EXISTS `hotel_industry`.`hotels` (
  `hotel_id` INT NOT NULL,
  `stars` TINYINT(1) NULL,
  `town` VARCHAR(25) NULL,
  `street` VARCHAR(35) NULL,
  `ZIP_code` VARCHAR(7) NULL,
  `hotel_name` VARCHAR(35) NULL,
  PRIMARY KEY (`hotel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_industry`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_industry`.`clients` ;

CREATE TABLE IF NOT EXISTS `hotel_industry`.`clients` (
  `client_id` INT NOT NULL,
  `name` VARCHAR(25) NULL,
  `surname` VARCHAR(45) NULL,
  `address` VARCHAR(65) NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_industry`.`rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_industry`.`rooms` ;

CREATE TABLE IF NOT EXISTS `hotel_industry`.`rooms` (
  `room_id` INT NOT NULL,
  `hotel_id` INT NOT NULL,
  `room_price` DECIMAL(6,2) NULL,
  `number_of_places` TINYINT(2) NULL,
  `type_id` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`room_id`, `hotel_id`),
  INDEX `fk_rooms_rooms_types_idx` (`type_id` ASC),
  INDEX `fk_rooms_hotels1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_rooms_rooms_types`
    FOREIGN KEY (`type_id`)
    REFERENCES `hotel_industry`.`rooms_types` (`type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rooms_hotels1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel_industry`.`hotels` (`hotel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_industry`.`inhabitants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_industry`.`inhabitants` ;

CREATE TABLE IF NOT EXISTS `hotel_industry`.`inhabitants` (
  `inhabitant_id` INT NOT NULL,
  `reservation_number` INT NULL,
  `client_id` INT NOT NULL,
  `hotel_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `arrival_date` DATE NULL,
  `departure_date` DATE NULL,
  PRIMARY KEY (`inhabitant_id`),
  INDEX `fk_inhabitants_clients1_idx` (`client_id` ASC),
  INDEX `fk_inhabitants_hotels1_idx` (`hotel_id` ASC),
  INDEX `fk_inhabitants_rooms1_idx` (`room_id` ASC),
  CONSTRAINT `fk_inhabitants_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `hotel_industry`.`clients` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inhabitants_hotels1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel_industry`.`hotels` (`hotel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inhabitants_rooms1`
    FOREIGN KEY (`room_id`)
    REFERENCES `hotel_industry`.`rooms` (`room_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_industry`.`parking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_industry`.`parking` ;

CREATE TABLE IF NOT EXISTS `hotel_industry`.`parking` (
  `inhabitant_id` INT NOT NULL,
  `parking_space` INT NULL,
  PRIMARY KEY (`inhabitant_id`),
  CONSTRAINT `fk_parking_inhabitants1`
    FOREIGN KEY (`inhabitant_id`)
    REFERENCES `hotel_industry`.`inhabitants` (`inhabitant_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_industry`.`reservations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_industry`.`reservations` ;

CREATE TABLE IF NOT EXISTS `hotel_industry`.`reservations` (
  `reservation_number` INT NOT NULL,
  `hotel_id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `arrival_date` DATE NULL,
  `departure_date` DATE NULL,
  `parking` VARCHAR(1) NULL,
  PRIMARY KEY (`reservation_number`),
  INDEX `fk_reservations_hotels1_idx` (`hotel_id` ASC),
  INDEX `fk_reservations_rooms1_idx` (`room_id` ASC),
  INDEX `fk_reservations_clients1_idx` (`client_id` ASC),
  CONSTRAINT `fk_reservations_hotels1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel_industry`.`hotels` (`hotel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservations_rooms1`
    FOREIGN KEY (`room_id`)
    REFERENCES `hotel_industry`.`rooms` (`room_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservations_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `hotel_industry`.`clients` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_industry`.`history_of_rents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel_industry`.`history_of_rents` ;

CREATE TABLE IF NOT EXISTS `hotel_industry`.`history_of_rents` (
  `rent_id` INT NOT NULL,
  `inhabitant_id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `hotel_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `arrival_date` DATE NULL,
  `departure_date` DATE NULL,
  PRIMARY KEY (`rent_id`))
ENGINE = InnoDB;
