#=================TASK #10==================

drop procedure if exists get_coaches_by_sport;

delimiter $$
create procedure get_coaches_by_sport(IN sport_name varchar(20))
begin
	select c.name as 'Name',
				c.surname as 'Surname'
    from coach as c
    join _coach_sport as _cs on _cs.coach_id = c.id
    join kind_of_sport as kos on kos.id = _cs.kind_of_sport_id
		where _cs.kind_of_sport_id = get_sport_id(sport_name);
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_coaches_by_sport("kind_of_sport_2");
call get_coaches_by_sport("kind_of_sport_3");