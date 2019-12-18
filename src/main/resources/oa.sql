-- 创建管理用户表
CREATE TABLE USER(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(40),
	PASSWORD VARCHAR(20)
);

SELECT * FROM USER;

INSERT INTO USER VALUES(NULL,"张三","123456");
INSERT INTO USER VALUES(NULL,"root","123456");

-- 创建部门表
CREATE TABLE department(
	dep_id INT PRIMARY KEY AUTO_INCREMENT,
	dep_name VARCHAR(50),
	dep_num INT
);

SELECT * FROM department;

INSERT INTO department VALUES(1,"技术部",3);
INSERT INTO department VALUES(2,"销售部",4);

-- 创建员工表
CREATE TABLE employee(
	emp_id INT PRIMARY KEY AUTO_INCREMENT,
	emp_name VARCHAR(40),
	emp_position VARCHAR(50),
	emp_gender VARCHAR(10),
	emp_age INT,
	dep_id INT
);

SELECT * FROM employee;

INSERT INTO employee VALUES(NULL,"张三","部长","男",22,1);
INSERT INTO employee VALUES(NULL,"李四","员工","女",19,1);
INSERT INTO employee VALUES(NULL,"王五","员工","女",27,1);