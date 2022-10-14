drop table if exists connection cascade;
drop table if exists train cascade;
drop table if exists station cascade;
drop table if exists city cascade;

create table city
(
    id     serial primary key,
    name   varchar,
    region varchar
);

create table station
(
    id      serial primary key,
    pk_city integer references city,
    name    varchar,
    tracks  integer
);

create table train
(
    id               serial primary key,
    pk_start_station integer references station,
    pk_end_station   integer references station,
    number           varchar,
    length           integer
);

create table connection
(
    id              serial primary key,
    pk_from_station integer references station,
    pk_to_station   integer references station,
    pk_train        integer references train,
    departure       timestamp,
    arrival         timestamp
);