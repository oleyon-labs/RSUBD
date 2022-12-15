INSERT INTO climber VALUES (climber_id_seq.nextval, 'Абрам', 'Ибрагимов', 'Воронеж');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Иван', 'Воронов', 'Москва');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Игорь', 'Власов', 'Москва');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Ангелина', 'Еремеева', 'Новороссийск');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Анастасия', 'Иванова', 'Бердяево');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Митрофан', 'Тарасов', 'Можжевелкино');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Артем', 'Тимофеев', 'Бруталкино');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Слава', 'Головин', 'Червоедово');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Арсений', 'Алексеев', 'Тольяти');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Влад', 'Фролов', 'Мурманск');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Кирилл', 'Головин', 'Москва');
INSERT INTO climber VALUES (climber_id_seq.nextval, 'Данил', 'Смирнов', 'Архангельск');

INSERT INTO country VALUES (country_id_seq.nextval, 'Россия');
INSERT INTO country VALUES (country_id_seq.nextval, 'Азербайджан');
INSERT INTO country VALUES (country_id_seq.nextval, 'США');
INSERT INTO country VALUES (country_id_seq.nextval, 'Канада');
INSERT INTO country VALUES (country_id_seq.nextval, 'Китай');
INSERT INTO country VALUES (country_id_seq.nextval, 'Непал');

INSERT INTO mountain_range VALUES (mountain_range_id_seq.nextval, 'Гималаи');
INSERT INTO mountain_range VALUES (mountain_range_id_seq.nextval, 'Кавказ');
INSERT INTO mountain_range VALUES (mountain_range_id_seq.nextval, 'Кордильеры');
INSERT INTO mountain_range VALUES (mountain_range_id_seq.nextval, 'Уральские горы');
INSERT INTO mountain_range VALUES (mountain_range_id_seq.nextval, 'Альпы');
INSERT INTO mountain_range VALUES (mountain_range_id_seq.nextval, 'Тянь-Шань');

INSERT INTO peak VALUES (peak_id_seq.nextval, 'Эверест', 8848, 6, 1);
INSERT INTO peak VALUES (peak_id_seq.nextval, 'Эльбрус', 5642, 1, 2);
INSERT INTO peak VALUES (peak_id_seq.nextval, 'Народная', 1895, 1, 4);
INSERT INTO peak VALUES (peak_id_seq.nextval, 'Травная', 1427, 1, 4);
INSERT INTO peak VALUES (peak_id_seq.nextval, 'Мураманд', 3758, 1, 2);
INSERT INTO peak VALUES (peak_id_seq.nextval, 'Аконкагуа', 6961, 3, 3);

INSERT INTO climbing VALUES (climbing_id_seq.nextval, TO_DATE('2003/05/03', 'yyyy/mm/dd'), TO_DATE('2003/09/25', 'yyyy/mm/dd'), 1);
INSERT INTO climbing VALUES (climbing_id_seq.nextval, TO_DATE('2015/04/03', 'yyyy/mm/dd'), TO_DATE('2016/02/15', 'yyyy/mm/dd'), 1);
INSERT INTO climbing VALUES (climbing_id_seq.nextval, TO_DATE('2018/05/03', 'yyyy/mm/dd'), TO_DATE('2003/05/29', 'yyyy/mm/dd'), 3);
INSERT INTO climbing VALUES (climbing_id_seq.nextval, TO_DATE('2022/12/10', 'yyyy/mm/dd'), NULL, 2);
INSERT INTO climbing VALUES (climbing_id_seq.nextval, TO_DATE('2022/10/01', 'yyyy/mm/dd'), TO_DATE('2022/10/25', 'yyyy/mm/dd'), 2);
INSERT INTO climbing VALUES (climbing_id_seq.nextval, TO_DATE('2022/03/07', 'yyyy/mm/dd'), TO_DATE('2022/06/08', 'yyyy/mm/dd'), 6);
INSERT INTO climbing VALUES (climbing_id_seq.nextval, TO_DATE('2022/10/01', 'yyyy/mm/dd'), NULL, 1);
INSERT INTO climbing VALUES (climbing_id_seq.nextval, TO_DATE('2022/10/02', 'yyyy/mm/dd'), NULL, 1);

INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Альпинисты мы', 4);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Терявкины', 1);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Муджад', 2);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Жумы', 3);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Крутые киты', 6);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Муламы', 7);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Кравцы', 4);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Бутеры', 2);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Собачники', 6);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Кошатники', 6);
INSERT INTO climbing_group VALUES (climbing_group_id_seq.nextval, 'Терявкины', 8);

INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 2, 1);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 1, 1);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 3, 1);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 4, 2);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 5, 4);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 6, 5);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 7, 5);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 8, 3);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 1, 5);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 2, 2);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 3, 4);
INSERT INTO climber_group VALUES (climber_group_id_seq.nextval, 1, 4);