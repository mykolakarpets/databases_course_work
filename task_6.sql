#=================TASK #6==================

drop procedure if exists get_competitions_by_date;

delimiter $$
#org_name - "" if filtering by organizer is not needed
#						"<organizer name>" otherwise
create procedure get_competitions_by_date(in low_date date, in top_date date,
	in org_name varchar(20))
begin
	select c.name as 'Title',
				c.date as 'Date',
                o.name as 'Ogranizer'
	from competition as c
    join organizer as o on o.id = c.organizer_id
    where (c.date > low_date) and (c.date < top_date)
    and (org_name = "" or o.name = org_name);
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_competitions_by_date("2000-01-01","2015-12-12","");
call get_competitions_by_date("2000-01-01","2009-12-12","");