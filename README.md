# Crownfield Eye Hospital — MySQL Database Project

**Student A:** Dumitru-Daniel Nedelescu  
**Student ID:** G1423264  
**Course:** Introduction to Database

## Project overview

The group created a MySQL relational database to organise patient, clinic, clinician, appointment, diagnosis, prescription and follow-up information. The project uses synthetic data, not real hospital records.

## My contribution — Student A

My main responsibility was **database implementation, security and testing**. I worked in MySQL Workbench to check the database tables and sample data, run integrity checks, test transactions, review the appointment status audit trigger, and configure role-based access permissions. The database design and other shared materials are part of the group project.

### Work completed

- Checked the database structure and sample data in `crownfield_eye_demo`.
- Checked required fields, duplicate identifiers, several foreign-key relationships, appointment statuses, dates and times, and overlapping scheduled appointments.
- Tested `ROLLBACK` and `COMMIT` with an appointment status update.
- Checked that the appointment status audit trigger recorded changes.
- Reviewed permissions for administrator, doctor, receptionist and patient roles.
- Confirmed the hospital user accounts had matching role assignments and default roles.
- Prepared an individual report with screenshots from MySQL Workbench.

**Testing limitation:** I did not complete a permission-denied test while logged in as `hospital_patient`. Role grants and assignments were checked, but actual patient-account access restrictions were not independently verified.

## SQL files

| File | Purpose |
| --- | --- |
| `01_schema.sql` | Creates the database structure and tables. |
| `01a_seed_data.sql` | Adds synthetic sample records. |
| `02_individual_queries.sql` | Contains the individual SQL queries. |
| `03_procedure_and_trigger.sql` | Contains the stored procedure and audit trigger. |
| `04_security.sql` | Contains security roles and permissions. |
| `05_transactions_and_tests.sql` | Contains transaction and testing SQL. |

These six files are currently stored at the top level of this GitHub repository.

## Evidence and documentation

My individual report, **`Crownfield_A_Individual_Report_No_Footer.docx`**, describes the implementation, security checks, transaction tests and audit trigger, with screenshots of the work completed. The report and supporting images may be added to the repository separately, depending on the coursework submission instructions.

## Software

- MySQL
- MySQL Workbench
- Microsoft Word
- GitHub (for storing the project files)

## Use of AI tools

I used OpenAI ChatGPT to help organise the report and README, and improve the clarity of my English.

