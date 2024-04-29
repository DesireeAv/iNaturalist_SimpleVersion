alter table PERSON
add email varchar2(300);

select * from person;

UPDATE person
SET email = 'user@gmail.com'
WHERE id in (1,2,3,4,5,21,22);

