#=================TASK #1==================

drop procedure if exists get_facilities_by_type;

delimiter $$
create procedure get_facilities_by_type(IN type_name varchar(20))
begin
	select f.id as 'ID',
				f.name as 'Facility name',
                ft.name as 'Type name',
                a.name as 'Attribute name',
                _af.int_value as 'Integer value',
                _af.string_value as 'String value'                
	from facility as f
    join facility_type as ft 			on f.facility_type_id = ft.id
    join _attribute_facility as _af 	on f.id = _af.facility_id
    join attribute as a 						on a.id = _af.attribute_id
	where f.facility_type_id = get_type_id(type_name);
end$$

#--------------------------------------------------------------------------

drop procedure if exists get_facilities_by_str_param$$

delimiter $$
create procedure get_facilities_by_str_param(IN type_name varchar(20),
			IN attr_name varchar(20),
            IN attr_value varchar(20))
begin
	select f.name as 'Facility name',
				attr.name as 'Attribute name',
                _af.string_value as 'Value'
	from facility as f
	join _attribute_facility as _af
	join attribute as attr
	join _attribute_facility_type as _aft on _aft.attribute_id = _af.attribute_id
		and f.id = _af.facility_id
		and f.facility_type_id = _aft.facility_type_id
		and attr.id = _af.attribute_id
	where attr.name = attr_name 
			and f.facility_type_id = get_type_id(type_name)
            and attr.value_type = "string"
			and _af.string_value = attr_value;
end$$

#--------------------------------------------------------------------------

drop procedure if exists get_facilities_by_int_param$$

delimiter $$
create procedure get_facilities_by_int_param(IN type_name varchar(20),
			IN attr_name varchar(20),
            IN low_bound int,
            IN top_bound int)
begin
	select f.name as 'Facility name',
				attr.name as 'Attribute name',
                _af.int_value as 'Value'
	from facility as f
	join _attribute_facility as _af
	join attribute as attr
	join _attribute_facility_type as _aft on _aft.attribute_id = _af.attribute_id
		and f.id = _af.facility_id
		and f.facility_type_id = _aft.facility_type_id
		and attr.id = _af.attribute_id
	where attr.name = attr_name 
			and f.facility_type_id = get_type_id(type_name)
            and attr.value_type = "int"
			and _af.int_value >= low_bound
            and _af.int_value <= top_bound;
end$$

#--------------------------------------------------------------------------
delimiter ;

call get_facilities_by_type("facility_type_1");
call get_facilities_by_str_param("facility_type_1", "str_attribute_1", "facility_str_val_1");
call get_facilities_by_int_param("facility_type_1", "int_attribute_3", 0, 10);