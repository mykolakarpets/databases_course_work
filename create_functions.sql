use course_work;
drop function if exists get_type_id;

delimiter $$

create function get_type_id (type_name varchar(20))
returns int
begin
	declare type_id int default 0;
    
	select id into type_id
    from facility_type as ft
    where ft.name = type_name;
    
    return type_id;
end$$