CREATE TABLE `posts` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`content` TEXT NOT NULL,
	`published_at` TIMESTAMP NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tags` (
	`id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`title` varchar(32) NOT NULL UNIQUE,
	`created_at` TIMESTAMP NOT NULL AUTO_INCREMENT UNIQUE,
	`updated_at` TIMESTAMP NOT NULL AUTO_INCREMENT UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `post_tag` (
	`id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`post_id` int NOT NULL,
	`tag_id` int NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`post_id`,`tag_id`)
);

CREATE TABLE `likes` (
	`id` int NOT NULL AUTO_INCREMENT,
	`model` varchar(32) NOT NULL,
	`type` enum NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
	`id` int NOT NULL AUTO_INCREMENT,
	`fullname` varchar(64) NOT NULL,
	`username` varchar(32) NOT NULL UNIQUE,
	`email` varchar(128) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`phonenumber` varchar(32) NOT NULL UNIQUE,
	`country_id` int NOT NULL,
	`language_id` int NOT NULL,
	`sec_id` varchar(255) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `countries` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	`langcode` varchar(6) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `languages` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	`langcode` varchar(6) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `secs` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL UNIQUE,
	`recovery_email` varchar(128) NOT NULL UNIQUE,
	`recovery_phonenumber` varchar(32) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `secqs` (
	`id` int NOT NULL AUTO_INCREMENT,
	`content` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sec_secq` (
	`id` int NOT NULL,
	`sec_id` int NOT NULL,
	`secq_id` int NOT NULL,
	PRIMARY KEY (`sec_id`,`secq_id`)
);

CREATE TABLE `secas` (
	`id` int NOT NULL AUTO_INCREMENT,
	`content` varchar(255) NOT NULL,
	`secq_id` int(255) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sec_seca` (
	`id` int NOT NULL,
	`sec_id` int NOT NULL,
	`seca_id` int NOT NULL,
	PRIMARY KEY (`sec_id`,`seca_id`)
);

CREATE TABLE `settings` (
	`id` int NOT NULL AUTO_INCREMENT,
	`key` varchar(64) NOT NULL UNIQUE,
	`type` enum NOT NULL,
	`title` varchar(32) NOT NULL,
	`description` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `profile` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL UNIQUE,
	`avatar` varchar(255) NOT NULL,
	`cover` varchar(255),
	`profilename` varchar(32) NOT NULL UNIQUE,
	`description` TEXT(500),
	`tagline` varchar(255),
	`email` varchar(255),
	`website` varchar(255),
	`country_id` varchar(255),
	`birthday` DATETIME,
	`occupation` varchar(32),
	`status` enum,
	PRIMARY KEY (`id`)
);

CREATE TABLE `badges` (
	`id` int NOT NULL AUTO_INCREMENT,
	`title` varchar(32) NOT NULL,
	`icon` varchar(32) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `badge_profile` (
	`id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`badge_id` int NOT NULL UNIQUE,
	`profile_id` int NOT NULL UNIQUE,
	PRIMARY KEY (`badge_id`,`profile_id`)
);

CREATE TABLE `socials` (
	`id` int NOT NULL AUTO_INCREMENT,
	`profile_id` int NOT NULL UNIQUE,
	`configration_id` int NOT NULL UNIQUE,
	`title` varchar(32) NOT NULL,
	`content` varchar(128) NOT NULL,
	`configuration_id` int NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `configurations` (
	`id` int NOT NULL AUTO_INCREMENT,
	`key` varchar(255) NOT NULL,
	`title` varchar(64) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `configuration_setting` (
	`id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`configuration_id` int NOT NULL,
	`setting_id` int NOT NULL UNIQUE,
	PRIMARY KEY (`configuration_id`,`setting_id`)
);

CREATE TABLE `notifications` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL UNIQUE,
	`source_id` int NOT NULL UNIQUE,
	`title` varchar(255) NOT NULL,
	`icon` varchar(255) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `friends` (
	`id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`main_id` int NOT NULL,
	`sidekick_id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`deactivate` BOOLEAN NOT NULL DEFAULT false,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`main_id`,`sidekick_id`)
);

CREATE TABLE `followers` (
	`id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`main_id` int NOT NULL UNIQUE,
	`sidekick_id` int NOT NULL AUTO_INCREMENT UNIQUE,
	`deactivate` BOOLEAN NOT NULL DEFAULT false,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`main_id`,`sidekick_id`)
);

CREATE TABLE `friend_requests` (
	`id` int NOT NULL,
	`main_id` int NOT NULL,
	`sidekick_id` int NOT NULL,
	`status` enum,
	PRIMARY KEY (`main_id`,`sidekick_id`)
);

ALTER TABLE `post_tag` ADD CONSTRAINT `post_tag_fk0` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `post_tag` ADD CONSTRAINT `post_tag_fk1` FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_fk0` FOREIGN KEY (`country_id`) REFERENCES `countries`(`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_fk1` FOREIGN KEY (`language_id`) REFERENCES `languages`(`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_fk2` FOREIGN KEY (`sec_id`) REFERENCES `secs`(`id`);

ALTER TABLE `secs` ADD CONSTRAINT `secs_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `sec_secq` ADD CONSTRAINT `sec_secq_fk0` FOREIGN KEY (`sec_id`) REFERENCES `secs`(`id`);

ALTER TABLE `sec_secq` ADD CONSTRAINT `sec_secq_fk1` FOREIGN KEY (`secq_id`) REFERENCES `secqs`(`id`);

ALTER TABLE `secas` ADD CONSTRAINT `secas_fk0` FOREIGN KEY (`secq_id`) REFERENCES `secqs`(`id`);

ALTER TABLE `sec_seca` ADD CONSTRAINT `sec_seca_fk0` FOREIGN KEY (`sec_id`) REFERENCES `secs`(`id`);

ALTER TABLE `sec_seca` ADD CONSTRAINT `sec_seca_fk1` FOREIGN KEY (`seca_id`) REFERENCES `secas`(`id`);

ALTER TABLE `profile` ADD CONSTRAINT `profile_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `profile` ADD CONSTRAINT `profile_fk1` FOREIGN KEY (`country_id`) REFERENCES `countries`(`id`);

ALTER TABLE `badge_profile` ADD CONSTRAINT `badge_profile_fk0` FOREIGN KEY (`badge_id`) REFERENCES `badges`(`id`);

ALTER TABLE `badge_profile` ADD CONSTRAINT `badge_profile_fk1` FOREIGN KEY (`profile_id`) REFERENCES `profile`(`id`);

ALTER TABLE `socials` ADD CONSTRAINT `socials_fk0` FOREIGN KEY (`profile_id`) REFERENCES `profile`(`id`);

ALTER TABLE `socials` ADD CONSTRAINT `socials_fk1` FOREIGN KEY (`configration_id`) REFERENCES ``(``);

ALTER TABLE `socials` ADD CONSTRAINT `socials_fk2` FOREIGN KEY (`configuration_id`) REFERENCES `configurations`(`id`);

ALTER TABLE `configuration_setting` ADD CONSTRAINT `configuration_setting_fk0` FOREIGN KEY (`configuration_id`) REFERENCES `configurations`(`id`);

ALTER TABLE `configuration_setting` ADD CONSTRAINT `configuration_setting_fk1` FOREIGN KEY (`setting_id`) REFERENCES `settings`(`id`);

ALTER TABLE `notifications` ADD CONSTRAINT `notifications_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `notifications` ADD CONSTRAINT `notifications_fk1` FOREIGN KEY (`source_id`) REFERENCES `users`(`id`);

ALTER TABLE `friends` ADD CONSTRAINT `friends_fk0` FOREIGN KEY (`main_id`) REFERENCES `users`(`id`);

ALTER TABLE `friends` ADD CONSTRAINT `friends_fk1` FOREIGN KEY (`sidekick_id`) REFERENCES `users`(`id`);

ALTER TABLE `followers` ADD CONSTRAINT `followers_fk0` FOREIGN KEY (`main_id`) REFERENCES `users`(`id`);

ALTER TABLE `followers` ADD CONSTRAINT `followers_fk1` FOREIGN KEY (`sidekick_id`) REFERENCES `users`(`id`);

ALTER TABLE `friend_requests` ADD CONSTRAINT `friend_requests_fk0` FOREIGN KEY (`main_id`) REFERENCES `users`(`id`);

ALTER TABLE `friend_requests` ADD CONSTRAINT `friend_requests_fk1` FOREIGN KEY (`sidekick_id`) REFERENCES `users`(`id`);
