/* 
==========  Trigger 1. =============

Every time a new incident is reported this trigger calculates
how many incidents have already been reported during the current month.
If the total number of incidents during the month is 5 or more 
or the number of incidents from a single client is 2 or more
then the trigger displays a warning message to notify the regional manager.
*/

create or replace trigger count_incidents
before insert or update
on incidents
for each row
declare
    current_year number;
    current_month number;
    incident_count number;
    incident_client_count number;
    cursor clientlist is select clientid from clients;
begin
    select extract(year from sysdate) into current_year from dual;
    select extract(month from sysdate) into current_month from dual;
    select count(incidentid) into incident_count
        from incidents
        where extract(year from incident_date)=current_year
        and extract(month from incident_date)=current_month;
    if (incident_count >= 4) then
        dbms_output.put_line ('The number of incidents this month exceeded 5. Please notify the regional manager.');
    end if;
    for client in clientlist loop
        select count(incidentid) into incident_client_count
            from incidents
            where extract(year from incident_date)=current_year
            and extract(month from incident_date)=current_month;
        if (incident_client_count >= 1) then
            dbms_output.put_line ('The number of incidents this month for client ' || to_char(client.clientid) || '
                                    exceeded 2. Please notify the regional manager.');
        end if;
    end loop;
end;
/


/* 
==========  Trigger 2. =============

Every time a new area is assigned to a customer rep team
this trigger checks if the number of areas already assigned
to the team is below the limit of 5. If the number of areas
exceeds the limit the trigger raises an error.

*/

create or replace trigger check_can_service_areas
before insert or update
on can_service_area
for each row
declare
    current_areas number;
    max_areas constant number := 5;
    teamname customer_rep_teams.team_name%type;
    team_reached_max_areas exception;
begin
    select team_name into teamname 
        from customer_rep_teams 
        where teamid = :new.teamid;
    select count(areaid) into current_areas
        from can_service_area 
        where teamid = :new.teamid;
    if (current_areas >= max_areas) then 
        raise team_reached_max_areas;
    end if;
exception
    when team_reached_max_areas then
        dbms_output.put_line('Team ' || teamname || ' already services maximum allowed number of areas');
end;
/
