use cyber_attacks_warehouse;
DELIMITER $$

CREATE PROCEDURE IncrementalLoadCyberData()
BEGIN
    -- Load into DateDimension
    INSERT INTO cyber_attacks_warehouse.DateDimension (Day, Month, Year)
    SELECT DISTINCT Day, Month, Year 
    FROM transformed_cyber_staging.Individual_Cyber_Attacks
    ON DUPLICATE KEY UPDATE DateID=LAST_INSERT_ID(DateID);

    -- Load into DetailedLocationDimension
    INSERT INTO cyber_attacks_warehouse.DetailedLocationDimension (Source_IP_Address, Destination_IP_Address, Valid_Source_IP, Valid_Destination_IP, SourceCountryID)
    SELECT DISTINCT 
        i.Source_IP_Address, 
        i.Destination_IP_Address, 
        i.Valid_Source_IP, 
        i.Valid_Destination_IP, 
        sc.SourceCountryID
    FROM transformed_cyber_staging.Individual_Cyber_Attacks i
    JOIN cyber_attacks_warehouse.SourceCountryDimension sc
        ON i.source_country = sc.Source_Country
    ON DUPLICATE KEY UPDATE DetailedGeoLocationID=LAST_INSERT_ID(DetailedGeoLocationID);

    -- Load into NetworkTrafficDimension
    INSERT INTO cyber_attacks_warehouse.NetworkTrafficDimension (Source_Port, Destination_Port, Protocol, Packet_Length, Packet_Type, Traffic_Type, Network_Segment)
    SELECT DISTINCT Source_Port, Destination_Port, Protocol, Packet_Length, Packet_Type, Traffic_Type, Network_Segment 
    FROM transformed_cyber_staging.Individual_Cyber_Attacks
    ON DUPLICATE KEY UPDATE NetworkTrafficID=LAST_INSERT_ID(NetworkTrafficID);

    -- Load into CompanyDimension
    INSERT INTO cyber_attacks_warehouse.CompanyDimension (Company_Name, Industry)
    SELECT DISTINCT company_name, industry 
    FROM transformed_cyber_staging.companies_cyber_attacks
    ON DUPLICATE KEY UPDATE CompanyID=LAST_INSERT_ID(CompanyID);

    -- Load into IndividualCyberAttacksFact
    INSERT INTO cyber_attacks_warehouse.IndividualCyberAttacksFact (
        DateID, CountryID, DetailedGeoLocationID, NetworkTrafficID, DeviceID, Attack_Type, Payload_Data, Malware_Indicators,
        Anomaly_Scores, Severity_Level, Alerts_Warnings, Attack_Signature, Action_Taken, User_Information, Proxy_Information,
        Firewall_Logs, IDS_IPS_Alerts, Log_Source
    )
    SELECT 
        d.DateID, c.CountryID, g.DetailedGeoLocationID, n.NetworkTrafficID, v.DeviceID,
        i.Attack_Type, i.Payload_Data, i.Malware_Indicators, i.Anomaly_Scores, i.Severity_Level, i.Alerts_Warnings,
        i.Attack_Signature, i.Action_Taken, i.User_Information, i.Proxy_Information, i.Firewall_Logs, i.IDS_IPS_Alerts, i.Log_Source
    FROM transformed_cyber_staging.Individual_Cyber_Attacks i
    JOIN cyber_attacks_warehouse.DateDimension d 
        ON i.Day = d.Day AND i.Month = d.Month AND i.Year = d.Year  
    JOIN cyber_attacks_warehouse.CountryDimension c 
        ON i.Country = c.Country
    JOIN cyber_attacks_warehouse.DetailedLocationDimension g 
        ON i.Source_IP_Address = g.Source_IP_Address AND i.Destination_IP_Address = g.Destination_IP_Address
    JOIN cyber_attacks_warehouse.NetworkTrafficDimension n 
        ON i.Source_Port = n.Source_Port AND i.Destination_Port = n.Destination_Port
    JOIN cyber_attacks_warehouse.DeviceDimension v 
        ON i.Browser = v.Browser AND i.Operating_System = v.Operating_System;

    -- Load into CompaniesCyberAttacksFact
    INSERT INTO cyber_attacks_warehouse.CompaniesCyberAttacksFact (
        DateID, CountryID, CompanyID, Attack_Type, Breach_Size_No_of_Records, Attack_Vector, Mitigation_Time_Days, Financial_Loss_USD
    )
    SELECT 
        d.DateID, c.CountryID, com.CompanyID, comp.attack_type, comp.breach_size, comp.attack_vector, comp.mitigation_time, comp.financial_loss
    FROM transformed_cyber_staging.companies_cyber_attacks comp
    JOIN cyber_attacks_warehouse.DateDimension d 
        ON comp.day = d.Day AND comp.month = d.Month AND comp.year = d.Year
    JOIN cyber_attacks_warehouse.CountryDimension c 
        ON comp.country = c.Country
    JOIN cyber_attacks_warehouse.CompanyDimension com 
        ON comp.company_name = com.Company_Name;

    -- Load into ActiveOnlineUsersFact
    INSERT INTO cyber_attacks_warehouse.ActiveOnlineUsersFact (DateID, Active_Online_Users)
    SELECT 
        d.DateID, a.active_online_users
    FROM transformed_cyber_staging.active_online_users a
    JOIN cyber_attacks_warehouse.DateDimension d 
        ON a.day = d.Day AND a.month = d.Month AND a.year = d.Year;
END $$

DELIMITER ;

-- Schedule this procedure to run daily using an event
CREATE EVENT DailyCyberLoad
ON SCHEDULE EVERY 1 DAY
DO
    CALL IncrementalLoadCyberData();
