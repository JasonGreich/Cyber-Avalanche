use transformed_cyber_staging;
CREATE TABLE Individual_Cyber_Attacks (
    ID INT PRIMARY KEY,  -- Assuming 'Unnamed: 0' is an ID column
    Timestamp DATETIME,  -- Matches DateDimension
    Source_IP_Address VARCHAR(45),  -- Matches DetailedGeoLocationDimension
    Destination_IP_Address VARCHAR(45),  -- Matches DetailedGeoLocationDimension
    Source_Port INT,  -- Matches NetworkTrafficDimension
    Destination_Port INT,  -- Matches NetworkTrafficDimension
    Protocol VARCHAR(10),  -- Matches NetworkTrafficDimension
    Packet_Length INT,  -- Matches NetworkTrafficDimension
    Packet_Type VARCHAR(20),  -- Matches NetworkTrafficDimension
    Traffic_Type VARCHAR(20),  -- Matches NetworkTrafficDimension
    Payload_Data TEXT,  -- Matches IndividualCyberAttacksFact
    Malware_Indicators TEXT,  -- Matches IndividualCyberAttacksFact
    Anomaly_Scores FLOAT,  -- Matches IndividualCyberAttacksFact
    Alerts_Warnings TEXT,  -- Matches IndividualCyberAttacksFact
    Attack_Type VARCHAR(50),  -- Matches IndividualCyberAttacksFact
    Attack_Signature TEXT,  -- Matches IndividualCyberAttacksFact
    Action_Taken VARCHAR(50),  -- Matches IndividualCyberAttacksFact
    Severity_Level VARCHAR(20),  -- Matches IndividualCyberAttacksFact
    User_Information TEXT,  -- Matches IndividualCyberAttacksFact
    Network_Segment VARCHAR(50),  -- Matches NetworkTrafficDimension
    Proxy_Information TEXT,  -- Matches IndividualCyberAttacksFact
    Firewall_Logs TEXT,  -- Matches IndividualCyberAttacksFact
    IDS_IPS_Alerts TEXT,  -- Matches IndividualCyberAttacksFact
    Log_Source VARCHAR(50),  -- Matches IndividualCyberAttacksFact
    Country VARCHAR(100),  -- Matches CountryDimension
    Valid_Source_IP BOOLEAN,  -- Matches DetailedGeoLocationDimension
    Valid_Destination_IP BOOLEAN,  -- Matches DetailedGeoLocationDimension
    Day INT,  -- Matches DateDimension
    Hour_of_Day INT,  -- Matches DateDimension
    Month INT,  -- Matches DateDimension
    Year INT,  -- Matches DateDimension
    Browser VARCHAR(50),  -- Matches DeviceDimension
    Operating_System VARCHAR(50),  -- Matches DeviceDimension
    Device_Type VARCHAR(50)  -- Matches DeviceDimension
);
CREATE TABLE companies_cyber_attacks (
    id SERIAL PRIMARY KEY,
    incident_id INTEGER,
    company_name VARCHAR(255),  -- Matches CompanyDimension
    industry VARCHAR(100),  -- Matches CompanyDimension
    attack_type VARCHAR(50),  -- Matches CompaniesCyberAttacksFact
    date_of_incident DATE,  -- Matches DateDimension (DateID will be used as FK)
    breach_size INTEGER,  -- Matches CompaniesCyberAttacksFact as Breach_Size_No_of_Records
    financial_loss NUMERIC(15, 2),  -- Matches CompaniesCyberAttacksFact as Financial_Loss_USD
    country VARCHAR(100),  -- Matches CountryDimension
    attack_vector VARCHAR(100),  -- Matches CompaniesCyberAttacksFact
    mitigation_time INTEGER,  -- Matches CompaniesCyberAttacksFact as Mitigation_Time_Days
    year INTEGER,  -- Matches DateDimension
    month INTEGER,  -- Matches DateDimension
    day INTEGER  -- Matches DateDimension
);
CREATE TABLE active_online_users (
    id SERIAL PRIMARY KEY,
    date DATE,  -- Matches DateDimension (DateID will be used as FK)
    active_online_users BIGINT,  -- Matches ActiveOnlineUsersFact
    year INTEGER,  -- Matches DateDimension
    month INTEGER,  -- Matches DateDimension
    day INTEGER  -- Matches DateDimension
);

