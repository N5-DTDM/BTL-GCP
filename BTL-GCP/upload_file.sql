create database upload_file;

use upload_file;

create table documents(
	id int primary key auto_increment,
    title nvarchar(50),
    url nvarchar(200),
    content nvarchar(10000)
);
