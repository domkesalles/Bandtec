create database Filmes;
 create table Filme (
 idFilme int primary key,
 nome varchar(40),
 ator varchar(40),
 genero varchar(40)
 );

insert into Filme values ('21', 'Jogos Mortais', 'Tobin Bell', 'terror');
insert into Filme values ('27', 'StarWars', 'Mark Hammil', 'aventura');
insert into Filme values ('19', 'PulpFiction', 'John Travolta', 'ação');
insert into Filme values ('7', 'Greeze', 'John Travolta', 'musical');
insert into Filme values ('11', 'Vingadores', 'Robert Downey', 'aventura');
insert into Filme values ('12', 'Piratas do Caribe', 'Johnny Dep', 'aventura');
insert into Filme values ('25', 'Alice', 'Johnny Dep', 'fantasia');
insert into Filme values ('32', 'Edward Mãos', 'Johnny Dep', 'suspense');
insert into Filme values ('13', 'Sherlock Holmes', 'Robert Downey', 'suspense');

select * from Filme;
select nome, ator from Filme;
select genero, ator from Filme;
select * from Filme where genero = 'aventura';
select * from Filme where ator = 'Johnny Dep';
select nome from Filme where genero = 'Suspense';
select nome, genero from Filme where ator = 'Robert Downey';
select * from Filme where idFilme < 14 and idFilme > 10;
select * from Filme where idFilme <= 19;
select * from Filme where idFilme > 15;
