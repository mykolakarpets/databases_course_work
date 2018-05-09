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
