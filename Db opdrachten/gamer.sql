-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema m5prog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema m5prog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `m5prog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`bordspellen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`bordspellen` (
  `idbordspellen` INT NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(45) NOT NULL,
  `aantal spelers` VARCHAR(45) NOT NULL,
  `beschrijving` VARCHAR(45) NOT NULL,
  `coop` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idbordspellen`),
  UNIQUE INDEX `idbordspellen_UNIQUE` (`idbordspellen` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `m5prog`.`gameraccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m5prog`.`gameraccount` (
  `idgameraccount` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `leeftijd` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgameraccount`),
  UNIQUE INDEX `idgameraccount_UNIQUE` (`idgameraccount` ASC) VISIBLE,
  UNIQUE INDEX `leeftijd_UNIQUE` (`leeftijd` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`game` (
  `idachievments` INT NOT NULL AUTO_INCREMENT,
  `minecraft achievments` VARCHAR(45) NOT NULL,
  `fortnite achievments` VARCHAR(45) NOT NULL,
  `gta achievments` VARCHAR(45) NOT NULL,
  `crew 2 achievments` VARCHAR(45) NOT NULL,
  `gameraccount_idgameraccount` INT NOT NULL,
  PRIMARY KEY (`idachievments`),
  UNIQUE INDEX `idachievments_UNIQUE` (`idachievments` ASC) VISIBLE,
  INDEX `fk_game_gameraccount1_idx` (`gameraccount_idgameraccount` ASC) VISIBLE,
  CONSTRAINT `fk_game_gameraccount1`
    FOREIGN KEY (`gameraccount_idgameraccount`)
    REFERENCES `m5prog`.`gameraccount` (`idgameraccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`games` (
  `idgames` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fortnite` VARCHAR(45) NOT NULL,
  `gta` VARCHAR(45) NOT NULL,
  `minecraft` VARCHAR(45) NOT NULL,
  `crew 2` VARCHAR(45) NOT NULL,
  `gameraccount_idgameraccount` INT NOT NULL,
  `game_idachievments` INT NOT NULL,
  UNIQUE INDEX `idgames_UNIQUE` (`idgames` ASC) VISIBLE,
  INDEX `fk_games_gameraccount_idx` (`gameraccount_idgameraccount` ASC) VISIBLE,
  PRIMARY KEY (`game_idachievments`),
  CONSTRAINT `fk_games_gameraccount`
    FOREIGN KEY (`gameraccount_idgameraccount`)
    REFERENCES `m5prog`.`gameraccount` (`idgameraccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_game1`
    FOREIGN KEY (`game_idachievments`)
    REFERENCES `dbfirst`.`game` (`idachievments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`gamer` (
  `idgamer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `behaalde achievments minecraft` VARCHAR(45) NOT NULL,
  `behaalde achievments fortnite` VARCHAR(45) NOT NULL,
  `behaalde achievments gta` VARCHAR(45) NOT NULL,
  `behaalde achievments crew 2` VARCHAR(45) NOT NULL,
  `gameraccount_idgameraccount` INT NOT NULL,
  PRIMARY KEY (`idgamer`, `gameraccount_idgameraccount`),
  INDEX `fk_gamer_gameraccount1_idx` (`gameraccount_idgameraccount` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_gameraccount1`
    FOREIGN KEY (`gameraccount_idgameraccount`)
    REFERENCES `m5prog`.`gameraccount` (`idgameraccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`game_has_gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`game_has_gamer` (
  `game_idachievments` INT NOT NULL,
  `gamer_idgamer` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`game_idachievments`, `gamer_idgamer`),
  INDEX `fk_game_has_gamer_gamer1_idx` (`gamer_idgamer` ASC) VISIBLE,
  INDEX `fk_game_has_gamer_game1_idx` (`game_idachievments` ASC) VISIBLE,
  CONSTRAINT `fk_game_has_gamer_game1`
    FOREIGN KEY (`game_idachievments`)
    REFERENCES `dbfirst`.`game` (`idachievments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_gamer_gamer1`
    FOREIGN KEY (`gamer_idgamer`)
    REFERENCES `dbfirst`.`gamer` (`idgamer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `m5prog` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
