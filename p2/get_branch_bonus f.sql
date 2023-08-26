 create or replace FUNCTION get_branch_bonus (v_branch_id NUMBER)
    RETURN NUMBER
    is
    v_branch_bonus   NUMBER(10);
    begin 
     select branch_bonus into v_branch_bonus 
      FROM branches
      where branch_id =v_branch_id ;
      RETURN    v_branch_bonus  ;
    end;