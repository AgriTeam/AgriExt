SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `AgriExt` ;
CREATE SCHEMA IF NOT EXISTS `AgriExt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `AgriExt` ;

-- -----------------------------------------------------
-- Table `AgriExt`.`districts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`districts` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`districts` (
  `id` INT NOT NULL ,
  `districtName` VARCHAR(45) NULL ,
  `timeAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`counties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`counties` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`counties` (
  `id` INT NOT NULL ,
  `countryname` VARCHAR(45) NULL ,
  `districtId` INT NULL ,
  `timeAdded` TIMESTAMP NULL ,
  `lat` FLOAT NULL ,
  `long` FLOAT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_districtID` (`districtId` ASC) ,
  CONSTRAINT `fk_districtID`
    FOREIGN KEY (`districtId` )
    REFERENCES `AgriExt`.`districts` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`sub_counties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`sub_counties` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`sub_counties` (
  `id` INT NOT NULL ,
  `sub_county` VARCHAR(45) NULL ,
  `countyId` INT NULL ,
  `districtId` INT NULL ,
  `lat` FLOAT NULL ,
  `long` FLOAT NULL ,
  `timeAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_county` (`countyId` ASC) ,
  CONSTRAINT `fk_county`
    FOREIGN KEY (`countyId` )
    REFERENCES `AgriExt`.`counties` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`users` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`users` (
  `id` INT NOT NULL ,
  `phone` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `firstname` VARCHAR(45) NULL ,
  `lastname` VARCHAR(45) NULL ,
  `emailaddress` VARCHAR(45) NULL ,
  `usertype` VARCHAR(45) NULL ,
  `locality` INT NULL ,
  `timeadded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_location` (`locality` ASC) ,
  CONSTRAINT `fk_location`
    FOREIGN KEY (`locality` )
    REFERENCES `AgriExt`.`sub_counties` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'users of the system';


-- -----------------------------------------------------
-- Table `AgriExt`.`parish`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`parish` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`parish` (
  `id` INT NOT NULL ,
  `parishName` VARCHAR(45) NULL ,
  `sub_countyId` INT NULL ,
  `countyId` INT NULL ,
  `districtId` INT NULL ,
  `lat` FLOAT NULL ,
  `long` FLOAT NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_subcounty` (`sub_countyId` ASC) ,
  CONSTRAINT `fk_subcounty`
    FOREIGN KEY (`sub_countyId` )
    REFERENCES `AgriExt`.`sub_counties` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`village`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`village` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`village` (
  `id` INT NOT NULL ,
  `villageName` VARCHAR(45) NULL ,
  `parishId` INT NULL ,
  `sub_countyId` INT NULL ,
  `countyId` INT NULL ,
  `districtId` INT NULL ,
  `lat` FLOAT NULL ,
  `long` FLOAT NULL ,
  `dateAdded` TIMESTAMP NULL ,
  `parish_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `parish_id`) ,
  INDEX `fk_parish` (`parishId` ASC) ,
  CONSTRAINT `fk_parish`
    FOREIGN KEY (`parishId` )
    REFERENCES `AgriExt`.`parish` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`households`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`households` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`households` (
  `id` INT NOT NULL ,
  `location` INT NULL ,
  `lat` FLOAT NULL ,
  `long` FLOAT NULL ,
  `agentAdded` INT NULL ,
  `size` INT NULL ,
  `sizeInAgric` INT NULL ,
  `headOfHH` VARCHAR(45) NULL ,
  `sizeofLand` VARCHAR(45) NULL ,
  `sizeofLandAgric` VARCHAR(45) NULL ,
  `sizeofLandShelter` VARCHAR(45) NULL ,
  `sizeofLandUnused` VARCHAR(45) NULL ,
  `CropTypeNo` INT NULL ,
  `CropLandSize` VARCHAR(45) NULL ,
  `AnimalTypeNo` INT NULL ,
  `AnimalLandSize` VARCHAR(45) NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_HHlocation` (`location` ASC) ,
  INDEX `fk_agent` (`agentAdded` ASC) ,
  CONSTRAINT `fk_HHlocation`
    FOREIGN KEY (`location` )
    REFERENCES `AgriExt`.`sub_counties` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agent`
    FOREIGN KEY (`agentAdded` )
    REFERENCES `AgriExt`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`HHCropInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`HHCropInfo` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`HHCropInfo` (
  `id` INT NOT NULL ,
  `HHId` INT NULL ,
  `CropName` VARCHAR(45) NULL ,
  `localName` VARCHAR(45) NULL ,
  `CropVaria` VARCHAR(45) NULL COMMENT 'The type of that crop (Beans Nambale)\n' ,
  `VariaLocalName` VARCHAR(45) NULL ,
  `Acreage` VARCHAR(45) NULL COMMENT 'size of land planted (1 acre)' ,
  `CropSize` VARCHAR(45) NULL COMMENT 'size of the crop planted (300 trees)' ,
  `lastYield` VARCHAR(45) NULL ,
  `expectedYield` VARCHAR(45) NULL ,
  `dateOfPlanting` DATE NULL ,
  `expectedHarvDate` DATE NULL ,
  `ready4Mkt` VARCHAR(45) NULL COMMENT 'whether the produce for the crop is ready for market\n' ,
  `price` VARCHAR(45) NULL ,
  `dateAdded` TIMESTAMP NULL ,
  `households_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `households_id`) ,
  INDEX `fk_household` (`HHId` ASC) ,
  CONSTRAINT `fk_household`
    FOREIGN KEY (`HHId` )
    REFERENCES `AgriExt`.`households` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`HHanimalInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`HHanimalInfo` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`HHanimalInfo` (
  `id` INT NOT NULL ,
  `HHId` INT NULL ,
  `animalName` VARCHAR(45) NULL ,
  `localName` VARCHAR(45) NULL ,
  `animailBreed` VARCHAR(45) NULL ,
  `breedLocName` VARCHAR(45) NULL ,
  `Acreage` VARCHAR(45) NULL ,
  `numberReared` VARCHAR(45) NULL ,
  `soldLastSzn` VARCHAR(45) NULL ,
  `broughtIn` VARCHAR(45) NULL ,
  `dateBroughtIn` DATE NULL ,
  `expectedSell` VARCHAR(45) NULL ,
  `dateExptdSell` DATE NULL ,
  `ready4sell` VARCHAR(45) NULL ,
  `price` VARCHAR(45) NULL ,
  `dateAdded` TIMESTAMP NULL ,
  `households_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `households_id`) ,
  INDEX `fk_ANhousehold` (`HHId` ASC) ,
  CONSTRAINT `fk_ANhousehold`
    FOREIGN KEY (`HHId` )
    REFERENCES `AgriExt`.`households` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`AnimalProducts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`AnimalProducts` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`AnimalProducts` (
  `id` INT NOT NULL ,
  `productName` VARCHAR(45) NULL ,
  `animalId` INT NULL ,
  `volumeLastSzn` VARCHAR(45) NULL ,
  `volumeExcted` VARCHAR(45) NULL ,
  `dateExpected` DATE NULL ,
  `ready4sell` VARCHAR(45) NULL ,
  `price` VARCHAR(45) NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_animal` (`animalId` ASC) ,
  CONSTRAINT `fk_animal`
    FOREIGN KEY (`animalId` )
    REFERENCES `AgriExt`.`HHanimalInfo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`marketInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`marketInfo` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`marketInfo` (
  `id` INT NOT NULL ,
  `locationId` INT NULL ,
  `marketName` VARCHAR(45) NULL ,
  `lat` VARCHAR(45) NULL ,
  `long` VARCHAR(45) NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_MKlocation` (`locationId` ASC) ,
  CONSTRAINT `fk_MKlocation`
    FOREIGN KEY (`locationId` )
    REFERENCES `AgriExt`.`sub_counties` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`marketPrice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`marketPrice` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`marketPrice` (
  `id` INT NOT NULL ,
  `marketId` INT NULL ,
  `commodity` VARCHAR(45) NULL ,
  `localName` VARCHAR(45) NULL ,
  `commodityPrice` VARCHAR(45) NULL ,
  `volumeSold` VARCHAR(45) NULL ,
  `priceDate` DATE NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_market` (`marketId` ASC) ,
  CONSTRAINT `fk_market`
    FOREIGN KEY (`marketId` )
    REFERENCES `AgriExt`.`marketInfo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`farmingTools`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`farmingTools` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`farmingTools` (
  `id` INT NOT NULL ,
  `toolName` VARCHAR(45) NULL ,
  `crop_livestock` VARCHAR(45) NULL ,
  `HHId` INT NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_FThousehold` (`HHId` ASC) ,
  CONSTRAINT `fk_FThousehold`
    FOREIGN KEY (`HHId` )
    REFERENCES `AgriExt`.`households` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`weatherData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`weatherData` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`weatherData` (
  `id` INT NOT NULL ,
  `locationId` INT NULL ,
  `lat` FLOAT NULL ,
  `long` FLOAT NULL ,
  `cityId` INT NULL ,
  `dataRvd` TIMESTAMP NULL COMMENT 'time data is recieved' ,
  `sunRTime` TIMESTAMP NULL ,
  `sunSTime` TIMESTAMP NULL ,
  `hum` INT NULL ,
  `temp` INT NULL ,
  `tempMin` INT NULL ,
  `tempMax` INT NULL ,
  `tempNight` INT NULL ,
  `tempEven` INT NULL ,
  `tempMorn` INT NULL ,
  `pressure` INT NULL ,
  `pressSeaL` INT NULL COMMENT 'atmospheric pressure seal level' ,
  `pressGndL` INT NULL COMMENT 'atmospheric pressure ground level' ,
  `windSpeed` INT NULL ,
  `windDir` INT NULL ,
  `cloudLiness` INT NULL ,
  `weatherId` INT NULL ,
  `weatherCond` VARCHAR(45) NULL ,
  `weatherDesc` VARCHAR(100) NULL ,
  `weatherIc` INT NULL ,
  `rainPres` INT NULL ,
  `snowPres` INT NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_weatherData` (`locationId` ASC) ,
  CONSTRAINT `fk_weatherData`
    FOREIGN KEY (`locationId` )
    REFERENCES `AgriExt`.`sub_counties` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgriExt`.`cropAbnorm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`cropAbnorm` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`cropAbnorm` (
  `id` INT NOT NULL ,
  `cropId` INT NULL ,
  `abnormName` VARCHAR(45) NULL ,
  `abnormLocNam` VARCHAR(45) NULL ,
  `abnormDesc` VARCHAR(300) NULL ,
  `abnormDescLoc` VARCHAR(45) NULL ,
  `cropSizeAff` VARCHAR(45) NULL COMMENT 'crop size affected' ,
  `expertID` INT NULL ,
  `expertAdvice` VARCHAR(300) NULL ,
  `expertAdviceLoc` VARCHAR(300) NULL ,
  `pest_disease` VARCHAR(45) NULL ,
  `adnormResol` VARCHAR(45) NULL COMMENT 'Yes or No' ,
  `resolDesc` VARCHAR(300) NULL COMMENT 'Resolution description' ,
  `resolDescLoc` VARCHAR(300) NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_CAcrop` (`cropId` ASC) ,
  INDEX `fk_CAexpertId` (`expertID` ASC) ,
  CONSTRAINT `fk_CAcrop`
    FOREIGN KEY (`cropId` )
    REFERENCES `AgriExt`.`HHCropInfo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAexpertId`
    FOREIGN KEY (`expertID` )
    REFERENCES `AgriExt`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'crop abnormalities table to capture pests and diseases information';


-- -----------------------------------------------------
-- Table `AgriExt`.`animAbnorm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgriExt`.`animAbnorm` ;

CREATE  TABLE IF NOT EXISTS `AgriExt`.`animAbnorm` (
  `id` INT NOT NULL ,
  `animId` INT NULL ,
  `abnormName` VARCHAR(45) NULL ,
  `abnormLocNam` VARCHAR(45) NULL ,
  `abnormDesc` VARCHAR(300) NULL ,
  `abnormDescLoc` VARCHAR(45) NULL ,
  `animSizeAff` VARCHAR(45) NULL COMMENT 'crop size affected' ,
  `expertID` INT NULL ,
  `expertAdvice` VARCHAR(300) NULL ,
  `expertAdviceLoc` VARCHAR(300) NULL ,
  `pest_disease` VARCHAR(45) NULL ,
  `adnormResol` VARCHAR(45) NULL COMMENT 'Yes or No' ,
  `resolDesc` VARCHAR(300) NULL COMMENT 'Resolution description' ,
  `resolDescLoc` VARCHAR(300) NULL ,
  `dateAdded` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_AAanimal` (`animId` ASC) ,
  INDEX `fk_AAexpert` (`expertID` ASC) ,
  CONSTRAINT `fk_AAanimal`
    FOREIGN KEY (`animId` )
    REFERENCES `AgriExt`.`HHanimalInfo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AAexpert`
    FOREIGN KEY (`expertID` )
    REFERENCES `AgriExt`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'animal abnormalities table to capture pests and diseases information';



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
