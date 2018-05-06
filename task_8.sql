#=================TASK #8==================

drop procedure if exists get_competitions_by_facility;

delimiter $$
#kind_of_sport - "" if filtering by sport is not needed
#							"<kind of sport>" otherwise
create procedure get_competitions_by_facility(in f_name varchar(20), in sport_name varchar(20))
begin
	select c.name as 'Title',
				f.name as 'Facility name',
                kos.name as 'Kind of sport'
    from competition as c
    join facility as f on c.facility_id = f.id
    join kind_of_sport as kos on c.kind_of_sport_id = kos.id
    where f.name = f_name and (sport_name = "" or kos.name = sport_name);
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_competitions_by_facility("facility_3","");
call get_competitions_by_facility("facility_3","kind_of_sport_4");