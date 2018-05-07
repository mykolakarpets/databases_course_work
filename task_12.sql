#=================TASK #12==================

drop procedure if exists get_organizers;

delimiter $$
create procedure get_organizers(in low_date date, in top_date date)
begin
	select org.name as 'Name',
		count(comp.id) as 'Count of competitions'
				
    from organizer as org
    join competition as comp on comp.organizer_id = org.id
		where (comp.date >= low_date or low_date is null) 
			and (comp.date <= top_date or top_date is null)
	group by org.id;
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_organizers(null, null);
call get_organizers("2000-01-01", "2006-12-12");