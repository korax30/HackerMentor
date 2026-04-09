CREATE DATABASE IF NOT EXISTS social;

CREATE USER IF NOT EXISTS 'socialuser'@'localhost' IDENTIFIED BY 'password123';

GRANT ALL PRIVILEGES ON social.* TO 'socialuser'@'localhost';
FLUSH PRIVILEGES;
