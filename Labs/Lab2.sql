--описать и вызвать функцию которая вычисляет для университета номера которых находятся в данном диапазоне максимальное кол-во преподавателей которые его читают по заданному названию предмета
CREATE OR replace FUNCTION nazv
  (l_university_diapason in NUMBER,
  r_university_diapason in NUMBER,
  subject_name in subject.subj_name%TYPE)
  RETURN NUMBER
  AS
  lecturers_count NUMBER := 0;
BEGIN
  SELECT sum(l.univ_id) INTO lecturers_count
    FROM lecturer l JOIN university u ON l.univ_id=u.univ_id JOIN subj_lect sl ON l.lecturer_id=sl.lecturer_id JOIN subject s ON s.subj_id=sl.subj_id
    WHERE (u.univ_id BETWEEN l_university_diapason AND r_university_diapason) AND s.subj_name = subject_name;
  IF lecturers_count IS NULL THEN lecturers_count:=0; END IF;
  RETURN lecturers_count;
END;
/