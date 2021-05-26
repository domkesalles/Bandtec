create database Gastos;
use Gastos;

create table Pessoa (
	idPessoa int primary key auto_increment,
    nome varchar(45),
    dataDeNascimento date,
    profissao varchar(40),
    idioma varchar(35)
);

create table Gasto (
	idGasto int primary key auto_increment,
    dataGasto date,
    valor decimal(6,2) check (valor > 0),
    descricao varchar(45),
    fkPessoa int, foreign key (fkPessoa) references Pessoa(idPessoa)
) auto_increment = 1000;

insert into Pessoa values (null, 'Ingrid', '1971/07/04', 'Gerente', 'Português'),
							(null, 'Felipe', '2003/02/08', 'Programador', 'Inglês'),
                            (null, 'Leonardo', '2004/11/21', 'Dançarino', 'Inglês'),
                            (null, 'Reyel', '2003/04/25', 'Cozinheiro', 'Português'),
                            (null, 'Fernando', '2003/07/25', 'Programador', 'Português');

insert into Gasto values (null, '2020/03/31', 30.50, 'Liquidificador', 6),
						(null, '2021/01/20', 3.50, 'Esmalte', 6),
                        (null, '2021/03/03', 5.30, 'Chocolate', 6),
                        (null, '2021/02/08', 35.00, 'Bolo', 7),
                        (null, '2021/03/08', 50.30, 'Jogo', 7),
                        (null, '2020/11/20', 24.10, 'Sapatilha', 8),
                        (null, '2020/04/16', 41.20, 'Aliança', 9),
                        (null, '2021/03/31', 50.00, 'Ifood', 9),
                        (null, '2020/12/31', 14.20, 'Cigarro', 10);
                        
select * from Pessoa;

select * from Gasto;

select * from Pessoa where profissao = 'Programador';

select * from Gasto where descricao = 'Bolo';

select * from Gasto, Pessoa where fkPessoa = idPessoa;

select * from Gasto, Pessoa where fkPessoa = idPessoa and nome = 'Ingrid';

update Gasto set descricao = 'Bolo' where idGasto = 1009;
update Gasto set descricao = 'Buquê' where idGasto = 1017;

select sum(valor) as 'Soma dos Gastos', avg(valor) as 'Média dos Gastos' from Gasto;

select max(valor) as 'Maior gasto', min(valor) as 'Menor gasto' from Gasto;

select sum(valor) as 'Soma dos Gastos', avg(valor) as 'Média dos Gastos' from Gasto where fkPessoa = '7';

select max(valor) as 'Maior gasto', min(valor) as 'Menor gasto' from Gasto where fkPessoa = '9';

delete from Gasto where idGasto = 1015;