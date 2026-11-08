# Crownfield Eye Hospital — ER diagram documentation

**Student A:** Dumitru-Daniel Nedelescu  
**Student ID:** G1423264  
**Course:** Introduction to Database

## Purpose

These diagrams explain the logical design of the fictional Crownfield Eye Hospital MySQL database. The database design and ER diagrams are shared group artefacts. My individual contribution focused on implementation, security and testing, as explained in my individual report and SQL scripts.

## Diagram files

- `Crownfield_Full_Crows_Foot_ERD.png` — full diagram of the 14 database tables; use this as the main ER diagram for the assessment.
- `Crownfield_Core_Relationship_Overview_Crows_Foot.png` — simpler overview of the main relationships, suitable for explaining the design in a presentation.
- `Crownfield_ERD_Crows_Foot.mmd` — editable Mermaid source of the logical ER diagram.
- HTML/SVG diagram versions, if included, are alternative display formats of the same design.

## Main design decisions

The `PATIENTS` and `APPOINTMENTS` tables are separate because one patient can have several appointments. Each appointment refers to one patient, one clinician and one clinic. Junction tables link appointments to diagnoses and treatments. Prescription items link prescriptions to medicines. A follow-up plan is optional for an appointment.

The `APPOINTMENT_STATUS_AUDIT` table stores appointment status changes. During testing, an `AFTER UPDATE` trigger recorded changes to appointment 111. I also tested transaction behaviour with `COMMIT` and `ROLLBACK` and checked database integrity using SQL queries.

## Crow's Foot notation

- `||` means exactly one.
- `o{` means zero or many.
- `|{` means one or many.
- `o|` means zero or one.

The diagram describes the intended relationships. It does not prove that every business rule is enforced by SQL. For example, a prescription is expected to have at least one prescription item, but a foreign key alone does not require the parent prescription to have a child item.

## Security and testing notes

Four database roles were configured for administrator, doctor, receptionist and patient access. Roles and permissions are not shown on an ER diagram because they are database access controls, not table relationships. Their configuration and screenshots are documented in `04_security.sql` and the individual report.

The patient-account access-denied test was not completed while logged in as the patient account, so it is not reported as a passed test.

## How to use these files

1. Open the full PNG diagram to review the tables and relationships.
2. Use the core overview for a simpler explanation in slides.
3. Keep the `.mmd` source in GitHub as an editable version.
4. Refer to `01_schema.sql` for the implemented database definitions and constraints.

## AI assistance acknowledgement

I used ChatGPT to help organise this documentation and make the English clearer. The diagrams and database work should be checked against the SQL files and my own MySQL Workbench evidence.
