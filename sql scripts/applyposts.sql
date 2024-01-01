use finding_jobs_website_project;


select * from applyposts;
SELECT user_id FROM applyposts where recruitment_id = 1 GROUP BY user_id ;
ALTER TABLE applyposts AUTO_INCREMENT = 1;
update applyposts set status = 0 where id > 0;
delete from applyposts where id > 0;

create table applyposts (
	id INT primary key auto_increment,
    created_at date,
    status INT,
    recruitment_id INT,
    user_id INT,
    name_cv VARCHAR(255),
    text varchar(255)
);