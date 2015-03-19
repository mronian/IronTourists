DROP TABLE Spot;
DROP TABLE City;
DROP TABLE State;
DROP TABLE Country;

CREATE TABLE Country (
  CountryID INT PRIMARY KEY,
  CountryName VARCHAR(30)
);

CREATE TABLE State (
  StateID INT PRIMARY KEY,
  StateName VARCHAR(30),
  CountryID INT,
  CONSTRAINT state_c_fk FOREIGN KEY (CountryID) REFERENCES Country (CountryID)
);

CREATE TABLE City (
  CityID INT PRIMARY KEY,
  CityName VARCHAR(30),
  CityPin CHAR(6),
  StateID INT,
  CONSTRAINT city_s_fk FOREIGN KEY (StateID) REFERENCES State (StateID)
);

CREATE TABLE Spot (
  SpotID INT PRIMARY KEY,
  SpotName VARCHAR(30),
  SpotAddr VARCHAR(50),
  CityID INT,
  CONSTRAINT spot_fk FOREIGN KEY (CityID) REFERENCES City (CityID)
);




