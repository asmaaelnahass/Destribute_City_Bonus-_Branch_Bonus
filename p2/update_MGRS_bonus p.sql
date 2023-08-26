 create or replace PROCEDURE update_MGRS_bonus (v_branch_id NUMBER, v_branch_MGRS_bonus   NUMBER)
 is 
 begin
    update BRANCH_EMPLOYEES set employee_bonus=v_branch_MGRS_bonus 
           where branch_id=v_branch_id and EMPLOYEE_POSITION='MGR' ;
 end;