-- Isso é um comentário
-- Crianção do BD Aluno
create database aluno;
-- Selecionar BD Aluno
use aluno;
-- Criação de tabela Aluno
create table Aluno (
ra int primary key,
nome varchar(40),
bairro varchar(40)
);
-- Exibir a tabela Aluno
select * from Aluno;
-- * significa todas as colunas
-- no lugar do * vc pode colocar o nome das colunas
select ra from Aluno;
select nome, ra from Aluno;
-- Inserção de dados de um aluno na tabela
insert into Aluno values (02211001, 'Abner Nunes', 'Erasmo');
select * from Aluno;
insert into Aluno values (02211022, 'Gabriel Sanchez', 'Scarpelli'),(02211056, 'Renan Moreira Lima', 'Vila Rio Branco'),(02211062, 'Yan Cruz santos', 'Parque Paulistano');
select * from Aluno;
-- Exibir os dados dos alunos que são do bairro Erasmo
select * from Aluno where bairro = 'Erasmo';

