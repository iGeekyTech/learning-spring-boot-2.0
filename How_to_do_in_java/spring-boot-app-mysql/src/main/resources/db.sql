SET SQL_SAFE_UPDATES = 0;

CREATE TABLE `articles` (
	`article_id` INT(5) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(200) NOT NULL,
	`category` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`article_id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB; 


INSERT INTO `test`.`articles` (`article_id`, `title`, `category`) VALUES
 
(1, 'Java Concurrency', 'Java'),
	
(2, 'Spring Boot Getting Started', 'Spring Boot'),
        
(3, 'Spring Cloud Tutorials', 'Spring Cloud'),
	
(4, 'Spring Cloud Microservices', 'Spring Microservices')
; 
