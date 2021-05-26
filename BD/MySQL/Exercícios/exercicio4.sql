create database Escola;
use Escola;

create table Aluno (
 RA int primary key,
 nomeAluno varchar(40),
 telefone char(25),
 email varchar(40),
 hobby varchar(30)
 );
 
 insert into Aluno values (2211000, 'Abner Biscassi Moreira Nunes', '(+55) 11 97112-5552', 'abner.nunes@bandtec.com.br', 'Valorant'),
						(2211006, 'Bruno Leonardo Guimarâes da Silva', '(+55) 11 94538-4967', 'bruno.silva@bandtec.com.br', 'Basquete'),
                        (2211008, 'Cauã Benini', '(+55) 11 95983-1316', 'cauã.benini@bandtec.com.br', 'Futebol'),
                        (2211014, 'Felipe Domke Salles', '(+55) 11 98404-4237', 'felipe.salles@bandtec.com.br', 'FIFA'),
						(2211016, 'Fernando Martins Marques', '(+55) 11 96919-9579', 'fernando.marques@bandtec.com.br', 'Formula 1'),
                        (2211024, 'Giovanna Butini Pompeu', '(+55) 11 97788-2270', 'giovanna.pompeu@bandtec.com.br', 'Filme'),
                        (2211027, 'Henrique Nunes de Lima', '(+55) 11 98133-3167', 'henrique.lima@bandtec.com.br', 'LOL');
 select * from Aluno;
 
 create table Empresa (
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar (40),
    representante varchar(30)
    ) auto_increment = 100;
    
insert into Empresa values (null, 'Banco Saffra', 'Cléber'),
							(null, 'Berghem', 'Maísa'),
                            (null, 'C6 Bank', 'Jonas'),
                            (null, 'Fleury', 'Miriam'),
                            (null, 'Stefanini', 'Lucas');
select * from Empresa;

create table Instituicao (
idInstituicao int primary key auto_increment,
nomeInsituticao varchar(40),
bairro varchar(30)
) auto_increment = 1000;

insert into Instituicao values (null, 'Colégio Rumo Inicial', 'Jardim Patente'),
								(null, 'ETEC Heliópolis', 'Sacomã'),
                                (null, 'ETEC Jorge Street', 'Barcelona');
select * from Instituicao;

alter table Aluno add fkEmpresa int;
alter table Aluno add foreign key(fkEmpresa) references Empresa(idEmpresa);
alter table Aluno add fkInstituicao int;
alter table Aluno add foreign key(fkInstituicao) references Instituicao(idInstituicao);

update Aluno set fkEmpresa = 100 where ra in (2211000, 2211016);
update Aluno set fkEmpresa = 101 where ra = 2211027;
update Aluno set fkEmpresa = 102 where ra = 2211008;
update Aluno set fkEmpresa = 103 where ra = 2211014;
update Aluno set fkEmpresa = 104 where ra in (2211006, 2211024);

select * from Empresa, Aluno where fkEmpresa = idEmpresa;

update Aluno set fkInstituicao = 1000 where ra = 2211006;
update Aluno set fkInstituicao = 1001 where ra = 2211027;
update Aluno set fkInstituicao = 1002 where ra in (2211000, 2211016, 2211008, 2211014, 2211024);

select * from Instituicao, Aluno where fkInstituicao = idInstituicao;

select * from Instituicao, Aluno, Empresa where fkInstituicao = idInstituicao and fkEmpresa = idEmpresa;