-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fraus
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fraus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fraus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `fraus` ;

-- -----------------------------------------------------
-- Table `fraus`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fraus`.`question` (
  `questionid` INT(11) NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(100) NOT NULL,
  `IP` VARCHAR(45) NOT NULL,
  `qNo` INT(11) NOT NULL,
  PRIMARY KEY (`questionid`),
  UNIQUE INDEX `questionid_UNIQUE` (`questionid` ASC) VISIBLE,
  UNIQUE INDEX `indx_unqno` (`qNo` ASC) INVISIBLE,
  UNIQUE INDEX `indx_question` (`question` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fraus`.`question_option_template`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fraus`.`question_option_template` (
  `optionid` INT(11) NOT NULL AUTO_INCREMENT,
  `questionid` INT(11) NOT NULL,
  `No` INT(11) NOT NULL,
  `option` VARCHAR(100) NOT NULL,
  `IP` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`optionid`),
  UNIQUE INDEX `optionid_UNIQUE` (`optionid` ASC) VISIBLE,
  INDEX `fp_qid_idx` (`questionid` ASC) VISIBLE,
  UNIQUE INDEX `indx_answers` (`questionid` ASC, `No` ASC) VISIBLE,
  CONSTRAINT `fp_qid`
    FOREIGN KEY (`questionid`)
    REFERENCES `fraus`.`question` (`questionid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fraus`.`question_answer_ip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fraus`.`question_answer_ip` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `IP` VARCHAR(45) NOT NULL,
  `questionid` INT(11) NOT NULL,
  `answerid` INT(11) NOT NULL,
  `rating` INT(11) NOT NULL,
  `selected` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_qid2_idx` (`questionid` ASC) VISIBLE,
  INDEX `fk_answerid_idx` (`answerid` ASC) VISIBLE,
  UNIQUE INDEX `indx_unanswer` (`IP` ASC, `questionid` ASC, `answerid` ASC) VISIBLE,
  CONSTRAINT `fk_qid2`
    FOREIGN KEY (`questionid`)
    REFERENCES `fraus`.`question` (`questionid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answerid`
    FOREIGN KEY (`answerid`)
    REFERENCES `fraus`.`question_option_template` (`optionid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fraus`.`question_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fraus`.`question_comment` (
  `question_comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `questionid` INT(11) NOT NULL,
  `comment` VARCHAR(45) NOT NULL,
  `ip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`question_comment_id`),
  UNIQUE INDEX `question_comment_id_UNIQUE` (`question_comment_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
