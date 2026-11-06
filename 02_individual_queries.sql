-- STUDENT A: four individual SELECT queries (Q1-Q4). Screenshots required.
USE crownfield_eye_demo;
-- Q1: Which patients have attended or booked more than one appointment?
SELECT p.patient_id,p.full_name,COUNT(a.appointment_id) AS appointment_count
FROM patients p JOIN appointments a ON a.patient_id=p.patient_id
GROUP BY p.patient_id,p.full_name HAVING COUNT(a.appointment_id)>1
ORDER BY appointment_count DESC,p.patient_id;

-- Q2: Show a patient, their appointment, clinician and clinic (4-table INNER JOIN).
SELECT a.appointment_id,p.full_name AS patient,c.full_name AS clinician,
       cl.clinic_name,a.appointment_date,a.status
FROM appointments a INNER JOIN patients p ON a.patient_id=p.patient_id
INNER JOIN clinicians c ON a.clinician_id=c.clinician_id
INNER JOIN clinics cl ON a.clinic_id=cl.clinic_id
ORDER BY a.appointment_id LIMIT 20;

-- Q3: Identify patients who have no appointments (LEFT JOIN).
SELECT p.patient_id,p.full_name FROM patients p
LEFT JOIN appointments a ON a.patient_id=p.patient_id
WHERE a.appointment_id IS NULL ORDER BY p.patient_id;

-- Q4: Find patients whose number of appointments exceeds the average patient count (CTE).
WITH per_patient AS (
 SELECT p.patient_id,p.full_name,COUNT(a.appointment_id) AS booking_count
 FROM patients p LEFT JOIN appointments a ON a.patient_id=p.patient_id
 GROUP BY p.patient_id,p.full_name
)
SELECT patient_id,full_name,booking_count FROM per_patient
WHERE booking_count > (SELECT AVG(booking_count) FROM per_patient)
ORDER BY booking_count DESC,patient_id;
