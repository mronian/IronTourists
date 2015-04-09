DROP TABLE Restaurant;
DROP TABLE RestaurantChain;
DROP TABLE Hotel;
DROP TABLE HotelChain;
DROP TABLE HubSpotInfo;
DROP TABLE Conveyance;
DROP TABLE Hub;
DROP TABLE SpotFare;
DROP TABLE Fare;
DROP TABLE SpotType;
DROP TABLE Type;
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

CREATE TABLE Fare (
  FareID INT PRIMARY KEY,
  FareDesc VARCHAR(50)
);

CREATE TABLE SpotFare (
  SpotID INT,
  FareID INT,
  Cost INT,
  CONSTRAINT spotfare_pk PRIMARY KEY (SpotID, FareID),
  CONSTRAINT spotfare_spot_fk FOREIGN KEY (SpotID) REFERENCES Spot (SpotID),
  CONSTRAINT spotfare_fare_fk FOREIGN KEY (FareID) REFERENCES Fare (FareID)
);

CREATE TABLE Type (
  TypeID INT PRIMARY KEY,
  TypeName VARCHAR(30)
);

CREATE TABLE SpotType (
  SpotID INT,
  TypeID INT,
  CONSTRAINT spottype_pk PRIMARY KEY (SpotID, TypeID),
  CONSTRAINT spottype_spot_fk FOREIGN KEY (SpotID) REFERENCES Spot (SpotID),
  CONSTRAINT spottype_type_fk FOREIGN KEY (TypeID) REFERENCES Type (TypeID)
);

CREATE TABLE Hub (
  HubID INT, 
  HubName VARCHAR(50),
  HubAddress VARCHAR(200),
  CityID INT,
  CONSTRAINT hub_pk PRIMARY KEY (HubID), 
  CONSTRAINT hub_city_fk FOREIGN KEY (CityID) REFERENCES City (CityID)
);

CREATE TABLE Conveyance (
  ConID INT PRIMARY KEY,
  ConName VARCHAR(30)
);

CREATE TABLE HubSpotInfo (
  HubID INT,
  SpotID INT,
  ConID INT,
  Time TIME,
  Fare INT,
  CONSTRAINT hubspotinfo_pk PRIMARY KEY (HubID, SpotID, ConID),
  CONSTRAINT hsi_hub_fk FOREIGN KEY (HubID) REFERENCES Hub (HubID),
  CONSTRAINT hsi_spot_fk FOREIGN KEY (SpotID) REFERENCES Spot (SpotID),
  CONSTRAINT hsi_con_fk FOREIGN KEY (ConID) REFERENCES Conveyance (ConID)
);

CREATE TABLE HotelChain (
  HChainID INT PRIMARY KEY,
  HChainName VARCHAR(30)
);  

CREATE TABLE Hotel (
  HotelID INT PRIMARY KEY,
  HotelName VARCHAR(30),
  HotelAddr VARCHAR(50),
  Rating FLOAT,
  CityID INT,
  HChainID INT,
  CONSTRAINT hotel_city_fk FOREIGN KEY (CityID) REFERENCES City (CityID),
  CONSTRAINT hotel_hc_fk FOREIGN KEY (HChainID) REFERENCES HotelChain (HChainID)
);

CREATE TABLE RestaurantChain (
  RChainID INT PRIMARY KEY,
  RChainName VARCHAR(30)
);  

CREATE TABLE Restaurant (
  ResID INT PRIMARY KEY,
  ResName VARCHAR(30),
  ResAddr VARCHAR(50),
  CityID INT,
  RChainID INT,
  CONSTRAINT res_city_fk FOREIGN KEY (CityID) REFERENCES City (CityID),
  CONSTRAINT res_rc_fk FOREIGN KEY (RChainID) REFERENCES RestaurantChain (RChainID)
);
