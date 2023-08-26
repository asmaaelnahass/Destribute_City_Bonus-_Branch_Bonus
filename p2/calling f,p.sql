/*
1- Destribute City Bonus across the branches in this city in equal quota 
2- Destibute the branch bonus across the employees work in this branch 
not in equal parts 
Mgrs take 50% 
Employees take 50% 
+++++++++++++
Create a plsql cursor block to implement this project and must use functions or procedures as needed 
*/
set serveroutput on
 declare
cursor  cites_cursor is
select * from CITIES;
 v_city_bonus number(10);
 v_branch_count number(10);
   v_br_bonus NUMBER(10);
 v_branch_bonus   NUMBER(10);
 v_branch_MGRS_count number(10);
 v_branch_EMPS_count number(10);
  v_branch_MGRS_bonus  number(10);
   v_branch_EMPS_bonus number(10);
begin
for cites_record in cites_cursor loop
  v_city_bonus:= get_city_bonus (cites_record.city_id);

     FOR branch_rec IN (SELECT branch_id FROM branches where city_id=cites_record.city_id)   LOOP
      v_branch_count :=get_city_branches_count (cites_record.city_id);
      v_br_bonus:= calc_branch_bonus (v_city_bonus  , v_branch_count);
        update_branches_city_bonus (branch_rec.branch_id, v_br_bonus );
              v_branch_bonus  :=get_branch_bonus (branch_rec.branch_id);
                  dbms_output.put_line(v_branch_bonus);  
                   v_branch_MGRS_count :=get_branch_MGRS_count (branch_rec.branch_id);
                   v_branch_EMPS_count :=get_branch_EMPS_count (branch_rec.branch_id);
                  dbms_output.put_line(   v_branch_MGRS_count||'  '|| v_branch_EMPS_count);
                  
       
            for branch_emp in( select branch_id FROM BRANCH_EMPLOYEES where branch_id=branch_rec.branch_id) loop
              v_branch_MGRS_bonus:=calc_branch_MGRS_bonus (v_branch_bonus, v_branch_MGRS_count);
            v_branch_EMPS_bonus := calc_branch_EMPS_bonus(v_branch_bonus, v_branch_EMPS_count );
            --  v_branch_EMPS_bonus:=v_branch_bonus*0.5/v_branch_EMPS_count;
             -- v_branch_MGRS_bonus:=v_branch_bonus*0.5/v_branch_MGRS_count;
              dbms_output.put_line(   v_branch_MGRS_bonus||'  '|| v_branch_EMPS_bonus);

       
         update_MGRS_bonus (branch_rec.branch_id , v_branch_MGRS_bonus  );
        update_EMPS_bonus (branch_rec.branch_id , v_branch_EMPS_bonus);
       end loop;  
     end loop;
end loop;
end;
select  * from branches;
select  * from BRANCH_EMPLOYEES;

--select  * from branches;
--update BRANCHES set branch_bonus=null;
--update BRANCH_EMPLOYEES set employee_bonus=null;