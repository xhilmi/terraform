# this is terraform variable 

subnet_ip_cidr_range = [
    {name: "dev-subnet-01", range: "10.114.0.0/16"},
    {name: "dev-subnet-02", range: "10.115.0.0/16"}
]

secondary_ip_cidr_range = [
    {name: "dev-secondary-01", range: "192.168.10.0/24"},
    {name: "dev-secondary-02", range: "192.168.11.0/24"}
]

google_credentials = "path/to/file/project-id.json"
