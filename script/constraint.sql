ALTER TABLE Geography_NDS
ADD CONSTRAINT FK_Geography_NDS_Status_ID FOREIGN KEY (StatusID) REFERENCES Status_NDS(Status_ID)
ALTER TABLE Geography_NDS
ADD CONSTRAINT FK_Geography_NDS_Source_ID FOREIGN KEY (SourceID) REFERENCES Source_NDS(Source_ID)

alter table Geography_NDS
drop constraint FK_Geography_NDS_Status_ID
alter table Geography_NDS
drop constraint FK_Geography_NDS_Source_ID

ALTER TABLE PCD_OA_NDS
ADD CONSTRAINT FK_PCD_OA_NDS_NDS_Status_ID FOREIGN KEY (StatusID) REFERENCES Status_NDS(Status_ID)
ALTER TABLE PCD_OA_NDS
ADD CONSTRAINT FK_PCD_OA_NDS_NDS_Source_ID FOREIGN KEY (SourceID) REFERENCES Source_NDS(Source_ID)

alter table PCD_OA_NDS
drop constraint FK_PCD_OA_NDS_NDS_Status_ID
alter table PCD_OA_NDS
drop constraint FK_PCD_OA_NDS_NDS_Source_ID

ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Accident_Severity FOREIGN KEY (Accident_Severity) REFERENCES Severity_NDS(Severity_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Local_Authority_District FOREIGN KEY (Local_Authority_District) REFERENCES Local_Authority_District_NDS(Local_Authority_District_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Road_Type FOREIGN KEY (Road_Type) REFERENCES Road_Type_NDS(Road_Type_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Urban_or_Rural_Area FOREIGN KEY (Urban_or_Rural_Area) REFERENCES Urban_Rural_NDS(Urban_Rural_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Status_ID FOREIGN KEY (StatusID) REFERENCES Status_NDS(Status_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Source_ID FOREIGN KEY (SourceID) REFERENCES Source_NDS(Source_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Day_of_week FOREIGN KEY (Day_of_Week) REFERENCES Day_of_Week_NDS(Day_of_week_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Built_up_Road_Type FOREIGN KEY (Built_up_Road_Type) REFERENCES Built_up_Road_Type_NDS(Built_up_Road_Type_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Period_of_day FOREIGN KEY (Period_of_Day_ID) REFERENCES Period_of_Day_NDS(Period_of_Day_ID)
ALTER TABLE Accidents_NDS
ADD CONSTRAINT FK_Accidents_NDS_Geography FOREIGN KEY (Geography_ID) REFERENCES Geography_NDS(Geography_ID)

alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Accident_Severity
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Local_Authority_District
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Road_Type
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Urban_or_Rural_Area
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Status_ID
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Source_ID
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Day_of_week
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Built_up_Road_Type
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Period_of_day
alter table Accidents_NDS
drop constraint FK_Accidents_NDS_Geography

ALTER TABLE Vehicles_NDS
ADD CONSTRAINT FK_Vehicles_NDS_Vehicle_Type FOREIGN KEY (Vehicle_Type) REFERENCES Vehicle_Type_NDS(Vehicle_Type_ID)
ALTER TABLE Vehicles_NDS
ADD CONSTRAINT FK_Vehicles_NDS_Sex_of_Driver FOREIGN KEY (Sex_of_Driver) REFERENCES Sex_of_Person_NDS(Sex_of_Person_ID)
ALTER TABLE Vehicles_NDS
ADD CONSTRAINT FK_Vehicles_NDS_Age_Band_of_Driver FOREIGN KEY (Age_Band_of_Driver) REFERENCES Age_Band_NDS(Age_Band_ID)
ALTER TABLE Vehicles_NDS
ADD CONSTRAINT FK_Vehicles_NDS_Journey_Purpose FOREIGN KEY (Journey_Purpose) REFERENCES Journey_Purpose_NDS(Journey_Purpose_ID)
ALTER TABLE Vehicles_NDS
ADD CONSTRAINT FK_Vehicles_NDS_Status_ID FOREIGN KEY (StatusID) REFERENCES Status_NDS(Status_ID)
ALTER TABLE Vehicles_NDS
ADD CONSTRAINT FK_Vehicles_NDS_Source_ID FOREIGN KEY (SourceID) REFERENCES Source_NDS(Source_ID)
ALTER TABLE Vehicles_NDS
ADD CONSTRAINT FK_Vehicles_NDS_Accident FOREIGN KEY (Accident_ID) REFERENCES Accidents_NDS(Accident_ID)
ALTER TABLE Vehicles_NDS
ADD CONSTRAINT FK_Vehicles_NDS_Age FOREIGN KEY (Age_ID) REFERENCES Age_NDS(Age_ID)

alter table Vehicles_NDS
drop constraint FK_Vehicles_NDS_Vehicle_Type
alter table Vehicles_NDS
drop constraint FK_Vehicles_NDS_Sex_of_Driver
alter table Vehicles_NDS
drop constraint FK_Vehicles_NDS_Age_Band_of_Driver
alter table Vehicles_NDS
drop constraint FK_Vehicles_NDS_Journey_Purpose
alter table Vehicles_NDS
drop constraint FK_Vehicles_NDS_Status_ID
alter table Vehicles_NDS
drop constraint FK_Vehicles_NDS_Source_ID
alter table Vehicles_NDS
drop constraint FK_Vehicles_NDS_Accident
alter table Vehicles_NDS
drop constraint FK_Vehicles_NDS_Age

ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Sex_of_Casualty FOREIGN KEY (Sex_of_Casualty) REFERENCES Sex_of_Person_NDS(Sex_of_Person_ID)
ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Age_Band_of_Casualty FOREIGN KEY (Age_Band_of_Casualty) REFERENCES Age_Band_NDS(Age_Band_ID)
ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Casualty_Severity FOREIGN KEY (Casualty_Severity) REFERENCES Severity_NDS(Severity_ID)
ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Casualty_Type FOREIGN KEY (Casualty_Type) REFERENCES Casualty_Type_NDS(Casualty_Type_ID)
ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Status_ID FOREIGN KEY (StatusID) REFERENCES Status_NDS(Status_ID)
ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Source_ID FOREIGN KEY (SourceID) REFERENCES Source_NDS(Source_ID)
ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Vehicle FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles_NDS(Vehicle_ID)
ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Accident FOREIGN KEY (Accident_ID) REFERENCES Accidents_NDS(Accident_ID)
ALTER TABLE Casualties_NDS
ADD CONSTRAINT FK_Casualties_NDS_Age FOREIGN KEY (Age_ID) REFERENCES Age_NDS(Age_ID)

alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Sex_of_Casualty
alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Age_Band_of_Casualty
alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Casualty_Severity
alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Casualty_Type
alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Status_ID
alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Source_ID
alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Vehicle
alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Age
alter table Casualties_NDS
drop constraint FK_Casualties_NDS_Accidents

