-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tienda
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `tienda` ;

-- -----------------------------------------------------
-- Schema tienda
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8 ;
USE `tienda` ;

-- -----------------------------------------------------
-- Table `tienda`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda`.`proveedor` (
  `idproveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda`.`producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT 'Mi producto',
  `precio` DOUBLE NULL,
  `proveedor_idproveedor` INT NOT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `fk_producto_proveedor1_idx` (`proveedor_idproveedor` ASC) VISIBLE,
  CONSTRAINT `fk_producto_proveedor1`
    FOREIGN KEY (`proveedor_idproveedor`)
    REFERENCES `tienda`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda`.`venta` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NULL,
  `cantidad` DATETIME NULL,
  `total` VARCHAR(45) NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idventa`),
  INDEX `fk_venta_cliente_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_venta_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `tienda`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tienda`.`productoVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda`.`productoVenta` (
  `idproductoVenta` INT NOT NULL AUTO_INCREMENT,
  `venta_idventa` INT NOT NULL,
  `producto_idproducto` INT NOT NULL,
  PRIMARY KEY (`idproductoVenta`),
  INDEX `fk_productoVenta_venta1_idx` (`venta_idventa` ASC) VISIBLE,
  INDEX `fk_productoVenta_producto1_idx` (`producto_idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_productoVenta_venta1`
    FOREIGN KEY (`venta_idventa`)
    REFERENCES `tienda`.`venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoVenta_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `tienda`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
