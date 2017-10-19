--creamos la siguiente tabla
create table cartera_clientes(id integer primary key, 
                              nombre varchar2(40),
                              edad integer,
                              sueldo_base float);
                              
insert into cartera_clientes values (1,'JUAN',25,60000);
insert into cartera_clientes values (2,'ANA',45,40000);
insert into cartera_clientes values (3,'PEDRO',32,40000);
insert into cartera_clientes values (4,'IRMA',45,70000);
insert into cartera_clientes values (5,'LUIS',55,20000);

SELECT * FROM cartera_clientes;

declare
sueldo float;
pago_nomina float;
begin
--declaramos el cursor implicitos
select sueldo_base into sueldo from cartera_clientes where id=3;
pago_nomina:=sueldo*20;
dbms_output.put_line('El pago es: '||pago_nomina);
end;
/
set serveroutput on;

-- 1)Creamos la tabla
create table nominas(id_nomina integer primary key,
                    nombre varchar2(60));

-- 2)Generar una secuencia
create sequence sec_nominas
start with 1
increment by 2
nomaxvalue;

-- 3)Crear el procedimiento de enlace de tabla y secuencia
create or replace procedure guardar_nomina(my_id out integer,my_nombre in varchar2)
as
begin
select sec_nominas.nextval into my_id from dual;
insert into nominas values(my_id, my_nombre);
end;
/

-- Finalmente vamos a probar el procedimiento con un bloque PLSQL

declare
valor integer;
begin
guardar_nomina(valor,'JUAN');
dbms_output.put_line('El pk generado es: '||valor);
end;
/

select * from nominas;
                    