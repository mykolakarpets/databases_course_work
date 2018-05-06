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