DROP FUNCTION IF EXISTS FormatSeconds;
DELIMITER $$
CREATE FUNCTION FormatSeconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(255);
    
	SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds % (24 * 3600);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    
    RETURN result;
END$$

DELIMITER ;

SELECT FormatSeconds(123456);