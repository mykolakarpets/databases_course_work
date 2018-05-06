#=================TASK #2==================

drop procedure if exists get_sportsmans_by_sport;

delimiter $$
create procedure get_sportsmans_by_sport(IN sport_name varchar(20))
begin
	select s.name as 'Name',
				s.surname as 'Surname',
                kos.name as 'Kind of sport',
                s.category as 'Category'
    from sportsman as s
    join _sportsman_sport as _ss on _ss.sportsman_id = s.id
    join kind_of_sport as kos on kos.id = _ss.kind_of_sport_id
		where _ss.kind_of_sport_id = get_sport_id(sport_name);
end$$

#--------------------------------------------------------------------------

delimiter ;
drop procedure if exists get_sportsmans_by_sport_category;

delimiter $$
create procedure get_sportsmans_by_sport_category(IN sport_name varchar(20),
	IN category int)
begin
	select s.name as 'Name',
				s.surname as 'Surname',
                kos.name as 'Kind of sport',
                s.category as 'Category'
    from sportsman as s
    join _sportsman_sport as _ss on _ss.sportsman_id = s.id
    join kind_of_sport as kos on kos.id = _ss.kind_of_sport_id
		where _ss.kind_of_sport_id = get_sport_id(sport_name)
        and s.category <= category;
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_sportsmans_by_sport("kind_of_sport_1");
call get_sportsmans_by_sport_category("kind_of_sport_1", 2);