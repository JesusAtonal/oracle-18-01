create table usuario_x(id integer primary key,
                      nombre varchar2(40),
                      edad integer);
                      
insert into usuario_x values(1,'Juan',40);
insert into usuario_x values(2,'Ana',32);
insert into usuario_x values(3,'Pedro',27);
insert into usuario_x values(4,'Maria',30);

select * from usuario_x;

set serveroutput on;

    declare
    cursor cur_1 is select * from usuario_x;
    begin
    --Aqui viene la logica del cursor
    for fila in cur_1 loop 
    dbms_output.put_line('El nombre actual es: ' ||fila.nombre);
    end loop;
    end;
    /
    
    
    
    declare 
    cursor cur_2 is select * from usuario_x;
    sueldo_base integer;
    begin
    --inicializamos el sueldo base
    for fila in cur_2 loop
    sueldo_base:=6000;
    if fila.edad > 30 then
    sueldo_base:=sueldo_base*1.5;
    end if;
    dbms_output.put_line('El sueldo es: '||sueldo_base || ' Edad:'||fila.edad);
    end loop;
    end;
    /