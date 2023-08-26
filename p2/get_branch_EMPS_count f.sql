
 create or replace FUNCTION get_branch_EMPS_count (v_branch_id NUMBER)
    RETURN NUMBER
    is 
    v_branch_EMPS_count number(10);
    begin
         SELECT COUNT(*) INTO v_branch_EMPS_count  FROM BRANCH_EMPLOYEES
    where branch_id=v_branch_id and EMPLOYEE_POSITION='EMP' ;
       RETURN v_branch_EMPS_count ;
    end;