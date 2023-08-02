-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema universidad
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `universidad` ;

-- -----------------------------------------------------
-- Schema universidad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `universidad` DEFAULT CHARACTER SET utf8 ;
USE `universidad` ;

-- -----------------------------------------------------
-- Table `universidad`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `titular` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`departamento` (
  `iddepartamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`iddepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`profesor` (
  `numeco` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `edad` INT NULL,
  `categoria_idcategoria` INT NOT NULL,
  `sueldo` FLOAT NULL,
  `departamento_iddepartamento` INT NOT NULL,
  PRIMARY KEY (`numeco`),
  INDEX `fk_profesor_categoria_idx` (`categoria_idcategoria` ASC) VISIBLE,
  INDEX `fk_profesor_departamento1_idx` (`departamento_iddepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_profesor_categoria`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `universidad`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesor_departamento1`
    FOREIGN KEY (`departamento_iddepartamento`)
    REFERENCES `universidad`.`departamento` (`iddepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`articulo` (
  `idarticulo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `numpagina` INT NULL,
  PRIMARY KEY (`idarticulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`evento` (
  `idevento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `sede` VARCHAR(45) NULL,
  PRIMARY KEY (`idevento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`profesorArticulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`profesorArticulo` (
  `idprofesorArticulo` INT NOT NULL AUTO_INCREMENT,
  `profesor_numeco` INT NOT NULL,
  `articulo_idarticulo` INT NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`idprofesorArticulo`),
  INDEX `fk_profesorArticulo_profesor1_idx` (`profesor_numeco` ASC) VISIBLE,
  INDEX `fk_profesorArticulo_articulo1_idx` (`articulo_idarticulo` ASC) VISIBLE,
  CONSTRAINT `fk_profesorArticulo_profesor1`
    FOREIGN KEY (`profesor_numeco`)
    REFERENCES `universidad`.`profesor` (`numeco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesorArticulo_articulo1`
    FOREIGN KEY (`articulo_idarticulo`)
    REFERENCES `universidad`.`articulo` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universidad`.`profesorEvento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidad`.`profesorEvento` (
  `idprofesorEvento` INT NOT NULL AUTO_INCREMENT,
  `profesor_numeco` INT NOT NULL,
  `evento_idevento` INT NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`idprofesorEvento`),
  INDEX `fk_profesorEvento_profesor1_idx` (`profesor_numeco` ASC) VISIBLE,
  INDEX `fk_profesorEvento_evento1_idx` (`evento_idevento` ASC) VISIBLE,
  CONSTRAINT `fk_profesorEvento_profesor1`
    FOREIGN KEY (`profesor_numeco`)
    REFERENCES `universidad`.`profesor` (`numeco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesorEvento_evento1`
    FOREIGN KEY (`evento_idevento`)
    REFERENCES `universidad`.`evento` (`idevento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
