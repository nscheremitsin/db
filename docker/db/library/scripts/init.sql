drop table if exists publisher cascade;
drop table if exists copy cascade;
drop table if exists book cascade;
drop table if exists reader cascade;
drop table if exists copy_reader cascade;
drop table if exists category cascade;
drop table if exists book_reader cascade;

create table publisher
(
    id      serial primary key,
    name    varchar,
    address varchar
);

create table book
(
    id           serial primary key,
    pk_publisher integer references publisher,
    isbn         varchar,
    year         integer,
    author       varchar,
    title        varchar,
    pages        integer
);

create table copy
(
    id        serial primary key,
    pk_book   integer references book,
    copy_num  integer,
    shelf_pos integer
);

create table reader
(
    id         serial primary key,
    last_name  varchar,
    first_name varchar,
    date_birth date,
    address    varchar
);

create table copy_reader
(
    id          integer primary key,
    pk_copy     integer references copy,
    pk_reader   integer references reader,
    date_return date
);

create table category
(
    id                 serial primary key,
    pk_parent_category integer references category,
    name               varchar
);

create table book_category
(
    id          serial primary key,
    pk_book     integer references book,
    pk_category integer references category
);
