/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.5.20-log : Database - passbyop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`passbyop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `passbyop`;

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complid` int(11) NOT NULL AUTO_INCREMENT,
  `LID` int(11) DEFAULT NULL,
  `COMPLAINT` varchar(200) DEFAULT NULL,
  `CDATE` date DEFAULT NULL,
  `REPLAY` varchar(200) DEFAULT NULL,
  `RDATE` date DEFAULT NULL,
  PRIMARY KEY (`complid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complid`,`LID`,`COMPLAINT`,`CDATE`,`REPLAY`,`RDATE`) values (1,5,'lkjl','2019-01-28','gjhhk','2019-01-13'),(2,6,'kjhbjk','2019-01-28','fgdhs','2019-02-09'),(3,0,'\"+CCOMPLAINT+\"','2019-01-20',NULL,NULL),(4,6,'not functionable','2019-01-20','ssssss','2019-02-10'),(5,6,'jfnjkhjghj','2019-02-10','thrj','2019-02-10'),(6,6,'','2019-02-10',NULL,NULL),(7,6,'hghgjh','2019-02-10',NULL,NULL);

/*Table structure for table `feedbacks` */

DROP TABLE IF EXISTS `feedbacks`;

CREATE TABLE `feedbacks` (
  `FBID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` int(11) DEFAULT NULL,
  `FEEDBACK` char(50) DEFAULT NULL,
  `FBDATE` date DEFAULT NULL,
  PRIMARY KEY (`FBID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `feedbacks` */

insert  into `feedbacks`(`FBID`,`LID`,`FEEDBACK`,`FBDATE`) values (1,9,'ggghh','2019-10-11'),(2,NULL,'\"+FEEDBACK+\"','0000-00-00'),(3,NULL,'\"+FEEDBACK+\"','0000-00-00'),(5,0,'\"+FEEDBACK+\"','0000-00-00'),(6,0,'\"+FEEDBACK+\"','0000-00-00'),(7,6,'gud','2019-01-20'),(8,6,'yg','2019-02-10'),(9,6,'','2019-02-10'),(10,6,'','2019-02-10'),(11,6,'','2019-02-10'),(12,6,'null','2019-02-10');

/*Table structure for table `files` */

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `FID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` int(11) DEFAULT NULL,
  `FLNAME` char(100) DEFAULT NULL,
  `FDETAILS` char(50) DEFAULT NULL,
  `FDATE` date DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `files` */

insert  into `files`(`FID`,`LID`,`FLNAME`,`FDETAILS`,`FDATE`) values (1,0,'\"+image+\"','\"+details+\"','2019-02-09'),(7,6,'1.jpg','rewaa','2019-02-10');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `LID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(25) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`LID`,`USERNAME`,`PASSWORD`,`TYPE`) values (1,'admin','admin','admin'),(2,'rtr','jghuyg','pending'),(3,'rqfeeq261gmail,com','dghhhjjjh','user'),(4,'JASMIN','kk','user'),(5,'IL.COM','ertddct','user'),(6,'abc','a','user'),(7,'JASMINRAHIMAN2104@MAIL.COM','hugughu','user'),(8,'hfswkswsj','3356712','user'),(9,'shafna@gmail','123456','user');

/*Table structure for table `passfiles` */

DROP TABLE IF EXISTS `passfiles`;

CREATE TABLE `passfiles` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `fileindex` int(11) DEFAULT NULL,
  `grid` int(11) DEFAULT NULL,
  `fhash` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `passfiles` */

insert  into `passfiles`(`fid`,`lid`,`filename`,`fileindex`,`grid`,`fhash`) values (1,4,'Img22022019101413PM.jpg',1,5,'1b4605b0e20ceccf91aa278d10e81fad64e24e27'),(2,4,'Img22022019101503PM.jpg',2,555,'df7be9dc4f467187783aca68c7ce98e4df2172d0'),(3,4,'Img22022019101539PM.jpg',3,12,'30420d1a9afb2bcb60335812569af4435a59ce17'),(4,4,'Img22022019101600PM.jpg',4,555,'54c2f1a1eb6f12d681a5c7078421a5500cee02ad');

/*Table structure for table `shares` */

DROP TABLE IF EXISTS `shares`;

CREATE TABLE `shares` (
  `SID` int(11) NOT NULL AUTO_INCREMENT,
  `FID` int(11) DEFAULT NULL,
  `SDATE` date DEFAULT NULL,
  `RID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shares` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `FNAME` varchar(25) DEFAULT NULL,
  `LNAME` varchar(25) DEFAULT NULL,
  `DOB` varchar(20) DEFAULT NULL,
  `HOUSE` varchar(20) DEFAULT NULL,
  `PLACE` varchar(20) DEFAULT NULL,
  `NATION` varchar(20) DEFAULT NULL,
  `STATE` varchar(20) DEFAULT NULL,
  `PIN` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `LID` int(11) DEFAULT '0',
  `PICSNO` int(11) DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`UID`,`FNAME`,`LNAME`,`DOB`,`HOUSE`,`PLACE`,`NATION`,`STATE`,`PIN`,`EMAIL`,`PHONE`,`LID`,`PICSNO`) values (2,'aaa','jcokjds','0000-00-00','hvschgv','uhh','jgjusgc','djhcb','574545','bjbhs','766',4,2),(3,'umaira','jasmin','null','pullat','pulloor','indian','tamilnadu','6650551','IL.COM','22564785895',5,0),(4,'aaa','sss','null','uyg','ugu','gfHYGVYg','gujarat','hgvy','g','gyug',6,1),(5,'umaira','jasmin','2018-12-13','pullat','pulloor','gfHYGVYg','kerala','6650551','JASMINRAHIMAN2104@MAIL.COM','22564785895',7,3),(6,'faiza','vm','1998-12-12','vajswsgh','shjshs','indian','kerala','12333','hfswkswsj','56763513',8,2),(7,'shfana','p','1999-01-09','pallakkal','pookkattirri','indian','kerala','676554','shafna@gmail','8606649962',9,3),(8,'neheeda','km','1999-01-25','kayalma','kav','indian','kerala','3578','gdhgqghsj','3567889',10,1),(9,'fathima','neheeda','1999-01-25','kayalmadathil','kavumpuram','indian','kerala','676552','neheeda@gmail.com','64783105989',11,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
