CREATE OR REPLACE FUNCTION change_data_secure(attr_1 varchar, attr_2 varchar)
RETURNS varchar
AS $$
DECLARE 
    str varchar;
BEGIN
    str := 'UPDATE car SET model = $2 WHERE model = $1';
    RAISE NOTICE 'Query=%', str;
    EXECUTE str USING attr_1, attr_2;
    RETURN 'Model updated';
END;
$$ LANGUAGE plpgsql;
