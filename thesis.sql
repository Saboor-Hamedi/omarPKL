
CREATE TABLE `academic_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year_name` (`year_name`)
) ;


LOCK TABLES `academic_year` WRITE;
INSERT INTO `academic_year` VALUES (1,'2010-01-01'),(2,'2011-01-30'),(3,'2012-04-25'),(4,'2013-12-01'),(5,'2014-01-01'),(6,'2015-01-01'),(7,'2016-01-01'),(8,'2017-01-01'),(9,'2018-01-01'),(10,'2019-01-01'),(11,'2020-01-01'),(12,'2021-01-01'),(13,'2022-01-01'),(14,'2023-01-01'),(15,'2024-01-01'),(16,'2025-01-01'),(17,'2026-01-01'),(18,'2027-01-01'),(19,'2028-01-01'),(20,'2029-01-01'),(22,'2030-01-01');
UNLOCK TABLES;


CREATE TABLE `adminlastloggedin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loggedintime` timestamp NOT NULL current_timestamp(),
  `admin_nim` bigint(20) NULL,
  PRIMARY KEY (`id`),
  KEY `admin_nim` (`admin_nim`),
  CONSTRAINT `adminlastloggedin_ibfk_2` FOREIGN KEY (`admin_nim`) REFERENCES `login` (`admin_nim`)
) ;




LOCK TABLES `adminlastloggedin` WRITE;

INSERT INTO `adminlastloggedin` VALUES (1,'2020-11-26 02:06:07',11160930000120),(2,'2020-12-13 13:02:16',11160930000192);

UNLOCK TABLES;




CREATE TABLE `agency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agencytitle` varchar(50) NOT NULL ,
  `student_id` bigint(20) NOT NULL,
  `agencydescription` text NOT NULL  ,
  `duration` char(5) NOT NULL  ,
  `start_time` varchar(40) NOT NULL,
  `end_time` varchar(40) NOT NULL,
  `lettertype` varchar(20) NOT NULL ,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`nim`) ON DELETE CASCADE
) ;




LOCK TABLES `agency` WRITE;

INSERT INTO `agency` VALUES (82,'Computer Science and Engineering',83789553791438,'Networking with one\'s fellow scientists and engineers is extremely important for personal and professional development.  Professional societies sponsor conferences, publish journals, and serve as reviewers or editors.  They set professional and educational standards and provide job and career services for their members.','1','03/01/2021','03/31/2021','Electronic');

UNLOCK TABLES;




CREATE TABLE `all_subjects` (
  `all_subjectname` varchar(70) NOT NULL,
  `all_subjectid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`all_subjectid`)
) ;


LOCK TABLES `all_subjects` WRITE;

INSERT INTO `all_subjects` VALUES ('Anthropology\r',1),('Archaeology\r',2),('Area Studies\r',3),('Cultural and Ethnic Studies\r',4),('Economics\r',5),('Gender and Sexuality Studies\r',6),('Geography\r',7),('Political Science\r',8),('Psychology\r',9),('Sociology\r',10),('Chemistry\r',11),('Earth Sciences\r',12),('Life Sciences\r',13),('Physics\r',14),('Space Sciences\r',15),('Computer Sciences\r',16),('Logic\r',17),('Mathematics\r',18),('Statistics\r',19),('Systems Science\r',20),('Agriculture\r',21),('Architecture and Design\r',22),('Business\r',23),('Divinity\r',24),('Education\r',25),('Engineering\r',26),('Environmental Studies and Forestry\r',27),('Family and Consumer Science\r',28),('Health Sciences\r',29),('Human Physical Performance and Recreation*\r',30),('Journalism, Media Studies and Communication\r',31),('Law\r',32),('Library and Museum Studies\r',33),('Military Sciences\r',34),('Public Administration\r',35),('Social Work\r',36),('Transportation',37);

UNLOCK TABLES;





CREATE TABLE `class_grade_student` (
  `student_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_grade` int(11) NOT NULL,
  PRIMARY KEY (`student_class_id`),
  UNIQUE KEY `class_grade` (`class_grade`)
) ;


LOCK TABLES `class_grade_student` WRITE;

INSERT INTO `class_grade_student` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);

UNLOCK TABLES;




CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_grade` int(11) NOT NULL,
  `class_code` int(11) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `days` varchar(30) NOT NULL,
  `year_name` varchar(30) NULL,
  `end_time` varchar(30) NULL,
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
) ;


LOCK TABLES `classes` WRITE;

INSERT INTO `classes` VALUES (2,1,42485,'56XR','Moday','2010-01-01','2020-06-30 20:25:00',89124,43632372818789,83789553791438),(3,1,95819,'WRTJ','Moday','2010-01-01','2020-06-30 20:40:00',23412,43632372818789,99325320048831),(4,2,60908,'FHIB','Moday','2010-01-01','2020-06-30 20:42:00',23412,43632372818789,83789553791438),(5,1,41603,'WSD9','Moday','2011-01-30 ','2020-06-30 20:58:00',35216,43632372818789,83789553791438),(6,1,4635,'LA5G','Moday','2011-01-30','2020-06-25 21:02:00',54566,43632372818789,83789553791438),(7,2,88533,'JX57','Tuesday','2011-01-30','2020-06-06 21:04:00',30183,43632372818789,17034213768553),(8,5,10964,'B4YU','Moday','2010-01-01','2020-06-30 21:24:00',11511,43632372818789,17034213768553),(9,3,28822,'PLCE','Moday','2010-01-01','2020-09-16 22:40:00',26156,17352183302292,83789553791438),(11,2,21309,'OMFJ','Wednesday','2010-01-01','2020-09-10 22:43:00',23412,18154898755021,83789553791438),(16,3,40302,'EA13','tuesday','2020-01-01','02:00 AM',9314,42030737204174,83789553791438),(45,3,14104,'Y2PK','wednesday','2020-01-01','01:30 AM',9314,28152121636563,83789553791438),(58,4,40423,'DXKA','monday','2021-01-01','12:00 AM',72186,56871005568266,83789553791438),(59,4,13124,'ODW1','tuesday','2021-01-01','02:30 AM',54566,28152121636563,83789553791438),(61,4,30004,'23QF','thursay','2021-01-01','10:30 PM',30183,31084335760364,83789553791438),(62,3,21244,'8HEK','sunday','2020-01-01','01:30 AM',11511,18154898755021,83789553791438),(63,2,43322,'AHF2','friday','2020-01-01','02:00 AM',9298,38635016401032,83789553791438);
UNLOCK TABLES;




CREATE TABLE `eletter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `letters` varchar(250) NULL,
  PRIMARY KEY (`id`)
) ;


LOCK TABLES `eletter` WRITE;

INSERT INTO `eletter` VALUES (1,'Scholarship Recommendation Letter'),(2,'PKL Letter');

UNLOCK TABLES;




CREATE TABLE `family` (
  `family_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `familyname` varchar(30) NULL,
  `familyjob` varchar(30) NULL,
  `familyincome` varchar(30) NULL,
  PRIMARY KEY (`family_id`),
  KEY `nim` (`nim`),
  CONSTRAINT `family_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
);


LOCK TABLES `family` WRITE;

INSERT INTO `family` VALUES (5,47228610344222,'Asdf',NULL,NULL),(6,83789553791438,'Asdf',NULL,NULL),(8,47228610344221,'Asdf',NULL,NULL),(10,47228610344266,'Asdf',NULL,NULL),(11,16747873726784,'aaa',NULL,NULL),(12,16747873726784,'aaa',NULL,NULL),(13,99325320048831,'Emma',NULL,NULL),(14,18793286422779,'Olivia',NULL,NULL),(15,17034213768553,'Charlotte',NULL,NULL),(16,54141807378939,'Parker',NULL,NULL),(17,62960424079990,'Gavin',NULL,NULL),(18,62498751658254,'Kayden',NULL,NULL),(19,65384502317782,'Asdf',NULL,NULL),(20,12926861659608,'aa',NULL,NULL),(21,84614188815285,'Mike',NULL,NULL),(22,19654297179939,'asdf',NULL,NULL),(23,13124286433889,'codeigniter',NULL,NULL),(24,15643314587511,'codeigniter',NULL,NULL),(25,32452345234521,'codeigniter',NULL,NULL),(26,16469843373399,'codeigniter',NULL,NULL),(27,13712226564318,'asdfasd',NULL,NULL),(28,18565196249818,'Jordan',NULL,NULL),(29,12367227813729,'asdfasd',NULL,NULL),(30,18933889855648,'Dominic',NULL,NULL),(31,11446431127385,'Austin',NULL,NULL),(32,18224933851118,'Ian',NULL,NULL),(33,27054705240581,'test',NULL,NULL),(34,15756282592211,'INSERT',NULL,NULL),(35,63051738704130,'asdfasdf',NULL,NULL),(36,58517486632460,'asdfasdf',NULL,NULL),(37,58574236318147,'sdfasdfas',NULL,NULL),(38,14604327012522,'asdfasdf',NULL,NULL),(39,42773036300353,'adsfasdf',NULL,NULL),(40,20584232423423,'asdfasdf',NULL,NULL),(41,82487346006071,'asdfasdf',NULL,NULL),(42,84574802185024,'Asdfa',NULL,NULL),(43,87206712581231,'Asdf',NULL,NULL),(44,98720671258123,'Asdf',NULL,NULL),(45,98720671258111,'ddddddd',NULL,NULL),(46,16328062132605,'Asdfas',NULL,NULL),(47,26242752772112,'Adf',NULL,NULL),(48,73477631735544,'Asdfasdf',NULL,NULL),(49,47228610344232,'Asdf',NULL,NULL),(50,47228610344111,'Asdf',NULL,NULL),(51,47228610344222,'Asdf',NULL,NULL),(52,47228610344221,'Asdf',NULL,NULL),(53,47228610344229,'Asdf',NULL,NULL),(54,47228610344266,'Asdf',NULL,NULL);
UNLOCK TABLES;


DELIMITER ;;

    
DELIMITER ;






CREATE TABLE `files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `file_title` varchar(30) NOT NULL,
  `file_description` text NOT NULL,
  `file_attachment` blob NOT NULL,
  `send_date` timestamp NOT NULL current_timestamp(),
  PRIMARY KEY (`file_id`),
  KEY `nim` (`nim`),
  KEY `teacherid` (`teacherid`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`),
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`)
) ;


LOCK TABLES `files` WRITE;
INSERT INTO `files` VALUES (23,99325320048831,92254794233844,'asdf','asdfasdf','Vol3_No2_2.pdf','2020-12-04 13:34:19'),(25,99325320048831,92254794233844,'asdfasd','fasdfasdf','laravel.pdf','2020-12-04 13:35:09');
UNLOCK TABLES;




CREATE TABLE `grades` (
  `grade_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade_number` int(10) unsigned NOT NULL 0,
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
) ;


LOCK TABLES `grades` WRITE;

INSERT INTO `grades` VALUES (1,100,9223372036854775807,43632372818789,23412,1),(2,200,83789553791438,43632372818789,73218,1),(5,300,83789553791438,43632372818789,35216,1);
UNLOCK TABLES;




CREATE TABLE `login` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_nim` bigint(20) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_lastname` varchar(30) NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pass` text NOT NULL,
  `admin_conpass` text NOT NULL,
  `admin_image` blob NULL,
  `admin_level` varchar(15) 'admin',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_nim` (`admin_nim`)
) ;


LOCK TABLES `login` WRITE;
INSERT INTO `login` VALUES (2,11160930000192,'Administration',NULL,'newadminy@yahoo.com','$2y$10$AlaBU3MM2EdXswOehLr1ruHL2JmE/W7akUxDOjleb/5Euky0/Qyny','$2y$10$LM/rPc.XIMRNCPMQOzxoBurxtDgOODPP1LSs/ZozbGITSTcxVWHAe','1592747020_back5.jpg','admin'),(11,11160930000120,'Saboor','Hamedi','saboorhamedi49@gmail.com','$2y$10$ry1f/9iInlTthHNIdVGTq.PT3Nh9fW5QlwOhvNiTd1NhH09dVPVJ6','$2y$10$EeL64huBmcj0z6QDFUtsDOuyJ1ZpDgXuEp7LoOu0Aw7mumiwf3jDG','1605844930-IMG_0969.JPG','admin'),(12,26748282305214,'pak Eri','Rustam','pakerirustam@gmail.com','$2y$10$xsPK02E4g76UuUWnAc3hv.a9.ZQc8FnuOusgAaeorPyDQiv8SN8em','123','1606472826-pp.jpg','admin'),(13,61068775746818,'hkl','jkh','kjhkl@gmail.com','$2y$10$EFsO0Z7iWF86QtHeBdwk2OicQH6LISBWwLqdI3kBGFanCAcbXFIX2','123','1606983194-admission activity diagram.png','admin');
UNLOCK TABLES;




CREATE TABLE `parent` (
  `parent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `family_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`parent_id`),
  KEY `nim` (`nim`),
  KEY `family_id` (`family_id`),
  CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `parent_ibfk_2` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;


LOCK TABLES `parent` WRITE;

INSERT INTO `parent` VALUES (3,83789553791438,6),(5,47228610344221,8),(7,47228610344266,10),(8,16747873726784,11),(9,16747873726784,12),(10,99325320048831,13),(11,18793286422779,14),(12,17034213768553,15),(13,54141807378939,16),(14,62960424079990,17),(15,62498751658254,18),(16,65384502317782,19),(17,12926861659608,20),(18,84614188815285,21),(19,19654297179939,22),(20,13124286433889,23),(21,15643314587511,24),(22,32452345234521,25),(23,16469843373399,26),(24,13712226564318,27),(25,18565196249818,28),(26,12367227813729,29),(27,18933889855648,30),(28,11446431127385,31),(29,18224933851118,32),(30,27054705240581,33),(31,15756282592211,34),(32,63051738704130,35),(33,58517486632460,36),(34,58574236318147,37),(35,14604327012522,38),(36,42773036300353,39),(37,20584232423423,40),(38,82487346006071,41),(39,84574802185024,42),(40,87206712581231,43),(41,98720671258123,44),(42,98720671258111,45),(43,16328062132605,46),(44,26242752772112,47),(45,73477631735544,48),(46,47228610344232,49),(47,47228610344111,50),(48,47228610344222,51),(49,47228610344221,52),(50,47228610344229,53),(51,47228610344266,54);
UNLOCK TABLES;







LOCK TABLES `password_resets` WRITE;

UNLOCK TABLES;




CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NULL,
  `content` text NOT NULL,
  `content_time` timestamp NOT NULL current_timestamp(),
  `author_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `student` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ;


LOCK TABLES `post` WRITE;

INSERT INTO `post` VALUES (1,'New THML course ','<p>dsfddddddddddddddd</p><p>dsfddddddddddddddd</p><p>dsfddddddddddddddd</p><p>dsfddddddddddddddd</p>','2021-03-03 09:14:34',83789553791438);
UNLOCK TABLES;




CREATE TABLE `professions` (
  `profession_id` int(11) NOT NULL AUTO_INCREMENT,
  `profession_name` varchar(30) NOT NULL,
  PRIMARY KEY (`profession_id`)
) ;


LOCK TABLES `professions` WRITE;
INSERT INTO `professions` VALUES (1,'HTML'),(2,'Art\r'),(3,'Citizenship\r'),(4,' Geography\r'),(6,' History\r'),(7,'Languages (French, German, Spa'),(8,'Literacy\r'),(9,'Music\r'),(11,' Natural history\r'),(12,' Personal, social and health e'),(13,' Science\r'),(14,' Arithmetic\r'),(15,' Social Studies\r'),(16,'Reading\r'),(17,' Writing\r'),(18,'Information and communication '),(19,'Languages\r'),(20,'Mathematics\r'),(21,'Modern studies\r'),(22,'Music\r'),(23,' PE: Physical education\r'),(24,' P.S.H.E: Personal, social and'),(25,' RE: Religious education\r'),(26,' Science\r'),(27,'Study skills\r'),(28,'Physics\r'),(29,'Religion\r'),(30,'Woodwork\r'),(31,' Sociology\r'),(32,'Psychology\r'),(33,'H.ome economics\r'),(34,'Critical reading');
UNLOCK TABLES;




CREATE TABLE `recommendationletter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `lettertype` varchar(20) NOT NULL,
  `create_at` timestamp NOT NULL current_timestamp(),
  `update_at` timestamp NOT NULL current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  CONSTRAINT `recommendationletter_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`) ON DELETE CASCADE
) ; 


LOCK TABLES `recommendationletter` WRITE;
INSERT INTO `recommendationletter` VALUES (3,83789553791438,'ACM (Association for Computing Machinery)\nâ€œworldâ€™s largest educational and scientific computing society;â€� focused on advancing computing as a science and a profession.\n','Manual','2021-03-08 14:28:45','2021-03-08 14:28:45');
UNLOCK TABLES;



LOCK TABLES `student` WRITE;
INSERT INTO `student` VALUES (1,83789553791438,'Omer','Omer','Indonesia','Omer@gmail.com',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-01 07:41:02','2021-02-22 13:00:24'),(2,99325320048831,'Liam','Emma','Amercia','liamemma@gmail.com',5,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-04 21:16:30','2021-02-22 21:21:44'),(3,18793286422779,'Noah','Olivia','China','soliviachina@gmail.com',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-26 06:36:48','2021-02-24 15:03:39'),(4,22092393858586,'James','Isabella','French','jamesIsabella@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-24 12:31:49','2021-03-04 06:29:18'),(9,17034213768553,'Benjamin','Charlotte','Afghanistan','Benjamin@gmail.com',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-07 14:06:06','2021-02-23 06:31:45'),(10,54141807378939,'Xavier','Parker','asdf','Xavier@gmail.com',17,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-26 04:12:24','2021-02-25 08:27:03'),(13,62960424079990,'Sawyer','Gavin','asdfasdf','asdfasdf@gmail.com',17,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-01 22:01:04','2021-03-06 17:56:12'),(14,62498751658254,'Leonardo','Kayden','asdf','sadfsad199@yahoo.com',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-06 20:45:33','2021-03-05 11:36:05'),(15,65384502317782,'Validate','Asdf','asdfasd','alajs98@yahoo.com',16,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-06 09:01:53','2021-02-26 23:28:01'),(16,12926861659608,'Name updated','aa','afghanistan','asdfas@yahoo.com',7,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-03 02:10:10','2021-02-26 05:48:03'),(17,84614188815285,'Name updated','Mike','Australia','asdf72@yahoo.com',9,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-02 03:02:34','2021-02-28 01:52:25'),(18,19654297179939,'Name updated','asdf','asdf','asdfasdf@gmail.com',8,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-07 03:59:44','2021-02-25 11:14:08'),(23,13124286433889,'Name updated','codeigniter','asdfasdfa','asdfasdf',8,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-07 06:08:18','2021-03-06 21:49:38'),(26,15643314587511,'Asher','codeigniter','asdfasdfa','asdfasdf',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-06 13:59:42','2021-03-05 22:41:57'),(28,32452345234521,'Name updated','codeigniter','asdfasdfa','asdfasdf',8,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-02 22:50:58','2021-02-28 19:17:03'),(30,16469843373399,'Name updated','codeigniter','asdfasdfa','asdfasdf',9,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-28 19:33:07','2021-03-05 23:35:39'),(33,13712226564318,'Asher','asdfasd','fasdfasdf','asdfasdf',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-01 00:30:03','2021-03-05 07:23:15'),(36,18565196249818,'Brayden','Jordan','adfasdf','asdfasdfasdf',15,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-22 11:08:16','2021-02-28 09:25:34'),(44,12367227813729,'adsfasdf','asdfasd','adfasdf','asdfasdf',18,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-03 01:28:32','2021-03-05 20:14:15'),(45,18933889855648,'Bryson','Dominic','asdfasdf','asdfasd',23,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-23 17:15:17','2021-03-05 20:10:46'),(46,11446431127385,'adsfasdf','Austin','asdfasd','asdfasdf',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-03 05:08:09','2021-03-03 11:27:18'),(47,18224933851118,'asdfasdf','Ian','asdfasdf','asdfasdf',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-06 17:12:17','2021-03-05 16:00:24'),(49,16747873726784,'asdfasdf','Ian','asdfasd','asdfasd',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-01 17:54:23','2021-02-23 16:56:19'),(50,27054705240581,'Seminar','test','test','test@gmail.com',10,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-22 09:12:24','2021-02-23 07:56:33'),(51,42803670603152,'Naweed','Nazari','Kabul','naweednazari@gmail.com',10,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-28 11:36:12','2021-02-23 08:10:04'),(52,15756282592211,'INSERT','INSERT','INSERT','INSERT',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-25 01:41:12','2021-02-24 12:16:52'),(53,63051738704130,'asdfasdf','asdfasdf','asdfasdf','asdfasdf@gmail.com',15,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-03 16:54:48','2021-03-02 08:10:20'),(54,58517486632460,'asdfasdf','asdfasdf','asdfasdf','asdfasdf@gmail.com',17,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-05 02:47:45','2021-02-27 23:17:15'),(56,58574236318147,'Name updated','sdfasdfas','dfasdf','asdfasdfasd@gmail.com',7,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-06 06:31:42','2021-02-26 15:11:28'),(57,14604327012522,'asdfasdf','asdfasdf','asdfasdf','asdfasdf@gmail.com',16,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-07 19:32:40','2021-02-27 01:21:48'),(58,42773036300353,'asdfasdf','adsfasdf','asdfasdf','asdfasdh@gmail.cm',15,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-26 01:25:34','2021-03-05 04:30:50'),(59,20584232423423,'asdfasdfasd','asdfasdf','asdfasdf','asdfasdf@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-28 15:47:13','2021-03-06 13:44:56'),(60,82487346006071,'Name updated','asdfasdf','asdfasdf','asdfklj@gmail.cmo',9,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-28 21:56:46','2021-02-23 02:28:24'),(61,84574802185024,'Asdfa','Asdfa','asdf','adsfasdf@gmail.com',18,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-22 09:39:33','2021-03-03 14:23:25'),(62,87206712581231,'Asdf','Asdf','asdf','asdf@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-03 01:44:49','2021-02-24 11:48:06'),(63,98720671258123,'Asdf','Asdf','asdf','asdf@gmail.com',15,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-23 23:02:48','2021-03-05 11:06:28'),(64,98720671258111,'Asdf','ddddddd','asdf','asdf@gmail.com',15,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-04 09:16:55','2021-03-01 15:24:15'),(65,16328062132605,'Asdf','Asdfas','adsfasdf','sdfasdf@gmail.com',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-25 20:33:34','2021-02-25 14:58:03'),(66,26242752772112,'Ad','Adf','asdf','asfasdf@gmail.com',12,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-23 22:14:29','2021-03-02 23:53:42'),(67,73477631735544,'Asdf','Asdfasdf','asdfasdf','aksdfj@gmail.com',18,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-05 20:49:04','2021-02-27 21:50:33'),(68,47228610344232,'Asdf','Asdf','asdf','asdfasdf@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-05 08:39:16','2021-02-24 08:47:50'),(69,47228610344111,'Asdf','Asdf','asdf','asdfasdf@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-01 00:06:30','2021-03-01 21:43:44'),(78,47228610344222,'Asdf','Asdf','asdf','asdfasdf@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-02-22 17:52:06','2021-02-26 05:31:22'),(80,47228610344221,'Asdf','Asdf','asdf','asdfasdf@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-04 12:18:20','2021-03-05 05:41:50'),(81,47228610344229,'Asdf','Asdf','asdf','asdfasdf@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-02 03:12:45','2021-02-23 07:11:19'),(82,47228610344266,'Asdf','Asdf','asdf','asdfasdf@gmail.com',19,'Afghanistan','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','$2y$10$MC/oRT07.kNHLCzujRKzu.wfwc67NTYdK..AV/DRdVYarjzwfnvcW','student','2021-03-02 22:26:06','2021-02-22 14:07:15');
UNLOCK TABLES;
ALTER DATABASE `thesis` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;

DELIMITER ;;

DELIMITER ;

ALTER DATABASE `thesis` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
ALTER DATABASE `thesis` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;

DELIMITER ;;

DELIMITER ;




CREATE TABLE `student_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` bigint(20) NULL,
  `bio` text NULL,
  `facebook` varchar(100) NULL,
  `youtube` varchar(100) NULL,
  `instagram` varchar(100) NULL,
  `twitter` varchar(100) NULL,
  `location` varchar(100) NULL,
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  CONSTRAINT `student_details_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`)
) ;


LOCK TABLES `student_details` WRITE;
INSERT INTO `student_details` VALUES (1,83789553791438,'I\'m Saboor, majoring Information System, I\'m specialist on Java computer Language, PHP, MySQL, SQL, HTML CSS, and a little JavaScript and jQuery','https://web.facebook.com/saboor.hamedi.7/','https://www.youtube.com/channel/UCssGbxijAmdGv7kjmOpNinA?view_as=subscriber','https://www.instagram.com/hamedisaboor/','','Indonesia'),(2,9223372036854775807,'Hello I\'m Liam from America','https://www.facebook.com','','','','America'),(4,22092393858586,'Hello everyone, I\'m James from America, I came here to study and I love this place wooo','','','','',''),(8,12367227813729,'','https://web.facebook.com/','https://web.youtube.com/','https://www.instagram.com/','https://twitter.com/','America'),(9,98720671258111,NULL,NULL,NULL,NULL,NULL,NULL),(10,16328062132605,NULL,NULL,NULL,NULL,NULL,NULL),(11,26242752772112,NULL,NULL,NULL,NULL,NULL,NULL),(12,73477631735544,NULL,NULL,NULL,NULL,NULL,NULL),(13,47228610344232,'asdfasdfasdf','','','','',''),(14,47228610344111,NULL,NULL,NULL,NULL,NULL,NULL),(23,47228610344222,NULL,NULL,NULL,NULL,NULL,NULL),(24,807382473145,NULL,NULL,NULL,NULL,NULL,NULL),(25,47228610344221,NULL,NULL,NULL,NULL,NULL,NULL),(26,47228610344229,NULL,NULL,NULL,NULL,NULL,NULL),(27,47228610344266,NULL,NULL,NULL,NULL,NULL,NULL);
UNLOCK TABLES;




CREATE TABLE `studentlastlogged` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loggedtime` timestamp NOT NULL current_timestamp(),
  `nim` bigint(20) NULL,
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  CONSTRAINT `studentlastlogged_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`)
) ;


LOCK TABLES `studentlastlogged` WRITE;
INSERT INTO `studentlastlogged` VALUES (1,'2020-11-25 18:29:39',83789553791438),(2,'2020-11-26 02:19:25',98720671258111),(3,'2020-11-26 02:24:16',84574802185024),(4,'2020-11-26 02:58:27',47228610344232),(5,'2020-12-13 15:47:54',99325320048831),(6,'2021-03-03 09:15:52',11446431127385);
UNLOCK TABLES;




CREATE TABLE `subjects` (
  `sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subjectid` int(11) NOT NULL,
  `subjectname` varchar(30) NOT NULL,
  `subjectcode` varchar(15) NOT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `subjectid` (`subjectid`)
) ;


LOCK TABLES `subjects` WRITE;
INSERT INTO `subjects` VALUES (1,73218,'Language Arts','L1AS'),(2,89124,'Language Arts','ALU1'),(4,23412,'History','H13D'),(5,35216,'Music','YN7U'),(6,9314,'Anthropology','L8JY'),(7,26156,'Area Studies','KTWA'),(8,11511,'Geography','TOBK'),(9,9298,'Area Studies','BGC1'),(10,54566,'Physics','6AV7'),(11,28297,'Mathematics','HTBG'),(12,30183,'Life Sciences','KLWT'),(13,5561,'Library and Museum Studies','ECUP'),(14,72186,'Gender and Sexuality Studies','4NPI'),(15,30011,'Logic','4861'),(16,25442,'Anthropology','PDXC');
UNLOCK TABLES;




CREATE TABLE `teacher` (
  `tec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacherid` bigint(20) NOT NULL UNIQUE,
  `tname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address` varchar(70) NOT NULL,
  `country` varchar(30) NOT NULL,
  `profession` varchar(30) NOT NULL,
  `teacher_image` blob NULL,
  `pass` text NOT NULL,
  PRIMARY KEY (`tec_id`)
) ;


LOCK TABLES `teacher` WRITE;

INSERT INTO `teacher` VALUES (1,43632372818789,'Wahid','Rahimi','Kabul','Afghanistan','Language professional','','123'),(2,17352183302292,'Aahron','Seminar','Indonesia','123','English literature',NULL,'123'),(3,73401312312453,'Abrahaim','Abraham','Indonesia / Banten /Ciputat','Indonesia','Database administrator',NULL,'123'),(4,89643142801876,'Abrahame','Abrahamo','asdfasdf','asdfasd','HTML ',NULL,'123'),(5,18154898755021,'Abrahem','Abrahim','asdfasd','asdfas','HTML ',NULL,'123'),(6,47526615248432,'Abrahm','Abrahon','akjdfhj','ajksdk','HTML ',NULL,'123'),(7,80605444465409,'Master','asdf','asdfasdf','asdf','Languages (French, German, Spa',NULL,'123'),(13,42030737204174,'Hello','Aaaaa','ddd','dd','dd',NULL,'ddd'),(14,69099177388586,'I have been updated','ddd','dddd','dddd','ddd',NULL,'ddddd'),(15,34795397823220,'ttt','ttt','ttt','ttt','ttt',NULL,'ttt'),(17,64772801440232,'asdf','asdf','asdf','asdfsd','fas',NULL,'df'),(18,59350092051029,'adf','sd','asdf','asdfa','sdf',NULL,'sdf'),(19,92254794233844,'yy','yy','yy','yy','yy',NULL,'yy'),(20,83749561560103,'hh','hh','hhh','hhh','hh',NULL,'hh'),(21,91926932801454,'Update','asdf','sadf','asdf','asdf',NULL,'asdf'),(22,81066846838163,'zzzz','zzzzz','zz','zz','zz',NULL,'zz'),(23,23216118716884,'baa','baa','baa','baa','baa',NULL,'baa'),(24,50633102117110,'vvv','vvv','vvv','vvv','vvv',NULL,'vvv'),(26,28152121636563,'asd','asdf','asd','asd','adf',NULL,'adf'),(27,16531540007126,'adf','asdfa','asdf','asdf','asdf',NULL,'asdf'),(28,38635016401032,'asdfa','f','asdf','asdf','asdf',NULL,'f'),(29,15063310211710,'asdf','asdfa','sdf','asdf','asdf',NULL,'asdf'),(30,37003180416506,'asdf','adsfa','sdf','asdf','asd',NULL,'asdf'),(31,11506331021171,'load','load','load','load','load',NULL,'load'),(32,45820530160604,'asdf','sdf','sdf','sdf','sdf',NULL,'faadfasdf'),(34,12402256447111,'Hello update','Asdf','asd','asdf','asdf',NULL,'asdf'),(35,32744456284682,'asdfasdf','asdf','sdfasdfas','asdfasdf','asdfasdf',NULL,'asdfasdf'),(36,38783260050634,'asdfasdf','sdfasd','sdfasdf','asdfasdf','asdfasdf',NULL,'asdfasdf'),(37,10077248248021,'asdfasdf','sdfasdf','asd','asdfasdf','asdfasdf',NULL,'asdfasdfasdf'),(39,74216405655385,'asdfa','asdf','asdf','adsf','asdf',NULL,'adsf'),(40,30546167287573,'adf','adf','asdf','asdf','asdf',NULL,'adf'),(41,56465543217841,'asdf','asdf','asdf','asdf','asdf',NULL,'asdf'),(42,33463818527321,'asdfa','sdf','asdf','asdf','asdf',NULL,'asdf'),(43,45845467738827,'asdf','adsf','asdfa','sdf','asdf',NULL,'aaaaa'),(44,44332164521542,'asdf','asdf','asdf','asdf','asdf',NULL,'asdf'),(45,27108851235771,'adfa','dsfa','asdfa','sdf','asdfadsf',NULL,'asdf'),(52,56072142213523,'asdf','asdfas','df','asdfasdf','asdf',NULL,'asdfasdf'),(53,51630688122034,'Hello','Asdfasdf','asdfasdf','asdfasdf','asdfasdf',NULL,'asdfasdf'),(54,75683756446514,'asdfasdf','asdfasdf','adsfasd','asdfasdf','asdfasdf',NULL,'asdfasdf'),(55,62817213425052,'asdf','asdf','asdfasdf','asdfasdf','asdfasdf',NULL,'asdfasdfasdf'),(56,15817077276055,'asdfa','asdf','aasdf','asdf','asdf',NULL,'asdf'),(57,56871005568266,'asd','asdf','asdf','asdf','asdf',NULL,'sdfasdf'),(58,11764224311068,'asdf','asdf','asdf','asdf','asdfasdf',NULL,'asdf'),(59,15518143362070,'asdfasdf','fasdf','asdf','asdf','asdf',NULL,'asdfsdfasdf'),(60,31084335760364,'asdfasdf','asdfasdf','asdf','asdfasdf','asdfasdf',NULL,'asdfasdf'),(61,41373888047751,'Asdf','Asdf','df','Asdf','asdf',NULL,'asdf');
UNLOCK TABLES;







