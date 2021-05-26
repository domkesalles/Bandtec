create database Exercicio10;
use Exercicio10;

create table Departamento (
	idDepto int primary key,
    nomeDepto varchar(45),
    fkGerente int,
    dataInicioGer date
);

create table Funcionario (
	idFunc int primary key,
    nomeFunc varchar(30),
    salario int,
    sexo char(1),
    fkSupervisor int,
    dataNasc date,
    fkDepto int
);

create table Projeto (
	idProj int primary key,
    nomeProj varchar(40),
    localProj varchar(35),
    fkDepto int
);

create table FuncProj (
	fkFunc int,
    fkProj int,
    primary key (fkFunc, fkProj),
    horas decimal(3,1)
);

insert into Departamento values (105, "Pesquisa", 2, "2008-05-22"),
								(104, "Administração", 7, "2015-01-01"),
                                (101, "Matriz", 8, "2001-06-19");
                                
insert into Funcionario values (1, "Joao Silva", 3500, "m", 2, "1985-01-09", 105),
							(2, "Fernando Wong", 4500, "m", 8, "1975-12-08", 105),
                            (3, "Alice Sousa", 2500, "f", 7, "1988-01-19", 104),
                            (4, "Janice Morais", 4300, "f", 8, "1970-06-20", 104),
                            (5, "Ronaldo Lima", 3800, "m", 1, "1982-09-15", 105),
                            (6, "Joice Leite", 2500, "f", 1, "1992=07=31", 105),
                            (7, "Antonio Pereira", 2500, "m", 4, "1989-03-29", 104),
                            (8, "Juliano Brito", 5500, "m", null, "1957-11-10", 101);
                            
insert into Projeto values (1, "Produto X", "Santo André", 105),
						(2, "Produto Y", "Itu", 105),
                        (3, "Produto Z", "São Paulo", 105),
                        (10, "Informatização", "Mauá", 104),
                        (20, "Reorganização", "São Paulo", 101),
                        (30, "Benefícios", "Mauá", 104);
                        
insert into FuncProj values (1, 1, 32.5),
							(1, 2, 7.5),
                            (5, 3, 40.0),
                            (6, 1, 20.0),
                            (6, 2, 20.0),
                            (2, 2, 10.0),
                            (2, 3, 10.0),
                            (2, 10, 10.0),
                            (2, 20, 10.0),
                            (3, 30, 30.0),
                            (3, 10, 10.0),
                            (7, 10, 35.0),
                            (7, 30, 5.0),
                            (4, 30, 20.0),
                            (4, 20, 15.0),
                            (8, 20, null);
                            
alter table Departamento add foreign key (fkGerente) references Funcionario(idFunc);
alter table Funcionario add foreign key (fkSupervisor) references Funcionario(idFunc);
alter table Funcionario add foreign key (fkDepto) references Departamento(idDepto);
alter table Projeto add foreign key (fkDepto) references Departamento(idDepto);
alter table FuncProj add foreign key (fkFunc) references Funcionario(idFunc);
alter table FuncProj add foreign key (fkProj) references Projeto(idProj);

select * from Departamento;
select * from Funcionario;
select * from Projeto;
select * from FuncProj;

insert into Funcionario values (null, "Cecilia Ribeiro", 2800, "f", null, "1980-04-05", 104);
insert into Funcionario values (3, "Alice Sousa", 2800, "f", 4, "1980-04-05", 104);
insert into Funcionario values (9, "Cecilia Ribeiro", 2800, "f", 4, "1980-04-05", 107);
insert into Funcionario values (9, "Cecilia Ribeiro", 2800, "f", 4, "1980-04-05", 104);

delete from FuncProj where fkFunc = 3 and fkProj = 10;
delete from Funcionario where idFunc = 4;
delete from Funcionario where idFunc = 2;

update Funcionario set salario = 2800 where idFunc = 3;
update Funcionario set fkDepto = 101 where idFunc = 3;
update Funcionario set fkDepto = 107 where idFunc = 3;

select dataNasc, salario from Funcionario where nomeFunc = "Joao Silva";
select salario from Funcionario;
select distinct salario from Funcionario;
select * from Funcionario order by nomeFunc;
select * from Funcionario order by salario desc;
select * from Funcionario where salario >= 2000 and salario <= 4000;
select nomeFunc, salario from Funcionario where nomeFunc like 'J%';
select nomeFunc, salario from Funcionario where nomeFunc like '%a';
select nomeFunc from Funcionario where nomeFunc like '__n%';
select nomeFunc, dataNasc from Funcionario where nomeFunc like '%s____';
select * from Funcionario where fkDepto = 105;
select Funcionario.* from Funcionario inner join Departamento on fkDepto = idDepto and nomeDepto = "Pesquisa";
select * from Funcionario where fkDepto = (select idDepto from Departamento where nomeDepto = "Pesquisa");
select * from Funcionario where fkDepto in (select idDepto from Departamento where nomeDepto = "Pesquisa" or nomeDepto = "Matriz");
select * from Funcionario where fkDepto = 105 and salario > 3500;
select * from Funcionario where fkDepto = 105 and nomeFunc like 'J%';
select * from Jogador as Jogador, Jogador as Conselheiro where Jogador.fkConselheiro = Conselheiro.idJogador;
select idFuncionario.idFunc, idFuncionario.nomeFunc, idSupervisor.idFunc as 'idSupervisor', idSupervisor.nomeFunc as 'nomeSupervisor' from Funcionario as idFuncionario, Funcionario as idSupervisor where idFuncionario.fkSupervisor = idSupervisor.idFunc;
select Projeto.idProj, Projeto.fkDepto, Funcionario.nomeFunc, Funcionario.dataNasc from Projeto inner join Departamento on fkDepto = idDepto inner join Funcionario on fkGerente = idFunc where localProj = "São Paulo";
select Funcionario.idFunc, Funcionario.nomeFunc, Projeto.idProj, Projeto.nomeProj, FuncProj.horas from Funcionario inner join FuncProj on idFunc = fkFunc inner join Projeto on fkProj = idProj; 
select nomeFunc from Funcionario where dataNasc between ('1000-01-01') and ('1979-12-31');
select count(distinct salario) from Funcionario;
select count(distinct localProj) from Projeto;
select avg(salario), sum(salario) from Funcionario;
select min(salario), max(salario) from Funcionario;
select Departamento.idDepto, avg(Funcionario.salario), sum(Funcionario.salario) from Departamento inner join Funcionario on idDepto = fkDepto group by idDepto;
select Departamento.idDepto, min(Funcionario.salario), max(Funcionario.salario) from Departamento inner join Funcionario on idDepto = fkDepto group by idDepto;

insert into Funcionario values (10, 'José da Silva', 1800, 'm', 3, '2000-10-12', null),
							(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', null);

insert into Departamento values (110, 'RH', 3, '2018-11-10');

select * from Funcionario left join Departamento on fkDepto = idDepto;
select * from Funcionario right join Departamento on fkDepto = idDepto;