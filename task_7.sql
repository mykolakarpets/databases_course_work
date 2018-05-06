#=================TASK #7==================

drop procedure if exists get_medalists;

delimiter $$
#org_name - "" if filtering by organizer is not needed
#						"<organizer name>" otherwise
create procedure get_medalists(in c_name varchar(20))
begin
	select s.name as 'Name',
				s.surname as 'Surname',
                c.name as 'Competition title',
                a.result as 'Result'
                
    from sportsman as s
    join attenders as a on s.id = a.sportsman_id
    join competition as c on c.id = a.competition_id
    where a.competition_id = get_competition_id(c_name) and a.is_medalist = 1
    order by a.result;
end$$

#--------------------------------------------------------------------------

delimiter ;

call get_medalists("competition_2");