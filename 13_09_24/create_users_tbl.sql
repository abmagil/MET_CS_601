create table users
(
 user_id int(8) primary key auto_increment,
 email varchar(255) not null,
 password varchar(515) not null
) engine=INNODB;