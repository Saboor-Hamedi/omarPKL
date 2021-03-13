



CREATE TABLE `academic_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year_name` (`year_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;



CREATE TABLE `adminlastloggedin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loggedintime` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_nim` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_nim` (`admin_nim`),
  CONSTRAINT `adminlastloggedin_ibfk_2` FOREIGN KEY (`admin_nim`) REFERENCES `login` (`admin_nim`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;



CREATE TABLE `agency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agencytitle` varchar(50) NOT NULL DEFAULT 'No title found',
  `student_id` bigint(20) NOT NULL,
  `agencydescription` text NOT NULL DEFAULT 'No Description added',
  `duration` char(5) NOT NULL DEFAULT 'N',
  `start_time` varchar(40) NOT NULL,
  `end_time` varchar(40) NOT NULL,
  `lettertype` varchar(20) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`nim`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;





CREATE TABLE `all_subjects` (
  `all_subjectname` varchar(70) NOT NULL,
  `all_subjectid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`all_subjectid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;




CREATE TABLE `class_grade_student` (
  `student_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_grade` int(11) NOT NULL,
  PRIMARY KEY (`student_class_id`),
  UNIQUE KEY `class_grade` (`class_grade`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;




CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_grade` int(11) NOT NULL,
  `class_code` int(11) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `days` varchar(30) NOT NULL,
  `year_name` varchar(30) DEFAULT NULL,
  `end_time` varchar(30) DEFAULT NULL,
  `subjectid` int(11) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `nim` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_code` (`class_code`),
  KEY `classes_ibfk_1` (`subjectid`),
  KEY `classes_ibfk_2` (`teacherid`),
  KEY `classes_ibfk_3` (`nim`),
  KEY `class_grade` (`class_grade`),
  KEY `start_time` (`year_name`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`),
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`),
  CONSTRAINT `classes_ibfk_4` FOREIGN KEY (`class_grade`) REFERENCES `class_grade_student` (`class_grade`),
  CONSTRAINT `classes_ibfk_5` FOREIGN KEY (`year_name`) REFERENCES `academic_year` (`year_name`),
  CONSTRAINT `classes_ibfk_6` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;





CREATE TABLE `eletter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `letters` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;




CREATE TABLE `family` (
  `family_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `familyname` varchar(30) DEFAULT NULL,
  `familyjob` varchar(30) DEFAULT NULL,
  `familyincome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`family_id`),
  KEY `nim` (`nim`),
  CONSTRAINT `family_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;





CREATE TABLE `files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `file_title` varchar(30) NOT NULL,
  `file_description` text NOT NULL,
  `file_attachment` blob NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_id`),
  KEY `nim` (`nim`),
  KEY `teacherid` (`teacherid`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`),
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;




CREATE TABLE `grades` (
  `grade_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade_number` int(10) unsigned NOT NULL DEFAULT 0,
  `nim` bigint(20) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `class_grade_id` int(11) NOT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `nim` (`nim`),
  KEY `teacherid` (`teacherid`),
  KEY `subjectid` (`subjectid`),
  KEY `class_grade_id` (`class_grade_id`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`),
  CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`subjectid`) REFERENCES `subjects` (`subjectid`),
  CONSTRAINT `grades_ibfk_4` FOREIGN KEY (`class_grade_id`) REFERENCES `classes` (`class_grade`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;





CREATE TABLE `login` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_nim` bigint(20) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_lastname` varchar(30) DEFAULT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pass` text NOT NULL,
  `admin_conpass` text NOT NULL,
  `admin_image` blob DEFAULT NULL,
  `admin_level` varchar(15) DEFAULT 'admin',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_nim` (`admin_nim`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `parent` (
  `parent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `family_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`parent_id`),
  KEY `nim` (`nim`),
  KEY `family_id` (`family_id`),
  CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `parent_ibfk_2` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;



CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `content` text NOT NULL,
  `content_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `author_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `professions` (
  `profession_id` int(11) NOT NULL AUTO_INCREMENT,
  `profession_name` varchar(30) NOT NULL,
  PRIMARY KEY (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;



CREATE TABLE `recommendationletter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `lettertype` varchar(20) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  CONSTRAINT `recommendationletter_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `password` longtext NOT NULL,
  `conpassword` longtext NOT NULL,
  `student_level` varchar(10) DEFAULT 'student',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nim` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

CREATE TABLE `student_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  CONSTRAINT `student_details_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

CREATE TABLE `studentlastlogged` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loggedtime` timestamp NOT NULL DEFAULT current_timestamp(),
  `nim` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  CONSTRAINT `studentlastlogged_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



CREATE TABLE `subjects` (
  `sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subjectid` int(11) NOT NULL,
  `subjectname` varchar(30) NOT NULL,
  `subjectcode` varchar(15) NOT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `subjectid` (`subjectid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;




CREATE TABLE `teacher` (
  `tec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacherid` bigint(20) NOT NULL,
  `tname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address` varchar(70) NOT NULL,
  `country` varchar(30) NOT NULL,
  `profession` varchar(30) NOT NULL,
  `teacher_image` blob DEFAULT NULL,
  `pass` text NOT NULL,
  PRIMARY KEY (`tec_id`),
  UNIQUE KEY `teacherid` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `texts` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
