--GO TO my.ini CONFIGURATION FILE OF DATABASE AND MAKE THE FOLLOWING CHANGE:
--max_allowed_packet = 128*1024*1024

DROP DATABASE IF EXISTS bank;

CREATE DATABASE bank;

USE bank;


-- user table structure
CREATE TABLE users(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    token VARCHAR(200) NULL,
    code INT NULL,
    verified INT DEFAULT 0,
    verified_at DATETIME,
    created_at TIMESTAMP,
    updated_at TIMESTAMP DEFAULT NOW()
);

-- bank accounts table structure
CREATE TABLE accounts(
	account_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    account_number VARCHAR(100) NOT NULL,
    account_name VARCHAR(50) NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    balance DECIMAL(18, 2) DEFAULT 0.00,
    created_at TIMESTAMP,
    updated_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- transaction history table
CREATE TABLE transaction_history(
	transaction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50) NOT NULL,
    amount DECIMAL(18, 2),
    source VARCHAR(50) NULL,
    status VARCHAR(50) NULL,
    reason_code VARCHAR(100) NULL,
    created_at TIMESTAMP,
    FOREIGN KEY(account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);

--  payment table structure
CREATE TABLE payments(
	payment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    beneficiary VARCHAR(50) NULL,
    beneficiary_acc_no VARCHAR(200) NULL,
    amount DECIMAL(18, 2) NULL,
    reference_no VARCHAR(100) NULL,
    status VARCHAR(50) NULL,
    reason_code VARCHAR(100) NULL,
    created_at TIMESTAMP,
    FOREIGN KEY(account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);

-- transaction history view
CREATE VIEW v_transaction_history
AS
	SELECT t.transaction_id, a.account_id, u.user_id, t.transaction_type, t.amount, t.source, t.status, t.reason_code, t.created_at
	FROM transaction_history AS t
	INNER JOIN accounts AS a
	ON t.account_id = a.account_id
	INNER JOIN users as u
	ON a.user_Id = u.user_id;

-- payment history view 
CREATE VIEW v_payments 
AS
	SELECT p.payment_id, a.account_id, u.user_id, p.beneficiary, p.beneficiary_acc_no, p.amount, p.status, p.reference_no, p.reason_code, p.created_at	
	FROM payments AS p
	INNER JOIN accounts as a
	ON p.account_id = a.account_id
	INNER JOIN users as u
	ON u.user_id = a.user_id;
    
select * from v_transaction_history;

select * from v_payments;


-- ADMIN TABLE CREATION

-- department table
CREATE TABLE department (
	department_id INT PRIMARY KEY,
	department_name INT NOT NULL,
	department_head VARCHAR(255) NOT NULL,
	department_description VARCHAR(255));

--branch table
CREATE TABLE branch (
	branch_id INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL,
	state VARCHAR(255) NOT NULL,
	contact VARCHAR(255) NOT NULL,
	manager_id VARCHAR(255) NOT NULL);

--employee table
CREATE TABLE employee (
  	employee_id INT PRIMARY KEY,
  	first_name VARCHAR(100) NOT NULL,
  	last_name VARCHAR(100) NOT NULL,
  	email VARCHAR(100) NOT NULL,
  	contact VARCHAR(20) NOT NULL,
  	address VARCHAR(255) NOT NULL,
  	city VARCHAR(100) NOT NULL,
  	state VARCHAR(100) NOT NULL,
  	postal_code VARCHAR(20) NOT NULL,
  	hire_date DATE NOT NULL,
  	age INT NOT NULL,
  	gender VARCHAR(50) NOT NULL,
  	marital_status VARCHAR(100) NOT NULL,
  	education_level VARCHAR(100) NOT NULL,
  	primary_language VARCHAR(100) NOT NULL,
  	subsidiary_language VARCHAR(255) NOT NULL,
  	employee_type VARCHAR(100) NOT NULL,
  	employee_status VARCHAR(100) NOT NULL,
  	job_title VARCHAR(100) NOT NULL,
	salary DECIMAL(10, 2) NOT NULL,
	department_id INT NOT NULL,
  	branch_id INT NOT NULL
  	manager_id INT,
  	FOREIGN_KEY(manager_id) REFERENCES employee(employee_id),
	FOREIGN_KEY(department_id) REFERENCES department(department_id),
	FOREIGN_KEY(branch_id) REFERENCES branch(branch_id));


