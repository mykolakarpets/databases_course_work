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

create function get_sportsman_id (s_name varchar(30),
	s_surname varchar(30))
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

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_facility_id;

delimiter $$

create function get_facility_id (f_name varchar(20))
returns int
begin
	declare f_id int default -1;
    
	select f.id into f_id
	from facility as f
	where f.name = f_name;

    return f_id;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_attribute_id;

delimiter $$

create function get_attribute_id (attr_name varchar(20))
returns int
begin
	declare attr_id int default -1;
    
	select attr.id into attr_id
	from attribute as attr
	where attr.name = attr_name;

    return attr_id;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists check_attribute_in_type;

delimiter $$

create function check_attribute_in_type(attr_id int, facility_type_id int)
returns int
begin
	declare result int default 0;
    
	if ((attr_id, facility_type_id) in (select * from _attribute_facility_type)) then
		set result = 1;
	end if;

    return result;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists check_sportsman_competition;

delimiter $$

create function check_sportsman_competition(s_id int, competition_id int)
returns int
begin
	declare result int default 0;
    
	if exists (
		select * from sportsman as s
        join _sportsman_sport as _ss on s.id = _ss.sportsman_id
        join attenders as att on att.sportsman_id = s.id
        join competition as comp on comp.kind_of_sport_id = _ss.kind_of_sport_id
			where s.id = s_id and comp.id = competition_id
    ) then
		set result = 1;
	end if;

    return result;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_org_id;

delimiter $$

create function get_org_id (org_name varchar(20))
returns int
begin
	declare org_id int default -1;
    
	select org.id into org_id
	from organizer as org
	where org.name = org_name;

    return org_id;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_kos_id;

delimiter $$

create function get_kos_id (kos_name varchar(20))
returns int
begin
	declare kos_id int default -1;
    
	select kos.id into kos_id
	from kind_of_sport as kos
	where kos.name = kos_name;

    return kos_id;
end$$

#--------------------------------------------------------------------------

delimiter ;
drop function if exists get_sport_club_id;

delimiter $$

create function get_sport_club_id (sc_name varchar(20))
returns int
begin
	declare sc_id int default -1;
    
	select sc.id into sc_id
	from sport_club as sc
	where sc.name = sc_name;

    return sc_id;
end$$