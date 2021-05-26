create database exemplo_funcao;
use exemplo_funcao;
-- Criar uma tabela Aluno
create table Aluno (
	ra int primary key auto_increment,
    nomeAluno varchar(45),
    telefoneFixo char(13),
    telefoneCel char(14),
    sexo char(1) check (sexo = 'm' or sexo = 'f' or sexo = 'n'),
    notaVest decimal(4,2) check (notaVest >= 0 and notaVest <= 10)
    -- o check no MySQL funciona apenas nas versões posteriores a 8.0.16
    -- o 1º digito do decimal é qtos digitos vai ter no toal, antes e dps da vírgula
    -- o 2º digito do decimal é qtos digitos vai ter após a vírgula
    -- decimal(4,2) significa que o número será no máximo 99,99
) auto_increment = 2211000;
-- Inserir dados de Aluno com valor de sexo errado - MySQL acusa erro
insert into Aluno values (null, 'Bruno Silva', '(11)5432-1234', '(11)99765-9988', 'k', 7.5);
-- Inserir dados de Aluno com valor de nota inválido - MySQL acusa erro
insert into Aluno values (null, 'Bruno Silva', '(11)5432-1234', '(11)99765-9988', 'm', 27.5);
-- Inserir dados de forma correta
insert into Aluno values (null, 'Bruno Silva', '(11)5432-1234', '(11)99765-9988', 'm', 7.5),
						(null, 'Maria Souza', '(11)5511-2233', '(11)88542-1234', 'f', 10.0),
                        (null, 'Claudia Raia', '(11)5987-0987', '(11)94367-5588', 'f', 8.0),
                        (null, 'José Teixeira', '(11)5322-1122', '(11)98731-1828', 'm', 5.75),
                        (null, 'Carlos Pereira', '(11)4678-1090', '(11)96789-9493', 'm', 6.65);
-- Exibir os dados da tabela Aluno
select * from Aluno;
-- Exibir a soma das notas do vestibular
select sum(notaVest) from Aluno;
-- Exibir a soma das notas do vestibular, mas nomeando a coluna do resultado
select sum(notaVest) as SomaNotas from Aluno;
select sum(notaVest) as Soma_Notas from Aluno;
select sum(notaVest) as 'Soma das Notas' from Aluno;
-- Exibir a média das notas de vestibular
select avg(notaVest) as 'Média das notas' from Aluno;
-- Exibir a nota máxima e a nota mínima da tabela Aluno
select max(notaVest) as 'Maior nota', min(notaVest) as 'Menor nota' from Aluno;
-- Exibir a soma e a média das notas dos alunos de sexo = 'f'
select sum(notaVest) as 'Soma das Notas', avg(notaVest) as 'Média das notas' from Aluno where sexo = 'f';
-- Exibir a maior e a menor nota dos alunos de sexo = 'm'
select max(notaVest) as 'Maior nota', min(notaVest) as 'Menor nota' from Aluno where sexo = 'm';
-- Exibir a média das notas de vestibular, mas com 2 casa decimais
-- Para limitar a quantidade de casas decimais pode-se usar a funão ROUND ou a função TRUNCATE
select round(avg(notaVest),2) as 'Média das notas' from Aluno;
select truncate(avg(notaVest),2) as 'Média das notas' from Aluno;
-- Exibir a média das notas de vestibular, mas com 1 casa decimal
-- Para limitar a quantidade de casas decimais pode-se usar a funão ROUND ou a função TRUNCATE
select round(avg(notaVest),1) as 'Média das notas' from Aluno;
select truncate(avg(notaVest),1) as 'Média das notas' from Aluno;

-- Exibir a quantidade de notas de vestibular
select count(notaVest) as 'Quantidade de notas' from Aluno;
select count(notaVest) as 'Quantidade de notas' from Aluno where notaVest > 7;