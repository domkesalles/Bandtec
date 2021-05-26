-- Isso é um comentário
-- Criação do banco de dados aluno
create database aluno; -- aluno é o nome do banco de dados
-- Selecionar o banco de dados aluno
use aluno;
-- Criação da tabela Aluno
create table Aluno (
  ra int primary key,  -- ra é a chave primária desta tabela
  nome varchar(40),
  bairro varchar(40)
);
-- Exibir a tabela Aluno
select * from Aluno;
-- * significa todas as colunas
-- no lugar do *, vc pode colocar os nomes das colunas que vc quer exibir
-- seleciona apenas a coluna ra 
select ra from Aluno;
select ra, nome, bairro from Aluno;  -- equivale a select * from Aluno
-- seleciona as colunas nome e ra, nessa ordem
select nome, ra from Aluno;

-- Inserção de dados de um aluno na tabela
-- valor de campo int é inserido sem aspas
-- valor de campo varchar ou char é inserido com aspas simples
insert into Aluno values (02211016, 'Fernando Martins','Taboão');
-- Exibir os dados da tabela
select * from Aluno; 

-- Inserção de dados de mais alunos
insert into Aluno values (02211041, 'Leo Nunes', 'Ferraz de Vasconcelos'),
                         (02211042, 'Lucas Henrique Adelino', 'Ponte Grande'),
                         (02211044, 'Lucas Mesquita', 'Jardim São Luis'),
                         (02211057, 'Roberta Pires', 'Oswaldo Cruz'),
                         (02211022, 'Gabriel Sanchez', 'Scarpelli');
                         
-- Exibir os dados dos alunos que são do bairro 'Taboão'
select * from Aluno where bairro = 'Taboão';

-- -------------------------------------------------------------------------
-- PARTE NOVA - 16/03/21

-- Criação da tabela Curso
create table curso (
	idcurso int primary key auto_increment,
    nome char(5),
    coordenador varchar(15)
    ) auto_increment = 100;  
    
-- Inserção dos dados da tabela Curso
insert into curso values (null, 'ADS', 'Gerson'),
						(null, 'CCO', 'Marise'),
                        (null, 'Redes', 'Alex');
select * from Curso;

-- Acrescentar uma coluna chamada fkCurso na tabela Aluno
alter table Aluno add fkCurso int;

select * from Aluno;

-- Acrescentar restrição de FK à coluna fkCurso da tabela Aluno
-- ou seja, vamos configurar a coluna fkCurso para ser um FK
alter table Aluno add foreign key(fkCurso) references Curso(idCurso);

-- Preencher os dados de fkCurso para os registros que já existem
update Aluno set fkCurso = 100 where ra in (2211016, 2211041, 2211057);
update Aluno set fkCurso = 101 where ra in (2211022, 2211042);
update Aluno set fkCurso = 102 where ra in (2211044);

-- Exibir os dados dos alunos e dos cursos correspondentes
select * from aluno, curso where fkcurso = idCurso;

-- Exibir os dados dops alunos e dos crusos correspondentes mas somente do curso de CCO
select * from aluno, curso where fkcurso = idCurso and Curso.nome = 'CCO';

-- Exibir os dados dos alunos e dos cursos correspondentes mas sem repetir o valor do fk
select ra, Aluno.nome, bairro, Curso.* from aluno, curso where fkcurso = idCurso;
select Aluno.*, Curso.nome, coordenador from Aluno, curso where fkcurso = idcurso;

-- Inserção de um novo aluno, sendo que agora podemos inserir tb o fkCurso
insert into Aluno values (2211999, 'Mickey', 'Disney', 102);