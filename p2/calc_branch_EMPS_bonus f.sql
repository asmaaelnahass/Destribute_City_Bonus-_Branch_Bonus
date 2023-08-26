create or replace function calc_branch_EMPS_bonus(v_branch_bonus number,v_branch_EMPS_count number) return number
is
v_branch_EMPS_bonus number(10,2);
begin
v_branch_EMPS_bonus:=v_branch_bonus*0.5/v_branch_EMPS_count;
return v_branch_EMPS_bonus;
end;