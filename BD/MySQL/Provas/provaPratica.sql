create database Continuada1;

use Continuada1;

create table Restaurante (
idRest int primary key,
nome varchar(40),
bairro varchar(35),
tipo varchar(30)
);

insert into Restaurante values (1, 'Casa do Churrasco', 'Jardim Patente', 'Churrascaria'),
							   (2, 'MC Donalds', 'Sacomã', 'Fast Food'),
							   (3, 'Churras do Marcão', 'Taboão', 'Churrascaria'),
                               (4, 'Sabor Italiano', 'Sacomã', 'Italiana'),
                               (5, 'Japan in box', 'Liberdade', 'Japonesa'),
                               (6, 'Rei do Hambúrguer', 'Taboão', 'Fast Food'),
                               (7, 'Amigos do Davi', 'Jardim Patente', 'Churrascaria');
                               
-- 1)
select * from Restaurante;

-- 2)
select nome, tipo from Restaurante;

-- 3)
select * from Restaurante where tipo = 'Churrascaria';

-- 4)
select * from Restaurante where bairro = 'Sacomã';

-- 5)
select * from Restaurante order by nome;

-- 6)
select * from Restaurante order by tipo desc;

-- 7)
select * from Restaurante where nome like 'c%';

-- 8)
select * from Restaurante where bairro like '%e';

-- 9)
select * from Restaurante where tipo like '_a%';

-- 10)
select * from Restaurante where nome like '%o_';

-- 11)
update Restaurante set bairro = 'Taboão' where idRest = 2;
select * from Restaurante;

-- 12)
delete from Restaurante where idRest = 7;
select * from Restaurante;

-- 13)
drop table Restaurante;