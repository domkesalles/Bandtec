create database Dependente;
use Dependente;
-- Criação da tabela Funcionario, já com uma FK para ela mesma
-- Relacionamento recursivo de supervisão
create table Funcionario (
	idFuncionario int primary key auto_increment,
    nomeFuncionario varchar(45),
    salario decimal (7,2) check (salario > 1100), -- estamos validando se o salário é maior do que o salário mínimo
    sexo char(1) check (sexo = 'm' or sexo = 'f' or sexo = 'n'),
    FkSupervisor int, foreign key (fkSupervisor) references Funcionario(idFuncionario)
) auto_increment = 1000;

-- Criação da tabela Dependente, configurada como entidade fraca
create table Dependente (
	fkFuncionario int, foreign key (fkFuncionario) references Funcionario(idFuncionario),
    idDependente int, -- NÃO COLOCAR PRIMARY KEY AQUI, PQ SERÁ UMA PK COMPOSTA
					-- TAMBÉM NÃO COLOCAR AUTO_INCREMENT
	primary key (fkFuncionario, idDependente), -- chave primária composta
    nomeDependente varchar(45),
    tipo varchar(45),
    dataNascimento date
    );
-- Inserção de dados na tabela Funcionário
insert into Funcionario values (null, 'Claudio Nunes', 20000, 'm', null),
								(null, 'João Silva', 15000, 'm', 1000),
								(null, 'Maria Sousa', 12000, 'f', 1000),
								(null, 'Ana Teixeira', 10000, 'f', 1001),
								(null, 'Carlos Pereira', 8000, 'm', 1002);
-- Exibir dados da tabela Funcionario
select * from Funcionario;
-- Inserção de dados na tabela Dependente
insert into Dependente values (1000, 1, 'Claudia Nunes', 'conjuge', '1990-03-05'),
								(1000, 2, 'Pedro Nunes', 'filho', '2010-04-06'),
								(1000, 3, 'Petra Nunes', 'filha', '2012-05-10'),
								(1001, 1, 'Joana Silva', 'conjuge', '2000-10-04'),
								(1001, 2, 'Jurema Silva', 'conjuge', '2020-11-10'),
								(1002, 1, 'Mario Sousa', 'conjuge', '2001-09-05');
select * from Dependente;
-- Exibir os dados dos funcionários e dos seus dependentes
select * from Funcionario, Dependente where idFuncionario = fkFuncionario;
-- Exibir os dados dos funcionários e dos seus dependentes mas somente de um funcionario
select * from Funcionario, Dependente where idFuncionario = fkFuncionario and nomeFuncionario = 'Claudio Nunes';
-- Exibir os dados dos funcionários e dos seus supervisores
select * from Funcionario as f, Funcionario as s where f.fkSupervisor = s.idFuncionario;
-- Exibir os dados dos funcionários e dos seus supervisores mas somente de um supervisor
select * from Funcionario as f, Funcionario as s where f.fkSupervisor = s.idFuncionario and s.nomeFuncionario = 'Claudio Nunes';

select * from Funcionario inner join Dependente on idFuncionario = fkFuncionario;
select * from Funcionario left join Dependente on idFuncionario = fkFuncionario;
select * from Funcionario right join Dependente on idFuncionario = fkFuncionario;
select * from Funcionario as f, Funcionario as s where f.fkSupervisor = s.idFuncionario;
select * from Funcionario as f inner join Funcionario as s on f.fkSupervisor = s.idFuncionario;
select * from Funcionario as f left join Funcionario as s on f.fkSupervisor = s.idFuncionario;
select * from Funcionario as f inner join Funcionario as s on f.fkSupervisor = s.idFuncionario inner join dependente on f.idFuncionario = fkFuncionario;