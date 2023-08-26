select * from CITIES;
declare
cursor  cites_cursor is
select * from CITIES;
   branch_quota NUMBER(8);
  num_branches   NUMBER(8);  
   emp_bonus  NUMBER(8);
   emp_p NUMBER(8);
   num_emp NUMBER(8);
      mgr_bonus NUMBER(8);
     mgr_p NUMBER(8);
      num_mgr NUMBER(8);
 begin
 for cites_record in cites_cursor loop
    SELECT COUNT(*) INTO num_branches FROM branches
    where city_id = cites_record.city_id;
       branch_quota  :=calculate_branch_quota(cites_record.city_bonus,num_branches);
    FOR branch_rec IN (SELECT branch_id FROM branches where city_id=cites_record.city_id)   LOOP

    -- Update the branch table with the calculated bonus quota
    UPDATE branches
    SET  branch_bonus = branch_quota
    WHERE branch_id = branch_rec.branch_id; 
      emp_p:= branch_quota*0.5;
         mgr_p:= branch_quota*0.5;
  for branch_emp in( select branch_id FROM BRANCH_EMPLOYEES where branch_id=branch_rec.branch_id) loop
  SELECT COUNT(*) INTO num_mgr FROM BRANCH_EMPLOYEES
    where branch_id=branch_rec.branch_id and EMPLOYEE_POSITION='MGR' ;
     SELECT COUNT(*) INTO num_emp FROM BRANCH_EMPLOYEES
    where branch_id=branch_rec.branch_id and EMPLOYEE_POSITION='EMP' ;
      emp_bonus := emp_p/num_emp;
      mgr_bonus:=mgr_p/num_mgr;
      
      update BRANCH_EMPLOYEES set employee_bonus=emp_bonus
      where branch_id=branch_rec.branch_id and EMPLOYEE_POSITION='EMP' ;
          update BRANCH_EMPLOYEES set employee_bonus=mgr_bonus
           where branch_id=branch_rec.branch_id and EMPLOYEE_POSITION='MGR' ;
  
  
  end loop;
  
  
 
 
 
 
  END LOOP; 
  
     
 end loop;
 end;
select  * from BRANCH_EMPLOYEES;
select  * from branches;

--update BRANCHES set branch_bonus=null;
--update BRANCH_EMPLOYEES set employee_bonus=null;