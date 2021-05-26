create database Revista;
use Revista;

create table Revista (
	idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30),
    preco decimal (4,2)
    );
    
insert into Revista (nome, preco) values ('Veja', 10.90),
										('Época', 25),
                                        ('IstoÉ', 24),
                                        ('Caras', 28.3);
select * from Revista;

update Revista set categoria = 'Política' where idRevista = 1;
update Revista set categoria = 'Notícias' where idRevista in (2, 3);
update Revista set categoria = 'Fofoca' where idRevista = 4;

select * from Revista;

insert into Revista values (null, 'Viva Mais', 'Notícias', 18),
						(null, 'Ana Maria', 'Culinária', 12),
                        (null, 'Contigo', 'Fofoca', 28.3);
                        
select * from Revista;

desc Revista;

alter table Revista modify categoria varchar(40);

desc Revista;

alter table Revista change nome nomeRevista varchar(40);

select * from Revista;

alter table Revista add periodicidade varchar(15);

select * from Revista;

update Revista set periodicidade = 'Semanal' where idRevista in (1, 2, 4, 6);
update Revista set periodicidade = 'Mensal' where idRevista in (3, 5, 7);

select * from Revista;

alter table Revista drop periodicidade;

select * from Revista;

create table Editora (
	idEditora int primary key auto_increment,
    nomeEditora varchar(40),
    dataFund date
) auto_increment = 1000;

insert into Editora values (null, 'Editora Abril', '1950-05-01'),
						(null, 'Editora Globo', '1986-01-01'),
						(null, 'Editora Três', '2003-06-02');
                        
alter table Revista add fkEditora int;

alter table Revista add foreign key(fkEditora) references Editora(idEditora);

update Revista set fkEditora = 1000 where idRevista in (1, 4, 5, 6, 7);
update Revista set fkEditora = 1001 where idRevista = 2;
update Revista set fkEditora = 1002 where idRevista = 3;

select * from Revista;

select * from Revista, Editora where fkEditora = idEditora;

select * from Revista, Editora where fkEditora = idEditora and nomeEditora = 'Editora Abril';
