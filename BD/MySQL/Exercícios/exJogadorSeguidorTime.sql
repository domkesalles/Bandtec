create database PraticaJogador;
use PraticaJogador;

create table timeFutebol (
	idTime int primary key auto_increment,
    nomeTime varchar(45),
    tecnicoTime varchar(40),
    dataTime date
) auto_increment = 100;

create table Jogador (
	idJogador int primary key auto_increment,
    nomeJogador varchar(45),
    posicaoJogador varchar(40),
    salarioJogador decimal(10,2),
    fkConselheiro int, foreign key (fkConselheiro) references Jogador(idJogador),
    fkTime int, foreign key (fkTime) references timeFutebol(idTime)
);

create table Seguidor (
	fkJogador int, foreign key (fkJogador) references Jogador(idJogador),
    idSeguidor int,
    primary key (fkJogador, idSeguidor),
    nomeSeguidor varchar(45),
    nicknameSeguidor varchar(40),
    sexoSeguidor char(1) check (sexoSeguidor = 'm' or sexoSeguidor = 'f' or sexoSeguidor = 'n')
);

insert into TimeFutebol values (null, 'Bayern de Munique', 'Hans Flick', '1900-02-27'),
								(null, 'São Paulo', 'Hernán Crespo', '1930-01-25'),
                                (null, 'PSG', 'Maurício Pochettino', '1970-08-12'),
                                (null, 'Inter de Milão', 'Antonio Conte', '1908-03-09'),
                                (null, 'Manchester City', 'Josep Guardiola', '1880-01-01'),
                                (null, 'Milan', 'Stefano Pioli', '1899-12-16');
                                
insert into Jogador values (null, 'Manuel Neuer', 'Goleiro', 7627000.00, null, 100);
insert into Jogador values (null, 'Joshua Kimmich', 'Volante', 2160000.00, 25, 100);
insert into Jogador values  (null, 'Bruno Alves', 'Zagueiro', 3480000.00, null, 101);
insert into Jogador values  (null, 'Diego Costa', 'Zagueiro', 2000000.00, 50, 101);
insert into Jogador values	(null, 'Neymar Jr.', 'Ponta Esquerda', 36000000.00, null, 102);
insert into Jogador values	(null, 'Kyllian Mbappé', 'Ponta Direita', 17500000.00, 61, 102);
insert into Jogador values	(null, 'Leandro Paredes', 'Volante', 9000000.00, 61, 102);
insert into Jogador values	(null, 'Romelu Lukaku', 'Atacante', 7500000.00, null, 103);
insert into Jogador values	(null, 'Lautaro Martínez', 'Atacante', 2500000.00, 71, 103);
insert into Jogador values	(null, 'Kevin Bruyne', 'Meia Armador', 11315000, null, 104);
insert into Jogador values	(null, 'Phil Foden', 'Meia Armador', 624000.00, 73, 104);
insert into Jogador values	(null, 'Gianluigi Donnarumma', 'Goleiro', 10000000.00, null, 105);

insert into Seguidor values (25, 100, 'Felipe Domke', 'DomkeSalles', 'm'),
							(49, 101, 'Leonardo Domke', 'sofvckinglarry', 'm'),
                            (50, 102, 'Mateus Pina', 'mateus_pina', 'm'),
                            (50, 103, 'Leonardo Sandre', 'Leozittus', 'm'),
                            (60, 104, 'Giovanna Salles', 'itsgisalles', 'f'),
                            (61, 105, 'Victor Eduardo', 'toreduardo', 'm'),
                            (61, 106, 'Reyel Soares', 'reyelzeras', 'm'),
                            (69, 107, 'Kauã Marcelo', 'kiwiwold', 'm'),
                            (69, 108, 'Matheus Queiroz', 'gordo', 'm'),
                            (71, 109, '	Lucas Bernardes', 'berna', 'm'),
                            (73, 110, 'Ingrid Domke', 'guidomke', 'f');
                            
select * from TimeFutebol;
select * from Jogador;
select * from Seguidor;

select nomeTime, TecnicoTime from TimeFutebol where nomeTime like 'M%';

select * from Jogador order by posicaoJogador desc;

select * from Jogador where posicaoJogador = 'Atacante';

select * from TimeFutebol where tecnicoTime like '% %l_';

select * from TimeFutebol order by tecnicoTime;

select * from TimeFutebol order by dataTime;

update Jogador set posicaoJogador = 'Lateral Direito' where idJogador = 49;

select * from TimeFutebol, Jogador where idTime = fkTime;

select * from TimeFutebol, Jogador where idTime = fkTime and nomeTime = 'PSG';

select * from Jogador as Jogador, Jogador as Conselheiro where Jogador.fkConselheiro = Conselheiro.idJogador;

select * from TimeFutebol, Jogador as Jogador, Jogador as Conselheiro where Jogador.fkConselheiro = Conselheiro.idJogador and idTime = Jogador.fkTime;

select * from TimeFutebol, Jogador as Jogador, Jogador as Conselheiro where Jogador.fkConselheiro = Conselheiro.idJogador and idTime = Jogador.fkTime and Jogador.nomeJogador = 'Kyllian Mbappé';

select * from Jogador, Seguidor where idJogador = fkJogador;

select * from Jogador, Seguidor where idJogador = fkJogador and nomeJogador = 'Neymar Jr.';

select sum(salarioJogador) as 'Soma dos Salários', avg(salarioJogador) as 'Média dos Salários' from Jogador;

select min(salarioJogador) as 'Menor Salário', max(salarioJogador) as 'Maior Salário' from Jogador;

select salarioJogador from Jogador where salarioJogador < 3000000;

select sum(salarioJogador) as 'Soma dos Salários', avg(salarioJogador) as 'Média dos Salários' from Jogador where salarioJogador < 3000000;

delete from Jogador where idJogador = 70;

drop table Seguidor;
drop table Jogador;
drop table TimeFutebol;