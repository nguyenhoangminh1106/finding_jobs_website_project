use finding_jobs_website_project;

select * from follow_companies;

ALTER TABLE follow_companies AUTO_INCREMENT = 1;
delete from follow_companies where id > 0;

create table follow_companies (
	id INT primary key auto_increment,
    company_id int,
    user_id int
);