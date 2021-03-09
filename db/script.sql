CREATE SCHEMA `javaee_app_db`;
USE `javaee_app_db`;

CREATE TABLE `users` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `secondName` varchar(255) NULL,
  `Role` varchar(255) DEFAULT 'user',
  `email` varchar(255) NOT NULL,
  `phoneNumber` int(10) NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `tasks` (
  `taskID` INT(10) NOT NULL,
  `userID` INT(10) NULL,
  `TimeDate` DATETIME NULL,
  `taskType` VARCHAR(10) NULL,
  PRIMARY KEY (`taskID`),
  INDEX `fk_userID_idx` (`userID` ASC),
  CONSTRAINT `fk_ts_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `users` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `discussions` (
  `discussionID` INT(10) NOT NULL,
  `userID` INT(10) NULL,
  `fileID` INT(10) NULL,
  `taskID` INT(10) NULL,
  `logID` INT(10) NULL,
  `commentID` INT(10) NULL,
  `discussionName` VARCHAR(50) NULL,
  `discussionPermission` VARCHAR(50) NULL,
  PRIMARY KEY (`discussionID`));

CREATE TABLE `discussionmessages` (
  `messageID` INT(10) NOT NULL,
  `userID` INT(10) NULL,
  `timeDate` DATETIME NULL,
  `discussionID` INT(11) NULL,
  `messageType` VARCHAR(10) NULL,
  PRIMARY KEY (`messageID`),
  INDEX `fk_discussionID_idx` (`discussionID` ASC),
  CONSTRAINT `fk_dm_discussionID`
    FOREIGN KEY (`discussionID`)
    REFERENCES `discussions` (`discussionID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `files` (
  `fileID` INT(10) NOT NULL,
  `userID` INT(10) NULL,
  `dateTime` DATETIME NULL,
  `discussionID` INT(10) NULL,
  `fileType` VARCHAR(10) NULL,
  PRIMARY KEY (`fileID`),
  INDEX `fk_userID_idx` (`userID` ASC),
  INDEX `fk_discussionID_idx` (`discussionID` ASC),
  CONSTRAINT `fk_fl_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `users` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_fl_discussionID`
    FOREIGN KEY (`discussionID`)
    REFERENCES `discussions` (`discussionID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `privatemessages` (
  `PMID` INT(10) NOT NULL,
  `userID` INT(10) NULL,
  `description` VARCHAR(255) NULL,
  `fileID` INT(10) NULL,
  `dateTime` DATETIME NULL,
  PRIMARY KEY (`PMID`),
  INDEX `fk_pm_userID_idx` (`userID` ASC),
  INDEX `fk_pm_fileID_idx` (`fileID` ASC),
  CONSTRAINT `fk_pm_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `users` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pm_fileID`
    FOREIGN KEY (`fileID`)
    REFERENCES `files` (`fileID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `comments` (
  `commentID` INT(10) NOT NULL,
  `userID` INT(10) NULL,
  `fileID` INT(10) NULL,
  `discussionID` INT(10) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`commentID`),
  INDEX `fk_cm_userID_idx` (`userID` ASC),
  INDEX `fk_cm_fileID_idx` (`fileID` ASC),
  INDEX `fk_cm_disID_idx` (`discussionID` ASC),
  CONSTRAINT `fk_cm_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `users` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cm_fileID`
    FOREIGN KEY (`fileID`)
    REFERENCES `files` (`fileID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cm_disID`
    FOREIGN KEY (`discussionID`)
    REFERENCES `discussions` (`discussionID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `logs` (
  `logID` INT(10) NOT NULL,
  `userID` INT(10) NULL,
  `logType` VARCHAR(30) NULL,
  `dateTime` DATETIME NULL,
  `discussionID` INT(10) NULL,
  `description` VARCHAR(50) NULL,
  PRIMARY KEY (`logID`),
  INDEX `fk_lg_userID_idx` (`userID` ASC),
  INDEX `fk_lg_disID_idx` (`discussionID` ASC),
  CONSTRAINT `fk_lg_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `users` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lg_disID`
    FOREIGN KEY (`discussionID`)
    REFERENCES `discussions` (`discussionID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

ALTER TABLE `discussions`
ADD INDEX `fk_dis_userID_idx` (`userID` ASC),
ADD INDEX `fk_dis_fID_idx` (`fileID` ASC),
ADD INDEX `fk_dis_tId_idx` (`taskID` ASC),
ADD INDEX `fk_dis_lId_idx` (`logID` ASC),
ADD INDEX `fk_dis_cId_idx` (`commentID` ASC);
ALTER TABLE `discussions`
ADD CONSTRAINT `fk_dis_userID`
  FOREIGN KEY (`userID`)
  REFERENCES `users` (`userID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_dis_fID`
  FOREIGN KEY (`fileID`)
  REFERENCES `files` (`fileID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_dis_tId`
  FOREIGN KEY (`taskID`)
  REFERENCES `tasks` (`taskID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_dis_lId`
  FOREIGN KEY (`logID`)
  REFERENCES `logs` (`logID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_dis_cId`
  FOREIGN KEY (`commentID`)
  REFERENCES `comments` (`commentID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

