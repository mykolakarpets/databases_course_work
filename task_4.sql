#=================TASK #4==================

drop procedure if exists get_sportsmans_several_kos;

delimiter $$
create procedure get_sportsmans_several_kos()
begin    
	select s.name as 'Name',
				s.surname as 'Surname',
               count(_ss.sportsman_id) as 'Sports count'
    from sportsman as s
    join _sportsman_sport as _ss on _ss.sportsman_id = s.id 
	group by s.id
	having count(_ss.sportsman_id) > 1;
	
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_sportsmans_several_kos();