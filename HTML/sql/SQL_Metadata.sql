--Execute following queries one by one to create backend database for ADR SYSTEM

--1. Create database;
create database ADR;

--2. Use Database
select adr;

--3. Create table registeredUsers

create table registeredusers (registerAs varchar(100) not null,firstName varchar(255) not null,lastName varchar(255) not null,contactNumber varchar(100) not null,emailAddress varchar(255) not null,userLogin varchar(255) not null,password varchar(255) not null,confirmPassword varchar(255) not null,Constraint registeredUsers_pk Primary Key (userLogin));

--4. Insert guest user in registeredusr table for backend dependecy

insert into registeredusers(registerAs,firstName,lastName,contactNumber,emailAddress,userLogin,password,confirmPassword) values("Guest","Guest","Guest","0000000000","guest@guest.com","guest","password","password");

--5. Excute below query and check if "guest" user created successfully
select * from registeredusers;

--6. Create table patientADRs
 Create table patientADRs(adrid int(60) not null AUTO_INCREMENT,patientName varchar(255) not null,gender varchar(50) not null,age int(60) not null,contactNumber varchar(100) not null,emailAddress varchar(255) not null,medicine varchar(255) not null,dose varchar(50) not null,doseQuantity varchar(50) not null,problemOccuredDate date not null,symptomesObserved varchar(1000) not null,majorAffect varchar(255) not null,userLogin varchar(255)  not null,Constraint patientADRs_pk Primary Key (adrid), FOREIGN KEY (userLogin) references registeredUsers (userLogin));

--7. Create table doctorADRs
create table doctorADRs(adrid int(60) not null AUTO_INCREMENT,nameDoctor varchar(255) not null,contactDoctor varchar(100) not null,emailAddress varchar(255) not null,occupation varchar(100) not null,medicine varchar(255) not null,doseQuantity varchar(255) not null,doseType varchar(50) not null,therapyStart date not null,therapyEnd date not null,dateProblemoccu date not null,majorIssue varchar(255) not null,majorProblem varchar(255) not null,dateEvent date not null,describrEvent varchar(1000) not null,relevantTests varchar(255) not null,userLogin varchar(255)  not null,Constraint doctorADRs_pk Primary Key (adrid), FOREIGN KEY (userLogin) references registeredUsers (userLogin));

--8. Create table pharmacistADRs
create table pharmacistADRs(adrid int(60) not null AUTO_INCREMENT,pharmacistName varchar(255) not null,pharmacistContact varchar(100) not null,pharmacistEmail varchar(255) not null,medicine varchar(100) not null,productManufacture varchar(100) not null,manufacturingDate date not null,expirationDate date not null,noPrescription varchar(50) not null,dateFirst date not null,dateStopped date not null,personpDetails varchar(255) not null,anotherProduct varchar(255) not null,problemOccured date not null,reactionBycustomer varchar(1000) not null,sideEffect varchar(255)  not null,userLogin varchar(255) not null,Constraint pharmacistADRs_pk Primary Key (adrid), FOREIGN KEY (userLogin) references registeredUsers (userLogin));

--9. Create table communication

create table communication(msgid int(60) not null AUTO_INCREMENT,userLogin varchar(100) not null, adrid int(100) not null,medicine varchar(255) not null, msg varchar(500) not null,replayDate date not null,Constraint communication_pk Primary Key (msgid));
------------------------------------------------------------------------------------------------------------------------------------------------
--Supporting Queries

Show Doctor Details-
"select adrid,nameDoctor,contactDoctor,emailAddress,occupation,medicine,doseQuantity,doseType,therapyStart,therapyEnd,dateProblemoccu,majorIssue,majorProblem,dateEvent,describrEvent,relevantTests,imageFile,documentFile,userLogin from doctorADRs";

Show Pharmacist Details-
"select adrid,pharmacistName ,pharmacistContact ,pharmacistEmail ,medicine,productManufacture ,manufacturingDate ,expirationDate ,noPrescription ,dateFirst ,dateStopped,personpDetails,anotherProduct,problemOccured,reactionBycustomer,sideEffect,userLogin from pharmacistADRs";

Show Patient Details-
 "select adrid,patientName,gender,age,contactNumber,emailAddress,medicine,dose,doseQuantity,problemOccuredDate,symptomesObserved,majorAffect,userLogin from patientADRs";

