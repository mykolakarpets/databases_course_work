#=================TASK #11==================

drop procedure if exists get_uncompeted_sportsmans;

delimiter $$
create procedure get_uncompeted_sportsmans(in low_date date, in top_date date)
begin
	select s.name as 'Name',
					s.surname as 'Surname',
                    s.id as 'ID'
		
		from sportsman as s
		left join attenders as att on att.sportsman_id = s.id
		join competition as c on c.id = att.competition_id and (c.date < low_date or c.date > top_date)
	union
    select s.name as 'Name',
					s.surname as 'Surname',
                    s.id as 'ID'
		
	from sportsman as s
	where s.id not in (select s.id from sportsman as s
		join attenders as a on a.sportsman_id = s.id);
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_uncompeted_sportsmans("2000-12-12", "2006-12-12");