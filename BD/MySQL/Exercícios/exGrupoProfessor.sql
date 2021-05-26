create database Sprint;
use Sprint;

create table Grupo (
	idGrupo int primary key auto_increment,
    nomeGrupo varchar(45),
    descricaoProjeto varchar(50)
);

create table Aluno (
	ra int primary key,
    nomeAluno varchar(45),
    emailAluno varchar (45),
    fkGrupo int, foreign key (fkGrupo) references Grupo (idGrupo)
);

create table Professor (
	idProfessor int primary key auto_increment,
    nomeProfessor varchar(45),
    disciplinaProfessor varchar(40)
) auto_increment = 10000;

create table GrupoProfessor (
	fkGrupo int, foreign key GrupoProfessor (fkGrupo) references Grupo (idGrupo),
    fkProfessor int, foreign key (fkProfessor) references Professor (idProfessor),
    dataAvaliacao datetime,
    notaAvaliacao decimal(4,2),
    primary key (fkGrupo, fkProfessor)
);

insert into Grupo values (null, 'Lumos', 'Luminosidade das vias'),
						(null, 'Colerful Life', 'Febre de autistas');
                        
insert into Aluno values (02211014, 'Felipe Domke', 'felipe.salles3@bandtec.com.br', 1),
						(02211001, 'Nikolas Virionis', 'nikolas.virionis@bandtec.com.br', 1),
                        (02211013, 'Beatriz Vitória', 'beatriz.vitoria@bandtec.com.br', 1),
                        (02211024, 'Reyel Soares', 'reyel.soares@bandtec.com.br', 2),
                        (02211023, 'Henrique Nunes', 'henrique.nunes@bandtec.com.br', 1),
                        (02211002, 'Juan Silva', 'juan.silva@bandtec.com.br', 1),
                        (02211063, 'Rodrigo Garcez', 'rodrigo.garcez@bandtec.com.br', 1),
                        (02211011, 'Gustavo Quaresma', 'gustavo.quaresma@bandtec.com.br', 2),
                        (02211004, 'Bruno Silva', 'bruno.silva@bandtec.com.br', 2),
                        (02211009, 'Abner Nunes', 'abner.nunes@bandtec.com.br', 2),
                        (02211019, 'Bruno Zapateiro', 'bruno.zapateiro@bandtec.com.br', 2),
                        (02211008, 'Caio Hideki', 'caio.hideli@bandtec.com.br', 2);
                        
insert into Professor values (null, 'Fernando Brandão', 'Pesquisa e Inovação'),
							(null, 'Marise Miranda', 'Arquitetura de Computadores');
                            
insert into GrupoProfessor values (1, 10000, '2021-04-19 13:34:09', 8.80),
								(1, 10001, '2021-04-19 13:43:54', 9.50),
                                (2, 10000, '2021-04-22 15:50:09', 9.00),
                                (2, 10001, '2021-04-19 16:00:00', 9.00);
                                
select * from Grupo;
select * from Aluno;
select * from Professor;
select * from GrupoProfessor;
select * from Grupo inner join Aluno on idGrupo = Aluno.fkGrupo;
select * from Grupo inner join Aluno on idGrupo = Aluno.fkGrupo and nomeGrupo = 'Lumos';
select avg(notaAvaliacao) as 'Média das Notas' from GrupoProfessor;
select min(notaAvaliacao) as 'Menor nota', max(notaAvaliacao) as 'Maior nota' from GrupoProfessor;
select sum(notaAvaliacao) as 'Soma das Notas' from GrupoProfessor;
select * from Professor inner join Grupo inner join GrupoProfessor on idProfessor = fkProfessor and idGrupo = GrupoProfessor.fkGrupo;
select nomeGrupo from Grupo inner join GrupoProfessor on fkProfessor = 10000 and fkGrupo = idGrupo;
select * from Grupo inner join Aluno inner join Professor inner join GrupoProfessor on idGrupo = Aluno.fkGrupo and idGrupo = GrupoProfessor.fkGrupo and idProfessor = fkProfessor;
select count(distinct notaAvaliacao) as 'Qtd de notas distintas' from GrupoProfessor;
select fkProfessor, avg(notaAvaliacao) as 'Média das notas', sum(notaAvaliacao) as 'Soma das Notas' from GrupoProfessor group by fkProfessor; 
select GrupoProfessor.fkGrupo, avg(notaAvaliacao) as 'Média das notas', sum(notaAvaliacao) as 'Soma das Notas' from GrupoProfessor group by GrupoProfessor.fkGrupo; 
select fkProfessor, min(notaAvaliacao) as 'Menor nota', max(notaAvaliacao) as 'Maior nota' from GrupoProfessor group by fkProfessor;
select GrupoProfessor.fkGrupo, min(notaAvaliacao) as 'Menor nota', max(notaAvaliacao) as 'Maior nota' from GrupoProfessor group by GrupoProfessor.fkGrupo;