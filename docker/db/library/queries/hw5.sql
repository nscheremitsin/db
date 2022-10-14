-- а
select distinct last_name
from reader
where address ~ 'Москва';


-- б
select distinct b.author,
                b.title
from copy_reader cr
         join copy c on cr.pk_copy = c.id
         join book b on b.id = c.pk_book
         join reader r on cr.pk_reader = r.id
where r.last_name = 'Иванов'
  and r.first_name = 'Иван';


-- в
select isbn
from (select b.isbn,
             count(*) filter ( where c.name = 'Горы' )        mountain_cnt,
             count(*) filter ( where c.name = 'Путешествия' ) travel_cnt
      from book b
               join book_category bc on b.id = bc.pk_book
               join category c on bc.pk_category = c.id
      group by b.isbn) q
where mountain_cnt > 0
  and travel_cnt = 0;


-- г
select distinct r.last_name,
                r.first_name
from copy_reader cr
         join reader r on cr.pk_reader = r.id
         join copy c on c.id = cr.pk_copy
where cr.date_return is not null;


-- д
with book_with_reader as (select distinct r.last_name,
                                          r.first_name,
                                          b.id book_pk
                          from copy_reader cr
                                   join copy c on c.id = cr.pk_copy
                                   join reader r on r.id = cr.pk_reader
                                   join book b on b.id = c.pk_book)
select distinct last_name,
                first_name
from book_with_reader
where last_name != 'Иванов'
  and first_name != 'Иван'
  and book_pk in (select distinct book_pk
                  from book_with_reader
                  where last_name = 'Иванов'
                    and first_name = 'Иван');



