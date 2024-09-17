
DELIMITER $$

CREATE PROCEDURE WeeklyFullLoad()
BEGIN
    -- Start a transaction
    START TRANSACTION;
    
    -- Truncate the existing dimension tables to load fresh data
    TRUNCATE TABLE cyber_attacks_warehouse.CountryDimension;
    TRUNCATE TABLE cyber_attacks_warehouse.SourceCountryDimension;
    TRUNCATE TABLE cyber_attacks_warehouse.DeviceDimension;

    -- Load into CountryDimension
    INSERT INTO cyber_attacks_warehouse.CountryDimension (Country)
    SELECT DISTINCT Country 
    FROM transformed_cyber_staging.Individual_Cyber_Attacks
    ON DUPLICATE KEY UPDATE CountryID=LAST_INSERT_ID(CountryID);

    -- Load into SourceCountryDimension
    INSERT INTO cyber_attacks_warehouse.SourceCountryDimension (Source_Country)
    SELECT DISTINCT source_country 
    FROM transformed_cyber_staging.Individual_Cyber_Attacks
    ON DUPLICATE KEY UPDATE SourceCountryID=LAST_INSERT_ID(SourceCountryID);

    -- Load into DeviceDimension
    INSERT INTO cyber_attacks_warehouse.DeviceDimension (Browser, Operating_System, Device_Type)
    SELECT DISTINCT Browser, Operating_System, Device_Type 
    FROM transformed_cyber_staging.Individual_Cyber_Attacks
    ON DUPLICATE KEY UPDATE DeviceID=LAST_INSERT_ID(DeviceID);

    -- Commit the transaction if all operations succeed
    COMMIT;

END$$

DELIMITER ;
-- Enable the event scheduler (if not already enabled)
SET GLOBAL event_scheduler = ON;

-- Create the event to call the procedure every week
CREATE EVENT WeeklyFullLoadEvent
ON SCHEDULE EVERY 1 WEEK
STARTS '2024-09-16 00:00:00'  -- Set the start date and time as per your needs
DO
    CALL WeeklyFullLoad();
