/*
Team Six Clinical IT Database
Jessica Bruner
Matthew Ludwick
Eric Bravo



*/
DROP DATABASE IF EXISTS medical_it_db;
CREATE DATABASE medical_it_db;
USE medical_it_db;

DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS machines;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS priority_levels;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
dept_ID INT PRIMARY KEY AUTO_INCREMENT,
dept_name VARCHAR(100),
location VARCHAR(100)
);

CREATE TABLE priority_levels (
priority_level INT PRIMARY KEY AUTO_INCREMENT,
description VARCHAR(255)
);

CREATE TABLE employees (
employee_ID INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
job_title VARCHAR(50),
dept_ID INT,
FOREIGN KEY (dept_ID) REFERENCES departments(dept_ID)
);

CREATE TABLE machines (
machine_ID INT PRIMARY KEY AUTO_INCREMENT,
device_type VARCHAR(100),
serial_number VARCHAR(100),
dept_ID INT,
FOREIGN KEY (dept_ID) REFERENCES departments(dept_ID)
);

CREATE TABLE tickets (
ticket_ID INT PRIMARY KEY AUTO_INCREMENT,
issue_description VARCHAR(100),
machine_ID INT,
priority_level INT,
date_submission DATETIME,
date_completion DATETIME,
tech_ID INT,
ticket_status ENUM('Open','Closed','In Progress'),
dept_ID INT,
job_role INT,
FOREIGN KEY (machine_ID) REFERENCES machines(machine_ID),
FOREIGN KEY (priority_level) REFERENCES priority_levels(priority_level),
FOREIGN KEY (tech_ID) REFERENCES employees(employee_ID),
FOREIGN KEY (dept_ID) REFERENCES departments(dept_ID),
FOREIGN KEY (job_role) REFERENCES employees(employee_ID)
);
INSERT INTO departments (dept_name, location) VALUES
('Emergency Department','Main Hospital - 1st Floor'),
('Intensive Care Unit','Main Hospital - 3rd Floor'),
('Medical Surgical Unit','Main Hospital - 4th Floor'),
('Operating Room','Surgical Pavilion - 2nd Floor'),
('Labor and Delivery','Women and Children Center - 2nd Floor'),
('Pharmacy','Main Hospital - Basement'),
('Radiology','Diagnostic Center - 1st Floor'),
('Laboratory','Main Hospital - Basement'),
('Cardiology','Heart Center - 2nd Floor'),
('Oncology','Cancer Center - 3rd Floor'),
('Pediatrics','Women and Children Center - 3rd Floor'),
('Neonatal ICU','Women and Children Center - 4th Floor'),
('Physical Therapy','Outpatient Center - 1st Floor'),
('Respiratory Therapy','Main Hospital - 2nd Floor'),
('Nutrition Services','Main Hospital - Basement'),
('Patient Registration','Main Lobby'),
('Health Information Management','Administration Building - 2nd Floor'),
('Billing','Administration Building - 3rd Floor'),
('Human Resources','Administration Building - 1st Floor'),
('Finance','Administration Building - 3rd Floor'),
('Facilities Management','Service Building'),
('Security','Main Hospital - 1st Floor'),
('Environmental Services','Service Building'),
('Materials Management','Warehouse'),
('Outpatient Clinic','Outpatient Center - 2nd Floor'),
('Ambulatory Surgery','Surgical Pavilion - 1st Floor'),
('Behavioral Health','North Wing - 2nd Floor'),
('Clinical Education','Administration Building - 2nd Floor'),
('IT and Clinical Systems','Technology Center'),
('Executive Administration','Administration Building - 4th Floor');
INSERT INTO priority_levels (description) VALUES
('Priority 1: Critical - Life Safety and Core Outage. Total failure of systems directly impacting patient care, safety, or critical hospital operations with no workaround.'),
('Priority 2: High - Severe Disruption. Key systems are majorly degraded or a critical department is isolated, but partial workarounds exist.'),
('Priority 3: Medium - Moderate Impact. Non-clinical or operational systems are impaired, affecting a group of users but not stopping essential patient care.'),
('Priority 4: Low - Minor Request. Limited impact issue, routine service request, single-user problem, or cosmetic/non-urgent system concern.');
INSERT INTO employees (first_name, last_name, job_title, dept_ID) VALUES
('Alex','Morgan','IT Systems Analyst',29),
('Jordan','Lee','Clinical Systems Analyst',29),
('Taylor','Patel','Network Administrator',29),
('Casey','Nguyen','Desktop Support Specialist',29),
('Morgan','Brooks','Biomedical Equipment Technician',29),
('Riley','Chen','EHR Application Analyst',29),
('Avery','Diaz','Clinical Informatics Specialist',29),
('Quinn','Roberts','Security Systems Administrator',29),
('Skyler','Ramirez','Database Administrator',29),
('Cameron','Hughes','Help Desk Technician',29),
('Reese','Kim','Systems Engineer',29),
('Jamie','Thornton','Interface Analyst',29),
('Parker','Singh','Clinical Device Integration Specialist',29),
('Drew','Bennett','IT Project Coordinator',29),
('Rowan','Foster','Telecommunications Technician',29),
('Maria','Lopez','Charge Nurse',1),
('Samuel','Green','ICU Nurse',2),
('Nina','Wright','Unit Clerk',3),
('Owen','Scott','OR Scheduler',4),
('Grace','Adams','Labor and Delivery Nurse',5),
('Ethan','Baker','Pharmacy Technician',6),
('Maya','Rivera','Radiology Technologist',7),
('Logan','Collins','Lab Technician',8),
('Sofia','Reed','Cardiology Nurse',9),
('Noah','Ward','Oncology Registrar',10),
('Lily','Murphy','Pediatric Nurse',11),
('Elijah','Cook','NICU Respiratory Nurse',12),
('Chloe','Bell','Physical Therapist',13),
('Daniel','Cooper','Respiratory Therapist',14),
('Ava','Bailey','Dietitian',15),
('Lucas','Howard','Registration Specialist',16),
('Mia','Cox','HIM Specialist',17),
('Henry','Torres','Billing Specialist',18),
('Ella','Peterson','HR Coordinator',19),
('Jack','Gray','Finance Analyst',20),
('Zoe','James','Facilities Coordinator',21),
('Leo','Watson','Security Officer',22),
('Aria','Brooks','EVS Supervisor',23),
('Wyatt','Kelly','Materials Coordinator',24),
('Isla','Sanders','Clinic Nurse',25),
('Mason','Price','Ambulatory Surgery Nurse',26),
('Layla','Bennett','Behavioral Health Counselor',27),
('Sebastian','Wood','Clinical Educator',28),
('Violet','Barnes','Administrative Assistant',30),
('Julian','Ross','Executive Assistant',30),
('Amelia','Henderson','Emergency Physician',1),
('Benjamin','Coleman','ICU Physician',2),
('Harper','Jenkins','Medical Surgical Nurse',3),
('Gabriel','Perry','Surgical Technician',4),
('Scarlett','Powell','OB Technician',5),
('Anthony','Long','Pharmacist',6),
('Penelope','Patterson','MRI Technologist',7),
('Christopher','Hughes','Phlebotomist',8),
('Victoria','Flores','Cardiac Sonographer',9),
('Andrew','Washington','Oncology Nurse',10),
('Stella','Butler','Pediatrician',11),
('Joshua','Simmons','NICU Nurse',12),
('Nora','Foster','Rehab Aide',13),
('David','Gonzales','Respiratory Technician',14),
('Hazel','Bryant','Nutrition Aide',15),
('Joseph','Alexander','Patient Access Lead',16),
('Lucy','Russell','Records Analyst',17),
('John','Griffin','Claims Processor',18),
('Claire','Hayes','Recruiter',19),
('Isaac','Myers','Payroll Specialist',20),
('Audrey','Ford','Maintenance Technician',21),
('Nathan','Hamilton','Security Dispatcher',22),
('Bella','Graham','Housekeeping Lead',23),
('Caleb','Sullivan','Supply Technician',24),
('Paisley','Wallace','Clinic Receptionist',25);
INSERT INTO machines (device_type, serial_number, dept_ID) VALUES
('EHR Workstation','ED-WS-1001',1),
('Patient Registration Kiosk','REG-KSK-1002',16),
('ICU Telemetry Monitor','ICU-TEL-1003',2),
('Medication Dispensing Cabinet','PHR-MDC-1004',6),
('MRI Image Transfer Workstation','RAD-MRI-1005',7),
('Portable Vital Signs Monitor','MSU-VSM-1006',3),
('Operating Room Anesthesia Workstation','OR-ANES-1007',4),
('Fetal Monitoring Station','LDR-FMS-1008',5),
('Laboratory Analyzer Interface PC','LAB-AIP-1009',8),
('Cardiology ECG Cart','CAR-ECG-1010',9),
('Oncology Infusion Pump Gateway','ONC-IPG-1011',10),
('Pediatric Medication Scanner','PED-MSC-1012',11),
('NICU Ventilator Interface','NIC-VIN-1013',12),
('Physical Therapy Scheduling Workstation','PT-SCH-1014',13),
('Respiratory Therapy Ventilator Tablet','RT-VTAB-1015',14),
('Nutrition Label Printer','NUT-LBL-1016',15),
('Document Scanner','HIM-SCN-1017',17),
('Billing Department Printer','BIL-PRN-1018',18),
('HR Laptop','HR-LTP-1019',19),
('Finance Workstation','FIN-WS-1020',20),
('Facilities Mobile Tablet','FAC-TAB-1021',21),
('Security Camera Console','SEC-CAM-1022',22),
('EVS Dispatch Tablet','EVS-TAB-1023',23),
('Inventory Barcode Scanner','MAT-BCS-1024',24),
('Clinic Phone System','OPC-PHN-1025',25),
('Ambulatory Surgery Workstation','ASU-WS-1026',26),
('Behavioral Health Telehealth Cart','BHV-THC-1027',27),
('Clinical Education Smartboard','CED-SMB-1028',28),
('IT Service Desk Workstation','IT-WS-1029',29),
('Executive Conference Room Display','EXE-DSP-1030',30),
('Wireless Access Point','NET-WAP-1031',1),
('Medication Barcode Scanner','PHR-BCS-1032',6),
('Radiology PACS Workstation','RAD-PACS-1033',7),
('Nurse Call Console','ICU-NCC-1034',2),
('Point of Care Testing Dock','LAB-POC-1035',8),
('Emergency Department Label Printer','ED-LBL-1036',1),
('Staff Scheduling Workstation','HR-SCH-1037',19),
('VoIP Phone','TEL-VOIP-1038',25),
('Shared Department Printer','ADM-PRN-1039',30),
('Mobile EHR Cart','MSU-EHR-1040',3);
INSERT INTO tickets (issue_description, machine_ID, priority_level, date_submission, date_completion, tech_ID, ticket_status, dept_ID, job_role)
WITH RECURSIVE ticket_numbers AS (
SELECT 1 AS n
UNION ALL
SELECT n + 1 FROM ticket_numbers WHERE n < 300
)
SELECT
CASE
WHEN n MOD 12 = 0 THEN 'EHR system unavailable for department users'
WHEN n MOD 12 = 1 THEN 'Printer or label printer not responding'
WHEN n MOD 12 = 2 THEN 'Medication dispensing cabinet connectivity issue'
WHEN n MOD 12 = 3 THEN 'Radiology image transfer delay to main server'
WHEN n MOD 12 = 4 THEN 'Workstation cannot log into hospital network'
WHEN n MOD 12 = 5 THEN 'Barcode scanner not reading patient wristbands'
WHEN n MOD 12 = 6 THEN 'Clinical device interface not sending data to EHR'
WHEN n MOD 12 = 7 THEN 'Phone or VoIP service disruption'
WHEN n MOD 12 = 8 THEN 'Staff scheduling portal inaccessible'
WHEN n MOD 12 = 9 THEN 'Security camera or access console alert'
WHEN n MOD 12 = 10 THEN 'Wireless access point intermittent outage'
ELSE 'Routine software access or password assistance request'
END AS issue_description,
((n - 1) MOD 40) + 1 AS machine_ID,
CASE
WHEN n MOD 25 = 0 THEN 1
WHEN n MOD 10 = 0 THEN 2
WHEN n MOD 3 = 0 THEN 3
ELSE 4
END AS priority_level,
DATE_ADD('2026-01-01 07:00:00', INTERVAL n HOUR) AS date_submission,
CASE
WHEN n MOD 5 = 0 THEN NULL
ELSE DATE_ADD(DATE_ADD('2026-01-01 07:00:00', INTERVAL n HOUR), INTERVAL (n MOD 72) HOUR)
END AS date_completion,
((n - 1) MOD 15) + 1 AS tech_ID,
CASE
WHEN n MOD 5 = 0 THEN 'Open'
WHEN n MOD 4 = 0 THEN 'In Progress'
ELSE 'Closed'
END AS ticket_status,
((n - 1) MOD 30) + 1 AS dept_ID,
((n - 1) MOD 30) + 16 AS job_role
FROM ticket_numbers;
-- Views
CREATE VIEW tickets_per_department AS
SELECT COUNT(ticket_ID) AS number_tickets, dept_name
FROM departments AS a
INNER JOIN
tickets AS b
USING(dept_ID)
GROUP BY dept_name WITH ROLLUP;

CREATE VIEW open_tickets AS
SELECT ticket_ID, dept_name, priority_level, date_submission, CONCAT(first_name," ",last_name) AS technician, job_title
FROM departments AS a
INNER JOIN
tickets AS b
USING(dept_ID)
INNER JOIN employees AS c
ON b.tech_ID=c.employee_ID
WHERE ticket_status !="Closed"
ORDER BY date_submission ASC;

CREATE VIEW tickets_per_dept AS
SELECT COUNT(ticket_ID) AS number_tickets, dept_name
FROM tickets AS a
INNER JOIN departments AS b
USING(dept_ID)
GROUP BY dept_name WITH ROLLUP;

CREATE VIEW tickets_per_staff AS
SELECT COUNT(ticket_ID), CONCAT(first_name," ",last_name,"  ",job_title) AS clinical_staff
FROM tickets AS a
INNER JOIN
employees AS b
ON a.job_role=b.employee_ID
GROUP BY clinical_staff WITH ROLLUP;

SET SQL_SAFE_UPDATES=0;

UPDATE tickets
SET date_completion=NULL
WHERE ticket_status!="Closed";

-- Sample Querys

-- Ticket Details with Machine and Department Info

SELECT 
    t.ticket_ID, 
    t.issue_description, 
    m.device_type, 
    d.dept_name, 
    d.location
FROM tickets t
JOIN machines m ON t.machine_ID = m.machine_ID
JOIN departments d ON t.dept_ID = d.dept_ID
ORDER BY t.ticket_ID;

-- Technician Workload for Open Tickets

SELECT 
    t.ticket_ID, 
    t.ticket_status, 
    p.description AS priority, 
    e.first_name, 
    e.last_name AS technician
FROM tickets t
JOIN employees e ON t.tech_ID = e.employee_ID
JOIN priority_levels p ON t.priority_level = p.priority_level
WHERE t.ticket_status IN ('Open', 'In Progress')
ORDER BY t.date_submission ASC;

-- Equipment Inventory by Location

SELECT 
    m.serial_number, 
    m.device_type, 
    d.dept_name, 
    d.location
FROM machines m
JOIN departments d ON m.dept_ID = d.dept_ID
ORDER BY d.dept_name;

-- Tickets Submitted by Clinical Staff

SELECT 
    t.ticket_ID, 
    t.date_submission, 
    e.first_name AS staff_first_name, 
    e.last_name AS staff_last_name, 
    e.job_title,
    d.dept_name
FROM tickets t
JOIN employees e ON t.job_role = e.employee_ID
JOIN departments d ON t.dept_ID = d.dept_ID
ORDER BY t.date_submission DESC
LIMIT 20;



