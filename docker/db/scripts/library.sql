drop table if exists publisher cascade;
drop table if exists copy cascade;
drop table if exists book cascade;
drop table if exists reader cascade;
drop table if exists copy_reader cascade;
drop table if exists category cascade;
drop table if exists book_reader cascade;

create table publisher
(
    id      integer primary key,
    name    varchar,
    address varchar
);

create table book
(
    isbn         integer primary key,
    pk_publisher integer references publisher (id),
    year         integer,
    author       varchar,
    title        varchar,
    pages        integer
);

create table copy
(
    id        integer primary key,
    pk_book   integer references book (isbn),
    copy_num  integer,
    shelf_pos integer
);

create table reader
(
    id         integer primary key,
    last_name  varchar,
    first_name varchar,
    date_birth date,
    address    varchar
);

create table copy_reader
(
    id          integer primary key,
    pk_copy     integer references copy (id),
    pk_reader   integer references reader (id),
    date_return date
);

create table category
(
    id                 integer primary key,
    pk_parent_category integer references category (id),
    name               varchar
);

create table book_category
(
    id          integer primary key,
    pk_book     integer references book (isbn),
    pk_category integer references category (id)
);
