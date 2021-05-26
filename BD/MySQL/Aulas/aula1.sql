create database filme;
use filme;
create table Filme (
	idFilme int primary key,
    titulo varchar(50),
    genero varchar(40),
    diretor varchar(40)
);
select * from Filme;
-- Inserção dos dados de um filme da forma como foi ensinada
insert into Filme values (1, 'Pulp Fiction', 'Drama Policial', 'Quentin Tarantino');
-- Inserção dos dados de filme, mas sem informar todos os dados
insert into Filme (idFilme, titulo) values (2, 'Um Sonho de Liberdade'),
											(3, 'O Poderoso Chefão'),
                                            (4, 'O Poderoso Chefão II'),
                                            (5, 'Batman: O Cavaleiro das Trevas');
-- Inserção dos dados de um filme, informando as colunas numa ordem diferente
insert into Filme (titulo, idFilme) values ('12 Homens e uma Sentença', 6),
											('A Lista de Schindler', 7);
insert into Filme (idFilme, genero) values (8, 'Fantasia');
-- Atualizar os dados não preenchidos da tabela
-- Vamos informar o gênero e o diretor do O Poderoso Chefão I e II
update Filme set genero = 'Crime', diretor = 'Francis Ford Coppola' where idFilme in (3, 4);
select * from Filme;
update Filme set genero = 'Drama' where idFilme in (2, 6, 7);
update Filme set genero = 'Ação', diretor = 'Christopher Nolan' where idFilme = 5; 
update Filme set diretor = 'Frank Darabont' where idFilme = 2;
update Filme set diretor = 'Sidney Lumet' where idFilme = 6;
update Filme set diretor = 'Steven Spielberg' where idFilme = 7;
update Filme set titulo = 'O Senhor dos Anéis: O Retorno do Rei', diretor = 'PeterJackson' where idFilme = 8;
update Filme set titulo = 'Pulp Fiction: Tempo de Violência', genero = 'Crime' where idFilme = 1;

select * from Filme order by titulo;
select * from Filme order by diretor, titulo;
select * from Filme order by diretor, titulo desc;
select * from Filme order by diretor desc, titulo desc;
select * from filme order by genero, diretor, titulo;

-- Criação de uma nova tabela, para o uso do auto_increment
create table Pessoa (
	idPessoa int primary key auto_increment,
    nome varchar(40),
    dataNascimento date
);
select * from Pessoa;
desc Pessoa;
desc Filme;
-- Inserindo dados com auto_increment
-- Se vc não especificar quais campos estão sendo inseridos, então tem que informar null no lugar o idPessoa, para que o auto_increment gere o valor
insert into Pessoa values (null, 'Felipe Domke', '2003-02-08'),
							(null, 'Reyel Soares', '2003-04-25');


-- Inserindo dados com auto_increment, porém especificando os campos
insert into Pessoa (nome, dataNascimento) values ('Leonardo Domke', '2004-11-21'),
													('Ingrid Domke', '1974-07-04');
-- Excluindo os registros duplicados pq inserimos novamente todas as pessoas
delete from Pessoa where idPessoa in (3, 4, 7, 8);

-- Inserção de uma nova pessoa
insert into Pessoa values (null, 'Lucas Bernardes', '2002-07-30');
-- Inserção de uma pessoa propositalmente com erro
insert into Pessoa values (3, 'Luiz Salles', '1971-05-10'),
							(4, 'Giovanna Salles', '2001-02-05'),
                            (7, 'Thiago Garcia', '2002-12-07');
select * from Pessoa;
desc Pessoa;

-- Acrescentar uma coluna nova na tabela
-- Os 2 comandos abaixo são equivalentes
alter table Pessoa add sexo char(1);
alter table Pessoa add column sexo char(1);

insert into Pessoa values (null, 'Leonardo Sandre', '2002-03-08', 'M');
-- Excluir uma coluna da tabela Pessoa
alter table Pessoa drop sexo;
alter table Pessoa drop column sexo;

-- Podemos alterar o tipo de uma coluna
alter table Pessoa modify nome varchar(50);
alter table Pessoa modify column nome varchar(50);
alter table Pessoa modify dataNascimento int;

select * from Pessoa order by dataNascimento;
delete from Pessoa where idPessoa = 13;

alter table Pessoa auto_increment = 50;
insert into Pessoa values (null, 'Mateus de Pina', '2003/06/02');

-- Criação de uma nova tabela para mostrar a configuração do número incial do auto_increment
create table Produto (
	idProduto int primary key auto_increment,
    nome varchar(40),
    preco decimal(5,2)	-- preço máximo será 999,99 
    					-- decimal (5,2) - 5 siginifica que terá 5 digitos no total
						-- 				- 2 dígitos após a vírgula
	) auto_increment = 1000;
    
    -- Inserção de produtos - obs: decimal é inserido sem aspas
    insert into Produto (nome, preco) values ('Camisa SPFC 2021', 279.80),
											('Camisa SPFC 2020', 120);
	select * from Produto;
    desc Produto;
    
    insert into Produto (preco) values (900);
    delete from Produto where idProduto = 1002;
    
  -- Como renomear uma coluna que já foi criada
  -- Qualquer versão do MySQL
  alter table Produto change nome nomeProduto varchar(40);
  -- Versões superiores ao MySql 8.0
  alter table Produto rename column nomeProduto to nomeProd;
  
  alter table Produto change nomeProd nomeProduto varchar(40) default 'Indefinido';
  
  -- No SQL Server (Microsoft) não se usa auto_increment
  -- No lugar é identity(100,10)
  -- 100 é o número inicial e 10 é o incremento
  -- Exemplo: 100, 110, 120...