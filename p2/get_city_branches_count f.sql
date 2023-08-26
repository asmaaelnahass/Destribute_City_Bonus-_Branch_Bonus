 create or replace FUNCTION get_city_branches_count (v_city_id NUMBER)
    RETURN NUMBER
     is 
     v_branch_count number(10);
     begin
     SELECT COUNT(*) INTO v_branch_count FROM branches
       where city_id =v_city_id;
          RETURN  v_branch_count ;
     end;