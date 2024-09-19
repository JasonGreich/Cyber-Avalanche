create database staging_cyber_attacks;
Use staging_cyber_attacks;
CREATE TABLE cyber_attacks_companies (
    incident_id VARCHAR(255),
    company_name VARCHAR(255),
    industry VARCHAR(255),
    attack_type VARCHAR(255),
    date_of_incident VARCHAR(255),
    breach_size VARCHAR(255),
    financial_loss_usd VARCHAR(255),
    country VARCHAR(255),
    attack_vector VARCHAR(255),
    mitigation_time_days VARCHAR(255)
);

CREATE TABLE cyber_attacks_individuals (
    timestamp VARCHAR(255),
    source_ip_address VARCHAR(255),
    destination_ip_address VARCHAR(255),
    source_port VARCHAR(255),
    destination_port VARCHAR(255),
    protocol VARCHAR(255),
    packet_length VARCHAR(255),
    packet_type VARCHAR(255),
    traffic_type VARCHAR(255),
    payload_data VARCHAR(255),
    malware_indicators VARCHAR(255),
    anomaly_scores VARCHAR(255),
    alerts_warnings VARCHAR(255),
    attack_type VARCHAR(255),
    attack_signature VARCHAR(255),
    action_taken VARCHAR(255),
    severity_level VARCHAR(255),
    user_information VARCHAR(255),
    device_information VARCHAR(255),
    network_segment VARCHAR(255),
    proxy_information VARCHAR(255),
    firewall_logs VARCHAR(255),
    ids_ips_alerts VARCHAR(255),
    log_source VARCHAR(255),
    geo_location_data VARCHAR(255)
);
CREATE TABLE active_online_users (
    date VARCHAR(255),
    active_online_users VARCHAR(255)
);

