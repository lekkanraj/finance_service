/*
SQLyog Community v13.0.0 (32 bit)
MySQL - 10.1.25-MariaDB : Database - finance-app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `config` */

/*Table structure for table `customer_master` */

DROP TABLE IF EXISTS `customer_master`;

CREATE TABLE `customer_master` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(50) DEFAULT NULL,
  `job_name` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `cur_addr` varchar(300) DEFAULT NULL,
  `per_addr` varchar(300) DEFAULT NULL,
  `house` varchar(10) DEFAULT NULL,
  `bailee_name` varchar(50) DEFAULT NULL,
  `bailee_mob` varchar(50) DEFAULT NULL,
  `security_type` int(11) DEFAULT NULL,
  `security_id` varchar(100) DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL,
  `net_amt` decimal(8,2) DEFAULT '0.00',
  `rec_amt` decimal(8,2) DEFAULT '0.00',
  `bal_amt` decimal(8,2) DEFAULT '0.00',
  `line_id` int(11) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `cr_by` varchar(50) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(50) DEFAULT NULL,
  `fin_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `customer_master` */

insert  into `customer_master`(`cus_id`,`cus_name`,`job_name`,`mobile_no`,`cur_addr`,`per_addr`,`house`,`bailee_name`,`bailee_mob`,`security_type`,`security_id`,`isactive`,`net_amt`,`rec_amt`,`bal_amt`,`line_id`,`cr_dt`,`cr_by`,`up_dt`,`up_by`,`fin_id`) values (25,'Lekkan M','Former','9944649551','TNHB Velachery','Thayanur','3','Hari','62374672347',6,'AIAPLdsfsdf',1,600.00,200.00,400.00,1,NULL,NULL,NULL,NULL,15);
insert  into `customer_master`(`cus_id`,`cus_name`,`job_name`,`mobile_no`,`cur_addr`,`per_addr`,`house`,`bailee_name`,`bailee_mob`,`security_type`,`security_id`,`isactive`,`net_amt`,`rec_amt`,`bal_amt`,`line_id`,`cr_dt`,`cr_by`,`up_dt`,`up_by`,`fin_id`) values (26,'Karthik ','SE','7898943543','Guindy','Kumbakonam','4','Raj','34636278624',4,'3243246237847',1,300.00,100.00,200.00,1,NULL,NULL,NULL,NULL,14);
insert  into `customer_master`(`cus_id`,`cus_name`,`job_name`,`mobile_no`,`cur_addr`,`per_addr`,`house`,`bailee_name`,`bailee_mob`,`security_type`,`security_id`,`isactive`,`net_amt`,`rec_amt`,`bal_amt`,`line_id`,`cr_dt`,`cr_by`,`up_dt`,`up_by`,`fin_id`) values (27,'Aki','SE','48375934685','adsfd','sdfsdf','3','raj','5345345345',5,'sdfsdfsdf',1,0.00,0.00,0.00,3,NULL,NULL,NULL,NULL,0);
insert  into `customer_master`(`cus_id`,`cus_name`,`job_name`,`mobile_no`,`cur_addr`,`per_addr`,`house`,`bailee_name`,`bailee_mob`,`security_type`,`security_id`,`isactive`,`net_amt`,`rec_amt`,`bal_amt`,`line_id`,`cr_dt`,`cr_by`,`up_dt`,`up_by`,`fin_id`) values (28,'Yuv','SE','435435345445','retreter','retret','3','tt','34545435',5,'34543543543543',1,0.00,0.00,0.00,4,NULL,NULL,NULL,NULL,0);
insert  into `customer_master`(`cus_id`,`cus_name`,`job_name`,`mobile_no`,`cur_addr`,`per_addr`,`house`,`bailee_name`,`bailee_mob`,`security_type`,`security_id`,`isactive`,`net_amt`,`rec_amt`,`bal_amt`,`line_id`,`cr_dt`,`cr_by`,`up_dt`,`up_by`,`fin_id`) values (29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,NULL,NULL,NULL,NULL,0);

/*Table structure for table `db_backup_history` */

DROP TABLE IF EXISTS `db_backup_history`;

CREATE TABLE `db_backup_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(1000) DEFAULT NULL,
  `backuped` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `db_backup_history` */

/*Table structure for table `finance_collection` */

DROP TABLE IF EXISTS `finance_collection`;

CREATE TABLE `finance_collection` (
  `coll_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fin_id` bigint(20) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `coll_amt` int(11) DEFAULT '0',
  `coll_dt` date DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `cr_by` varchar(50) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`coll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `finance_collection` */

insert  into `finance_collection`(`coll_id`,`fin_id`,`cus_id`,`coll_amt`,`coll_dt`,`comments`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (25,15,25,100,'2018-05-15',NULL,NULL,NULL,NULL,NULL);
insert  into `finance_collection`(`coll_id`,`fin_id`,`cus_id`,`coll_amt`,`coll_dt`,`comments`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (26,14,26,50,'2018-05-15',NULL,NULL,NULL,NULL,NULL);
insert  into `finance_collection`(`coll_id`,`fin_id`,`cus_id`,`coll_amt`,`coll_dt`,`comments`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (27,15,25,100,'2018-05-16',NULL,NULL,NULL,NULL,NULL);
insert  into `finance_collection`(`coll_id`,`fin_id`,`cus_id`,`coll_amt`,`coll_dt`,`comments`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (28,14,26,50,'2018-05-16',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `finance_master` */

DROP TABLE IF EXISTS `finance_master`;

CREATE TABLE `finance_master` (
  `fin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) DEFAULT NULL,
  `fin_amt` decimal(8,2) DEFAULT '0.00',
  `hold_amt` decimal(8,2) DEFAULT '0.00',
  `by_hand_amt` decimal(8,2) DEFAULT '0.00',
  `cmpy_amt` decimal(8,2) DEFAULT '0.00',
  `rec_amt` decimal(8,2) DEFAULT '0.00',
  `bal_amt` decimal(8,2) DEFAULT '0.00',
  `profit` decimal(8,2) DEFAULT '0.00',
  `fin_start` date DEFAULT NULL,
  `fin_end` date DEFAULT NULL,
  `fin_cnt` int(11) DEFAULT NULL,
  `close_dt` date DEFAULT NULL,
  `closing_cnt` int(11) DEFAULT NULL,
  `fin_status_id` int(10) NOT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `cr_by` varchar(50) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `finance_master` */

insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (7,25,100.00,10.00,90.00,100.00,400.00,0.00,10.00,'2018-05-10','2018-05-10',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL);
insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (8,25,200.00,20.00,80.00,200.00,0.00,0.00,20.00,'2018-05-10',NULL,NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL);
insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (9,25,300.00,30.00,70.00,300.00,0.00,0.00,30.00,'2018-05-10',NULL,NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL);
insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (10,25,400.00,40.00,60.00,400.00,0.00,0.00,40.00,'2018-05-10',NULL,NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL);
insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (11,25,500.00,50.00,50.00,500.00,500.00,0.00,50.00,'2018-05-10','2018-05-10',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL);
insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (12,26,100.00,10.00,90.00,100.00,100.00,0.00,10.00,'2018-05-10','2018-05-10',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL);
insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (13,26,200.00,20.00,80.00,200.00,200.00,0.00,20.00,'2018-05-10','2018-05-10',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL);
insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (14,26,300.00,30.00,70.00,300.00,100.00,200.00,30.00,'2018-05-10','0000-00-00',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL);
insert  into `finance_master`(`fin_id`,`cus_id`,`fin_amt`,`hold_amt`,`by_hand_amt`,`cmpy_amt`,`rec_amt`,`bal_amt`,`profit`,`fin_start`,`fin_end`,`fin_cnt`,`close_dt`,`closing_cnt`,`fin_status_id`,`remarks`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (15,25,600.00,60.00,40.00,600.00,200.00,400.00,60.00,'2018-05-10','0000-00-00',NULL,NULL,NULL,1,'',NULL,NULL,NULL,NULL);

/*Table structure for table `finance_status_master` */

DROP TABLE IF EXISTS `finance_status_master`;

CREATE TABLE `finance_status_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finance_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `finance_status_master` */

insert  into `finance_status_master`(`id`,`finance_status`) values (1,'Pending');
insert  into `finance_status_master`(`id`,`finance_status`) values (2,'Completed');

/*Table structure for table `house_master` */

DROP TABLE IF EXISTS `house_master`;

CREATE TABLE `house_master` (
  `house_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `house_master` */

insert  into `house_master`(`house_id`,`house_type`) values (3,'Own');
insert  into `house_master`(`house_id`,`house_type`) values (4,'Rental');

/*Table structure for table `line_master` */

DROP TABLE IF EXISTS `line_master`;

CREATE TABLE `line_master` (
  `line_id` int(11) NOT NULL AUTO_INCREMENT,
  `linetype_id` int(11) DEFAULT NULL,
  `area` varchar(200) DEFAULT NULL,
  `isactive` varchar(1) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `cr_by` varchar(50) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `line_master` */

insert  into `line_master`(`line_id`,`linetype_id`,`area`,`isactive`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (1,1,'Velachey','1',NULL,NULL,NULL,NULL);
insert  into `line_master`(`line_id`,`linetype_id`,`area`,`isactive`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (2,2,'Guindy','1',NULL,NULL,NULL,NULL);
insert  into `line_master`(`line_id`,`linetype_id`,`area`,`isactive`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (3,2,'Ambal Nagar','1',NULL,NULL,NULL,NULL);
insert  into `line_master`(`line_id`,`linetype_id`,`area`,`isactive`,`cr_dt`,`cr_by`,`up_dt`,`up_by`) values (4,3,'TNHB Velachery West','1',NULL,NULL,NULL,NULL);

/*Table structure for table `line_type` */

DROP TABLE IF EXISTS `line_type`;

CREATE TABLE `line_type` (
  `linetype_id` int(11) NOT NULL AUTO_INCREMENT,
  `linetype_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`linetype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `line_type` */

insert  into `line_type`(`linetype_id`,`linetype_name`) values (1,'Daily');
insert  into `line_type`(`linetype_id`,`linetype_name`) values (2,'Weekly');
insert  into `line_type`(`linetype_id`,`linetype_name`) values (3,'Monthly');

/*Table structure for table `monthly_debit` */

DROP TABLE IF EXISTS `monthly_debit`;

CREATE TABLE `monthly_debit` (
  `md_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `debit_amt` decimal(8,2) DEFAULT NULL,
  `debit_dt` date DEFAULT NULL,
  `month_id` varchar(10) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `cr_by` varchar(30) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(30) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `line_area` varchar(200) DEFAULT NULL,
  `lm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`md_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthly_debit` */

/*Table structure for table `monthly_plan_master` */

DROP TABLE IF EXISTS `monthly_plan_master`;

CREATE TABLE `monthly_plan_master` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT,
  `prv_plan_bal` decimal(12,2) DEFAULT NULL,
  `collection_amt` decimal(12,2) DEFAULT NULL,
  `profit_amt` decimal(12,2) DEFAULT NULL,
  `by_hand_amt` decimal(12,2) DEFAULT NULL,
  `monthly_debit_amt` decimal(12,2) DEFAULT NULL,
  `plus_plan1` decimal(12,2) DEFAULT NULL,
  `plus_plan2` decimal(12,2) DEFAULT NULL,
  `minus_plan` decimal(12,2) DEFAULT NULL,
  `current_plan` decimal(12,2) DEFAULT NULL,
  `prv_current_account` decimal(12,2) DEFAULT NULL,
  `plus_account1` decimal(12,2) DEFAULT NULL,
  `minus_account` decimal(12,2) DEFAULT NULL,
  `current_account` decimal(12,2) DEFAULT NULL,
  `lt_id` int(11) DEFAULT NULL,
  `from_dt` date DEFAULT NULL,
  `to_dt` date DEFAULT NULL,
  `monthid` varchar(10) DEFAULT NULL,
  `cr_by` varchar(30) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(30) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `other_expense` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthly_plan_master` */

/*Table structure for table `security_master` */

DROP TABLE IF EXISTS `security_master`;

CREATE TABLE `security_master` (
  `security_id` int(11) NOT NULL AUTO_INCREMENT,
  `security_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`security_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `security_master` */

insert  into `security_master`(`security_id`,`security_name`) values (4,'AADHAR');
insert  into `security_master`(`security_id`,`security_name`) values (5,'Voter ID');
insert  into `security_master`(`security_id`,`security_name`) values (6,'PAN Card');

/*Table structure for table `user_master` */

DROP TABLE IF EXISTS `user_master`;

CREATE TABLE `user_master` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `isactive` varchar(1) DEFAULT NULL,
  `created_dt` datetime(3) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `admin` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user_master` */

insert  into `user_master`(`user_id`,`user_name`,`user_pwd`,`isactive`,`created_dt`,`created_by`,`admin`) values (3,'a','ca898205d3ca09dba4279f3f0754c7d1','1',NULL,NULL,NULL);
insert  into `user_master`(`user_id`,`user_name`,`user_pwd`,`isactive`,`created_dt`,`created_by`,`admin`) values (4,'b','b','1',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
