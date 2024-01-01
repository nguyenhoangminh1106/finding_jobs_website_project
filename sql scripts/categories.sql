use finding_jobs_website_project;

select * from categories;
select id from categories where name = 'IT';

CREATE TABLE categories (
    id INT primary key auto_increment,
    name VARCHAR(255),
    number_choose int
);

insert into categories (name) values 
('Executive'),
('Financial'),
('IT'),
('Marketing'),
('Operations'),
('Human resources'),
('Product'),
('Sales'),
('Business'),
('Partnership');