CREATE TABLE CLIENT_SITES (
  clientsite_id   INT   NOT NULL UNIQUE,
  client_id int FOREIGN KEY REFERENCES Clients(client_id),
  clientsite_size NUMBER,
  clientsite_street VARCHAR(60),
  clientsite_city VARCHAR(60),
  clientsite_state VARCHAR(2),
  clientsite_zipcode INT,
  PRIMARY KEY(clientsite_id)
);