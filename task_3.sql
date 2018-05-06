#=================TASK #3==================

drop procedure if exists get_sportsmans_by_coach;

delimiter $$
/**
 * Selects sportsmans that are trained by specified coach.
 *
 * param[in] category (-1) if filtering by category is not needed
 */
create procedure get_sportsmans_by_coach(IN coach_name varchar(20),
	IN coach_surname varchar(20), IN category int)
begin
	select s.name as 'Name',
				s.surname as 'Surname',
                s.category as 'Category',
                c.name as 'Coach name',
                c.surname as 'Coach surname'
                
    from sportsman as s
    join _sportsman_sport as _ss on _ss.sportsman_id = s.id
    join _sportsman_sport_coach as _ssc on _ssc._sportsman_sport_id = _ss.id
    join coach as c on c.id = _ssc.coach_id
		where _ssc.coach_id = get_coach_id(coach_name, coach_surname)
			and (category = -1 or s.category <= category);
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_sportsmans_by_coach("coach_name_1", "coach_surname_1", -1);
call get_sportsmans_by_coach("coach_name_1", "coach_surname_1", 2);
