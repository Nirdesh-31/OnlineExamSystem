
use onlineExam;


DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `option1` varchar(500) DEFAULT NULL,
  `option2` varchar(500) DEFAULT NULL,
  `option3` varchar(500) DEFAULT NULL,
  `option4` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `subjectTopic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `questions` WRITE;
INSERT INTO `questions` VALUES (1,'What is Java?','Object Oriented','Procedure Oriented','Platform dependent','None of the above.','Object Oriented','Java'),(2,'What is MySQL?','Object Oriented','Database','Programming Language','Scripting Language','Database','Java'),(3,'What of the following is the default value of an instance variable?','null','0','Not assigned','Depends upon the type of variable','Depends upon the type of variable','Java'),(4,'What is the size of char variable?','8 bit','16 bit','32 bit','64 bit','16 bit','Java'),(5,'What is the default value of byte variable?','0','0.0','null','undefined','0','Java'),(6,'Which of the following is false about String?','String is immutable.','String can be created using new operator.','String is a primary data type.','None of the above.','String is a primary data type.','Java'),(7,'What is an Interface?','An interface is a collection of abstract methods.','Interface is an abstract class.','Interface is an concrete class.','None of the above.','Interface is an concrete class.','Java'),(8,'Method Overloading is an example of?','Static Binding.','Dynamic Binding.','Both of the above.','None of the above.','Static Binding.','Java'),(9,'What is a marker interface?','marker interface is an interface with no method.','marker interface is an interface with single method, mark().','marker interface is an interface with single method, marker().','None of the above.','marker interface is an interface with no method.','Java'),(11,'Who is the Java inventor?','Dennis Ritchie','Ken Thomsan','James Gosling','Mark Zuckerberg','James Gosling','Java'),(12,'What is the meaning of OOPS?','Object Oriented Programming','Structure Oriented Programming','None of this','Procedure Oriented Programming','Object Oriented Programming','Java'),(13,'What is operating system?','collection of programs that manages hardware resources','system service provider to the application programs','link to interface the hardware and application programs','all of the mentioned','collection of programs that manages hardware resources','Operating Systems'),(14,'To access the services of operating system, the interface is provided by the ','System calls','API','Library','Assembly instructions','System calls','Operating Systems'),(15,'Which one of the following error will be handle by the operating system?','power failure','lack of paper in printer','connection failure in the network','all of the mentioned','power failure','Operating Systems');
UNLOCK TABLES;



DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int NOT NULL,
  `studentName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `education` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `upass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `student` WRITE;
INSERT INTO `student` VALUES (1379,'Nirdesh Pradhan','nirdeshpradhan02@gmail.com','Lalitpur','CSE','nirdesh','1234'),(1382,'Raj Manandhar','raj_mdhr@yahoo.com','Kathmandu','CSE','raj','1234'),(0512,'Shruti Puri','spuri@gmail.com','Himachal Pradesh','CSE','shruti','1234'),(1125,'Gautam Rishi','grishi@gmail.com','Bihar','CSE','gautam','1234'),(1174,'Mamick Pradhan','mamick.pradhan@gmail.com','Bhutan','CSE','mamick','1234');
UNLOCK TABLES;


DROP TABLE IF EXISTS `tbladmin`;

CREATE TABLE `tbladmin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(45) DEFAULT NULL,
  `upass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `tbladmin` WRITE;
INSERT INTO `tbladmin` VALUES (1,'nirdesh','12345');
UNLOCK TABLES;

DROP TABLE IF EXISTS `tblresultreport`;

CREATE TABLE `tblresultreport` (
  `student_id` int NOT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `correct_answer` int DEFAULT NULL,
  `wrong_answer` int DEFAULT NULL,
  `test_marks` int DEFAULT NULL,
  `examtime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `tblresultreport` WRITE;
INSERT INTO `tblresultreport` VALUES (1382,'Raj Manandhar',2,1,8,'2020-07-02 15:50:39'),(1174,'Mamick Pradhan',5,3,20,'2020-07-02 16:44:55'),(1382,'Raj',0,8,20,'2020-07-03 03:36:15');
UNLOCK TABLES;



DROP TABLE IF EXISTS `tblstudentresult`;

CREATE TABLE `tblstudentresult` (
  `studentId` int NOT NULL,
  `question_id` int DEFAULT NULL,
  `hitAnswer` varchar(500) DEFAULT NULL,
  `examdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `subjectTopic` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `tblstudentresult` WRITE;
INSERT INTO `tblstudentresult` VALUES (1382,13,'collection of programs that manages hardware resources','2020-07-02 15:06:04','Operating Systems'),(1382,14,'API','2020-07-02 15:06:04','Operating Systems'),(1382,15,'power failure','2020-07-02 15:06:04','Operating Systems'),(1382,1,'Object Oriented','2020-07-02 15:18:58','Java'),(1382,2,'Database','2020-07-02 15:18:58','Java'),(1382,3,'0','2020-07-02 15:18:58','Java'),(1382,4,'8 bit','2020-07-02 15:18:58','Java'),(1382,5,'0','2020-07-02 15:18:58','Java'),(1382,6,'String is a primary data type.','2020-07-02 15:18:58','Java'),(1382,7,'Interface is an abstract class.','2020-07-02 15:18:58','Java'),(1382,8,'Both of the above.','2020-07-02 15:18:58','Java'),(1382,9,'None of the above.','2020-07-02 15:18:58','Java'),(1382,11,'James Gosling','2020-07-02 15:18:58','Java'),(1382,12,'Object Oriented Programming','2020-07-02 15:18:58','Java'),(1382,13,'collection of programs that manages hardware resources','2020-07-02 15:19:34','Operating Systems'),(1382,14,'System calls','2020-07-02 15:19:34','Operating Systems'),(1174,15,'lack of paper in printer','2020-07-02 15:19:34','Operating Systems'),(1174,13,'collection of programs that manages hardware resources','2020-07-02 15:50:39','Operating Systems'),(1174,14,'API','2020-07-02 15:50:39','Operating Systems'),(1173,15,'power failure','2020-07-02 15:50:39','Operating Systems'),(1174,1,'Object Oriented','2020-07-03 06:55:57','Java'),(1174,2,'Database','2020-07-03 06:55:57','Java'),(1174,3,'0','2020-07-03 06:55:57','Java'),(1174,4,'8 bit','2020-07-03 06:55:57','Java'),(1174,5,'null','2020-07-03 06:55:57','Java'),(1174,6,'String is a primary data type.','2020-07-03 06:55:57','Java'),(1174,7,'Interface is an concrete class.','2020-07-03 06:55:57','Java'),(1174,8,'Dynamic Binding.','2020-07-03 06:55:57','Java'),(1174,9,'marker interface is an interface with no method.','2020-07-03 06:55:57','Java'),(1174,11,'James Gosling','2020-07-03 06:55:57','Java'),(1174,12,'Object Oriented Programming','2020-07-03 06:55:57','Java');
UNLOCK TABLES;
