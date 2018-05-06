#=================TASK #5==================

drop procedure if exists get_coaches;

delimiter $$
create procedure get_coaches(in s_name varchar(20),
	in s_surname varchar(20))
begin
	select s.name as 'Sportsman name',
				s.surname as 'Sportsman surname',
                c.name as 'Coach name',
                c.surname as 'Coach surname'
	from coach as c
    join _sportsman_sport_coach as _ssc on _ssc.coach_id = c.id
    join _sportsman_sport as _ss on _ss.id = _ssc._sportsman_sport_id
    join sportsman as s on s.id = _ss.sportsman_id
    where _ss.sportsman_id = get_sportsman_id(s_name, s_surname);	
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_coaches("sportsman_name_3","sportsman_surname_3");