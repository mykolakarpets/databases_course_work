#=================TASK #13==================

drop procedure if exists get_facilities_by_comp_date;

delimiter $$
create procedure get_facilities_by_comp_date(in low_date date, in top_date date)
begin
	select fac.name as 'Name',
		comp.name as 'Competition title',
        comp.date as 'Date'
    from facility as fac
    join competition as comp on comp.facility_id = fac.id
		where (comp.date >= low_date or low_date is null) 
			and (comp.date <= top_date or top_date is null);
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_facilities_by_comp_date(null, null);
call get_facilities_by_comp_date("2000-01-01", "2006-12-12");