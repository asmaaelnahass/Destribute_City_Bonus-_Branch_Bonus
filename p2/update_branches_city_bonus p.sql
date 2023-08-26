
 create or replace PROCEDURE update_branches_city_bonus (v_city_id NUMBER, v_branch_bonus   NUMBER)
 is
 begin
   UPDATE branches
    SET  branch_bonus = v_branch_bonus
    WHERE branch_id =v_city_id; 
 end;