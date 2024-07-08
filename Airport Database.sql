DROP table USER_AIRPORT;
DROP table PASSENGERS;
DROP table AIRPORT;
DROP table FLIGHT;
DROP table BOOKING;
DROP table EMPLOYEE_AIRPORT;
DROP table BOOKING_RESERVATION;

//Create or replace type USERS as object(
Create table USER_AIRPORT(
Username varchar2(25),
Password varchar2(25),
UserType number(1,0),
constraint USER_PK Primary key(Username)
);

//Create or replace type Child_PASSENGERS under parent(
Create table PASSENGERS(
Passenger# varchar2(8),
FirstName varchar2(10),
MiddleName varchar2(10),
LastName varchar2(10),
DOB date,
Address varchar2(25),
constraint PASSENGER_PK Primary key(passenger#)
);//INHERITS(USERS);

Create table AIRPORT(
Code varchar2(5),
Name varchar2(25),
City varchar2(25),
capacity number,
constraint AIRPORT_PK Primary key(Code)
);


Create table FLIGHT(
FlightCode varchar2(10),
AirlineName varchar2(25),
Capacity number,
BaseAirport varchar2(5),
constraint FLIGHT_PK Primary key(FlightCode),
constraint FLIGHT_FK_AIRPORT foreign key(BaseAirport) references AIRPORT(Code)
);


//Create or replace type Child_EMPLOYEE under parent(
Create table EMPLOYEE_AIRPORT(
Empid number,
FirstName varchar2(10),
LastName varchar2(10),
Job varchar2(10),
Salary number(8,2),
FlightCode varchar2(10),
constraint Employee_PK Primary key(Empid),
constraint Employee_FK_FLIGHT foreign key(FlightCode) references FLIGHT(FlightCode)
);


Create table BOOKING(
Booking# number,
FlightCode varchar2(10),
FlightDate Date,
Origin varchar2(5),
Destination varchar2(5),
duration number,
constraint BOOKING_PK Primary key(Booking#),
constraint BOOKING_FK_Flight foreign key(FlightCode) references Flight(FlightCode) on delete cascade,
constraint BOOKING_FK_FROMAIRPORT foreign key(Origin) references AIRPORT(Code),
constraint BOOKING_FK_TOAIRPORT foreign key(Destination) references AIRPORT(Code)
);

Create table BOOKING_RESERVATION(
Booking# number,
FlightCode varchar2(10),
Passenger# varchar2(8),
Seat# varchar2(3),
constraint RESERVATION_FK_BOOKING foreign key(Booking#) references BOOKING(Booking#),
constraint RESERVATION_FK_FLIGHT foreign key(FlightCode) references FLIGHT(FlightCode) on delete cascade,
constraint RESERVATION_FK_PASSENGER foreign key(Passenger#) references PASSENGERS(Passenger#),
constraint RESERVATION_PK Primary key(Booking#, Passenger#)
);

insert into USER_AIRPORT values('seth', 'seth', 1);
insert into USER_AIRPORT values('emp123', '123', 0);
commit;
select * from user_airport;
select* from employee_airport;
select* from flight;
select* from booking;
select* from booking_reservation;
select* from airport;
select* from Passengers;
desc Employee_Airport;
desc flight;
desc Passengers;
desc airport;
desc booking;
desc booking_reservation;
insert into employee_Airport values('456', 'stan', 'pop', 'hey',300,'abc123');
insert into Airport values('DXB', 'pe343', 'dubai', 30);
insert into Airport values('SGP', 'fe2o3', 'Singapore', 40);
insert into Airport values('SHJ', 'sharjahairport', 'sharjah', 25);
insert into Flight values('abc123', 'emirates', 200, 'DXB');
insert into booking(booking#,flightname,origin, destination,duration) values ( 15,'heretothere','SHJ', 'DXB', 45);
insert into employee_Airport values('213', 'shawn', 'arc', 'man',4000,'PA34T');
commit;
insert into Airport values('FR', 'France Airport', 'France', 30);
commit;
//CREATE TABLE PASSENGERS OF Child_PASSENGERS;
//CREATE TABLE EMPLOYEE OF CHILD_EMPLOYEE;
delete flight where flightcode='SOS';
//delete booking where booking#=15;
alter table booking modify FlightTime time;
insert into passengers values (55, 'James','Ramos','Arquero', '09-dec-2000','Earth');
insert into passengers values (67, 'Asa','C','Smith', '12-mar-1999','Earth2');
insert into booking_reservation values (21,'abc123',55, 12);
insert into booking_reservation values (21,'abc123',67, 12);
commit;
insert into booking(booking#,flightCode,flightdate,origin, destination,duration) values ( 15,'PA34T','15-oct-2022', 'SHJ', 'DXB', 45);
insert into booking(booking#,flightCode,flightdate,origin, destination,duration) values ( 21,'abc123','08-nov-2022', 'DXB', 'FR', 60);
insert into booking(booking#,flightCode,flightdate,origin, destination,duration) values ( 16,'GUI','20-oct-2022', 'FR', 'SHJ', 80);
