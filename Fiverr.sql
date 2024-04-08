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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `hire_date` datetime DEFAULT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `hire_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `hire_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `job_title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_sub_title` varchar(255) DEFAULT NULL,
  `job_star` int DEFAULT NULL,
  `job_type_detail_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_type_detail_id` (`job_type_detail_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`job_type_detail_id`) REFERENCES `jobTypeDetail` (`id`),
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `jobType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `jobTypeDetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_type_detail_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `job_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_type_id` (`job_type_id`),
  CONSTRAINT `jobTypeDetail_ibfk_1` FOREIGN KEY (`job_type_id`) REFERENCES `jobType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `jobTypeDetailList` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_type_detail_id` int DEFAULT NULL,
  `detail_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `skill` varchar(255) DEFAULT NULL,
  `certification` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comment` (`id`, `job_id`, `user_id`, `comment_date`, `content`, `comment_star`) VALUES
(1, 3, 1, '2024-04-01 03:05:33', 'hehehe', 3);


INSERT INTO `hire` (`id`, `job_id`, `user_id`, `hire_date`, `complete`) VALUES
(1, 3, 1, '2024-04-02 07:32:24', 1);
INSERT INTO `hire` (`id`, `job_id`, `user_id`, `hire_date`, `complete`) VALUES
(3, 10, 1, '2024-04-08 07:15:39', 1);


INSERT INTO `job` (`id`, `job_name`, `rate`, `salary`, `image`, `job_title`, `job_sub_title`, `job_star`, `job_type_detail_id`, `user_id`) VALUES
(3, 'I will design minimal logo with complete corporate brand identity', 66, 10, 'https://fiverrnew.cybersoft.edu.vn/images/cv3.jpg', 'Hi There, Have You Been Looking for a Brand Logo with Complete Corporate Brand Identity? Hi, I am Talha, a Passionate Professional Graphic Designer designing brand logos & brand Identity for many Years, I have successfully designed brand logos with the complete corporate brand identity for different brands around the world. I also would love to do demanded designs, Just leave your request, I will respond instantly.', 'US$10\r\nSave up to 20% with Subscribe to Save\r\nBASIC CORPORATE BRAND IDENTITY Business Card + Letterhead + Compliment Design\r\n\r\n2 Days Delivery\r\nUnlimited Revisions\r\nIncludes logo design\r\nLogo usage guidelines\r\nColor palette\r\nTypography guidelines', 4, 3, 1);
INSERT INTO `job` (`id`, `job_name`, `rate`, `salary`, `image`, `job_title`, `job_sub_title`, `job_star`, `job_type_detail_id`, `user_id`) VALUES
(4, 'I will do modern logo design with premium brand identity', 422, 35, 'https://fiverrnew.cybersoft.edu.vn/images/cv4.jpg', 'Hi There, Have You Been Looking for a Brand Logo with Complete Corporate Brand Identity? Hi, I am Talha, a Passionate Professional Graphic Designer designing brand logos & brand Identity for many Years, I have successfully designed brand logos with the complete corporate brand identity for different brands around the world. I also would love to do demanded designs, Just leave your request, I will respond instantly.', 'US$10\r\nSave up to 20% with Subscribe to Save\r\nBASIC CORPORATE BRAND IDENTITY Business Card + Letterhead + Compliment Design\r\n\r\n2 Days Delivery\r\nUnlimited Revisions\r\nIncludes logo design\r\nLogo usage guidelines\r\nColor palette\r\nTypography guidelines', 3, 3, 1);
INSERT INTO `job` (`id`, `job_name`, `rate`, `salary`, `image`, `job_title`, `job_sub_title`, `job_star`, `job_type_detail_id`, `user_id`) VALUES
(5, 'I will create an effective instagram hashtag growth strategy', 522, 20, 'https://fiverrnew.cybersoft.edu.vn/images/cv5.jpg', '\r\nHi There,\r\n\r\nHave You Been Looking for a Brand Logo with Complete Corporate Brand Identity?\r\n\r\nHi, I am Talha, a Passionate Professional Graphic Designer designing brand logos & brand Identity for many Years, I have successfully designed brand logos with the complete corporate brand identity for different brands around the world.\r\n\r\nI also would love to do demanded designs, Just leave your request, I will respond instantly.', '#40 + organic growth strategy\r\nUS$20\r\n🎯 40# + Personalized Growth Strategy + Hashtag Guide + News List & Tools + Account Optimization\r\n\r\n3 Days Delivery\r\nPage/channel evaluation\r\nAction plan', 5, 5, 1);
INSERT INTO `job` (`id`, `job_name`, `rate`, `salary`, `image`, `job_title`, `job_sub_title`, `job_star`, `job_type_detail_id`, `user_id`) VALUES
(6, 'I will design professional social media post', 55, 30, 'https://fiverrnew.cybersoft.edu.vn/images/cv6.jpg', '\r\nWelcome to our Social Media Posts Design.\r\n\r\nWe understand the client\'s needs and assist through the whole process with professionalism.\r\n\r\nWe are experienced in creating social media graphic content for clients all over the world, for business, products, and personal brands.\r\n\r\nWe can assist you to improve the appearance of your social media presence.', 'US$30\r\nSave up to 10% with Subscribe to Save\r\nBASIC 3 unique social media posts with the most attractive content that will transform your business.\r\n\r\n2 Days Delivery\r\n3 social posts created', 2, 5, 1),
(7, 'I will setup facebook and instagram ads campaign to boost your business', 53, 25, 'https://fiverrnew.cybersoft.edu.vn/images/cv7.jpg', 'Do you need a marketer with EXTREMELY WIDE experience in facebook and instagram ads? Well, you have come to the right place! I would love to boost your sales and revenue and Ensure Your Business Growth with Expertise in facebook and instagram ads. I will help you to get targeted customers and generate more QUALIFIED TRAFFIC, Leads, Message To make more sales. I will provide you a target audience with interests, behaviors, demographics and keywords', 'Starting\r\nUS$25\r\n1 Campaign setup, multiple adsets and ads + Setup Marketing Goals+ Audience Research\r\n\r\n3 Days Delivery\r\nTarget audience research\r\nPlatform: Facebook, Instagram', 5, 6, 1),
(8, 'I will create a website design for your company', 54, 10, 'https://fiverrnew.cybersoft.edu.vn/images/cv8.jpg', 'If you are looking for a new responsive Website, OR Want to redesign/modify your current website into a professional website then you are at the right place.\r\n\r\nI am expert in creating Website Design, OR Redesign/modify your current website.\r\n\r\nI will create an awesome website that will increase your online presence and your business will grow on the internet', 'Starting at $10\r\n1 Unique Web Page Design\r\n2 Revisions\r\nResponsive Design\r\nSource File\r\n\r\n1 Day Delivery\r\nResponsive Design', 5, 1, 1),
(9, 'I will create an animated promotional video', 21, 45, 'https://fiverrnew.cybersoft.edu.vn/images/cv9.jpg', 'Hi there! Are you looking for an AWESOME Animated Promotional Video? Then you are at the right place!\r\n\r\nI will create an amazing Animated Promotional Video to promote your business, product, or service.', 'Starting at $45\r\nEngaging 30 Seconds Animated Promotional Video\r\nHigh Quality 1080p HD Video\r\nScript Writing\r\nVoice Over\r\nBackground Music\r\nUnlimited Revisions\r\n\r\n2 Days Delivery\r\nEngaging Animated Promotional Video', 5, 2, 1),
(10, 'I will do modern minimalist business logo design', 26, 20, 'https://fiverrnew.cybersoft.edu.vn/images/cv10.jpg', 'Welcome to our gig, Do you need a Modern Minimalist Business Logo Design? Then you are in the right place. We can help you out! we will design unique, creative, modern, minimalist, and versatile business logo design that perfectly represents your company or brand. Our Design is minimalist, flat, and modern that will make your business grow', 'Starting at $20\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 5, 3, 1),
(11, 'I will create an awesome facebook and instagram ad', 26, 15, 'https://fiverrnew.cybersoft.edu.vn/images/cv11.jpg', 'If you are looking for a new responsive Website, OR Want to redesign/modify your current website into a professional website then you are at the right place.\r\n\r\nI am expert in creating Website Design, OR Redesign/modify your current website.\r\n\r\nI will create an awesome website that will increase your online presence and your business will grow on the internet', 'Starting\r\nUS$25\r\n1 Campaign setup, multiple adsets and ads + Setup Marketing Goals+ Audience Research\r\n\r\n3 Days Delivery\r\nTarget audience research\r\nPlatform: Facebook, Instagram', 4, 6, 1),
(12, 'I will design minimal logo with complete corporate brand identity', 22, 15, 'https://fiverrnew.cybersoft.edu.vn/images/cv12.jpg', 'Do you need a marketer with EXTREMELY WIDE experience in facebook and instagram ads? Well, you have come to the right place! I would love to boost your sales and revenue and Ensure Your Business Growth with Expertise in facebook and instagram ads. I will help you to get targeted customers and generate more QUALIFIED TRAFFIC, Leads, Message To make more sales. I will provide you a target audience with interests, behaviors, demographics and keywords', 'US$10\r\nSave up to 20% with Subscribe to Save\r\nBASIC CORPORATE BRAND IDENTITY Business Card + Letterhead + Compliment Design\r\n\r\n2 Days Delivery\r\nUnlimited Revisions\r\nIncludes logo design\r\nLogo usage guidelines\r\nColor palette\r\nTypography guidelines', 3, 3, 1),
(13, 'I will do modern logo design with premium brand identity', 64, 25, 'https://fiverrnew.cybersoft.edu.vn/images/cv13.jpg', 'If you are looking for a new responsive Website, OR Want to redesign/modify your current website into a professional website then you are at the right place.\r\n\r\nI am expert in creating Website Design, OR Redesign/modify your current website.\r\n\r\nI will create an awesome website that will increase your online presence and your business will grow on the internet', 'US$10\r\nSave up to 20% with Subscribe to Save\r\nBASIC CORPORATE BRAND IDENTITY Business Card + Letterhead + Compliment Design\r\n\r\n2 Days Delivery\r\nUnlimited Revisions\r\nIncludes logo design\r\nLogo usage guidelines\r\nColor palette\r\nTypography guidelines', 3, 3, 1),
(14, 'I will create an effective instagram hashtag growth strategy', 36, 35, 'https://fiverrnew.cybersoft.edu.vn/images/cv14.jpg', 'Welcome to our Social Media Posts Design.\r\n\r\nWe understand the client\'s needs and assist through the whole process with professionalism.\r\n\r\nWe are experienced in creating social media graphic content for clients all over the world, for business, products, and personal brands.\r\n\r\nWe can assist you to improve the appearance of your social media presence.', 'US$30\r\nSave up to 10% with Subscribe to Save\r\nBASIC 3 unique social media posts with the most attractive content that will transform your business.\r\n\r\n2 Days Delivery\r\n3 social posts created', 2, 5, 1),
(15, 'I will setup facebook and instagram ads campaign to boost your business', 71, 40, 'https://fiverrnew.cybersoft.edu.vn/images/cv15.jpg', 'Hi there! Are you looking for an AWESOME Animated Promotional Video? Then you are at the right place!\r\n\r\nI will create an amazing Animated Promotional Video to promote your business, product, or service.', 'Starting\r\nUS$25\r\n1 Campaign setup, multiple adsets and ads + Setup Marketing Goals+ Audience Research\r\n\r\n3 Days Delivery\r\nTarget audience research\r\nPlatform: Facebook, Instagram', 5, 6, 1),
(16, 'I will create a website design for your company', 23, 20, 'https://fiverrnew.cybersoft.edu.vn/images/cv16.jpg', 'Welcome to our gig, Do you need a Modern Minimalist Business Logo Design? Then you are in the right place. We can help you out! we will design unique, creative, modern, minimalist, and versatile business logo design that perfectly represents your company or brand. Our Design is minimalist, flat, and modern that will make your business grow', 'Starting at $20\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 5, 1, 1),
(17, 'I will create an animated promotional video', 65, 10, 'https://fiverrnew.cybersoft.edu.vn/images/cv17.jpg', 'Do you need a marketer with EXTREMELY WIDE experience in facebook and instagram ads? Well, you have come to the right place! I would love to boost your sales and revenue and Ensure Your Business Growth with Expertise in facebook and instagram ads. I will help you to get targeted customers and generate more QUALIFIED TRAFFIC, Leads, Message To make more sales. I will provide you a target audience with interests, behaviors, demographics and keywords', 'Starting at $45\r\nEngaging 30 Seconds Animated Promotional Video\r\nHigh Quality 1080p HD Video\r\nScript Writing\r\nVoice Over\r\nBackground Music\r\nUnlimited Revisions\r\n\r\n2 Days Delivery\r\nEngaging Animated Promotional Video', 3, 2, 1),
(18, 'I will do modern minimalist business logo design', 77, 30, 'https://fiverrnew.cybersoft.edu.vn/images/cv18.jpg', 'Welcome to our Social Media Posts Design.\r\n\r\nWe understand the client\'s needs and assist through the whole process with professionalism.\r\n\r\nWe are experienced in creating social media graphic content for clients all over the world, for business, products, and personal brands.\r\n\r\nWe can assist you to improve the appearance of your social media presence.', 'Starting at $10\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 4, 3, 1),
(19, 'I will design creative and modern business logo', 44, 20, 'https://fiverrnew.cybersoft.edu.vn/images/cv19.jpg', 'Hi there! Are you looking for an AWESOME Animated Promotional Video? Then you are at the right place!\r\n\r\nI will create an amazing Animated Promotional Video to promote your business, product, or service.', 'Starting at $15\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 5, 1, 1),
(20, 'I will design luxury minimalist business logo', 48, 25, 'https://fiverrnew.cybersoft.edu.vn/images/cv20.jpg', 'Do you need a marketer with EXTREMELY WIDE experience in facebook and instagram ads? Well, you have come to the right place! I would love to boost your sales and revenue and Ensure Your Business Growth with Expertise in facebook and instagram ads. I will help you to get targeted customers and generate more QUALIFIED TRAFFIC, Leads, Message To make more sales. I will provide you a target audience with interests, behaviors, demographics and keywords', 'Starting at $10\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 4, 1, 1),
(21, 'I will design minimalist luxury business logo', 32, 15, 'https://fiverrnew.cybersoft.edu.vn/images/cv21.jpg', 'Welcome to our Social Media Posts Design.\r\n\r\nWe understand the client\'s needs and assist through the whole process with professionalism.\r\n\r\nWe are experienced in creating social media graphic content for clients all over the world, for business, products, and personal brands.\r\n\r\nWe can assist you to improve the appearance of your social media presence.', 'Starting at $20\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 3, 3, 1),
(22, 'I will do minimalist luxury business logo design', 29, 10, 'https://fiverrnew.cybersoft.edu.vn/images/cv22.jpg', 'Welcome to our gig, Do you need a Modern Minimalist Business Logo Design? Then you are in the right place. We can help you out! we will design unique, creative, modern, minimalist, and versatile business logo design that perfectly represents your company or brand. Our Design is minimalist, flat, and modern that will make your business grow', 'Starting at $15\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 5, 3, 1),
(23, 'I will design modern minimalist luxury business logo', 39, 18, 'https://fiverrnew.cybersoft.edu.vn/images/cv23.jpg', 'Do you need a marketer with EXTREMELY WIDE experience in facebook and instagram ads? Well, you have come to the right place! I would love to boost your sales and revenue and Ensure Your Business Growth with Expertise in facebook and instagram ads. I will help you to get targeted customers and generate more QUALIFIED TRAFFIC, Leads, Message To make more sales. I will provide you a target audience with interests, behaviors, demographics and keywords', 'Starting at $20\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 4, 3, 1),
(24, 'I will design luxury modern minimalist business logo', 19, 10, 'https://fiverrnew.cybersoft.edu.vn/images/cv24.jpg', 'Welcome to our Social Media Posts Design.\r\n\r\nWe understand the client\'s needs and assist through the whole process with professionalism.\r\n\r\nWe are experienced in creating social media graphic content for clients all over the world, for business, products, and personal brands.\r\n\r\nWe can assist you to improve the appearance of your social media presence.', 'Starting at $10\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 3, 1, 1),
(25, 'I will do modern luxury minimalist business logo design', 16, 8, 'https://fiverrnew.cybersoft.edu.vn/images/cv25.jpg', 'Welcome to our gig, Do you need a Modern Minimalist Business Logo Design? Then you are in the right place. We can help you out! we will design unique, creative, modern, minimalist, and versatile business logo design that perfectly represents your company or brand. Our Design is minimalist, flat, and modern that will make your business grow', 'Starting at $15\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 2, 2, 1),
(26, 'I will do modern minimalist luxury business logo design', 22, 12, 'https://fiverrnew.cybersoft.edu.vn/images/cv26.jpg', 'Hi there! Are you looking for an AWESOME Animated Promotional Video? Then you are at the right place!\r\n\r\nI will create an amazing Animated Promotional Video to promote your business, product, or service.', 'Starting at $20\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 4, 2, 1),
(27, 'I will do creative modern minimalist business logo design', 17, 8, 'https://fiverrnew.cybersoft.edu.vn/images/cv27.jpg', 'Do you need a marketer with EXTREMELY WIDE experience in facebook and instagram ads? Well, you have come to the right place! I would love to boost your sales and revenue and Ensure Your Business Growth with Expertise in facebook and instagram ads. I will help you to get targeted customers and generate more QUALIFIED TRAFFIC, Leads, Message To make more sales. I will provide you a target audience with interests, behaviors, demographics and keywords', 'Starting at $25\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 3, 2, 1),
(28, 'I will design luxury modern minimalist business logo', 11, 5, 'https://fiverrnew.cybersoft.edu.vn/images/cv28.jpg', 'Welcome to our Social Media Posts Design.\r\n\r\nWe understand the client\'s needs and assist through the whole process with professionalism.\r\n\r\nWe are experienced in creating social media graphic content for clients all over the world, for business, products, and personal brands.\r\n\r\nWe can assist you to improve the appearance of your social media presence.', 'Starting at $30\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 2, 1, 1),
(29, 'I will do minimalist luxury modern business logo design', 14, 7, 'https://fiverrnew.cybersoft.edu.vn/images/cv29.jpg', 'Welcome to our gig, Do you need a Modern Minimalist Business Logo Design? Then you are in the right place. We can help you out! we will design unique, creative, modern, minimalist, and versatile business logo design that perfectly represents your company or brand. Our Design is minimalist, flat, and modern that will make your business grow', 'Starting at $35\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 5, 3, 1),
(30, 'I will design creative modern luxury business logo', 8, 4, 'https://fiverrnew.cybersoft.edu.vn/images/cv30.jpg', 'Do you need a marketer with EXTREMELY WIDE experience in facebook and instagram ads? Well, you have come to the right place! I would love to boost your sales and revenue and Ensure Your Business Growth with Expertise in facebook and instagram ads. I will help you to get targeted customers and generate more QUALIFIED TRAFFIC, Leads, Message To make more sales. I will provide you a target audience with interests, behaviors, demographics and keywords', 'Starting at $40\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 4, 1, 1),
(31, 'I will design luxury creative modern business logo', 7, 3, 'https://fiverrnew.cybersoft.edu.vn/images/cv31.jpg', 'Welcome to our Social Media Posts Design.\r\n\r\nWe understand the client\'s needs and assist through the whole process with professionalism.\r\n\r\nWe are experienced in creating social media graphic content for clients all over the world, for business, products, and personal brands.\r\n\r\nWe can assist you to improve the appearance of your social media presence.', 'Starting at $45\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 3, 2, 1),
(32, 'I will design creative luxury modern business logo', 5, 2, 'https://fiverrnew.cybersoft.edu.vn/images/cv32.jpg', 'Welcome to our gig, Do you need a Modern Minimalist Business Logo Design? Then you are in the right place. We can help you out! we will design unique, creative, modern, minimalist, and versatile business logo design that perfectly represents your company or brand. Our Design is minimalist, flat, and modern that will make your business grow', 'Starting at $50\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 2, 2, 1),
(33, 'I will design modern minimalist luxury business logo', 3, 2, 'https://fiverrnew.cybersoft.edu.vn/images/cv33.jpg', 'Hi there! Are you looking for an AWESOME Animated Promotional Video? Then you are at the right place!\r\n\r\nI will create an amazing Animated Promotional Video to promote your business, product, or service.', 'Starting at $55\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 4, 3, 1),
(34, 'I will design creative minimalist business logo', 2, 1, 'https://fiverrnew.cybersoft.edu.vn/images/cv34.jpg', 'Do you need a marketer with EXTREMELY WIDE experience in facebook and instagram ads? Well, you have come to the right place! I would love to boost your sales and revenue and Ensure Your Business Growth with Expertise in facebook and instagram ads. I will help you to get targeted customers and generate more QUALIFIED TRAFFIC, Leads, Message To make more sales. I will provide you a target audience with interests, behaviors, demographics and keywords', 'Starting at $60\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 3, 2, 1),
(35, 'I will do minimalist luxury modern business logo design', 1, 1, 'https://fiverrnew.cybersoft.edu.vn/images/cv35.jpg', 'Welcome to our Social Media Posts Design.\r\n\r\nWe understand the client\'s needs and assist through the whole process with professionalism.\r\n\r\nWe are experienced in creating social media graphic content for clients all over the world, for business, products, and personal brands.\r\n\r\nWe can assist you to improve the appearance of your social media presence.', 'Starting at $65\r\n1 Logo Design Concept\r\nHigh-Resolution Files\r\n3D Mockup\r\nVector Files\r\nSource Files\r\n\r\n2 Days Delivery\r\nHigh-Resolution', 2, 1, 1),
(36, 'string', 0, 0, 'string', 'string', 'string', 0, 3, 2);

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
(10, 'Test10'),
(11, 'test');

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
(15, 'string', 'test15', 2);

INSERT INTO `jobTypeDetailList` (`id`, `job_type_detail_id`, `detail_name`) VALUES
(1, 1, 'Short Video Ads');
INSERT INTO `jobTypeDetailList` (`id`, `job_type_detail_id`, `detail_name`) VALUES
(2, 1, 'Social Media Videos');
INSERT INTO `jobTypeDetailList` (`id`, `job_type_detail_id`, `detail_name`) VALUES
(3, 2, 'Video Editing');
INSERT INTO `jobTypeDetailList` (`id`, `job_type_detail_id`, `detail_name`) VALUES
(4, 2, 'Visual Effects'),
(5, 3, 'Producers & Composers'),
(6, 3, 'Songwriters'),
(7, 4, 'Articles & Blog Posts'),
(8, 5, 'Social Media Advertising'),
(9, 5, 'Video Editing'),
(10, 5, 'Visual Effects'),
(11, 6, 'Articles & Blog Posts'),
(12, 6, 'Music Production & Writing'),
(13, 7, 'Video Editing'),
(14, 7, 'Producers & Composers'),
(15, 8, 'Social Media Advertising'),
(16, 8, 'Visual Effects'),
(17, 9, 'Social Media Videos'),
(18, 9, 'Video Editing'),
(19, 10, 'Short Video Ads'),
(20, 10, 'Songwriters'),
(21, 10, 'Visual Effects'),
(22, 10, 'string');

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `gender`, `role`, `skill`, `certification`) VALUES
(1, 'Test1', 'test1@gmail.com', '1234', '639-998-8863', '2024-03-24 00:00:00', 'M', 'member', NULL, NULL);
INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `birthday`, `gender`, `role`, `skill`, `certification`) VALUES
(2, 'string', 'test2@gmail.com', '1234', '6399988865', '2024-03-24 00:00:00', 'M', 'member', NULL, NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;