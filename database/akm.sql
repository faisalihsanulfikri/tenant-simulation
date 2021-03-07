/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 8.0.16 : Database - akm
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`akm` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `akm`;

/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `subject_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `id_peserta` bigint(20) unsigned DEFAULT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`),
  KEY `subject` (`subject_id`,`subject_type`),
  KEY `causer` (`causer_id`,`causer_type`),
  KEY `activity_log_id_peserta_foreign` (`id_peserta`),
  CONSTRAINT `activity_log_id_peserta_foreign` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activity_log` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned NOT NULL,
  `nik` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `history_id_user_foreign` (`id_user`),
  CONSTRAINT `history_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `history` */

/*Table structure for table `jawaban_pilihan_ganda` */

DROP TABLE IF EXISTS `jawaban_pilihan_ganda`;

CREATE TABLE `jawaban_pilihan_ganda` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_peserta` bigint(20) unsigned NOT NULL,
  `id_ujian` bigint(20) unsigned NOT NULL,
  `id_soal` bigint(20) unsigned NOT NULL,
  `jawaban` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jawaban_pilihan_ganda_id_peserta_foreign` (`id_peserta`),
  KEY `jawaban_pilihan_ganda_id_soal_foreign` (`id_soal`),
  KEY `jawaban_pilihan_ganda_id_ujian_foreign` (`id_ujian`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jawaban_pilihan_ganda` */

insert  into `jawaban_pilihan_ganda`(`id`,`id_peserta`,`id_ujian`,`id_soal`,`jawaban`,`jawaban_2`,`jawaban_3`,`jawaban_4`,`jawaban_5`,`jawaban_6`,`updated_at`,`deleted_at`,`created_at`) values (37,555333,3,30,'<p>paragraf deskripsi subjektif</p>','1',NULL,NULL,NULL,NULL,'2020-12-11 17:23:38',NULL,'2020-12-11 10:33:26'),(38,555333,3,34,'<p>depan</p>','1',NULL,NULL,NULL,NULL,'2020-12-11 17:23:39',NULL,'2020-12-11 10:33:28'),(39,555333,3,33,'<p>Penglihatan dan pengecap</p>\n\n<p>&nbsp;</p>','0',NULL,NULL,NULL,NULL,'2020-12-11 17:23:40',NULL,'2020-12-11 10:33:30'),(40,555333,3,35,'<p>Berisi gambaran umum dari pantai Batu Karas&nbsp;</p>','1',NULL,NULL,NULL,NULL,'2020-12-11 17:23:40',NULL,'2020-12-11 10:33:31'),(41,555333,3,36,'<p>Orientasi&ndash; resolusi &ndash; komplikasi</p>,<p>Orientasi&ndash; resolusi &ndash; komplikasi</p>,<p>Orientasi&ndash; resolusi &ndash; komplikasi</p>','0',NULL,NULL,NULL,NULL,'2020-12-11 17:23:42',NULL,'2020-12-11 10:33:39'),(42,555333,3,42,'Sangat Tidak Setuju','0',NULL,NULL,NULL,NULL,'2020-12-11 17:23:43',NULL,'2020-12-11 10:33:42'),(43,555333,3,43,'Setuju','0',NULL,NULL,NULL,NULL,'2020-12-11 17:23:43',NULL,'2020-12-11 10:33:43'),(44,555333,3,40,'Benar','1',NULL,NULL,NULL,NULL,'2020-12-11 17:23:44',NULL,'2020-12-11 10:33:44'),(45,555333,3,41,'Salah','1',NULL,NULL,NULL,NULL,'2020-12-11 17:23:44',NULL,'2020-12-11 10:33:45'),(46,666333,4,192,'4','1','dsds',NULL,NULL,NULL,'2020-12-11 21:16:08',NULL,'2020-12-11 13:46:06'),(47,666333,4,30,'<p>paragraf deskripsi objektif</p>','0','dsds',NULL,NULL,NULL,'2020-12-11 21:57:19',NULL,'2020-12-11 13:46:07'),(48,666333,4,33,'<p>Perabaan dan penciuman</p>','0','dsds',NULL,NULL,NULL,'2020-12-11 21:57:19',NULL,'2020-12-11 13:46:07'),(49,666333,4,34,'<p>imbuhan</p>','0','dsds',NULL,NULL,NULL,'2020-12-11 21:57:20',NULL,'2020-12-11 13:46:08'),(50,666333,4,35,'<p>Berisi rincian dari pantai Batu Karas</p>','0','dsds',NULL,NULL,NULL,'2020-12-11 21:57:20',NULL,'2020-12-11 13:46:08'),(51,666333,4,36,'<p>Orientasi</p>','1','dsds',NULL,NULL,NULL,'2020-12-11 21:57:21',NULL,'2020-12-11 13:46:08'),(52,666333,4,39,'1','1','ds',NULL,NULL,NULL,'2020-12-11 21:57:21',NULL,'2020-12-11 13:46:08'),(53,666333,4,40,'Benar','1','ds',NULL,NULL,NULL,'2020-12-11 21:57:21',NULL,'2020-12-11 13:46:09'),(54,666333,4,38,'s','1','sddsdlkklks',NULL,NULL,NULL,'2020-12-11 21:57:21',NULL,'2020-12-11 13:46:09'),(55,666333,4,37,'sd','1','sddsdlkklks',NULL,NULL,NULL,'2020-12-11 21:57:21',NULL,'2020-12-11 13:46:09'),(56,666333,4,42,'Setuju','0','ds',NULL,NULL,NULL,'2020-12-11 21:57:22',NULL,'2020-12-11 13:46:09'),(57,666333,4,43,'Tidak Setuju','0','ds',NULL,NULL,NULL,'2020-12-11 21:57:23',NULL,'2020-12-11 13:46:09'),(58,666333,4,41,'Salah','1','ds',NULL,NULL,NULL,'2020-12-11 21:57:22',NULL,'2020-12-11 13:46:10'),(59,555333,3,39,'1','1','Karena Pantai Batu Karas Pantai Batu Karas merupakan salah satu pantai untuk berselancar terbaik di Pulau Jawa, dan ombaknya cukup terkenal di kalangan para peselancar',NULL,NULL,NULL,'2020-12-11 17:23:45',NULL,'2020-12-11 14:28:31'),(60,555333,3,37,'karena eh karena','1','Karena Pantai Batu Karas Pantai Batu Karas merupakan salah satu pantai untuk berselancar terbaik di Pulau Jawa, dan ombaknya cukup terkenal di kalangan para peselancar',NULL,NULL,NULL,'2020-12-11 17:23:45',NULL,'2020-12-11 14:28:32'),(61,555333,3,38,'apa saja','1','Karena Pantai Batu Karas Pantai Batu Karas merupakan salah satu pantai untuk berselancar terbaik di Pulau Jawa, dan ombaknya cukup terkenal di kalangan para peselancar',NULL,NULL,NULL,'2020-12-11 17:23:45',NULL,'2020-12-11 14:28:32'),(62,757575,6,30,'<p>paragraf deskripsi subjektif</p>','1',NULL,NULL,NULL,NULL,'2020-12-12 09:32:32',NULL,'2020-12-12 09:32:32'),(63,757575,6,33,'<p>Penglihatan dan pengecap</p>\n\n<p>&nbsp;</p>','0',NULL,NULL,NULL,NULL,'2020-12-12 09:32:34',NULL,'2020-12-12 09:32:34'),(64,757575,6,34,'<p>depan</p>','1',NULL,NULL,NULL,NULL,'2020-12-12 09:32:36',NULL,'2020-12-12 09:32:36'),(65,757575,6,35,'<p>Berisi gambaran umum dari pantai Batu Karas&nbsp;</p>','1',NULL,NULL,NULL,NULL,'2020-12-12 09:32:36',NULL,'2020-12-12 09:32:36'),(66,757575,6,36,'<p>resolusi</p>,<p>resolusi</p>,<p>resolusi</p>','1',NULL,NULL,NULL,NULL,'2020-12-12 09:32:41',NULL,'2020-12-12 09:32:41'),(67,757575,6,37,'test','1',NULL,NULL,NULL,NULL,'2020-12-12 09:32:42',NULL,'2020-12-12 09:32:42'),(68,757575,6,38,'test','1',NULL,NULL,NULL,NULL,'2020-12-12 09:32:42',NULL,'2020-12-12 09:32:42'),(69,757575,6,39,'1','1','test',NULL,NULL,NULL,'2020-12-12 09:32:42',NULL,'2020-12-12 09:32:42'),(70,757575,6,40,'Benar','1',NULL,NULL,NULL,NULL,'2020-12-12 09:32:43',NULL,'2020-12-12 09:32:43'),(71,757575,6,41,'Salah','1',NULL,NULL,NULL,NULL,'2020-12-12 09:32:44',NULL,'2020-12-12 09:32:44'),(72,757575,6,42,'Sangat Tidak Setuju','0',NULL,NULL,NULL,NULL,'2020-12-12 09:32:47',NULL,'2020-12-12 09:32:47'),(73,757575,6,43,'Tidak Setuju','0',NULL,NULL,NULL,NULL,'2020-12-12 09:32:49',NULL,'2020-12-12 09:32:49');

/*Table structure for table `log_users` */

DROP TABLE IF EXISTS `log_users`;

CREATE TABLE `log_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `id_peserta` bigint(20) unsigned DEFAULT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_users_id_user_foreign` (`id_user`),
  KEY `log_users_id_peserta_foreign` (`id_peserta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `log_users` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `paket` */

DROP TABLE IF EXISTS `paket`;

CREATE TABLE `paket` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_paket` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `paket` */

insert  into `paket`(`id`,`nama_paket`,`created_at`,`updated_at`,`deleted_at`) values (1,'test','2020-11-24 18:36:09','2020-11-24 18:36:09',NULL),(2,'Matematika','2020-11-26 06:03:29','2020-11-26 06:03:29',NULL),(3,'Indonesia Kelas 7','2020-12-11 09:05:03','2020-12-11 09:05:03',NULL),(4,'TEST','2020-12-11 09:09:29','2020-12-11 09:09:29',NULL);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `peserta` */

DROP TABLE IF EXISTS `peserta`;

CREATE TABLE `peserta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nis` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('Laki-laki','Perempuan') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Laki-laki',
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noimage.png',
  PRIMARY KEY (`id`),
  KEY `peserta_updated_by_foreign` (`updated_by`),
  KEY `peserta_kota_id_foreign` (`nis`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `peserta` */

insert  into `peserta`(`id`,`nama`,`email`,`password`,`nis`,`gender`,`updated_by`,`deleted_at`,`created_at`,`updated_at`,`code`,`foto`) values (2,'r','faisal.ishak@gmail.com','$2b$10$4d9sWnLJaBVhgsZrT6w6F.XDWyySyM4F.gM4pLZzbJ7hxqK9.iqjy','1','Laki-laki',NULL,NULL,NULL,NULL,'q','noimage.png'),(3,'','','$2y$10$SbHgbVSR2FdkRiH4WTq7ku2VP/drRCqT.LG5IVTJM8JxlroS8EeW.','555333','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(4,'','','$2y$10$ryp0ajuj9JkQ99Gf0aDDZ.MHylLjFk5.ECfqGHlwwdpe44GvJyTEe','666333','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(5,'','','$2y$10$V5iBz3qBXjpxWmDBXdaMAe2J1mncUSDwGKoUbTB63iiTJ84X8BKVO','69696969','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(6,'','','$2y$10$gG.rOEz2qpmmBTrEsqcbVubPetiOgBc1KEAlkKw.1jeNQZH460woW','757575','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(7,'','','$2y$10$lAgcaS0e3aFZBn7Ugf0TmuP4rj6BquipV31Sf6s8QOd3Rxc8cS8XG','111111','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(8,'','','$2y$10$ni1NySxl0wk4zNTyOzakPe5nCDLps7kv37wXk4OJyeY3IxxiMWCN.','1193','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(9,'','','$2y$10$BdNoNIN5sQX9ILRde8QJV.y9Ah/epHdiALaRWSWN1aGUC0ZEyCKRm','121212','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(10,'','','$2y$10$M4jUEH35zbH641cIijsIXOvLVwBUiB.DoABOAPWMu4gyj6OC0YqLm','131313','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(11,'','','$2y$10$CPE3FVnrah1VxOgN72XxD.J9VgfM3X5UMptkPLzFccFlZTgRoaL8i','141414','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(12,'','','$2y$10$aBd4c37TeNylTrjAArT/.Odfmz4zUJJHSHpy38EA3DbTk6kJmA0uC','161616','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png'),(13,'','','$2y$10$yVqCCsmPvDfN5RZL5hAy0O6e0lMDG2IYdr/nSEOh8sOgeQdE18w5i','191919','Laki-laki',NULL,NULL,NULL,NULL,NULL,'noimage.png');

/*Table structure for table `pilihan_ganda` */

DROP TABLE IF EXISTS `pilihan_ganda`;

CREATE TABLE `pilihan_ganda` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_paket` bigint(20) unsigned DEFAULT NULL,
  `no_soal` int(11) NOT NULL,
  `id_soal` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `soal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pilihan_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pilihan_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pilihan_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pilihan_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pilihan_5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pilihan_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jawaban_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jawaban_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `score` bigint(20) DEFAULT NULL,
  `type_soal` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pilihan_ganda_created_by_foreign` (`created_by`),
  KEY `pilihan_ganda_updated_by_foreign` (`updated_by`),
  KEY `pilihan_ganda_id_soal_foreign` (`id_soal`),
  KEY `pilihan_ganda_id_paket_foreign` (`id_paket`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pilihan_ganda` */
 </i> </i> </i> </i> </i>
insert  into `pilihan_ganda`(`id`,`id_paket`,`no_soal`,`id_soal`,`deleted_at`,`soal`,`pilihan_1`,`pilihan_2`,`pilihan_3`,`pilihan_4`,`pilihan_5`,`pilihan_6`,`updated_by`,`created_at`,`updated_at`,`jawaban_1`,`jawaban_2`,`jawaban_3`,`jawaban_4`,`jawaban_5`,`jawaban_6`,`created_by`,`score`,`type_soal`) values (1,1,0,NULL,NULL,'test','a','b','c','d',NULL,NULL,NULL,'2020-11-24 21:53:57','2020-11-24 21:53:57','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,0,NULL,NULL,'d','a','b','c','v',NULL,NULL,NULL,'2020-11-24 21:54:21','2020-11-24 21:54:21','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,0,NULL,NULL,'ds','a','sd','d','f',NULL,NULL,NULL,'2020-11-24 21:54:49','2020-11-24 21:54:49','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,0,1,NULL,'Ini pertanyaan no 1','1','3','2','4',NULL,NULL,NULL,'2020-11-26 06:08:31','2020-11-26 06:08:31','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,0,1,NULL,'ini pertanyaan no 2','1','3','2','4',NULL,NULL,NULL,'2020-11-26 06:09:02','2020-11-26 06:09:02','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,0,NULL,NULL,'ini soal biasa','1','3','2','sldkfj',NULL,NULL,NULL,'2020-11-26 06:09:57','2020-11-26 06:09:57','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,0,NULL,'2020-12-02 06:31:29','tes tes tes','aku','burung','es','fanta',NULL,NULL,NULL,'2020-12-01 15:53:14','2020-12-02 06:31:29','aku',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,2,0,2,'2020-12-02 06:31:37','ini soal cerita','anak','bisa','enam','fan',NULL,NULL,NULL,'2020-12-01 15:56:14','2020-12-02 06:31:37','bisa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,2,0,NULL,'2020-12-02 05:36:57','ini test soal multiple choice','aku','bibi','cucu -','dari','emon','fir\'aun',NULL,'2020-12-02 01:19:36','2020-12-02 05:36:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,2,0,NULL,'2020-12-02 06:31:45','test soal multiple choice','aku -','bisa','cuma','dia -','emon','firaun -',NULL,'2020-12-02 03:11:16','2020-12-02 06:31:45','A',NULL,NULL,'D',NULL,'F',NULL,NULL,NULL),(12,2,0,NULL,'2020-12-02 05:37:14','ini contoh soal','aku -','bunga','cendol -','duri','es -','fanta -',NULL,'2020-12-02 03:14:09','2020-12-02 05:37:14','aku -',NULL,'cendol -',NULL,'es -','fanta -',NULL,NULL,NULL),(13,2,0,NULL,'2020-12-02 06:31:52','test test','aku -','bubu','cuma -','dudu',NULL,NULL,NULL,'2020-12-02 05:05:34','2020-12-02 06:31:52','aku -',NULL,'cuma -',NULL,NULL,NULL,NULL,NULL,NULL),(14,2,0,2,'2020-12-02 06:31:59','helllo','a -','b -','c','d','e',NULL,NULL,'2020-12-02 05:12:33','2020-12-02 06:31:59','a -','b -',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,2,0,NULL,'2020-12-02 06:32:07','tes test','aku','bibi','cuma','didi -','emon -',NULL,NULL,'2020-12-02 05:40:03','2020-12-02 06:32:07',NULL,NULL,'tes','tes','emon -','tes',NULL,NULL,NULL),(16,2,0,NULL,NULL,'helo helo','Aku','Bukan','Cuma','Demon','Emon',NULL,NULL,'2020-12-02 05:55:42','2020-12-02 05:55:42','Aku',NULL,'Cuma',NULL,'Emon',NULL,NULL,NULL,NULL),(17,2,0,NULL,'2020-12-02 06:31:08','tes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-02 06:15:32','2020-12-02 06:31:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,2,0,NULL,'2020-12-02 06:31:18','test','aku','bukan','cuma','demon','emon',NULL,NULL,'2020-12-02 06:21:52','2020-12-02 06:31:18',NULL,NULL,NULL,'demon','emon',NULL,NULL,NULL,NULL),(19,2,0,NULL,NULL,'test','Asik','Bukan','Cuma','D',NULL,NULL,NULL,'2020-12-02 06:28:24','2020-12-02 06:28:24',NULL,'Bukan','Cuma',NULL,NULL,NULL,NULL,NULL,NULL),(20,2,0,NULL,NULL,'siapa cidelaras','cinde','cindea','laras','larasati',NULL,NULL,NULL,'2020-12-02 06:51:22','2020-12-02 06:51:22','cinde',NULL,'laras',NULL,NULL,NULL,NULL,NULL,NULL),(21,2,0,NULL,NULL,'<p>hello hello kitty</p>','<p>Anak</p>','<p>Bibi</p>','<p>Cucu</p>','<p>Darto</p>',NULL,NULL,NULL,'2020-12-03 01:47:45','2020-12-03 01:47:45',NULL,NULL,'<p>Cucu</p>','<p>Darto</p>',NULL,NULL,NULL,NULL,NULL),(22,2,0,NULL,'2020-12-03 02:20:33','<p>hello</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-03 02:19:31','2020-12-03 02:20:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,2,0,NULL,'2020-12-03 03:55:44','<p>h</p>','<p>a</p>',NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-03 03:55:34','2020-12-03 03:55:44','<p>a</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,2,0,NULL,NULL,'<p>sss</p>','<p>s</p>',NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-03 06:31:34','2020-12-03 06:31:34','<p>s</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,2,1,NULL,NULL,'<p>teas ganda</p>','<p>a</p>','<p>s</p>',NULL,NULL,NULL,NULL,NULL,'2020-12-11 08:58:16','2020-12-11 08:58:16','<p>a</p>',NULL,NULL,NULL,NULL,NULL,NULL,10,'pil_ganda'),(27,4,1,NULL,'2020-12-11 16:00:14','<p>1</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-11 09:13:55','2020-12-11 16:00:14','<p>1</p>',NULL,NULL,NULL,NULL,NULL,NULL,1,'essay'),(28,4,2,NULL,'2020-12-11 16:00:29','1','Benar','Salah',NULL,NULL,NULL,NULL,NULL,'2020-12-11 09:14:36','2020-12-11 16:00:29','Benar',NULL,NULL,NULL,NULL,NULL,NULL,1,'survey'),(29,4,2,NULL,'2020-12-11 16:00:36','1','Benar','Salah',NULL,NULL,NULL,NULL,NULL,'2020-12-11 09:14:39','2020-12-11 16:00:36','Benar',NULL,NULL,NULL,NULL,NULL,NULL,1,'survey'),(30,3,1,NULL,NULL,'<p>Paragraf deskripsi yang berisi gambaran keadaan sesuai dengan apa yang dilihat dan dirasakan penulis termasuk ke dalam jenis &hellip;</p>','<p>paragraf deskripsi spasial</p>','<p>paragraf deskripsi objektif</p>','<p>paragraf deskripsi subjektif</p>','<p>paragraf deskripsi ruang dan waktu</p>',NULL,NULL,NULL,'2020-12-11 09:26:33','2020-12-11 09:26:33',NULL,NULL,'<p>paragraf deskripsi subjektif</p>',NULL,NULL,NULL,NULL,10,'pil_ganda'),(31,3,2,NULL,'2020-12-11 09:29:54','<p><em>Cilok isi keju memiliki bentuk bulat dengan rasa manis dan asin.</em></p>\r\n\r\n<p>Kalimat di atas menunjukkan pembuktian dari cerapan pancaindra &hellip;.</p>','<p>Penglihatan dan penciuman&nbsp;</p>','<p>Perabaan dan penciuman</p>','<p>Penglihatan dan pengecap</p>\r\n\r\n<p>&nbsp;</p>','<p>Perabaan dan pengecap</p>',NULL,NULL,NULL,'2020-12-11 09:28:34','2020-12-11 09:29:54',NULL,NULL,'<p>Penglihatan dan pengecap</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,NULL,0,'pil_ganda'),(32,3,2,NULL,'2020-12-11 09:29:43','<p><em>Cilok isi keju memiliki bentuk bulat dengan rasa manis dan asin.</em></p>\r\n\r\n<p>Kalimat di atas menunjukkan pembuktian dari cerapan pancaindra &hellip;.</p>','<p>Penglihatan dan penciuman&nbsp;</p>','<p>Perabaan dan penciuman</p>','<p>Penglihatan dan pengecap</p>\r\n\r\n<p>&nbsp;</p>','<p>Perabaan dan pengecap</p>',NULL,NULL,NULL,'2020-12-11 09:28:40','2020-12-11 09:29:43',NULL,NULL,'<p>Penglihatan dan pengecap</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,NULL,10,'pil_ganda'),(33,3,2,NULL,NULL,'<p><em>Cilok isi keju memiliki bentuk bulat dengan rasa manis dan asin.</em></p>\r\n\r\n<p>Kalimat di atas menunjukkan pembuktian dari cerapan pancaindra &hellip;.</p>','<p>Penglihatan dan penciuman&nbsp;</p>','<p>Perabaan dan penciuman</p>','<p>Penglihatan dan pengecap</p>\r\n\r\n<p>&nbsp;</p>','<p>Perabaan dan pengecap</p>',NULL,NULL,NULL,'2020-12-11 09:28:51','2020-12-11 09:28:51',NULL,NULL,'<p>Penglihatan dan pengecap</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,NULL,0,'pil_ganda'),(34,3,3,NULL,NULL,'<p>Kata&nbsp;<strong><em>di, dari,&nbsp;</em></strong>dan&nbsp;<strong><em>ke</em></strong>&nbsp;termasuk ke dalam tiga jenis kata &hellip;.</p>','<p>penghubung</p>','<p>imbuhan</p>','<p>depan</p>','<p>kongjungsi</p>',NULL,NULL,NULL,'2020-12-11 09:33:35','2020-12-11 09:33:35',NULL,NULL,'<p>depan</p>',NULL,NULL,NULL,NULL,10,'pil_ganda'),(35,3,4,3,NULL,'<p>Paragraf pertama kutipan teks di atas merupakan bagian identifikasi teks deskripsi karena &hellip;.</p>','<p>Berisi gambaran umum dari pantai Batu Karas&nbsp;</p>','<p>Berisi rincian dari pantai Batu Karas</p>','<p>Berisi tanggapan subjektif penulis tentang pantai Batu Karas</p>','<p>Berisi kesan penulis terhadap pantai Batu Karas</p>',NULL,NULL,NULL,'2020-12-11 09:36:58','2020-12-11 09:36:58','<p>Berisi gambaran umum dari pantai Batu Karas&nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,10,'pil_ganda'),(36,3,4,NULL,NULL,'<p>Urutan struktur teks cerita fantasi yang tepat adalah &hellip;.</p>','<p>Orientasi&ndash; resolusi &ndash; komplikasi</p>','<p>Orientasi</p>','<p>komplikasi</p>','<p>resolusi</p>','<p>Orientasi &ndash; konflik &ndash; resolusi</p>','<p>Orientasi &ndash; konflik &ndash; reorientasi</p>',NULL,'2020-12-11 09:39:32','2020-12-11 09:39:32',NULL,'<p>Orientasi</p>','<p>komplikasi</p>','<p>resolusi</p>',NULL,NULL,NULL,10,'pil_ganda_kompleks'),(37,3,4,NULL,NULL,'<p>Langkah-langkah membuat bubur manado:</p>\r\n\r\n<p>1) Didihkan air, masukkan berurutan nasi merah, singkong, ubi, jagung pipil dan sereh. Aduk sampai bubur mengental.</p>\r\n\r\n<p>2) Tambahkan kangkung dan bayam, aduk beberapa saat, jangan sampai terlalu layu.</p>\r\n\r\n<p>3) Angkatlah dan hidangkan panas, ditemani ikan asin dan kerupuk</p>\r\n\r\n<p>Kalimat pada bagian langkah-langkah merupakan kalimat imperatif karena &hellip;.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-11 09:42:01','2020-12-11 09:42:01','<p>Mengandung makna memerintah seseorang untuk melakukan sesuatu</p>',NULL,NULL,NULL,NULL,NULL,NULL,10,'essay'),(38,3,5,NULL,NULL,'<p>Teks laporan hasil observasi berisi &hellip;.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-11 09:42:46','2020-12-11 09:42:46','<p>&nbsp;informasi tentang suatu objek atau situasi yang merupakan hasil suatu pengamatan ilmiah.</p>',NULL,NULL,NULL,NULL,NULL,NULL,10,'essay'),(39,3,6,4,NULL,'<p>pantai apa yang cocok dan yang merupakan salah satu pantai terbaik&nbsp;untuk berselancar terbaik di pulau jawa?</p>\r\n\r\n<p>jelaskan alasanya!</p>','Batu Karas','Pangandaran','Sayang Heulang','Santolo',NULL,NULL,NULL,'2020-12-11 09:48:58','2020-12-11 09:48:58','1','<p>karena Pantai Batu Karas merupakan salah satu pantai untuk berselancar terbaik di Pulau Jawa, dan ombaknya cukup terkenal di kalangan para peselancar.</p>',NULL,NULL,NULL,NULL,NULL,10,'essay_opsi'),(40,3,7,3,NULL,'Pantai Batu Karas Pantai Batu Karas merupakan salah satu pantai untuk berselancar terbaik di Pulau Jawa','Benar','Salah',NULL,NULL,NULL,NULL,NULL,'2020-12-11 09:51:29','2020-12-11 09:51:29','Benar',NULL,NULL,NULL,NULL,NULL,NULL,5,'tf'),(41,3,7,3,NULL,'Pantai Batu Karas tidak terletak di Desa Batukaras Kecamatan Cijulang','Benar','Salah',NULL,NULL,NULL,NULL,NULL,'2020-12-11 09:51:46','2020-12-11 09:51:46',NULL,'Salah',NULL,NULL,NULL,NULL,NULL,5,'tf'),(42,3,7,3,NULL,'Ombak di Batu Karas terlalu ekstrem','Setuju','Tidak Setuju','Sangat Tidak Setuju','Sangat Setuju',NULL,NULL,NULL,'2020-12-11 09:54:18','2020-12-11 09:54:18',NULL,'Tidak Setuju',NULL,NULL,NULL,NULL,NULL,5,'survey'),(43,3,7,3,NULL,'Pantai Batu Karas terletak di Desa Batukaras Kecamatan Cijulang, sekitar 34 km atau sekitar 1 jam perjalanan dari kawasan wisata Pangandaran.','Setuju','Tidak Setuju','Sangat Tidak Setuju','Sangat Setuju',NULL,NULL,NULL,'2020-12-11 09:54:24','2020-12-11 09:54:24',NULL,NULL,NULL,'Sangat Setuju',NULL,NULL,NULL,5,'survey'),(44,4,1,NULL,NULL,'<p>Di bawah ini yang merupakan kota di benua eropa, kecuali!</p>','<p>Madrid</p>','<p>Budapest</p>','<p>sydney</p>','<p>Munchen</p>',NULL,NULL,NULL,'2020-12-11 16:02:45','2020-12-12 01:35:31','','','<p>sydney</p>','','','',NULL,45,'pil_ganda'),(45,4,2,NULL,NULL,'<p>Di bawah ini yang merupakan kota di Asia Timur adalah...</p>','<p>Ottawa</p>','<p>Kyoto</p>','<p>Shenzhen</p>','<p>Hanoi</p>',NULL,NULL,NULL,'2020-12-11 16:06:20','2020-12-12 01:35:58','','<p>Kyoto</p>','<p>Shenzhen</p>','','','',NULL,30,'pil_ganda_kompleks'),(46,4,3,NULL,NULL,'<p>Sebutkan nama orang pertama yang mendarat di bulan!</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-11 16:08:50','2020-12-11 16:08:50','<p>Neil Armstrong</p>',NULL,NULL,NULL,NULL,NULL,NULL,40,'essay'),(47,4,4,NULL,NULL,'<p>Bahasa pemrograman termudah</p>','Scala','Golang','Lua','Lalal',NULL,NULL,NULL,'2020-12-11 16:15:21','2020-12-12 11:50:38','3','<p>Karna di pilihan tidak ada javascript :(</p>',NULL,NULL,NULL,NULL,NULL,30,'essay_opsi'),(48,4,5,6,NULL,'Kura-kura bernafas dengan insang','Benar','Salah',NULL,NULL,NULL,NULL,NULL,'2020-12-11 16:18:10','2020-12-11 16:18:10',NULL,'Salah',NULL,NULL,NULL,NULL,NULL,5,'tf'),(49,4,5,6,NULL,'Harimau merupakan hewan karniilyas','Benar','Salah',NULL,NULL,NULL,NULL,NULL,'2020-12-11 16:18:11','2020-12-11 16:18:11',NULL,'Salah',NULL,NULL,NULL,NULL,NULL,5,'tf'),(50,4,6,NULL,NULL,'<p>test</p>','Satu','Dua','Tiga',NULL,NULL,NULL,NULL,'2020-12-12 11:55:34','2020-12-12 11:55:34','1','<p>test</p>',NULL,NULL,NULL,NULL,NULL,1,'essay_opsi');

/*Table structure for table `sertifikasi` */

DROP TABLE IF EXISTS `sertifikasi`;

CREATE TABLE `sertifikasi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_ujian` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_ujian` date NOT NULL,
  `jam_mulai` time NOT NULL DEFAULT '09:00:00',
  `jam_selesai` time NOT NULL DEFAULT '11:00:00',
  `id_guru` bigint(20) unsigned NOT NULL,
  `id_paket_soal` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_guru2` bigint(20) unsigned NOT NULL,
  `jenis_sertifikasi` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `laporan_hambatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deskripsi` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balai_id` bigint(20) unsigned NOT NULL,
  `kelas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lokasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sertifikasi_id_asessor_foreign` (`id_guru`),
  KEY `sertifikasi_id_paket_soal_foreign` (`id_paket_soal`),
  KEY `sertifikasi_created_by_foreign` (`created_by`),
  KEY `sertifikasi_updated_by_foreign` (`updated_by`),
  KEY `sertifikasi_id_asessor2_foreign` (`id_guru2`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sertifikasi` */

insert  into `sertifikasi`(`id`,`jenis_ujian`,`tgl_ujian`,`jam_mulai`,`jam_selesai`,`id_guru`,`id_paket_soal`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`,`id_guru2`,`jenis_sertifikasi`,`role`,`laporan_hambatan`,`deskripsi`,`balai_id`,`kelas`,`lokasi`) values (1,'tests','2020-11-18','09:00:00','11:00:00',3,1,NULL,NULL,NULL,'2020-11-24 21:24:06','2020-11-24 21:24:06',5,NULL,'TKS',NULL,'tet',0,'1','test'),(2,'tests','2020-11-18','09:00:00','11:00:00',3,1,NULL,NULL,NULL,'2020-11-24 21:25:11','2020-11-24 21:25:11',5,NULL,'TKS',NULL,'tet',0,'1','test'),(3,'tests','2020-11-18','09:00:00','11:00:00',3,1,NULL,NULL,NULL,'2020-11-24 21:25:33','2020-11-24 21:25:33',5,NULL,'TKS',NULL,'tet',0,'1','test'),(4,'Ujian PAS','2020-11-26','09:00:00','11:00:00',3,1,NULL,NULL,NULL,'2020-11-26 06:16:08','2020-11-26 06:16:08',5,NULL,'PEKSOS',NULL,'ujian penilain akhir semester',0,'3','7A'),(5,'pas','2020-12-02','09:00:00','11:00:00',3,2,NULL,NULL,NULL,'2020-12-01 17:21:12','2020-12-01 17:21:12',5,NULL,'TKS',NULL,'h',0,'1','kj'),(6,'pas mtk','2020-12-02','09:00:00','11:00:00',3,2,NULL,NULL,NULL,'2020-12-02 07:06:56','2020-12-02 07:06:56',5,NULL,'TKS',NULL,'dd',0,'1','kelas 8'),(7,'PAT','2020-12-11','09:00:00','11:00:00',112345,3,NULL,NULL,NULL,'2020-12-11 10:10:32','2020-12-11 10:10:32',3544221199,NULL,'',NULL,'tes',0,'VI-A, VI-B','tes'),(8,'PAT','2020-12-11','09:00:00','11:00:00',1133,3,NULL,NULL,NULL,'2020-12-11 17:13:44','2020-12-11 17:13:44',112345,NULL,'',NULL,'ujian bahasa indonesia',0,'VI-A','ruang 7');

/*Table structure for table `soal` */

DROP TABLE IF EXISTS `soal`;

CREATE TABLE `soal` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_paket` bigint(20) unsigned DEFAULT NULL,
  `judul` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `soal_cerita` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `soal_created_by_foreign` (`created_by`),
  KEY `soal_updated_by_foreign` (`updated_by`),
  KEY `soal_id_paket_foreign` (`id_paket`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `soal` */

insert  into `soal`(`id`,`id_paket`,`judul`,`deleted_at`,`soal_cerita`,`created_by`,`updated_by`,`created_at`,`updated_at`) values (1,1,'Aljabar 1',NULL,'Tempat parkir untuk motor dan mobil dapat menampung 30 buah kendaraan. Jumlah roda seluruhnya 90 buah. Jika banyak motor dinyatakan dengan x dan banyak mobil dinyatakan dengan y, sistem persamaan linear dua variabel dari pernyataan di atas adalah ….',NULL,NULL,'2020-11-26 06:06:13','2020-11-26 06:06:13'),(2,2,'tes',NULL,'Cerita Rakyat Cindelaras\r\nKerajaan Jenggala dipimpin oleh seorang raja yang bernama Raden Putra. Ia didampingi oleh seorang permaisuri yang baik hati dan seorang selir yang memiliki sifat iri dan dengki. Raja Putra dan kedua istrinya tadi hidup di dalam istana yang sangat megah dan damai. Hingga suatu hari selir raja merencanakan sesuatu yang buruk pada permaisuri raja. Hal tersebut dilakukan karena selir Raden Putra ingin menjadi permaisuri.\r\n\r\nSelir baginda lalu berkomplot dengan seorang tabib istana untuk melaksanakan rencana tersebut. Selir baginda berpura-pura sakit parah. Tabib istana lalu segera dipanggil sang Raja. Setelah memeriksa selir tersebut, sang tabib mengatakan bahwa ada seseorang yang telah menaruh racun dalam minuman tuan putri. “Orang itu tak lain adalah permaisuri Baginda sendiri,” kata sang tabib. Baginda menjadi murka mendengar penjelasan tabib istana. Ia segera memerintahkan patih untuk membuang permaisuri ke hutan dan membunuhnya.\r\n\r\nSang Patih segera membawa permaisuri yang sedang mengandung itu ke tengah hutan belantara. Tapi, patih yang bijak itu tidak mau membunuh sang permaisuri. Rupanya sang patih sudah mengetahui niat jahat selir baginda. “Tuan putri tidak perlu khawatir, hamba akan melaporkan kepada Baginda bahwa tuan putri sudah hamba bunuh,” kata patih. Untuk mengelabui raja, sang patih melumuri pedangnya dengan darah kelinci yang ditangkapnya. Raja merasa puas ketika sang patih melapor kalau ia sudah membunuh permaisuri.\r\n\r\nSetelah beberapa bulan berada di hutan, sang permaisuri melahirkan seorang anak laki-laki. Anak itu diberinya nama Cindelaras. Cindelaras tumbuh menjadi seorang anak yang cerdas dan tampan. Sejak kecil ia sudah berteman dengan binatang penghuni hutan. Suatu hari, ketika sedang asyik bermain, seekor rajawali menjatuhkan sebutir telur ayam. Cindelaras kemudian mengambil telur itu dan bermaksud menetaskannya. Setelah 3 minggu, telur itu menetas menjadi seekor anak ayam yang sangat lucu. Cindelaras memelihara anak ayamnya dengan rajin. Kian hari anak ayam itu tumbuh menjadi seekor ayam jantan yang gagah dan kuat. Tetapi ada satu yang aneh dari ayam tersebut. Bunyi kokok ayam itu berbeda dengan ayam lainnya. “Kukuruyuk… Tuanku Cindelaras, rumahnya di tengah rimba, atapnya daun kelapa, ayahnya Raden Putra…”, kokok ayam itu\r\n\r\nCindelaras sangat takjub mendengar kokok ayamnya itu dan segera memperlihatkan pada ibunya. Lalu, ibu Cindelaras menceritakan asal usul mengapa mereka sampai berada di hutan. Mendengar cerita ibundanya, Cindelaras bertekad untuk ke istana dan membeberkan kejahatan selir baginda. Setelah di ijinkan ibundanya, Cindelaras pergi ke istana ditemani oleh ayam jantannya. Ketika dalam perjalanan ada beberapa orang yang sedang menyabung ayam. Cindelaras kemudian dipanggil oleh para penyabung ayam. “Ayo, kalau berani, adulah ayam jantanmu dengan ayamku,” tantangnya. “Baiklah,” jawab Cindelaras. Ketika diadu, ternyata ayam jantan Cindelaras bertarung dengan perkasa dan dalam waktu singkat, ia dapat mengalahkan lawannya. Setelah beberapa kali diadu, ayam Cindelaras tidak terkalahkan.\r\n\r\nBerita tentang kehebatan ayam Cindelaras tersebar dengan cepat hingga sampai ke Istana. Raden Putra akhirnya pun mendengar berita itu. Kemudian, Raden Putra menyuruh hulubalangnya untuk mengundang Cindelaras ke istana. “Hamba menghadap paduka,” kata Cindelaras dengan santun. “Anak ini tampan dan cerdas, sepertinya ia bukan keturunan rakyat jelata,” pikir baginda. Ayam Cindelaras diadu dengan ayam Raden Putra dengan satu syarat, jika ayam Cindelaras kalah maka ia bersedia kepalanya dipancung, tetapi jika ayamnya menang maka setengah kekayaan Raden Putra menjadi milik Cindelaras.\r\n\r\nDua ekor ayam itu bertarung dengan gagah berani. Tetapi dalam waktu singkat, ayam Cindelaras berhasil menaklukkan ayam sang Raja. Para penonton bersorak sorai mengelu-elukan Cindelaras dan ayamnya. “Baiklah aku mengaku kalah. Aku akan menepati janjiku. Tapi, siapakah kau sebenarnya, anak muda?” Tanya Baginda Raden Putra. Cindelaras segera membungkuk seperti membisikkan sesuatu pada ayamnya. Tidak berapa lama ayamnya segera berbunyi. “Kukuruyuk… Tuanku Cindelaras, rumahnya di tengah rimba, atapnya daun kelapa, ayahnya Raden Putra…,” ayam jantan itu berkokok berulang-ulang. Raden Putra terperanjat mendengar kokok ayam Cindelaras. “Benarkah itu?” Tanya baginda keheranan. “Benar Baginda, nama hamba Cindelaras, ibu hamba adalah permaisuri Baginda.”\r\n\r\nBersamaan dengan itu, sang patih segera menghadap dan menceritakan semua peristiwa yang sebenarnya telah terjadi pada permaisuri. “Aku telah melakukan kesalahan,” kata Baginda Raden Putra. “Aku akan memberikan hukuman yang setimpal pada selirku,” lanjut Baginda dengan murka. Kemudian, selir Raden Putra pun di buang ke hutan. Raden Putra segera memeluk anaknya dan meminta maaf atas kesalahannya Setelah itu, Raden Putra dan hulubalang segera menjemput permaisuri ke hutan.. Akhirnya Raden Putra, permaisuri dan Cindelaras dapat berkumpul kembali. Setelah Raden Putra meninggal dunia, Cindelaras menggantikan kedudukan ayahnya. Ia memerintah negerinya dengan adil dan bijaksana.',NULL,NULL,'2020-12-01 15:54:09','2020-12-02 06:47:23'),(3,3,'Pantai Batu Karas',NULL,'Pantai Batu Karas\r\n\r\nPantai Batu Karas merupakan salah satu pantai untuk berselancar terbaik di Pulau Jawa, dan ombaknya cukup terkenal di kalangan para peselancar. Pantai Batu Karas terletak di Desa Batukaras Kecamatan Cijulang, sekitar 34 km atau sekitar 1 jam perjalanan dari kawasan wisata Pangandaran. Pantai Batu Karas terletak di antara dua bukit yang mengurungnya, sehingga pantai tersebut berbentuk setengah lingkaran.\r\n\r\nPantai ini sering dianggap sebagai perpaduan antara obyek wisata Batu Hiu dan Pantai Pangandaran karena pantainya yang kaya akan tebing dengan hamparan pasir serta ombaknya yang indah. Keberadaan tebing di sebelah kanan pantai, menciptakan jalur ombak yang panjang sehingga cocok untuk berselancar.\r\n\r\nOmbak di Batu Karas tidak terlalu ekstrem, keadaan inilah yang membuat para peselancar pemula juga menggemari Batu Karas sebagai tempat mengasah kemampuan berselancar. Selain itu, arus laut yang tidak langsung mengarah ke pantai menjadikan area Pantai Batu Karas aman untuk berenang sekaligus melakukan olahraga air lainnya seperti Banana Boat.',NULL,NULL,'2020-12-11 09:34:20','2020-12-11 09:34:20'),(4,3,'batu karas 2',NULL,'Pantai Batu Karas\r\n\r\nPantai Batu Karas merupakan salah satu pantai untuk berselancar terbaik di Pulau Jawa, dan ombaknya cukup terkenal di kalangan para peselancar. Pantai Batu Karas terletak di Desa Batukaras Kecamatan Cijulang, sekitar 34 km atau sekitar 1 jam perjalanan dari kawasan wisata Pangandaran. Pantai Batu Karas terletak di antara dua bukit yang mengurungnya, sehingga pantai tersebut berbentuk setengah lingkaran.\r\n\r\nPantai ini sering dianggap sebagai perpaduan antara obyek wisata Batu Hiu dan Pantai Pangandaran karena pantainya yang kaya akan tebing dengan hamparan pasir serta ombaknya yang indah. Keberadaan tebing di sebelah kanan pantai, menciptakan jalur ombak yang panjang sehingga cocok untuk berselancar.\r\n\r\nOmbak di Batu Karas tidak terlalu ekstrem, keadaan inilah yang membuat para peselancar pemula juga menggemari Batu Karas sebagai tempat mengasah kemampuan berselancar. Selain itu, arus laut yang tidak langsung mengarah ke pantai menjadikan area Pantai Batu Karas aman untuk berenang sekaligus melakukan olahraga air lainnya seperti Banana Boat.',NULL,NULL,'2020-12-11 09:44:36','2020-12-11 09:44:36'),(5,3,'batu karas 3',NULL,'Pantai Batu Karas merupakan salah satu pantai untuk berselancar terbaik di Pulau Jawa, dan ombaknya cukup terkenal di kalangan para peselancar. Pantai Batu Karas terletak di Desa Batukaras Kecamatan Cijulang, sekitar 34 km atau sekitar 1 jam perjalanan dari kawasan wisata Pangandaran. Pantai Batu Karas terletak di antara dua bukit yang mengurungnya, sehingga pantai tersebut berbentuk setengah lingkaran.\r\n\r\nPantai ini sering dianggap sebagai perpaduan antara obyek wisata Batu Hiu dan Pantai Pangandaran karena pantainya yang kaya akan tebing dengan hamparan pasir serta ombaknya yang indah. Keberadaan tebing di sebelah kanan pantai, menciptakan jalur ombak yang panjang sehingga cocok untuk berselancar.\r\n\r\nOmbak di Batu Karas tidak terlalu ekstrem, keadaan inilah yang membuat para peselancar pemula juga menggemari Batu Karas sebagai tempat mengasah kemampuan berselancar. Selain itu, arus laut yang tidak langsung mengarah ke pantai menjadikan area Pantai Batu Karas aman untuk berenang sekaligus melakukan olahraga air lainnya seperti Banana Boat.',NULL,NULL,'2020-12-11 09:49:38','2020-12-11 09:49:38'),(6,4,'test referensi',NULL,'Lorem ipsum dolor sit amet',NULL,NULL,'2020-12-11 15:59:58','2020-12-11 15:59:58');

/*Table structure for table `ujian` */

DROP TABLE IF EXISTS `ujian`;

CREATE TABLE `ujian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_peserta` bigint(20) unsigned NOT NULL,
  `id_sertifikasi` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nilai_diri1` double NOT NULL DEFAULT '0',
  `nilai_diri2` double NOT NULL DEFAULT '0',
  `nilai_praktek1` double NOT NULL DEFAULT '0',
  `nilai_praktek2` double NOT NULL DEFAULT '0',
  `nilai_ujian` double NOT NULL DEFAULT '0',
  `total_nilai` double NOT NULL DEFAULT '0',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum Dinilai',
  `status_dd` enum('Belum Sesuai','Sedang Direview','Dalam Penilaian','Sesuai') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum Sesuai',
  `catatan1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ujian_id_peserta_foreign` (`id_peserta`),
  KEY `ujian_id_sertifikasi_foreign` (`id_sertifikasi`),
  KEY `ujian_created_by_foreign` (`created_by`),
  KEY `ujian_updated_by_foreign` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ujian` */

insert  into `ujian`(`id`,`id_peserta`,`id_sertifikasi`,`created_by`,`updated_by`,`deleted_at`,`created_at`,`updated_at`,`nilai_diri1`,`nilai_diri2`,`nilai_praktek1`,`nilai_praktek2`,`nilai_ujian`,`total_nilai`,`status`,`status_dd`,`catatan1`,`catatan2`) values (3,555333,7,NULL,NULL,NULL,'2020-12-11 10:11:40','2020-12-11 17:23:45',0,0,0,0,3.33,0,'Belum Diisi','Belum Sesuai',NULL,NULL),(4,666333,7,NULL,NULL,NULL,'2020-12-11 10:11:41','2020-12-11 21:57:23',0,0,0,0,2.5,0,'Selesai','Belum Sesuai',NULL,NULL),(5,69696969,7,NULL,NULL,NULL,'2020-12-11 10:11:41','2020-12-11 10:11:41',0,0,0,0,0,0,'Belum Diisi','Belum Sesuai',NULL,NULL),(6,757575,7,NULL,NULL,NULL,'2020-12-11 10:11:42','2020-12-12 09:32:49',0,0,0,0,3.75,0,'Selesai','Belum Sesuai',NULL,NULL),(7,111111,8,NULL,NULL,NULL,'2020-12-11 17:14:59','2020-12-11 17:14:59',0,0,0,0,0,0,'Belum Diisi','Belum Sesuai',NULL,NULL),(8,1193,8,NULL,NULL,NULL,'2020-12-11 17:15:01','2020-12-11 17:15:01',0,0,0,0,0,0,'Belum Diisi','Belum Sesuai',NULL,NULL),(9,121212,8,NULL,NULL,NULL,'2020-12-11 17:15:01','2020-12-11 17:15:01',0,0,0,0,0,0,'Belum Diisi','Belum Sesuai',NULL,NULL),(10,131313,8,NULL,NULL,NULL,'2020-12-11 17:15:02','2020-12-11 17:15:02',0,0,0,0,0,0,'Belum Diisi','Belum Sesuai',NULL,NULL),(11,141414,8,NULL,NULL,NULL,'2020-12-11 17:15:03','2020-12-11 17:15:03',0,0,0,0,0,0,'Belum Diisi','Belum Sesuai',NULL,NULL),(12,161616,8,NULL,NULL,NULL,'2020-12-11 17:15:04','2020-12-11 17:15:04',0,0,0,0,0,0,'Belum Diisi','Belum Sesuai',NULL,NULL),(13,191919,8,NULL,NULL,NULL,'2020-12-11 17:15:05','2020-12-11 17:15:05',0,0,0,0,0,0,'Belum Diisi','Belum Sesuai',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`foto`,`email`,`email_verified_at`,`password`,`last_name`,`first_name`,`address`,`phone_number`,`remember_token`,`created_at`,`updated_at`,`deleted_at`,`role`) values (2,'proktor','YGMT5ErLW0J23fBM.png','proktor@gmail.com',NULL,'$2y$10$Qn8cZZDk75cuGvnjwstPduYoLo9lkMY8ImBtYNSyTgJJERz10.CuG',NULL,NULL,'jalan traktor','087783651353',NULL,NULL,'2020-12-03 04:25:47',NULL,'proktor'),(3,'asessor',NULL,'guru@gmail.com',NULL,'$2y$10$Qn8cZZDk75cuGvnjwstPduYoLo9lkMY8ImBtYNSyTgJJERz10.CuG',NULL,NULL,'jalan traktor','087783651353',NULL,NULL,NULL,NULL,'guru'),(5,'asessor',NULL,'guru2@gmail.com',NULL,'$2y$10$Qn8cZZDk75cuGvnjwstPduYoLo9lkMY8ImBtYNSyTgJJERz10.CuG',NULL,NULL,'s','s',NULL,NULL,NULL,NULL,'guru');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
