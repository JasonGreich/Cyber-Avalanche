create database cyber_attacks_warehouse;
use cyber_attacks_warehouse;

-- Date Dimension
CREATE TABLE cyber_attacks_warehouse.DateDimension (
    DateID INT AUTO_INCREMENT PRIMARY KEY,
    Day INT,
    Month INT,
    Year INT,
    Hour_of_Day INT
);

-- Country Dimension
CREATE TABLE cyber_attacks_warehouse.CountryDimension (
    CountryID INT AUTO_INCREMENT PRIMARY KEY,
    Country VARCHAR(100)
);

-- Source Country Dimension (for source_country)
CREATE TABLE cyber_attacks_warehouse.SourceCountryDimension (
    SourceCountryID INT AUTO_INCREMENT PRIMARY KEY,
    Source_Country VARCHAR(100)
);

-- Detailed Location Dimension (including SourceCountryID)
CREATE TABLE cyber_attacks_warehouse.DetailedLocationDimension (
    DetailedGeoLocationID INT AUTO_INCREMENT PRIMARY KEY,
    Source_IP_Address VARCHAR(45),
    Destination_IP_Address VARCHAR(45),
    Valid_Source_IP BOOLEAN,
    Valid_Destination_IP BOOLEAN,
    SourceCountryID INT,  -- Foreign key to the new SourceCountryDimension
    FOREIGN KEY (SourceCountryID) REFERENCES SourceCountryDimension(SourceCountryID)
);

-- Network Traffic Dimension
CREATE TABLE cyber_attacks_warehouse.NetworkTrafficDimension (
    NetworkTrafficID INT AUTO_INCREMENT PRIMARY KEY,
    Source_Port INT,
    Destination_Port INT,
    Protocol VARCHAR(10),
    Packet_Length INT,
    Packet_Type VARCHAR(20),
    Traffic_Type VARCHAR(20),
    Network_Segment VARCHAR(50)
);

-- Company Dimension
CREATE TABLE cyber_attacks_warehouse.CompanyDimension (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY,
    Company_Name VARCHAR(255),
    Industry VARCHAR(255)
);

-- Device Dimension
CREATE TABLE cyber_attacks_warehouse.DeviceDimension (
    DeviceID INT AUTO_INCREMENT PRIMARY KEY,
    Browser VARCHAR(100),
    Operating_System VARCHAR(100),
    Device_Type VARCHAR(50)
);

-- Individual Cyber Attacks Fact
CREATE TABLE cyber_attacks_warehouse.IndividualCyberAttacksFact (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DateID INT,
    CountryID INT,
    DetailedGeoLocationID INT,
    NetworkTrafficID INT,
    DeviceID INT,
    Attack_Type VARCHAR(50),
    Payload_Data TEXT,
    Malware_Indicators TEXT,
    Anomaly_Scores FLOAT,
    Severity_Level VARCHAR(20),
    Alerts_Warnings TEXT,
    Attack_Signature TEXT,
    Action_Taken VARCHAR(50),
    User_Information TEXT,
    Proxy_Information TEXT,
    Firewall_Logs TEXT,
    IDS_IPS_Alerts TEXT,
    Log_Source VARCHAR(50),
    FOREIGN KEY (DateID) REFERENCES DateDimension(DateID),
    FOREIGN KEY (CountryID) REFERENCES CountryDimension(CountryID),
    FOREIGN KEY (DetailedGeoLocationID) REFERENCES DetailedLocationDimension(DetailedGeoLocationID),
    FOREIGN KEY (NetworkTrafficID) REFERENCES NetworkTrafficDimension(NetworkTrafficID),
    FOREIGN KEY (DeviceID) REFERENCES DeviceDimension(DeviceID)
);

-- Companies Cyber Attacks Fact
CREATE TABLE cyber_attacks_warehouse.CompaniesCyberAttacksFact (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DateID INT,
    CountryID INT,
    CompanyID INT,
    Attack_Type VARCHAR(50),
    Breach_Size_No_of_Records BIGINT,
    Attack_Vector VARCHAR(100),
    Mitigation_Time_Days INT,
    Financial_Loss_USD DECIMAL(18,2),
    FOREIGN KEY (DateID) REFERENCES DateDimension(DateID),
    FOREIGN KEY (CountryID) REFERENCES CountryDimension(CountryID),
    FOREIGN KEY (CompanyID) REFERENCES CompanyDimension(CompanyID)
);

-- Active Online Users Fact
CREATE TABLE cyber_attacks_warehouse.ActiveOnlineUsersFact (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DateID INT,
    Active_Online_Users BIGINT,
    FOREIGN KEY (DateID) REFERENCES DateDimension(DateID)
);
