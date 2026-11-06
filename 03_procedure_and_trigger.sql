USE crownfield_eye_demo;
-- Q5: Stored procedure with patient identifier input.
DROP PROCEDURE IF EXISTS sp_s1_patient_appointments;
DELIMITER $$
CREATE PROCEDURE sp_s1_patient_appointments(IN p_patient_id VARCHAR(12))
BEGIN
 SELECT a.appointment_id,a.appointment_date,a.appointment_time,
        c.full_name AS clinician,cl.clinic_name,a.status
 FROM appointments a JOIN clinicians c ON c.clinician_id=a.clinician_id
 JOIN clinics cl ON cl.clinic_id=a.clinic_id
 WHERE a.patient_id=p_patient_id ORDER BY a.appointment_date,a.appointment_time;
END$$
DELIMITER ;
CALL sp_s1_patient_appointments('OP001');

-- Q6: Trigger logs a status change (meaningful audit rule).
DROP TRIGGER IF EXISTS trg_s1_appointment_status_audit;
DELIMITER $$
CREATE TRIGGER trg_s1_appointment_status_audit
AFTER UPDATE ON appointments FOR EACH ROW
BEGIN
 IF OLD.status <> NEW.status THEN
  INSERT INTO appointment_status_audit(appointment_id,old_status,new_status)
  VALUES(NEW.appointment_id,OLD.status,NEW.status);
 END IF;
END$$
DELIMITER ;

-- Safe reversible test: screenshot within the transaction, then rollback.
START TRANSACTION;
UPDATE appointments SET status='Cancelled' WHERE appointment_id=111 AND status='Scheduled';
SELECT appointment_id,old_status,new_status,changed_at FROM appointment_status_audit
WHERE appointment_id=111 ORDER BY audit_id DESC LIMIT 3;
ROLLBACK;
SELECT status FROM appointments WHERE appointment_id=111;
