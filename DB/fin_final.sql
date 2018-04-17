/*
SQLyog Community v13.0.0 (32 bit)
MySQL - 5.5.41-MariaDB : Database - fin_test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `config` */

CREATE TABLE `config` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `customer_master` */

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
  `net_amt` decimal(8,2) DEFAULT NULL,
  `rec_amt` decimal(8,2) DEFAULT NULL,
  `bal_amt` decimal(8,2) DEFAULT NULL,
  `line_id` int(11) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `cr_by` varchar(50) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(50) DEFAULT NULL,
  `fin_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `db_backup_history` */

CREATE TABLE `db_backup_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(1000) DEFAULT NULL,
  `backuped` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `finance_collection` */

CREATE TABLE `finance_collection` (
  `coll_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fin_id` bigint(20) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `coll_amt` decimal(8,2) DEFAULT NULL,
  `coll_dt` date DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `cr_by` varchar(50) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`coll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `finance_master` */

CREATE TABLE `finance_master` (
  `fin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) DEFAULT NULL,
  `fin_amt` decimal(8,2) DEFAULT NULL,
  `hold_amt` decimal(8,2) DEFAULT NULL,
  `by_hand_amt` decimal(8,2) DEFAULT NULL,
  `cmpy_amt` decimal(8,2) DEFAULT NULL,
  `rec_amt` decimal(8,2) DEFAULT NULL,
  `bal_amt` decimal(8,2) DEFAULT NULL,
  `profit` decimal(8,2) DEFAULT NULL,
  `fin_start` date DEFAULT NULL,
  `fin_end` date DEFAULT NULL,
  `fin_cnt` int(11) DEFAULT NULL,
  `close_dt` date DEFAULT NULL,
  `closing_cnt` int(11) DEFAULT NULL,
  `fin_status` varchar(10) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `cr_dt` datetime(3) DEFAULT NULL,
  `cr_by` varchar(50) DEFAULT NULL,
  `up_dt` datetime(3) DEFAULT NULL,
  `up_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `house_master` */

CREATE TABLE `house_master` (
  `house_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `line_master` */

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `line_type` */

CREATE TABLE `line_type` (
  `linetype_id` int(11) NOT NULL AUTO_INCREMENT,
  `linetype_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`linetype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `monthly_debit` */

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

/*Table structure for table `monthly_plan_master` */

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

/*Table structure for table `security_master` */

CREATE TABLE `security_master` (
  `security_id` int(11) NOT NULL AUTO_INCREMENT,
  `security_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`security_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `user_master` */

CREATE TABLE `user_master` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `created_dt` datetime(3) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `admin` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
