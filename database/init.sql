CREATE DATABASE IF NOT EXISTS demo_vault;
USE demo_vault;

CREATE TABLE IF NOT EXISTS `users` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT
);

INSERT INTO `users` (full_name, age) VALUES ('Cristiano Ronaldo', 38);
INSERT INTO `users` (full_name, age) VALUES ('Lionel Messi', 36);