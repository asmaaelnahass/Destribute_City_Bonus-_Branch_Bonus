 create or replace FUNCTION get_city_bonus (v_city_id NUMBER)
    RETURN NUMBER
  is
  v_city_bonus number(10);
  begin
   select city_bonus into v_city_bonus from cities
   where city_id = v_city_id;
   RETURN  v_city_bonus;
  end;