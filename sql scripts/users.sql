use finding_jobs_website_project;

select * from finding_jobs_website_project.users;

ALTER TABLE users MODIFY image mediumblob;

ALTER TABLE users CHANGE cv_id cv mediumblob;

CREATE TABLE users (
    id INT PRIMARY KEY auto_increment,
    address VARCHAR(255),
    description VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    full_name VARCHAR(255),
    image VARCHAR(255),
    password VARCHAR(128),
    phone_number VARCHAR(15),
    status INT,
    role_id INT,
    cv_id INT
);