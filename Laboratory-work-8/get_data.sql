CREATE OR REPLACE FUNCTION get_data(attribute_value text)
RETURNS TABLE(c_id integer, model varchar, year integer)
AS $$
BEGIN
  RETURN QUERY EXECUTE format('SELECT c_id, model, year FROM car WHERE model = %L or true = true', attribute_value);
END;
$$ LANGUAGE plpgsql;
