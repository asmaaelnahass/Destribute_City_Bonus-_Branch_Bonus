 create or replace FUNCTION get_branch_MGRS_count (v_branch_id NUMBER)
    RETURN NUMBER
    is
      v_branch_MGRS_count number(10);
    begin
     SELECT COUNT(*) INTO  v_branch_MGRS_count FROM BRANCH_EMPLOYEES
    where branch_id=v_branch_id and EMPLOYEE_POSITION='MGR' ;
       RETURN v_branch_MGRS_count;
    end;