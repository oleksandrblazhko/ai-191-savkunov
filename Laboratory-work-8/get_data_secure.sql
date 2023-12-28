CREATE OR REPLACE FUNCTION get_data_secure(model_name varchar)
RETURNS TABLE(c_id integer, model varchar, year integer) -- Виправлено структуру повернення
AS $$
DECLARE
    str varchar;
BEGIN
    str := 'SELECT * FROM car WHERE model = $1';  -- Виправлено запит
    RAISE NOTICE 'Query = %', str;
    RETURN QUERY EXECUTE str USING model_name;  -- Використовуємо параметризований запит
END;
$$ LANGUAGE plpgsql;
