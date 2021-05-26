create database EscolaIdioma;
use EscolaIdioma;
-- Criação da tabela Aluno
create table Aluno (
	ra int primary key auto_increment,
    nomeAluno varchar(45),
    bairro varchar(45)
) auto_increment = 1000;
-- Criação da tabela Curso
create table Curso (
	idCurso int primary key auto_increment,
    nomeCurso varchar(45),
    coordenador varchar(45)
);
-- 	Criação da tabela AlunoCurso - tabela associativa entre Aluno e Curso
create table AlunoCurso(
	fkRa int, foreign key (fkRa) references Aluno(ra),
    fkCurso int, foreign key (fkCurso) references Curso(idCurso),
    dataInicio date,
    primary key (fkRa, fkCurso, dataInicio),
    media decimal(4,2),
    nivel char(2)
);
-- Inserção de dados na tabela Aluno
insert into Aluno values (null, 'Maria', 'Saúde'),
						(null, 'João', 'Consolação');
-- Inserção de dados na tabela Curso
insert into Curso values (null, 'Espanhol', 'Juan'),
						(null, 'Inglês', 'Beth');
-- Inserção de dados na tabela AlunoCurso (tabela associativa)
insert into AlunoCurso values (1000, 1, '2015-02-01', 9.0, 'A1'),
							(1000, 2, '2017-02-01', 7.0, 'I3'),
                            (1001, 1, '2020-02-01', 7.0, 'B1'),
                            (1001, 2, '2019-02-01', 8.5, 'I2');
-- Selects individuais de cada tabela
select * from Aluno;
select * from Curso;
select * from AlunoCurso;
-- Exibir os dados dos alunos e dos cursos correspondentes
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso;
-- Exibir os dados dos alunos e dos cursos correspondentes, mas somente de um curso
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso and nomeCurso = 'Espanhol';
-- Exibir os dados dos alunos e dos cursos correspondentes, mas somente de um aluno
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso and nomeAluno = 'Maria';
-- Exibir a soma e a média das médias
select sum(media) as 'Soma das Médias', round(avg(media),2) as 'Média das Médias' from AlunoCurso;
-- Exibir a menor e a maior média
select min(media) as 'Menor média', max(media) as 'Maior média' from AlunoCurso;
-- Exibir a menor e a maior média agrupado por curso
select min(media) as 'Menor média', max(media) as 'Maior média' from AlunoCurso group by fkCurso;
-- Exibir a menor e a maior média agrupado por curso (aparecendo qual é o curso)
select fkCurso, min(media) as 'Menor média', max(media) as 'Maior média' from AlunoCurso group by fkCurso;
-- Exibir a menor e a maior média agrupado por curso (aparecendo qual é o aluno)
select fkRa as 'RA', min(media) as 'Menor média', max(media) as 'Maior média' from AlunoCurso group by fkRa;
select media from AlunoCurso;
select distinct media from AlunoCurso;
select count(media) as 'Quantidade de médias' from AlunoCurso;
select count(distinct media) as 'Quantidade de médias' from AlunoCurso;
select count(media) - count(distinct media) from AlunoCurso;
-- vamos dar 0.5 ponto a mais em todas as médias da tabela
update AlunoCurso set media = media + 0.5 where fkRa >= 1000;
