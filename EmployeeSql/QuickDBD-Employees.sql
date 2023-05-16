-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/9ohzbL
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "employee_no" int   NOT NULL,
    "employee_title_id" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "Department_employees" (
    "employee_no" int   NOT NULL,
    "department_no" varchar   NOT NULL
);

CREATE TABLE "Departments" (
    "department_no" int   NOT NULL,
    "department_name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "department_no"
     )
);

CREATE TABLE "Department_manager" (
    "department_no" varchar   NOT NULL,
    "employee_no" int   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Salaries" (
    "employee_no" int   NOT NULL,
    "salary" money   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_employee_title_id" FOREIGN KEY("employee_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Department_employees" ADD CONSTRAINT "fk_Department_employees_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Employees" ("employee_no");

ALTER TABLE "Department_employees" ADD CONSTRAINT "fk_Department_employees_department_no" FOREIGN KEY("department_no")
REFERENCES "Departments" ("department_no");

ALTER TABLE "Department_manager" ADD CONSTRAINT "fk_Department_manager_department_no" FOREIGN KEY("department_no")
REFERENCES "Departments" ("department_no");

ALTER TABLE "Department_manager" ADD CONSTRAINT "fk_Department_manager_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Employees" ("employee_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Employees" ("employee_no");

