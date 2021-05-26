create database atletismo;
use atletismo;
create table Atleta (
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int
);

insert into Atleta values (1, 'Felipe Domke Salles', 'Futebol', '6');
insert into Atleta values (2, 'Reyel Soares', 'Tênis de Mesa', '10');
insert into Atleta values (3, 'Gustavo Lima', 'Volêi', '4');
insert into Atleta values (4, 'Flavio Vicentim', 'Handebol', '1');

select * from Atleta;

select nome, qtdMedalha from Atleta;
select modalidade, nome from Atleta;
select * from Atleta where modalidade = 'Handebol';
select * from Atleta where qtdMedalha >= 3;
select * from Atleta where idAtleta < 6;
select nome from Atleta where modalidade = 'Handebol';
select * from Atleta where idAtleta > 2 && idAtleta < 10;

create table Pais (
idPais int primary key,
nome varchar(40),
capital varchar(40)
);

insert into Pais values (100, 'Brasil', 'Brasília'),
						(101, 'Canadá', 'Otawa'),
                        (102, 'Estados Unidos', 'Washington'),
                        (103, 'México', 'Cidade do México');
                        
alter table Atleta add fkPais int;
alter table Atleta add foreign key(fkPais) references Pais(idPais);

update Atleta set fkPais = 100 where idAtleta = 1;
update Atleta set fkPais = 101 where idAtleta = 2;
update Atleta set fkPais = 102 where idAtleta = 3;
update Atleta set fkPais = 103 where idAtleta = 4;

select * from Atleta, Pais where fkPais = idPais;

select * from Atleta, Pais where fkPais = idPais and Pais.nome = 'Brasil';

drop table atleta;
drop table pais;