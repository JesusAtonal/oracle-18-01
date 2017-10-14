
create table menores_edad(id_menores integer primary key,
                          nombre varchar2(60),
                          edad integer );
                          
create or replace procedure generar_mil
as begin
--generamos los mil
for i IN 1..1000 loop
insert into menores_edad values(i,'jesus',20);
end loop;
end;
/

--vamos a ejecutar el procedimiento
begin
generar_mil();
end;
/

select * from menores_edad;
select count(*) from menores_edad;

create or replace procedure actualizar_edad(age in integer,id in integer)as
begin
if age < 18 then 
RAISE_APPLICATION_ERROR(-20000, 'No acepto edades menores a 18');
else
update menores_edad set edad=age where id_menores=id;
end if;
end;
/
