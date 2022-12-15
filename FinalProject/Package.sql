CREATE OR REPLACE PACKAGE CLIMBER_CLUB_PACKAGE AS
    --Для каждой горы показывает список групп, осуществляющих восхождение, в хронологическом порядке.
    PROCEDURE show_climbing_groups_for_peak(peak_id1 INT);
    --Предоставить возможность добавления новой вершины, с указанием названия вершины, высоты и страны местоположения.
    PROCEDURE add_new_peak(peak_name VARCHAR, peak_height NUMBER, peak_country VARCHAR, peak_range VARCHAR);
    --Предоставить возможность изменения данных о вершине, если на нее не было восхождения.
    PROCEDURE change_peak_info(peak_id1 INT, peak_name VARCHAR, peak_height NUMBER);
    --Показать список альпинистов, осуществивших восхождение в указанный интервал дат.
    PROCEDURE show_climbers_in_date_range(start_d DATE, end_d DATE);
    --Предоставить возможность добавления нового альпиниста в состав указанной группы.
    PROCEDURE add_climber_to_group(climber_id INT, climbing_id INT);
    --Показать информацию о количестве восхождений каждого альпиниста на каждую гору.
    PROCEDURE show_climbing_count(climber_id1 INT, peak_id1 INT);
    --Показать список восхождений (групп), которые осуществлялись в указанный пользователем период времени.
    PROCEDURE show_groups_in_date_range(start_d DATE, end_d DATE);
    --Предоставить возможность добавления новой группы, указав ее название, вершину, время начала восхождения.
    PROCEDURE add_group(group_name VARCHAR, climbing_id1 INT);
    --Предоставить информацию о том, сколько альпинистов побывали на каждой горе.
    PROCEDURE show_climbers_count(peak_id1 INT);
  END;
/



CREATE OR REPLACE PACKAGE BODY CLIMBER_CLUB_PACKAGE AS
    PROCEDURE show_climbing_groups_for_peak
    (peak_id1 INT)
    IS
    c_name VARCHAR(255);
    c_date DATE;
    CURSOR cur IS SELECT CLIMBING_GROUP.NAME, CLIMBING.START_DATE FROM peak join climbing on (peak.ID=CLIMBING.PEAK_ID) join climbing_group on (CLIMBING.ID=CLIMBING_GROUP.CLIMBING_ID) where peak_id1 = peak.id and climbing.end_date is NULL order by CLIMBING.START_DATE asc;
    BEGIN
        OPEN cur;
        FETCH cur INTO c_name, c_date;
        WHILE cur%FOUND LOOP
          dbms_output.put_line(c_name||', '||c_date);
          FETCH cur INTO c_name, c_date;
        END LOOP;
    END;

    PROCEDURE add_new_peak(peak_name VARCHAR, peak_height NUMBER, peak_country VARCHAR, peak_range VARCHAR)
    IS
    c_id NUMBER := -1;
    r_id NUMBER := -1;
    BEGIN
      select id into c_id from COUNTRY where peak_country = COUNTRY_NAME;
      select id into r_id from MOUNTAIN_RANGE where NAME = peak_range;
      IF r_id < 0 THEN
        INSERT INTO mountain_range VALUES (mountain_range_id_seq.nextval, peak_range);
      end if;
      IF c_id < 0 THEN
        INSERT INTO country VALUES (country_id_seq.nextval, peak_country);
      end if;
      select id into c_id from COUNTRY where peak_country = COUNTRY_NAME;
      select id into r_id from MOUNTAIN_RANGE where NAME = peak_range;
      INSERT INTO peak VALUES (peak_id_seq.nextval, peak_name, peak_height, c_id, r_id);
    END;

    PROCEDURE change_peak_info(peak_id1 INT, peak_name VARCHAR, peak_height NUMBER)
    IS
    c_id NUMBER := -1;
    r_id NUMBER := -1;
    p_c number := -1;
    BEGIN
      SELECT COUNT(*) into p_c FROM peak join climbing on (peak.ID=CLIMBING.PEAK_ID) WHERE peak.id = peak_id1;
      if p_c = 0
      THEN
        update peak set name = peak_name, HEIGHT = peak_height where id = peak_id1;
      ELSE
        dbms_output.put_line('восхождения уже были или такой вершины не существует');
      end if;
    END;

    PROCEDURE show_climbers_in_date_range(start_d DATE, end_d DATE)
    IS
    cl_i NUMBER;
    cl_n VARCHAR(255);
    cl_s VARCHAR(255);
    cl_a VARCHAR(255);
    CURSOR cur IS SELECT DISTINCT climber.ID, climber.NAME, climber.SURNAME, climber.ADDRESS FROM climbing join climbing_group on (CLIMBING.ID=CLIMBING_GROUP.CLIMBING_ID) join CLIMBER_GROUP on (CLIMBER_GROUP.GROUP_ID = CLIMBING_GROUP.ID) join climber on (climber.ID=CLIMBER_GROUP.CLIMBER_ID)
      where start_d <= climbing.START_DATE and climbing.END_DATE is not null and climbing.END_DATE<end_d;
    BEGIN
        OPEN cur;
        FETCH cur INTO cl_i,cl_n,cl_s,cl_a;
        WHILE cur%FOUND LOOP
          dbms_output.put_line(cl_i||' '||cl_n||' '||cl_s||' '||cl_a);
          FETCH cur INTO cl_i,cl_n,cl_s,cl_a;
        END LOOP;
    END;

    PROCEDURE add_climber_to_group(climber_id INT, climbing_id INT)
    IS
    BEGIN
      INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, CLIMBER_ID, CLIMBING_ID);

      EXCEPTION when others THEN
      dbms_output.put_line('ошибка добавления альпиниста в группу');
    END;

    PROCEDURE show_climbing_count(climber_id1 INT, peak_id1 INT)
    IS
    c_count INT;
    BEGIN
      select count(climber.ID) into c_count from peak join climbing on(peak.ID = CLIMBING.PEAK_ID) join climbing_group on (CLIMBING.ID=CLIMBING_GROUP.CLIMBING_ID) join CLIMBER_GROUP on (CLIMBER_GROUP.GROUP_ID = CLIMBING_GROUP.ID) join climber on (climber.ID=CLIMBER_GROUP.CLIMBER_ID) where CLIMBER.ID = climber_id1 and peak_id1 = peak.id;
      dbms_output.put_line(c_count);
    END;

    PROCEDURE show_groups_in_date_range(start_d DATE, end_d DATE)
    IS
    gr_i NUMBER;
    gr_n VARCHAR(255);
    CURSOR cur IS SELECT DISTINCT CLIMBING_GROUP.ID, CLIMBING_GROUP.NAME FROM climbing join climbing_group on (CLIMBING.ID=CLIMBING_GROUP.CLIMBING_ID)
      where start_d <= climbing.START_DATE and climbing.END_DATE is not null and climbing.END_DATE<end_d;
    BEGIN
        OPEN cur;
        FETCH cur INTO gr_i,gr_n;
        WHILE cur%FOUND LOOP
          dbms_output.put_line(gr_i||' '||gr_n);
          FETCH cur INTO gr_i,gr_n;
        END LOOP;
    END;

    PROCEDURE add_group(group_name VARCHAR, climbing_id1 INT)
    IS
    BEGIN
      INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, group_name, climbing_id1);

      EXCEPTION when others THEN
      dbms_output.put_line('ошибка добавления группы');
    END;

    PROCEDURE show_climbers_count(peak_id1 INT)
    IS
    c_count INT;
    BEGIN
      select count(DISTINCT climber.ID) into c_count from peak join climbing on(peak.ID = CLIMBING.PEAK_ID) join climbing_group on (CLIMBING.ID=CLIMBING_GROUP.CLIMBING_ID) join CLIMBER_GROUP on (CLIMBER_GROUP.GROUP_ID = CLIMBING_GROUP.ID) join climber on (climber.ID=CLIMBER_GROUP.CLIMBER_ID) where peak_id1 = peak.id;
      dbms_output.put_line(c_count);
    END;

END;
/
