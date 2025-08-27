create user student with password "studentpassword" SUPERUSER;
create schema devops4;
create table devops4.employees (
	id serial not null  primary key,
	name text not null,
	position text not null
);
INSERT INTO devops4.employees (name, position)
VALUES
('Olena', 'junior'),
('Dmytro', 'middle'),
('Kateryna', 'senior');
create table devops4.projects (
	id serial primary key,
	name text not null,
	description text,
	start_date date,
	end_date date,
	status varchar,
	responsible_id int,
	constraint fk_responsible foreign key (responsible_id)
		references devops4.employees(id)
);
INSERT INTO devops4.projects (name, description, start_date, end_date, status, responsible_id)
VALUES
('Website Redesign', 'Повний редизайн корпоративного сайту', '2025-09-01', '2025-12-01', 'active', 1),
('Internal Tool', 'Розробка внутрішнього інструменту для DevOps', '2025-08-15', '2025-11-15', 'planned', 3),
('Data Migration', 'Міграція даних на нову базу', '2025-07-01', '2025-10-01', 'completed', 2);

