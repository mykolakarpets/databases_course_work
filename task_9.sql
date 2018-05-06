#=================TASK #9==================

drop procedure if exists get_sport_clubs;

delimiter $$
create procedure get_sport_clubs(in low_date date, in top_date date)
begin
	select sc.name as 'Title',
		count(s.id) as 'Sportsmans count',
        count(c1.id) as 'Competed', 
        max(c1.date) as 'Latest competition',
        min(c1.date) as 'Earliest competition'

    from sport_club as sc
    join sportsman as s on s.sport_club_id = sc.id
    left join attenders as att on att.sportsman_id = s.id
    left join	(select * from competition as c
					where ((low_date is null or c.date >= low_date)
						and (top_date is null or c.date <= top_date))
				) as c1
        	on c1.id = att.competition_id
	
    group by sc.id;

    
    
    
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_sport_clubs(null, null);
call get_sport_clubs("2000-01-01", "2006-12-12");