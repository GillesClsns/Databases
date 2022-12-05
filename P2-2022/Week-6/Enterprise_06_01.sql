CREATE TABLE "DEPARTMENTS"
(
    department_id   CHAR(2) PRIMARY KEY,
    department_name VARCHAR(20),
    manager_id      CHAR(9),
    mgr_start_date  DATE

);

CREATE TABLE "EMPLOYEES"
(
    employee_id   CHAR(9)
        CONSTRAINT pk_employee_id PRIMARY KEY
        REFERENCES DEPARTMENTS (department_id),
    last_name     VARCHAR(25),
    first_name    VARCHAR(25),
    infix         VARCHAR(25),
    street        VARCHAR(50),
    city          VARCHAR(25),
    province      CHAR(2),
    postal_code   VARCHAR(7),
    birth_date    DATE,
    salary        NUMERIC(7, 2),
    parking_spot  NUMERIC(4),
    gender        CHAR(1),
    department_id NUMERIC(2),
    manager_id    CHAR(9)
        REFERENCES EMPLOYEES (employee_id)
);

CREATE TABLE "PROJECTS"
(
    project_id    CHAR(2)
        CONSTRAINT pk_project_id PRIMARY KEY,
    project_name  VARCHAR(25),
    location      VARCHAR(25),
    department_id CHAR(2)
        REFERENCES DEPARTMENTS (department_id)
);

CREATE TABLE "LOCATIONS"
(
    department_id CHAR(2)
        REFERENCES DEPARTMENTS (department_id),
    location      VARCHAR(20),
    CONSTRAINT PK_loc_depid PRIMARY KEY (department_id, location)
);


CREATE TABLE "FAMILY_MEMBERS"
(
    employee_id  CHAR(9)     NOT NULL
        REFERENCES EMPLOYEES(employee_id),
    name         VARCHAR(50) NOT NULL,
    gender       CHAR(1)     NOT NULL,
    birth_date   DATE        NOT NULL,
    relationship VARCHAR(10) NOT NULL,
    CONSTRAINT PK_keys PRIMARY KEY (employee_id, name)
);

CREATE TABLE "TASKS"
(
    employee_id CHAR(9)
        CONSTRAINT FK_emp_id REFERENCES EMPLOYEES (employee_id),
    project_id  CHAR(2)
        CONSTRAINT FK_prj_id REFERENCES PROJECTS (project_id),
    hours       NUMERIC(5, 1),
    CONSTRAINT PK_tasks PRIMARY KEY (employee_id, project_id)
);
