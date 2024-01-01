use finding_jobs_website_project;

select * from recruitments;
SELECT * FROM recruitments WHERE title like '%Software%';
ALTER TABLE recruitments AUTO_INCREMENT = 1;

delete from recruitments where id > 0;


drop table recruitments;

CREATE TABLE recruitments (
    id INT primary key auto_increment,
    address VARCHAR(255),
    created_at date,
    description VARCHAR(255),
    experience VARCHAR(255),
    quantity INT,
    rankString VARCHAR(255),
    salary VARCHAR(255),
    status INT,
    title VARCHAR(255),
    type VARCHAR(255),
    view INT,
    category_id INT,
    company_id INT,
    deadline VARCHAR(255)
);
