use course_work;

drop function if exists get_type_id;

delimiter $$

create function get_type_id (type_name varchar(20))
returns int
begin
	declare type_id int default -1;
    
	select id into type_id
    from facility_type as ft
    where ft.name = type_name;
    
    return type_id;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_sport_id;

delimiter $$

create function get_sport_id (sport_name varchar(20))
returns int
begin
	declare sport_id int default -1;
    
	select id into sport_id
	from kind_of_sport as kos
	where kos.name = sport_name;

    return sport_id;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_coach_id;

delimiter $$

create function get_coach_id (coach_name varchar(20),
	coach_surname varchar(20))
returns int
begin
	declare coach_id int default -1;
    
	select c.id into coach_id
	from coach as c
	where c.name = coach_name and c.surname = coach_surname;

    return coach_id;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_sportsman_id;

delimiter $$

create function get_sportsman_id (s_name varchar(20),
	s_surname varchar(20))
returns int
begin
	declare sportsman_id int default -1;
    
	select id into sportsman_id
	from sportsman as s
	where s.name = s_name and s.surname = s_surname;

    return sportsman_id;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_competition_id;

delimiter $$

create function get_competition_id (c_name varchar(20))
returns int
begin
	declare c_id int default -1;
    
	select id into c_id
	from competition as c
	where c.name = c_name;

    return c_id;
end$$