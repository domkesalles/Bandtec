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
                         (02211022, 'Gabriel Sanchez', 'Scarpelli'),
                         (02211000, 'Rafael Gomes', 'Jardim São José');
                         
-- Exibir os dados dos alunos que são do bairro 'Taboão'
select * from Aluno where bairro = 'Taboão'; 

select * from Aluno;
desc Aluno;


select * from Aluno where ra between 02211040 and 02211050; -- entre valores
select * from Aluno where ra <> 02211016; -- diferente
select * from Aluno where ra != 02211041; -- diferente
select * from Aluno where ra <> 02211016 && ra <> 02211041; -- diferente de 2 valores

select * from Aluno order by nome; -- ordernar
-- order usa-se select * from Aluno + order by (campo);
select * from Aluno order by nome asc; -- order a-z
-- order por alfabética usa-se select * from Aluno + order by (campo) asc;
select * from Aluno order by nome desc; -- order z-a
-- order por alfabética usa-se select * from Aluno + order by (campo) desc;
select * from Aluno order by bairro asc; -- order a-z
select * from Aluno order by bairro desc; -- order z-a

select * from Aluno where nome like 'L%'; -- sort by letra
-- pesquisar por letras iniciais usar select normal + where (campo) like 'Letra%'
select * from Aluno where nome like 'Lucas%'; -- sort by nome
--  pesquisar por nomes iniciais usar select normal + where (campo) like 'Nome%'

select * from Aluno where ra like '%6';
--  pesquisar por nomes iniciais usar select normal + where (campo) like 'Nome%'

select * from aluno where bairro like 'j%';
select * from aluno where nome like '%s';
-- pesquisar por ultima letra do campo usando o mesmo esquema da primeira
select * from aluno where nome like '_e%'; -- segunda letra do nome = e
-- utilizar _letra% para identificar a segunda letra do (Campo)
select * from aluno where nome like '%n_'; -- penultima letra
-- utilizar _letra% para identificar a penultima letra do (Campo)

select * from aluno where bairro like '_a%';
select * from aluno where nome like '__b%';
select * from aluno where nome like '%e_'; -- penultima letra
select * from aluno where nome like '%e_%';
select * from aluno where nome like '%s' or nome like '%z'; -- terminados em s ou z
-- pesquisar por terminos em (Letra)
select * from aluno where bairro = 'Scarpelli';

select * from aluno where nome like '%l %' and nome like '%z';
-- %? % ultima letra do primeiro nome

select * from aluno where ra in (2211022, 2211054, 2211042); -- exibir alunos cujo ra = 2211022, 2211054, 3322042 
select * from aluno where ra not in (2211022, 2211054, 2211042); -- exibir alunos cujo ra != 2211022, 2211054, 3322042 
-- exibir nomes dos alunos com ra especifico usando "in"
select * from Aluno;

-- Alterar o bairro do aluno RA 2211016 para 'Vila Santa Luzia'

update Aluno set bairro ='Vila Santa Luzia' where ra = 2211016;
-- alterar um campo usando a chave primaria como código de acesso

-- prova semana q vem


update Aluno set nome ='Batman' , bairro ='Alemão' where ra = 2211016;

select * from aluno where ra= 2211016;

delete from Aluno where ra = 2211044;
select * from aluno;

-- Excluir a tabela
drop table Aluno;

-- Excluir banco de dados
drop database aluno;

--