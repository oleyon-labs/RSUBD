--1
BEGIN
    CLIMBER_CLUB_PACKAGE.SHOW_CLIMBING_GROUPS_FOR_PEAK(1);
END;
/

--2
BEGIN
    CLIMBER_CLUB_PACKAGE.add_new_peak('Анастейша', 5000, 'Россия', 'Кавказ');
END;
/

--3
BEGIN
    CLIMBER_CLUB_PACKAGE.change_peak_info(7, 'Гиндо', 2821);
END;
/

--4
BEGIN
    CLIMBER_CLUB_PACKAGE.show_climbers_in_date_range(TO_DATE('2015/05/03', 'yyyy/mm/dd'), TO_DATE('2023/05/03', 'yyyy/mm/dd'));
END;
/

--5
BEGIN
    CLIMBER_CLUB_PACKAGE.add_climber_to_group(8,5);
END;
/

--6
BEGIN
    CLIMBER_CLUB_PACKAGE.show_climbing_count(4,1);
END;
/

--7
BEGIN
    CLIMBER_CLUB_PACKAGE.show_groups_in_date_range(TO_DATE('2015/05/03', 'yyyy/mm/dd'), TO_DATE('2023/05/03', 'yyyy/mm/dd'));
END;
/

--8
BEGIN
    CLIMBER_CLUB_PACKAGE.add_group('Молорины', 1);
END;
/

--9
BEGIN
    CLIMBER_CLUB_PACKAGE.show_climbers_count(1);
END;
/
