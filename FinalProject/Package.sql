CREATE OR REPLACE PACKAGE CLIMBER_CLUB_PACKAGE AS


    --Для каждой горы показывает список групп, осуществляющих восхождение, в хронологическом порядке.
    PROCEDURE show_climbing_groups_for_peak(peak_name in );































    --PAC_CONST CONSTANT NUMBER:=20;
    FUNCTION count_positive_stud
    (subject_name in subject.subj_name%TYPE) RETURN NUMBER;

    PROCEDURE MYAUDIT;
  END;
/



CREATE OR REPLACE PACKAGE BODY CLIMBER_CLUB_PACKAGE AS
    --Для каждой горы показывает список групп, осуществляющих восхождение, в хронологическом порядке.
    PROCEDURE show_climbing_groups_for_peak
    (peak_name in )
    IS
    peak_id NUMBER;
    CURSOR cur IS
        SELECT * FROM 
    BEGIN

    END;
    

END;
/








CREATE OR replace PACKAGE BODY MYPACKAGE1 AS
  PAC_COUNT NUMBER:=0;
  PAC_subject_name subject.subj_name%TYPE;
  PAC_students_count NUMBER:=0;

  FUNCTION count_positive_stud
  (subject_name in subject.subj_name%TYPE) RETURN NUMBER IS
    students_count_l NUMBER := 0;
    BEGIN
      SELECT count(st.surname) INTO students_count_l
      FROM student st JOIN exams ex ON st.stud_id = ex.stud_id JOIN subject su ON su.subj_id = ex.subj_id
      WHERE su.subj_name = subject_name;
      pac_students_count:=students_count_l;
      pac_subject_name:=subject_name;
      MYAUDIT;
      RETURN students_count_l;
    END;

  PROCEDURE MYAUDIT IS
    BEGIN
      PAC_COUNT:=pac_count + 1;
      INSERT INTO MYPACKAGE1TABLE VALUES (pac_count, pac_subject_name,pac_students_count);
      commit;
    END;



















END;
/