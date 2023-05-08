CREATE TABLE employee (
  	employee_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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
  	branch_id INT NOT NULL,
  	manager_id INT,
	FOREIGN KEY(manager_id) REFERENCES department(manager_id),
	FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE CASCADE,
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE);

CREATE TABLE department (
	department_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	department_name VARCHAR(255) NOT NULL,
	department_head VARCHAR(255) NOT NULL,
	department_description VARCHAR(255));

CREATE TABLE branch (
	branch_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL,
	state VARCHAR(255) NOT NULL,
	contact VARCHAR(255) NOT NULL,
	manager_id INT NOT NULL,
	FOREIGN KEY(manager_id) REFERENCES employee(employee_id));


INSERT INTO department (department_name, department_head, department_description) VALUES 
('Accounting', 'Deepak Kumar', 'Responsible for maintaining the financial records and transactions of the bank.'),
('Audit', 'Rajat Sharma', 'Responsible for monitoring and ensuring compliance with the bank\'s policies and procedures.'),
('Branch Operations', 'Neeraj Verma', 'Responsible for managing the day-to-day operations of the bank branch.'),
('Customer Service', 'Priya Sharma', 'Responsible for providing high-quality customer service and support to clients.'),
('Finance', 'Amit Patel', 'Responsible for managing the bank\'s financial resources and investments.'),
('Human Resources', 'Sonia Gupta', 'Responsible for managing employee relations, recruitment, and compensation.'),
('Information Technology', 'Vikram Singh', 'Responsible for managing the bank\'s technology infrastructure and systems.'),
('Marketing', 'Amita Singh', 'Responsible for creating and executing marketing strategies to promote bank services and products.'),
('Sales', 'Sudhir Gupta', 'Responsible for generating revenue and sales for the bank.');



INSERT INTO branch (name, address, city, state, contact, manager_id) VALUES
('Mumbai Central', 'Cathedral Road, Dadar', 'Mumbai', 'Maharashtra', '9876543210', 23),
('Hyderabad Central', 'Sapphire Street, Banjara Hills', 'Hyderabad', 'Telangana', '4078901234', 53),
('Ahmedabad West', 'Skyline Heights, CG Road', 'Ahmedabad', 'Gujarat', '7989012345', 17),
('Pune East', 'Coral Avenue, Koregaon Park', 'Pune', 'Maharashtra', '2090123456', 82),
('Chandigarh City', 'Royal Gardens, Sector 17', 'Chandigarh', 'Punjab', '1723456789', 64),
('New Delhi Main', 'Diamond Drive, Connaught Place', 'New Delhi', 'Delhi', '1123456789', 77),
('Coimbatore West', 'Silver Springs, Race Course Road', 'Coimbatore', 'Tamil Nadu', '4228901234', 59);



-- insert employees for accountant department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Akash', 'Gupta', 'akash.gupta@gmail.com', '9876543210', '10, MG Road', 'Bangalore', 'Karnataka', '560001', '2022-05-01', 27, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Financial Analyst', 75000, 1, 8),
('Amit', 'Shah', 'amit.shah@gmail.com', '9876543211', '11, Nehru Road', 'Mumbai', 'Maharashtra', '400001', '2022-05-01', 29, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Accountant', 45000, 1, 1),
('Shruti', 'Patil', 'shruti.patil@gmail.com', '9876543212', '12, Karve Road', 'Pune', 'Maharashtra', '411001', '2022-05-01', 25, 'Female', 'Single', 'Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Accountant', 40000, 1, 1),
('Rajesh', 'Kumar', 'rajesh.kumar@gmail.com', '9876543213', '13, MG Road', 'Hyderabad', 'Telangana', '500001', '2022-05-01', 28, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Tax Manager', 80000,1, 2),
('Manpreet', 'Kaur', 'manpreet.kaur@gmail.com', '9876543214', '14, Ferozepur Road', 'Ludhiana', 'Punjab', '141001', '2022-05-01', 26, 'Female', 'Single', 'Graduate', 'Punjabi', 'English', 'Part Time', 'Active', 'Accountant', 25000,1 , 5),
('Rahul', 'Verma', 'rahul.verma@gmail.com', '9876543215', '15, Connaught Place', 'New Delhi', 'Delhi', '110001', '2022-05-01', 24, 'Male', 'Single', 'Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Accountant', 40000,1 , 6),
('Priya', 'Singh', 'priya.singh@gmail.com', '9876543216', '16, MG Road', 'Chennai', 'Tamil Nadu', '600001', '2022-05-01', 27, 'Female', 'Married', 'Post Graduate', 'Tamil', 'English', 'Full Time', 'Active', 'Financial Reporting Manager', 75000, 1, 7),
('Aarav', 'Kapoor', 'aarav.kapoor@gmail.com', '9876543210', '12, Ravi Road', 'Pune', 'Maharashtra', '400001', '2022-05-01', 25, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Bookkeeper', 40000, 1, 4),
('Isha', 'Chopra', 'isha.chopra@gmail.com', '9876543211', '8, Jaya Nagar', 'Hyderabad', 'Telangana', '500001', '2022-05-01', 29, 'Female', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Treasury Analyst', 75000, 1, 2),
('Anika', 'Jain', 'anika.jain@gmail.com', '9876543212', '9, Shanti Park', 'Ahmedabad', 'Gujarat', '380001', '2022-05-01', 27, 'Female', 'Married', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Tax Compliance Officer', 55000, 1, 3),
('Rajat', 'Singh', 'rajat.singh@gmail.com', '9876543213', '15, GT Road', 'Amritsar', 'Punjab', '143001', '2022-05-01', 28, 'Male', 'Married', 'Post Graduate', 'Punjabi', 'English', 'Full Time', 'Active', 'Tax Counsel', 30000, 1, 5),
('Mira', 'Rao', 'mira.rao@gmail.com', '9876543214', '7, Pooja Nagar', 'Delhi', 'Delhi', '110001', '2022-05-01', 26, 'Female', 'Single', 'Graduate', 'Hindi', 'English', 'Part Time', 'Active', 'Accountant Manager', 90000, 1, 6),
('Aryan', 'Kumar', 'aryan.kumar@gmail.com', '9876543215', '14, Anna Salai', 'Chennai', 'Tamil Nadu', '600001', '2022-05-01', 24, 'Male', 'Single', 'Graduate', 'Tamil', 'English', 'Full Time', 'Active', 'Finance Manager', 85000, 2, 7);



-- insert employees for audit department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Kirti', 'Shah', 'kirti.shah@gmail.com', '9876543217', '17, Bapu Nagar', 'Ahmedabad', 'Gujarat', '380024', '2022-05-02', 26, 'Female', 'Single', 'Graduate', 'Gujarati', 'English', 'Part Time', 'Active', 'Internal Auditor', 28000, 2, 3),
('Ankit', 'Nair', 'ankit.nair@gmail.com', '9876543218', '18, Park Street', 'Pune', 'Maharashtra', '700016', '2022-05-02', 30, 'Male', 'Married', 'Post Graduate', 'Bengali', 'English', 'Full Time', 'Active', 'External Auditor', 55000, 2, 10),
('Nisha', 'Rastogi', 'nisha.rastogi@gmail.com', '9876543219', '19, Shastri Nagar', 'Pune', 'Maharashtra', '302016', '2022-05-02', 28, 'Female', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'IT Auditor', 40000, 2, 12),
('Rahul', 'Saxena', 'rahul.saxena@gmail.com', '9876543220', '20, DLF Phase-1', 'Pune', 'Maharashtra', '122002', '2022-05-02', 29, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Audit Supervisor', 75000, 2, 9),
('Akanksha', 'Pathak', 'akanksha.pathak@gmail.com', '9876543221', '21, Tilak Nagar', 'Mumbai', 'Maharashtra', '400089', '2022-05-02', 25, 'Female', 'Single', 'Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Quality Control Auditor', 50000, 2, 1),
('Amitabh', 'Kumar', 'amitabh.Kumar@gmail.com', '9876543222', '22, Sector-16', 'Noida', 'New Delhi', '201301', '2022-05-02', 27, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Financial Auditor', 70000, 2, 11),
('Sneha', 'Yadav', 'sneha.Yadav@gmail.com', '9876543223', '23, Civil Lines', 'Jalandhar', 'Punjab', '144001', '2022-05-02', 28, 'Female', 'Married', 'Graduate', 'Punjabi', 'English', 'Part Time', 'Active', 'Audit Manager', 30000, 2, 5);



-- insert employees for operation department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Ravi', 'Narang', 'ravi.narang@gmail.com', '9876543224', '24, Ashok Vihar', 'Delhi', 'Delhi', '110052', '2022-05-03', 32, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Teller', 40000, 3, 1),
('Sneha', 'Mehta', 'sneha.mehta@gmail.com', '9876543225', '25, Kandivali', 'Mumbai', 'Maharashtra', '400101', '2022-05-03', 29, 'Female', 'Single', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Teller', 40000, 3, 1),
('Aditya', 'Joshi', 'aditya.joshi@gmail.com', '9876543226', '26, Maninagar', 'Ahmedabad', 'Gujarat', '380008', '2022-05-03', 27, 'Male', 'Single', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Teller', 40000, 3, 3),
('Simran', 'Mehra', 'simran.mehra@gmail.com', '9876543227', '27, Sector-23', 'Pune', 'Maharashtra', '122022', '2022-05-03', 24, 'Female', 'Single', 'Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Teller', 40000, 3, 9),
('Rajesh', 'Bhatia', 'rajesh.bhatia@gmail.com', '9876543228', '28, Model Town', 'Ludhiana', 'Punjab', '141002', '2022-05-03', 35, 'Male', 'Married', 'Post Graduate', 'Punjabi', 'English', 'Full Time', 'Active', 'Teller', 40000, 3, 5),
('Priya', 'Chawla', 'priya.chawla@gmail.com', '9876543229', '29, Malviya Nagar', 'Pune', 'Maharashtra', '302017', '2022-05-03', 26, 'Female', 'Single', 'Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Teller', 45000, 3, 1),
('Rakesh', 'Sharma', 'rakesh.sharma@gmail.com', '9876543230', '30, Nehru Nagar', 'Pune', 'Maharashtra', '201001', '2022-05-03', 31, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Payment Analyst', 66000, 3, 1),
('Sahil', 'Malhotra', 'sahil.malhotra@gmail.com', '9876543211', '11, Green Park', 'Delhi', 'Delhi', '110016', '2022-05-02', 27, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Loan Analyst', 55000, 3, 10),
('Rohit', 'Patel', 'rohit.patel@gmail.com', '9876543212', '12, Maninagar', 'Ahmedabad', 'Gujarat', '380008', '2022-05-02', 28, 'Male', 'Single', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Teller', 40000, 3, 3),
('Deepika', 'Singh', 'deepika.singh@gmail.com', '9876543213', '13, Powai', 'Mumbai', 'Maharashtra', '400076', '2022-05-02', 29, 'Female', 'Married', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Operations Manager', 80000, 3, 12),
('Jaspreet', 'Kaur', 'jaspreet.Kaur@gmail.com', '9876543214', '14, MG Road', 'Pune', 'Maharashtra', '411001', '2022-05-02', 32, 'Female', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Senior Branch Manager', 85000, 3, 9),
('Praveen', 'Shetty', 'praveen.Shetty@gmail.com', '9876543214', '14, MG Road', 'Pune', 'Maharashtra', '411001', '2022-05-02', 32, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Branch Manager', 110000, 3, 9);



-- insert employees for finance department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Pallavi', 'Ahuja', 'pallavi.ahuja@gmail.com', '9876543201', '1, Green Park', 'Delhi', 'Delhi', '110016', '2022-05-02', 26, 'Female', 'Single', 'Graduate', 'Hindi', 'English', 'Part Time', 'Active', 'Investment Banking Analyst', 70000, 6, 11),
('Rajat', 'Verma', 'rajat.verma@gmail.com', '9876543202', '2, Shankar Nagar', 'Nagpur', 'Maharashtra', '440010', '2022-05-02', 30, 'Male', 'Married', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Investment Banking Associate', 85000, 6, 10),
('Arjun', 'Kapoor', 'arjun.kapoor@gmail.com', '9876543203', '3, Ellis Road', 'Chennai', 'Tamil Nadu', '600002', '2022-05-02', 28, 'Male', 'Single', 'Post Graduate', 'Tamil', 'English', 'Full Time', 'Active', 'Asset Management', 75000, 6, 12),
('Tanvi', 'Singh', 'tanvi.singh@gmail.com', '9876543204', '4, Model Town', 'Ludhiana', 'Punjab', '141002', '2022-05-02', 29, 'Female', 'Married', 'Post Graduate', 'Punjabi', 'English', 'Full Time', 'Active', 'Corporate Banking Analyst', 50000, 6, 9),
('Arun', 'Shah', 'arun.shah@gmail.com', '9876543205', '5, Satellite Road', 'Ahmedabad', 'Gujarat', '380015', '2022-05-02', 25, 'Male', 'Single', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Equity Research', 80000, 6, 1),
('Shreya', 'Kumar', 'shreya.kumar@gmail.com', '9876543206', '6, Jubilee Hills', 'Hyderabad', 'Telangana', '500033', '2022-05-02', 27, 'Female', 'Single', 'Post Graduate', 'Telugu', 'English', 'Full Time', 'Active', 'Capital Markets Associate', 70000, 6, 5),
('Neha', 'Shukla', 'neha.shukla@gmail.com', '9876543229', '29, RJ Road', 'Pune', 'Maharashtra', '411001', '2022-05-02', 25, 'Female', 'Single', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Derivatives Analyst', 85000, 6, 15),
('Sachin', 'Arora', 'sachin.Arora@gmail.com', '9876543230', '30, Jubilee Hills', 'Hyderabad', 'Telangana', '500033', '2022-05-02', 28, 'Male', 'Married', 'Post Graduate', 'Telugu', 'English', 'Full Time', 'Active', 'Investment Banking Analyst', 70000, 6, 14),
('Raman', 'Chawla', 'raman.chawla@gmail.com', '9876543232', '32, Lawrence Road', 'Amritsar', 'Punjab', '143001', '2022-05-02', 29, 'Male', 'Single', 'Post Graduate', 'Punjabi', 'English', 'Full Time', 'Active', 'Financial Investment Manager', 95000, 6, 17);



-- insert employees for customer service department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Nitesh', 'Mehra', 'nitesh.mehra@gmail.com', '8765432101', '12, Viman Nagar', 'Pune', 'Maharashtra', '411014', '2022-05-02', 25, 'Male', 'Single', 'Bachelor\'s Degree', 'Hindi', 'English', 'Full Time', 'Active', 'Customer Service Representative', 40000, 5, 19),
('Aditi', 'Chopra', 'aditi.chopra@gmail.com', '8765432102', '8, Jubilee Hills', 'Hyderabad', 'Telangana', '500033', '2022-05-02', 28, 'Female', 'Married', 'Bachelor\'s Degree', 'Telugu', 'English', 'Full Time', 'Active', 'Customer Service Representative', 40000, 5, 20),
('Kunal', 'Joshi', 'kunal.joshi@gmail.com', '8765432103', '19, Naranpura', 'Ahmedabad', 'Gujarat', '380013', '2022-05-02', 27, 'Male', 'Single', 'Bachelor\'s Degree', 'Gujarati', 'English', 'Full Time', 'Active', 'Customer Service Representative', 40000, 5, 21),
('Kavita', 'Singh', 'kavita.singh@gmail.com', '8765432104', '16, Model Town', 'Ludhiana', 'Punjab', '141002', '2022-05-02', 30, 'Female', 'Married', 'Bachelor\'s Degree', 'Punjabi', 'English', 'Full Time', 'Active', 'Customer Service Representative', 40000, 5, 22),
('Sahil', 'Kulkarni', 'sahil.kulkarni@gmail.com', '8765432105', '7, Lajpat Nagar', 'Delhi', 'Delhi', '110024', '2022-05-02', 26, 'Male', 'Single', 'Bachelor\'s Degree', 'Hindi', 'English', 'Full Time', 'Active', 'Customer Service Representative', 40000, 5, 23),
('Mira', 'Kumar', 'mira.kumar@gmail.com', '8765432106', '14, Adyar', 'Chennai', 'Tamil Nadu', '600020', '2022-05-02', 29, 'Female', 'Married', 'Bachelor\'s Degree', 'Tamil', 'English', 'Full Time', 'Active', 'Call Center Representative', 40000, 5, 24),
('Pranav', 'Sharma', 'pranav.sharma@gmail.com', '9812345671', '15, Bhandarkar Road', 'Pune', 'Maharashtra', '411004', '2022-05-02', 24, 'Male', 'Single', 'Bachelor\'s Degree', 'Marathi', 'Hindi', 'Full Time', 'Active', 'Call Center Representative', 40000, 5, 7),
('Aarav', 'Konar', 'aarav.Konar@gmail.com', '9812345672', '12, Begumpet', 'Hyderabad', 'Telangana', '500016', '2022-05-02', 28, 'Male', 'Married', 'Bachelor\'s Degree', 'Telugu', 'English', 'Full Time', 'Active', 'Call Center Representative', 40000, 5, 8),
('Kavya', 'Patel', 'kavya.patel@gmail.com', '9812345673', '14, Navrangpura', 'Ahmedabad', 'Gujarat', '380009', '2022-05-02', 26, 'Female', 'Single', 'Bachelor\'s Degree', 'Gujarati', 'English', 'Full Time', 'Active', 'Call Center Representative', 40000, 5, 3),
('Aman', 'Mitra', 'aman.Mitra@gmail.com', '9812345674', '13, Rani Ka Bagh', 'Amritsar', 'Punjab', '143001', '2022-05-02', 29, 'Male', 'Married', 'Bachelor\'s Degree', 'Punjabi', 'Hindi', 'Full Time', 'Active', 'Call Center Representative', 40000, 5, 13),
('Anaya', 'Kaur', 'anaya.kaur@gmail.com', '9812345675', '17, Safdarjung Enclave', 'New Delhi', 'Delhi', '110029', '2022-05-02', 30, 'Female', 'Single', 'Bachelor\'s Degree', 'Hindi', 'English', 'Full Time', 'Active', 'Call Center Representative', 40000, 5, 11),
('Arjun', 'Suresh', 'arjun.suresh@gmail.com', '9812345676', '11, Velachery', 'Chennai', 'Tamil Nadu', '600042', '2022-05-02', 27, 'Male', 'Single', 'Bachelor\'s Degree', 'Tamil', 'English', 'Full Time', 'Active', 'Call Center Representative', 40000, 5, 1),
('Srishti', 'Nair', 'srishti.nair@gmail.com', '9812345677', '16, Rajiv Chowk', 'Pune', 'Maharashtra', '122001', '2022-05-02', 25, 'Female', 'Single', 'Bachelor\'s Degree', 'Hindi', 'English', 'Full Time', 'Active', 'Call Center Representative', 40000, 5, 1),
('Ria', 'Desai', 'ria.desai@example.com', '9012345678', '123, Main Street', 'Mumbai', 'Maharashtra', '400001', '2020-01-01', 28, 'Female', 'Single', 'Graduate', 'English', 'Hindi', 'Full-time', 'Active', 'Client Service Specialist', 50000, 5, 1),
('Rajat', 'Reddy', 'Rajat.reddy@example.com', '9123456789', '456, Shanti Nagar', 'Hyderabad', 'Telangana', '500001', '2019-01-01', 30, 'Male', 'Married', 'Graduate', 'English', 'Telugu', 'Full-time', 'Active', 'Relationship Manager', 45000, 5, 2),
('Kavya', 'Shah', 'kavya.shah@example.com', '9234567890', '789, Civil Lines', 'Ahmedabad', 'Gujarat', '380001', '2020-05-01', 25, 'Female', 'Single', 'Graduate', 'English', 'Gujarati', 'Full-time', 'Active', 'Customer Service Trainer', 45000, 5, 3),
('Karan', 'Singh', 'karan.singh@example.com', '9345678901', '567, Paldi Society', 'Ludhiana', 'Punjab', '141001', '2018-01-01', 32, 'Male', 'Married', 'Graduate', 'English', 'Punjabi', 'Full-time', 'Active', 'Service Desk', 40000, 5, 4),
('Isha', 'Malhotra', 'isha.malhotra@example.com', '9456789012', '234, Vijay Nagar Colony', 'New Delhi', 'Delhi', '110001', '2017-01-01', 32, 'Female', 'Married', 'Graduate', 'English', 'Punjabi', 'Full-time', 'Active', 'Customer Service Manager', 80000, 5, 4);


-- insert employees for HR department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Shalini', 'Kulkarni', 'shalini.kulkarni@example.com', '9820845678', '12, Kothrud', 'Pune', 'Maharashtra', '411038', '2021-05-08', 25, 'Female', 'Married', 'Graduate', 'English', 'Hindi', 'Full-Time', 'Active', 'HR Generalist', 55000, 7, 2),
('Sneha', 'Rao', 'sneha.rao@example.com', '9892307654', '21, Jubilee Hills', 'Hyderabad', 'Telangana', '500033', '2021-03-18', 27, 'Female', 'Single', 'Master of Computer Applications', 'English', 'Telugu', 'Full-Time', 'Active', 'HR Coordinator', 40000, 7, 3),
('Krishna', 'Patel', 'krishna.patel@example.com', '9823014567', '56, Sarkhej', 'Ahmedabad', 'Gujarat', '380055', '2021-02-11', 28, 'Male', 'Single', 'Graduate', 'English', 'Gujarati', 'Full-Time', 'Active', 'HR Administrator', 45000, 7, 4),
('Harpreet', 'Singh', 'harpreet.singh@example.com', '9812323456', '123, Model Town', 'Ludhiana', 'Punjab', '141002', '2021-01-21', 29, 'Male', 'Married', 'Graduate', 'English', 'Punjabi', 'Full-Time', 'Active', 'Recruitment Specialist', 45000, 7, 5),
('Meena', 'Kumar', 'meena.kumar@example.com', '4876543210', '45, Safdarjung', 'New Delhi', 'Delhi', '110029', '2021-04-06', 26, 'Female', 'Single', 'Post Graduate', 'English', 'Hindi', 'Full-Time', 'Active', 'Recruitment Specialist', 45000, 7, 1),
('Vikram', 'Chakravarthy', 'vikram.chakravarthy@example.com', '9884487654', '21, T Nagar', 'Chennai', 'Tamil Nadu', '600017', '2021-06-02', 24, 'Male', 'Single', 'Graduate', 'English', 'Tamil', 'Full-Time', 'Active', 'Recruitment Specialist', 45000, 7, 6),
('Manasi', 'Goel', 'manasi.Goel@gmail.com', '9876543211', '10, Sahakar Nagar', 'Pune', 'Maharashtra', '411009', '2023-05-08', 25, 'Female', 'Single', 'Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Talent Acquisition Specialist', 40000, 7, 15),
('Siddharth', 'Gupta', 'siddharth.gupta@gmail.com', '9876543212', '11, Jubilee Hills', 'Hyderabad', 'Telangana', '500033', '2023-05-08', 28, 'Male', 'Married', 'Post Graduate', 'Telugu', 'English', 'Full Time', 'Active', 'Talent Acquisition Specialist', 40000, 7, 5),
('Krishna', 'Sharma', 'krishna.sharma@gmail.com', '9876543213', '12, Satellite Road', 'Ahmedabad', 'Gujarat', '380015', '2023-05-08', 27, 'Male', 'Single', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Compensation and Benefits Manager', 55000, 7, 1),
('Rahul', 'Mehta', 'rahul.mehta@gmail.com', '9876543214', '13, Model Town', 'Ludhiana', 'Punjab', '141002', '2023-05-08', 30, 'Male', 'Married', 'Post Graduate', 'Punjabi', 'English', 'Full Time', 'Active', 'Employee Relations Manager', 45000, 7, 9),
('Nandini', 'Menon', 'nandini.Menon@gmail.com', '9876543215', '14, Ellis Road', 'Chennai', 'Tamil Nadu', '600002', '2023-05-08', 26, 'Female', 'Single', 'Graduate', 'Tamil', 'English', 'Part Time', 'Active', 'Employee Engagement Specialist', 40000, 7, 12),
('Karan', 'Hariharan', 'karan.Hariharan@gmail.com', '9876543216', '15, Green Park', 'Delhi', 'Delhi', '110016', '2023-05-08', 29, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Diversity and Inclusion Specialist', 40000, 7, 11),
('Mihir', 'Shah', 'mihir.shah@gmail.com', '9876543217', '16, Shankar Nagar', 'Pune', 'Maharashtra', '440010', '2023-05-08', 27, 'Male', 'Single', 'Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'HR Manager', 90000, 7, 10);


-- insert employees for IT department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Pallavi', 'Ahuja', 'pallavi.ahuja@gmail.com', '9876543201', '1, Raj Nagar', 'New Delhi', 'Delhi', '110016', '2022-05-02', 26, 'Female', 'Single', 'Graduate', 'Hindi', 'English', 'Part Time', 'Active', 'IT Security Analyst', 60000, 8, 11),
('Rajat', 'Verma', 'rajat.verma@gmail.com', '9876543202', '2, Shankar Nagar', 'Nagpur', 'Maharashtra', '440010', '2022-05-02', 30, 'Male', 'Married', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Network Administrator', 85000, 8, 10),
('Naveen', 'Ghosh', 'Naveen.Ghosh@gmail.com', '9876543203', '3, Ellis Road', 'Chennai', 'Tamil Nadu', '600002', '2022-05-02', 28, 'Male', 'Single', 'Post Graduate', 'Tamil', 'English', 'Full Time', 'Active', 'Systems Administrator', 75000, 8, 12),
('Nidhi', 'Singh', 'Nidhi.singh@gmail.com', '9876543204', '4, Model Town Road', 'Ludhiana', 'Punjab', '141002', '2022-05-02', 29, 'Female', 'Married', 'Post Graduate', 'Punjabi', 'English', 'Full Time', 'Active', 'Database Administrator', 50000, 8, 9),
('Arun', 'Joshi', 'arun.Joshi@gmail.com', '9876543205', '5, SG Road', 'Ahmedabad', 'Gujarat', '380015', '2022-05-02', 25, 'Male', 'Single', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Cybersecurity Analyst', 80000, 8, 1),
('Shreya', 'Mahajan', 'shreya.Mahajan@gmail.com', '9876543206', '6, Jubilee Hills Road', 'Hyderabad', 'Telangana', '500033', '2022-05-02', 27, 'Female', 'Single', 'Post Graduate', 'Telugu', 'English', 'Full Time', 'Active', 'Web Developer', 45000, 8, 5),
('Ravi', 'Narang', 'ravi.narang@gmail.com', '9876543224', '24, Ashok Vihar', 'New Delhi', 'Delhi', '110052', '2022-05-03', 32, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'UX/UI Designer', 50000, 8, 1),
('Sneha', 'Mehta', 'sneha.mehta@gmail.com', '9876543225', '25, Kandivali', 'Mumbai', 'Maharashtra', '400101', '2022-05-03', 29, 'Female', 'Single', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'IT Support', 40000, 8, 1),
('Aditya', 'Joshi', 'aditya.joshi@gmail.com', '9876543226', '26, Maninagar', 'Ahmedabad', 'Gujarat', '380008', '2022-05-03', 27, 'Male', 'Single', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'IT Support', 40000, 8, 3),
('Simran', 'Mehra', 'simran.mehra@gmail.com', '9876543227', '27, Sector-23', 'Pune', 'Maharashtra', '122022', '2022-05-03', 24, 'Female', 'Single', 'Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Cloud Architect', 70000, 8, 9),
('Rajesh', 'Bhatia', 'rajesh.bhatia@gmail.com', '9876543228', '28, Model Town', 'Ludhiana', 'Punjab', '141002', '2022-05-03', 35, 'Male', 'Married', 'Post Graduate', 'Punjabi', 'English', 'Full Time', 'Active', 'IT Manager', 90000, 8, 9);



-- insert employees for Marketing department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Manav', 'Dhawan', 'Manav.Dhawan@gmail.com', '9876543217', '1, Baner Road', 'Pune', 'Maharashtra', '411045', '2022-05-02', 27, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Digital Marketing', 60000, 10, 1),
('Shruti', 'Rao', 'shruti.rao@gmail.com', '9876543218', '2, Jubilee Hills', 'Hyderabad', 'Telangana', '500033', '2022-05-02', 25, 'Female', 'Single', 'Graduate', 'Telugu', 'English', 'Full Time', 'Active', 'Product Marketing', 50000, 10, 2),
('Jay', 'Patel', 'jay.patel@gmail.com', '9876543219', '3, Viman Nagar', 'Pune', 'Maharashtra', '411014', '2022-05-02', 28, 'Male', 'Married', 'Post Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Brand Marketing', 45000, 10, 3),
('Amrita', 'Dube', 'amrita.Dube@gmail.com', '9876543220', '4, Model Town', 'Jalandhar', 'Punjab', '144003', '2022-05-02', 29, 'Female', 'Married', 'Graduate', 'Punjabi', 'English', 'Full Time', 'Active', 'Marketing Analyst', 55000, 10, 4),
('Aditya', 'Mishra', 'aditya.mishra@gmail.com', '9876543221', '5, Kalkaji', 'New Delhi', 'Delhi', '110019', '2022-05-02', 26, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Customer Insights Analyst', 55000, 10, 1),
('Aarav', 'Goyal', 'aarav.Goyal@gmail.com', '9876543228', '28, Beach Road', 'Chennai', 'Tamil Nadu', '600005', '2022-05-02', 27, 'Male', 'Single', 'Post Graduate', 'Tamil', 'English', 'Full Time', 'Active', 'Content Marketing', 50000,10, 2),
('Pooja', 'Kadam', 'pooja.Kadam@gmail.com', '9876543229', '29, Ashok Vihar', 'Delhi', 'New Delhi', '110052', '2022-05-02', 26, 'Female', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Social Media Marketing', 45000, 10, 11),
('Akash', 'Saxena', 'akash.Saxena@gmail.com', '9876543230', '30, Jayanagar', 'Hyderabad', 'Telangana', '500032', '2022-05-02', 29, 'Male', 'Married', 'Post Graduate', 'Telugu', 'English', 'Full Time', 'Active', 'Events Manager', 55000, 10, 7),
('Prachi', 'Jain', 'prachi.jain@gmail.com', '9876543231', '31, Kothrud', 'Pune', 'Maharashtra', '411038', '2022-05-02', 27, 'Female', 'Single', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Public Relations Manager', 80000, 10, 10),
('Rashi', 'Chopra', 'Rashi.chopra@gmail.com', '9876543224', '24, Bhandarkar Road', 'Pune', 'Maharashtra', '411004', '2022-05-03', 27, 'Female', 'Single', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Advertising Manager', 60000, 10, 1),
('Vikram', 'Trivedi', 'vikram.Trivedi@gmail.com', '9876543225', '25, Panjagutta', 'Hyderabad', 'Telangana', '500082', '2022-05-03', 31, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Marketing Manager', 95000, 10, 2);



-- insert employees for Sales department
INSERT INTO employee (first_name, last_name, email, contact, address, city, state, postal_code, hire_date, age, gender, marital_status, education_level, primary_language, subsidiary_language, employee_type, employee_status, job_title, salary, department_id, branch_id) VALUES 
('Nandini', 'Krishnan', 'Nandini.Krishnan@gmail.com', '9876543226', '26, Near C.G. Road', 'Ahmedabad', 'Gujarat', '380009', '2022-05-03', 28, 'Female', 'Single', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Sales Representative', 45000, 12, 3),
('Rohan', 'Singh', 'rohan.singh@gmail.com', '9876543217', '17, Sahar Road', 'Mumbai', 'Maharashtra', '400099', '2022-05-02', 27, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Sales Representative', 45000, 12, 1),
('Shweta', 'Gupta', 'shweta.gupta@gmail.com', '9876543218', '18, MG Road', 'Pune', 'Maharashtra', '411001', '2022-05-02', 28, 'Female', 'Married', 'Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Sales Representative', 45000, 12, 2),
('Rahul', 'Goyal', 'rahul.goyal@gmail.com', '9876543219', '19, Banjara Hills', 'Hyderabad', 'Telangana', '500034', '2022-05-02', 29, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Sales Representative ', 45000, 12, 5),
('Komal', 'Verma', 'komal.verma@gmail.com', '9876543220', '20, Sarkhej Road', 'Ahmedabad', 'Gujarat', '380054', '2022-05-02', 26, 'Female', 'Single', 'Graduate', 'Gujarati', 'English', 'Full Time', 'Active', 'Sales Executive', 45000, 12, 3),
('Manoj', 'Sharma', 'manoj.sharma@gmail.com', '9876543217', '22, Gandhi Road', 'Mumbai', 'Maharashtra', '400001', '2022-05-02', 32, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Sales Executive', 45000, 12, 1),
('Deepa', 'Patil', 'deepa.patil@gmail.com', '9876543218', '12, Swargate', 'Pune', 'Maharashtra', '411042', '2022-05-02', 27, 'Female', 'Single', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Sales Consultant', 50000, 12, 2),
('Vikas', 'Khanna', 'vikas.Khanna@gmail.com', '9876543219', '14, Karol Bagh', 'Delhi', 'Delhi', '110005', '2022-05-02', 28, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Territory Sales Manager', 60000, 12, 3),
('Komal', 'Joshi', 'komal.joshi@gmail.com', '9876543220', '7, Shastri Nagar', 'Ahmedabad', 'Gujarat', '380007', '2022-05-02', 26, 'Female', 'Single', 'Graduate', 'Gujarati', 'English', 'Part Time', 'Active', 'Sales Trainer', 45000, 12, 4),
('Anjali', 'Deshmukh', 'anjali.deshmukh@gmail.com', '9876543217', '54, Janakpuri', 'Pune', 'Maharashtra', '411042', '2022-05-02', 28, 'Female', 'Single', 'Post Graduate', 'Marathi', 'English', 'Full Time', 'Active', 'Regional Sales Manager', 60000, 12, 3),
('Varun', 'Bajaj', 'varun.Bajaj@gmail.com', '9876543218', '28, Wazirabad', 'Delhi', 'Delhi', '110084', '2022-05-02', 30, 'Male', 'Married', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Mortgage Loan Officer', 50000, 12, 11),
('Jatin', 'Rana', 'jatin.rana@gmail.com', '9876543219', '31 Turquoise Road', 'Ahmedabad', 'Gujarat', '122001', '2022-05-02', 28, 'Male', 'Single', 'Post Graduate', 'Hindi', 'English', 'Full Time', 'Active', 'Sales Coordinator', 45000, 12, 11),
('Kavya', 'Thakur', 'Kavya.Thakur@gmail.com', '9876543214', '203, Satyam Towers', 'Hyderabad', 'Telangana', '500016', '2022-05-02', 29, 'Female', 'Married', 'Post Graduate', 'Telugu', 'English', 'Full Time', 'Active', 'Sales Manager', 90000, 12, 8);











SELECT * FROM bank.employee;

-- TODO: change branch id according to state --> DONE
-- TODO: remove numbers in the starting from address  --> DONE
-- TODO: swap first language and second language --> DONE
-- TODO: make all characters in email in lowercase  --> DONE
-- TODO: check for duplicate contact entries --> DONE
-- TODO: fix dates

UPDATE employee SET branch_id = 1 WHERE state='Maharashtra';

UPDATE employee SET branch_id = 2 WHERE state='Telangana';

UPDATE employee SET branch_id = 3 WHERE state='Gujarat';

UPDATE employee SET branch_id = 4 WHERE city='Pune';

UPDATE employee SET branch_id = 5 WHERE state='Punjab';

UPDATE employee SET branch_id = 6 WHERE state='Delhi';

UPDATE employee SET branch_id = 7 WHERE state='Tamil Nadu';

UPDATE employee e1 JOIN employee e2 ON e1.employee_id = e2.employee_id SET e1.address = SUBSTRING_INDEX(e2.address, ', ', -1);

UPDATE employee SET address = 'Turquoise Road' where employee_id = 113;

-- UPDATE employee SET primary_language = (@temp := primary_language), primary_language = subsidiary_language, subsidiary_language = @temp;

UPDATE employee SET subsidiary_language = (@temp := subsidiary_language), subsidiary_language = primary_language, primary_language = @temp WHERE employee_id = 63 OR employee_id = 64 OR employee_id = 65 OR employee_id = 66 OR employee_id = 67 OR employee_id = 68 OR employee_id = 69 OR employee_id = 70 OR employee_id =71 OR employee_id = 72;

UPDATE employee SET primary_language = 'English';

UPDATE employee e1 JOIN employee e2 ON e1.employee_id = e2.employee_id SET e1.email = CONCAT( LOWER(e2.first_name), '.',  LOWER(e2.last_name), '@gmail.com');


SELECT COUNT(*), contact FROM employee GROUP BY contact;

UPDATE employee SET contact = '9876543286' WHERE employee_id = 85;

SELECT COUNT(*), address FROM employee GROUP BY address;

UPDATE employee SET branch_id = 7 WHERE employee_id=8;

UPDATE employee e1 JOIN employee e2 ON (e1.job_title = 'Accountant' OR e1.job_title = 'Bookkeeper') AND e2.job_title = 'Accountant Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.job_title LIKE 'Financial%' AND e2.job_title = 'Finance Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON (e1.job_title = 'Tax Compliance Officer' OR e1.job_title = 'Tax Counsel') AND e2.job_title = 'Tax Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.job_title = 'Treasury Analyst' AND e2.job_title = 'Finance Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.job_title LIKE '%Audit%' AND e1.job_title NOT LIKE 'Audit Manager' AND e2.job_title = 'Audit Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.department_id = 3 AND e1.job_title NOT LIKE '%Manager%' AND e2.job_title = 'Operations Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.job_title = 'Senior Branch Manager' AND e2.job_title = 'Branch Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.department_id = 6 AND e1.job_title NOT LIKE '%Manager%' AND e2.job_title = 'Financial Investment Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.department_id = 5 AND e1.job_title NOT LIKE 'Customer Service Manager' AND e2.job_title = 'Customer Service Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.department_id = 7 AND e1.job_title NOT LIKE 'HR Manager' AND e2.job_title = 'HR Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.department_id = 8 AND e1.job_title NOT LIKE '%Manager%' AND e2.job_title = 'IT Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.department_id = 10 AND e1.job_title NOT LIKE 'Marketing Manager' AND e2.job_title = 'Marketing Manager' SET e1.manager_id = e2.employee_id;

UPDATE employee e1 JOIN employee e2 ON e1.department_id = 12 AND e1.job_title NOT LIKE 'Sales Manager' AND e2.job_title = 'Sales Manager' SET e1.manager_id = e2.employee_id;