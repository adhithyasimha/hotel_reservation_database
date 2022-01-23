create table customer(
customer_id number(4) primary key,
customer_name char(9),
phone_number number(10),
uidi_no number(12) not null)
;
create table booking_details(
room_number number(3) primary key,
room_type char(8),
room_location char(7),
customer_id(4),
foregin key(customer_id)references customer(customer_id));

create table reservation(
reservation_no number(3) primary key,
check_in_date date default(sysdate),
check_out_date date default(sysdate),
no_of_guests number(3),
reservation_date date default(sysdate),
customer_id number(4),
room_no number(4),
foreign key(customer_id)references customer(customer_id)
foreign key(room_no)references booking_details(room_number)
);

create table room(
room_no number(3) ,
reserv_no number(3),
foreign key(room_no)references booking_details(room_number),
foreign key(reserv_no)references reservation(reservation_no));

create table payment(
bill_no number(4) primary key,
mode_of_payment char(6),
payment_date date default(sysdate),
reservation_no number(5),
foreign key(reservation_no)references reservation(reservation_no));