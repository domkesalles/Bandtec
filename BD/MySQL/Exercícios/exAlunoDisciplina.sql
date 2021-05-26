create database AlunoDisciplina;
use AlunoDisciplina;

create table Aluno (
	ra int primary key auto_increment,
    nomeAluno varchar(45),
    bairro varchar(40)
) auto_increment = 1000;

create table Disciplina (
	idDisciplina int primary key auto_increment,
    nomeDisciplina varchar(45)
);

create table AlunoDisciplina (
	fkAluno int, foreign key (fkAluno) references Aluno(ra),
    fkDisciplina int, foreign key (fkDisciplina) references Disciplina(idDisciplina),
    dataMatricula date,
    primary key (fkAluno, fkDisciplina, dataMatricula),
    media decimal(4,2),
    qtdFaltas int
);

insert into Aluno values (null, 'Felipe Domke', 'Jardim Patente'),
						(null, 'Reyel Soares', 'Sacomã'),
                        (null, 'Fernando Marques', 'Taboão'),
                        (null, 'Bruno Zapateiro', 'Sacomã');
                        
insert into Disciplina values (null, 'CCO'),
							(null, 'ADS'),
                            (null, 'REDES');
                            
insert into AlunoDisciplina values (1000, 1, '2020-02-08', 8.60, 1),
								(1000, 3, '2018-01-30', 7.40, 15),
                                (1001, 2, '2020-02-10', 10.00, 10),
                                (1001, 3, '2018-01-30', 9.50, 30),
                                (1002, 1, '2020-02-08', 7.50, 5),
                                (1003, 2, '2020-02-10', 8.00, 8);
                            
select * from Aluno;
select * from Disciplina;
select * from AlunoDisciplina;
select * from Aluno, Disciplina, AlunoDisciplina where ra = fkAluno and idDisciplina = fkDisciplina;
select * from Aluno, Disciplina, AlunoDisciplina where ra = fkAluno and idDisciplina = fkDisciplina and nomeDisciplina = 'CCO';
select * from Aluno, Disciplina, AlunoDisciplina where ra = fkAluno and idDisciplina = fkDisciplina and nomeAluno = 'Felipe Domke';
select sum(media) as 'Soma das Médias', sum(qtdFaltas) as 'Soma das Faltas' from AlunoDisciplina;
select avg(media) as 'Média das Médias', avg(qtdFaltas) as 'Média das Faltas' from AlunoDisciplina;
select max(media) as 'Maior média', min(media) as 'Menor média' from AlunoDisciplina;
select max(qtdFaltas) as 'Maior quantidade de faltas', min(qtdFaltas) as 'Menor quantidade de faltas' from AlunoDisciplina;
select max(media) as 'Maior média', min(media) as 'Menor média' from AlunoDisciplina group by fkDisciplina;
select max(media) as 'Maior média', min(media) as 'Menor média' from AlunoDisciplina group by fkAluno;
select media from AlunoDisciplina;
select distinct media from AlunoDisciplina;
select count(media) as 'Quantidade de Médias' from AlunoDisciplina;
select count(distinct media) as 'Quantidade de Médias distintas' from AlunoDisciplina;