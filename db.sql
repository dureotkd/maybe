/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.6-MariaDB : Database - meet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`meet` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `meet`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `displayStatus` tinyint(1) unsigned NOT NULL,
  `tag` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `articleLike` */

DROP TABLE IF EXISTS `articleLike`;

CREATE TABLE `articleLike` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `articleId` int(10) unsigned NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `point` tinyint(1) unsigned NOT NULL,
  `readStatus` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `articleReply` */

DROP TABLE IF EXISTS `articleReply`;

CREATE TABLE `articleReply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `articleId` int(10) unsigned NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `displayStatus` tinyint(1) unsigned NOT NULL,
  `readStatus` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `attr` */

DROP TABLE IF EXISTS `attr`;

CREATE TABLE `attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `relTypeCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `type2Code` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `typeCode` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `delDate` datetime DEFAULT NULL,
  `delStatus` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `relTypeCode` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `originFileName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fileExt` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `typeCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `type2Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `fileSize` int(10) unsigned NOT NULL,
  `fileExtTypeCode` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `fileExtType2Code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `fileNo` tinyint(2) unsigned NOT NULL,
  `body` longblob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `friend` */

DROP TABLE IF EXISTS `friend`;

CREATE TABLE `friend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `followId` int(10) unsigned NOT NULL,
  `followerId` int(10) unsigned NOT NULL,
  `readStatus` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `followId` (`followId`,`followerId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `loginPw` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(10) NOT NULL,
  `mailStatus` tinyint(1) unsigned NOT NULL,
  `sessionKey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `sessionLimit` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delStatus` tinyint(1) NOT NULL,
  `delRegDate` datetime DEFAULT NULL,
  `introduce` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `delStatus` tinyint(1) unsigned NOT NULL,
  `displayStatus` tinyint(1) unsigned NOT NULL,
  `delRegDate` datetime DEFAULT NULL,
  `fromId` int(10) unsigned NOT NULL,
  `toId` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `readStatus` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
