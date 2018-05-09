#=================INSERT PROCEDURES==================

drop procedure if exists add_facility_type;

delimiter $$
create procedure add_facility_type(IN f_name varchar(30))
begin
	if get_type_id(f_name) = -1 then
		insert into facility_type (name) values (f_name);
        #select * from facility_type as ft where ft.name = f_name;
	else
		select "The facility type is already exist!";
    end if;
end$$

#call add_facility_type("facility_type_1")$$

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_attribute_type;

delimiter $$
create procedure add_attribute_type(in attr_name varchar(30),
	in attr_value_type varchar(30),
    in facility_type_name varchar(30))
begin
	if get_type_id(facility_type_name) != -1 then
		if get_attribute_id(attr_name) = -1 then
			insert into attribute (name, value_type) values (attr_name, attr_value_type);
			#select * from attribute as attr where attr.name = attr_name;
		else
			select "Specified attribute is already present!";
        end if;        
		
		if (check_attribute_in_type(get_attribute_id(attr_name), get_type_id(facility_type_name)) = 0) then
			insert into _attribute_facility_type (attribute_id, facility_type_id) values (get_attribute_id(attr_name), get_type_id(facility_type_name));
			#select * from _attribute_facility_type as _aft where _aft.attribute_id = get_attribute_id(attr_name) 
			#	and _aft.facility_type_id = get_type_id(facility_type_name);
		else
			select "Specified attribute is already connected to the type!";
        end if;
	else
		select "No such facility_type";
	end if;
end$$

#call add_attribute_type("int_attribute_1", "int", "facility_type_3")$$
#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_attribute_facility;

delimiter $$
create procedure add_attribute_facility(in attr_name varchar(30),
	in attr_value_type varchar(30),
    in facility_name varchar(30),
    in int_value int,
    in str_value varchar(30))
begin
	if (facility_name in (select f.name from facility as f)
		and (attr_name, attr_value_type) in 
        (select attr.name, attr.value_type from attribute as attr)) then
        
        if (check_attribute_in_type(get_attribute_id(attr_name),
			(select f.facility_type_id from facility as f where f.name = facility_name)) = 1) then
            if ((get_attribute_id(attr_name), get_facility_id(facility_name))
				in (select _af.attribute_id, _af.facility_id from _attribute_facility as _af)) then
                if (attr_value_type = "int" and int_value is not null) then
					update _attribute_facility as _af
						set _af.int_value = int_value
                        where  attribute_id = get_attribute_id(attr_name) and facility_id = get_facility_id(facility_name);
				elseif (attr_value_type = "string" and str_value is not null) then
					update _attribute_facility as _af
						set _af.string_value = str_value
                        where  attribute_id = get_attribute_id(attr_name) and facility_id = get_facility_id(facility_name);
				else
					select "Value must not be null!";
                end if;
            elseif (attr_value_type = "int" and int_value is not null) then
				insert into _attribute_facility(attribute_id, facility_id, string_value, int_value)
					values (get_attribute_id(attr_name), get_facility_id(facility_name), int_value, null);
			elseif (attr_value_type = "string" and str_value is not null) then
				insert into _attribute_facility(attribute_id, facility_id, string_value, int_value)
					values (get_attribute_id(attr_name), get_facility_id(facility_name), null, str_value);
			else
				select "Value must not be null!";
			end if;
		else
			select "The attribute is not related to the type!";
		end if;
		      
	else
		select "No such facility or attribute!";
	end if;
end$$

#call add_attribute_facility("int_attribute_1", "int", "facility_6", 7, null)$$

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_facility;

delimiter $$
create procedure add_facility(in facility_name varchar(30),
	in facility_type_name varchar(30))
begin
	if get_facility_id(facility_name) = -1 then
		if get_type_id(facility_type_name) != -1 then
			insert into facility (name, facility_type_id) values 
				(facility_name, get_type_id(facility_type_name));
		else
			select "No such facility type!";
        end if;
	else
		select "Specified facility exists!";
    end if;
end$$

#call add_facility("facility_111","type_1");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_attender;

delimiter $$
create procedure add_attender(in s_name varchar(30),
	in s_surname varchar(30), in c_name varchar(30), 
	in is_medalist int, in result int)
begin
	set @s_id = get_sportsman_id(s_name, s_surname);
    set @c_id = get_competition_id(c_name);
    
	if  @s_id != -1 and
		 @c_id != -1 then
        if (@s_id, @c_id) not in (select att.sportsman_id, att.competition_id from attenders as att) and
			(@c_id, result) not in (select att.competition_id, att.result from attenders as att) then
            if (check_sportsman_competition(@s_id, @c_id) = 1) then
				insert into attenders (competition_id, sportsman_id, is_medalist, result) values
					(@s_id, @c_id, is_medalist, result);
			else
				select "Sportsman's and competition sport are not coincide";
            end if;
        else
			select "Sportsman or the result is already registered in competition";
        end if;
    else 
		select "There is no such sportsman or competition!";
	end if;
end$$

#call add_attender("sportsman_name_10","sportsman_surname_10", "competition_10", 1, 1);

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_coach;

delimiter $$
create procedure add_coach(in c_name varchar(20),
	in c_surname varchar(20))
begin
	if get_coach_id(c_name, c_surname) = -1 then
		insert into coach (name, surname) values (c_name, c_surname);
    else
		select "The coach exists!";
    end if;
end$$

#call add_coach("coach_name_16","coach_surname_16#");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_competition;

delimiter $$
create procedure add_competition(in c_name varchar(20),
	in c_org varchar(20), in c_kos varchar(20), in c_facility varchar(20),
    in c_date date)
begin
	set @org_id = get_org_id(c_org);
    set @kos_id = get_kos_id(c_kos);
    set @fac_id = get_facility_id(c_facility);
	if get_competition_id(c_name) = -1 then
		if @org_id = 1 and @kos_id = 1 and
			 @fac_id = 1 then
			insert into competition (organizer_id, kind_of_sport_id, facility_id, name, date) values
				(@org_id, @kos_id, @fac_id, c_name, c_date);
        else
			select "Organizator, kind of sport or facility are not exist";
        end if;
    else
		select "The competition exists!";
    end if;
end$$

#call add_competition("new_competition","oganizer_1","kind_of_sport_1","facility_1","2010-01-01");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_kind_of_sport;

delimiter $$
create procedure add_kind_of_sport(in kos_name varchar(30))
begin
	if get_kos_id(kos_name) = -1 then
		insert into kind_of_sport (name) values (kos_name);
    else
		select "Specified kind of sport is already exists!";
    end if;
end$$

#call add_kind_of_sport("kind_of_sport_25");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_organizer;

delimiter $$
create procedure add_organizer(in org_name varchar(30))
begin
	if get_org_id(org_name) = -1 then
		insert into organizer (name) values (org_name);
    else
		select "Specified organizer is already exists!";
    end if;
end$$

#call add_organizer("organizer_1");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_sport_club;

delimiter $$
create procedure add_sport_club(in sc_name varchar(30))
begin
	if get_sport_club_id(sc_name) = -1 then
		insert into sport_club (name) values (sc_name);
    else
		select "Specified sport club is already exists!";
    end if;
end$$

#call add_sport_club("sport_club_16");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_sportsman;

delimiter $$
create procedure add_sportsman(in s_name varchar(30),
	in s_surname varchar(30), in in_age int, in in_category int,
    in sport_club_name varchar(30))
begin
	set @sc_id = get_sport_club_id(sport_club_name);
	if get_sportsman_id(s_name, s_surname) = -1 then
		if @sc_id != -1 then
			insert into sportsman (name, surname, age, category, sport_club_id) values
				(s_name, s_surname, in_age, in_category, @sc_id);
        else
			select "Specified sport club not found!";
        end if;
    else
		select "Specified sportsman is already exists";
    end if;
end$$

#call add_sportsman("sportsman_name_100", "sportsman_surname_100",20, 3, "sport_club_1");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_sportsman_coach;

delimiter $$
create procedure add_sportsman_coach(in s_name varchar(30),
	in s_surname varchar(30), in c_name varchar(30),
	in c_surname varchar(30), in kos_name varchar(30))
begin
	set @kos_id = get_kos_id(kos_name);
    set @s_id = get_sportsman_id(s_name, s_surname);
    set @c_id = get_coach_id(c_name, c_surname);
    
	if @kos_id != -1 and
		@s_id != -1 and
		@c_id != -1 then
        set @_ss_id = get_sportsman_sport_id(@s_id, @kos_id);
        if @_ss_id != -1 and check_coach_sport(@c_id, @kos_id) = 1 and
			@c_id not in (select _ssc.coach_id from _sportsman_sport_coach as _ssc where _ssc._sportsman_sport_id = @_ss_id) then
			insert into _sportsman_sport_coach (_sportsman_sport_id, coach_id)
				values (@_ss_id, @c_id);
        else
			select "Something's gone wrong!";
        end if;
    else
		select "One of the parameters is not exist!";
    end if;
end$$

#call add_sportsman_coach("sportsman_name_6", "sportsman_surname_6", "coach_name_13", "coach_surname_13", "kind_of_sport_7");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_sportsman_sport;

delimiter $$
create procedure add_sportsman_sport(in s_name varchar(30),
	in s_surname varchar(30), in kos_name varchar(30))
begin
	set @kos_id = get_kos_id(kos_name);
    set @s_id = get_sportsman_id(s_name, s_surname);
    
	if @kos_id != -1 and
		@s_id != -1 then
        set @_ss_id = get_sportsman_sport_id(@s_id, @kos_id);
        if @_ss_id = -1 then
			insert into _sportsman_sport (sportsman_id, kind_of_sport_id) values
				(@s_id, @kos_id);
        else
			select "The sport is already assigned to the sportsman!";
        end if;
    else
		select "One of the parameters is not exist!";
    end if;
end$$

#call add_sportsman_sport("sportsman_name_1", "sportsman_surname_1", "kind_of_sport_2");

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists add_coach_sport;

delimiter $$
create procedure add_coach_sport(in c_name varchar(30),
	in c_surname varchar(30), in kos_name varchar(30))
begin
	set @kos_id = get_kos_id(kos_name);
    set @c_id = get_coach_id(c_name, c_surname);
    
	if @kos_id != -1 and
		@c_id != -1 then
        if @c_id not in (select _cs.coach_id from _coach_sport as _cs where _cs.kind_of_sport_id = @kos_id) then
			insert into _coach_sport (coach_id, kind_of_sport_id) values
				(@c_id, @kos_id);
        else
			select "The sport is already assigned to the coach!";
        end if;
    else
		select "One of the parameters is not exist!";
    end if;
end$$

#call add_coach_sport("coach_name_1", "coach_surname_1", "kind_of_sport_3");