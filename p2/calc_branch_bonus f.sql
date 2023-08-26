  create or replace FUNCTION calc_branch_bonus (v_city_bonus  NUMBER, v_branch_count   NUMBER)
    RETURN NUMBER
    is 
     v_branch_bonus number(10);
    begin
     v_branch_bonus := v_city_bonus/v_branch_count;
       RETURN  v_branch_bonus;
     end;