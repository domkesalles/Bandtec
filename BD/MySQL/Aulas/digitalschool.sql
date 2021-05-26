create database digitalschool;

use digitalschool;

create table curso (
	idcurso int primary key auto_increment,
    nomeCurso char(5),
    coordenador varchar(15)
    ) auto_increment = 100;
    
select * from curso;

insert into curso values (null, 'ADS', 'Gerson'),
						(null, 'CCO', 'Marise'),
                        (null, 'Redes', 'Alex');
			
create table aluno (
	ra int primary key auto_increment,
    nomeAluno varchar(40),
    bairro varchar(30),
    fkCurso int,
    foreign key (fkCurso) references curso(idCurso)
) auto_increment = 50000;

select * from aluno;

desc aluno;

insert into aluno values (null, 'Maria', 'Paraíso', 100),
						(null, 'João', 'Consolação', 101),
                        (null, 'Mickey', 'Disney', 100),
                        (null, 'Pateta', 'Flórida', 102);
                        
drop table curso;

select * from aluno;
select * from curso;

-- Exibir os dados dos alunos e dos cursos correspondentes
-- JEITO ERRADO DE FAZER
select * from aluno, curso;

-- Exibir os dados dos alunos e dos cursos correspondentes
-- JEITO CERTO DE FAZER
select * from aluno, curso where fkcurso = idCurso;

-- Exibir os dados dos alunos e dos cursos correspondentes
-- mas somente do curso de ADS
select * from aluno, curso where fkcurso = idCurso and nomeCurso = 'ADS';

select ra, nomeAluno, bairro, idCurso, nomeCurso, coordenador from aluno, curso where fkcurso = idCurso and nomeCurso = 'ADS';

select ra, nomeAluno, bairro, curso.* from aluno, curso where fkcurso = idCurso and nomeCurso = 'ADS';