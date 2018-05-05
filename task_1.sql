#=================TASK #1==================

drop procedure if exists get_facilities_by_type;

delimiter $$
create procedure get_facilities_by_type(IN type_name varchar(20))
begin
	select *
	from facility as f
	where f.facility_type_id = get_type_id(type_name);
end$$

#--------------------------------------------------------------------------

drop procedure if exists get_facilities_by_str_param$$

delimiter $$
create procedure get_facilities_by_str_param(IN type_name varchar(20),
			IN attr_name varchar(20),
            IN attr_value varchar(20))
begin
	select *
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
	select *
	from facility as f
	where f.facility_type_id = get_type_id(type_name);

	select *
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