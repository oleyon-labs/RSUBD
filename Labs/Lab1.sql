DECLARE
  s_id subject.subj_id%TYPE;
  s_name subject.subj_name%TYPE;
  s_hour subject.hour%TYPE;
  s_semestr subject.semestr%TYPE;
 
CURSOR s_semester_7_8 IS SELECT * FROM subject WHERE semestr in (7,8);
 
u_rating_exception EXCEPTION;
 
BEGIN
  OPEN s_semester_7_8;
FETCH s_semester_7_8 INTO s_id, s_name, s_hour, s_semestr;
WHILE s_semester_7_8%FOUND LOOP
  BEGIN
    IF s_hour <> 36 THEN
      RAISE u_rating_exception;
    END IF;
  FETCH s_semester_7_8 INTO s_id, s_name, s_hour, s_semestr;
 
EXCEPTION WHEN u_rating_exception THEN
    dbms_output.put_line(s_name||' '||s_hour||' '||s_semestr);
    FETCH s_semester_7_8 INTO s_id, s_name, s_hour, s_semestr;
  END;
END LOOP;
END;
/