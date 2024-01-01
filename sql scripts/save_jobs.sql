use finding_jobs_website_project;

select * from save_jobs;

ALTER TABLE save_jobs AUTO_INCREMENT = 1;
delete from save_jobs where id > 0;

drop table save_jobs;


create table save_jobs (
	id INT primary key auto_increment,
    recruitment_id int,
    user_id int
);