create or replace function calc_branch_MGRS_bonus(v_branch_bonus number,v_branch_MGRS_count number) return number
is
v_branch_MGRS_bonus number(10,2);
begin
v_branch_MGRS_bonus:=v_branch_bonus*0.5/v_branch_MGRS_count;
return v_branch_MGRS_bonus;
end;