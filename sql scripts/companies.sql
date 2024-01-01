use finding_jobs_website_project;

select * from companies;
ALTER TABLE companies AUTO_INCREMENT = 1;

ALTER TABLE companies MODIFY logo mediumblob;

delete from companies where id > 0;

CREATE TABLE companies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    description VARCHAR(255),
    email VARCHAR(255),
    logo VARCHAR(255),
    nameCompany VARCHAR(255),
    phoneNumber VARCHAR(15),
    status INT,
    user_id INT
);

