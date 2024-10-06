CREATE TABLE Titles (
    title_id VARCHAR(5)   NOT NULL,
    title VARCHAR(25)   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no int NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date date NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Departments (
    dept_no VARCHAR(4)   NOT NULL,
    dept_name VARCHAR(25)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Dept_emp (
    emp_no int   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Dept_manager (
    dept_no VARCHAR(4)   NOT NULL,
    emp_no int   NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
