CREATE OR REPLACE FUNCTION change_data(attr1_name varchar, attr2_name varchar, new_value varchar)
RETURNS varchar
AS $$
BEGIN
    EXECUTE format('UPDATE car SET %I = $1 WHERE %I = $2', attr2_name, attr1_name)
    USING new_value, (SELECT attr1_name FROM car WHERE attr1_name = $1 LIMIT 1);
    RETURN 'Attribute updated';
END;
$$ LANGUAGE plpgsql;
