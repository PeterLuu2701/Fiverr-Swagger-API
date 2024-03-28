/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `comment_star` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `hire_date` datetime DEFAULT NULL,
  `complate` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `hire_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `hire_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `job_sub_title` varchar(255) DEFAULT NULL,
  `job_star` int DEFAULT NULL,
  `job_type_detail_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_type_detail_id` (`job_type_detail_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`job_type_detail_id`) REFERENCES `jobTypeDetail` (`id`),
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `jobType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `jobTypeDetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_type_detail_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `job_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_type_id` (`job_type_id`),
  CONSTRAINT `jobTypeDetail_ibfk_1` FOREIGN KEY (`job_type_id`) REFERENCES `jobType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `jobTypeDetailList` (
  `id` int NOT NULL,
  `job_type_detail_id` int DEFAULT NULL,
  `detail_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `skill` varchar(255) DEFAULT NULL,
  `certification` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;







INSERT INTO `jobType` (`id`, `job_type_name`) VALUES
(1, 'Graphics & Design');
INSERT INTO `jobType` (`id`, `job_type_name`) VALUES
(2, 'Digital Marketing');
INSERT INTO `jobType` (`id`, `job_type_name`) VALUES
(3, 'Writing & Translation');
INSERT INTO `jobType` (`id`, `job_type_name`) VALUES
(4, 'Video & Animation'),
(5, 'Music & Audio'),
(6, 'Sewing & Knitting'),
(7, 'Art & Craft'),
(8, 'Hello Dux'),
(10, 'Test10');

INSERT INTO `jobTypeDetail` (`id`, `job_type_detail_name`, `image`, `job_type_id`) VALUES
(1, 'Social & Marketing Videos', 'https://fiverrnew.cybersoft.edu.vn/images/lcv7.jpg', 4);
INSERT INTO `jobTypeDetail` (`id`, `job_type_detail_name`, `image`, `job_type_id`) VALUES
(2, 'Video Editing & Post-Production', 'https://fiverrnew.cybersoft.edu.vn/images/lcv8.jpg', 4);
INSERT INTO `jobTypeDetail` (`id`, `job_type_detail_name`, `image`, `job_type_id`) VALUES
(3, 'Music Production & Writing', 'https://fiverrnew.cybersoft.edu.vn/images/lcv9.jpg', 5);
INSERT INTO `jobTypeDetail` (`id`, `job_type_detail_name`, `image`, `job_type_id`) VALUES
(4, 'Beat Productions', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-52-29-beat.png', 5),
(5, 'Graphicss', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-54-11-graphics.png', 1),
(6, 'Writing', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-27-17-writing.png', 3),
(7, 'Translation', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-24-31-translation.png', 3),
(8, 'Marketing', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-59-43-marketing.png', 2),
(9, 'Media', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-58-19-media.png', 4),
(10, 'Sewing', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-51-15-sewing.png', 7),
(11, 'Knitting', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-49-19-knitting.png', 7),
(12, 'SEO', 'http://fiverrnew.cybersoft.edu.vn/images/24-02-2024-01-25-36-seo.png', 3),
(13, 'Art', 'http://fiverrnew.cybersoft.edu.vn/images/27-02-2024-11-59-55-knitting.png', 7),
(14, 'Baker', 'http://fiverrnew.cybersoft.edu.vn/images/04-03-2024-04-57-07-tumblr_nuhjl4fuwg1uaspr7o1_400.jpg', 3),
(15, 'test', 'test15', 1);



INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `gender`, `role`, `skill`, `certification`) VALUES
(1, 'Test1', 'test1@gmail.com', '1234', '639-998-8863', '2024-03-24T06:03:14.089Z', 'M', 'member', NULL, NULL);
INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `gender`, `role`, `skill`, `certification`) VALUES
(2, 'Test2', 'test2@gmail.com', '1234', '6399988865', '2024-03-24T06:18:38.110Z', 'M', 'member', NULL, NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;