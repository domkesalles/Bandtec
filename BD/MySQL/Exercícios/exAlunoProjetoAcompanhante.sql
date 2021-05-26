create database Apresentacao;
use Apresentacao;

create table Projeto (
	idProjeto int primary key auto_increment,
    nomeProjeto varchar(45),
    descricaoProjeto varchar(50)
);

create table Aluno (
	ra int primary key,
    nomeAluno varchar(45),
    telefoneAluno char(14),
    fkProjeto int, foreign key (fkProjeto) references Projeto(idProjeto),
    fkRepresentante int, foreign key (fkRepresentante) references Aluno(ra)
);

create table Acompanhante (
	fkAluno int, foreign key (fkAluno) references Aluno(ra),
    idAcompanhante int,
    primary key (fkAluno, idAcompanhante),
    nomeAcompanhante varchar(45),
    tipoAcompanhante varchar(40)
);

insert into Projeto values (null, 'LUMOS', 'Mapeamento da luz'),
							(null, 'Somul', 'Gerenciador de pet shop'),
                            (null, 'MOSUL', 'Gerenciador de hospital');

insert into Aluno values (1000, 'Felipe Domke', '(11)98404-4237', 1, null),
						(1001, 'Henrique Nunes', '(11)91234-5678', 1, 1000),
                        (1002, 'Reyel Soares', '(11)95678-1234', 2, null),
                        (1003, 'Bruno Zapateiro', '(11)94231-7856', 2, 1002),
                        (1004, 'Giovanna Buttini', '(11)92341-6785', 3, 1000),
                        (1005, 'Gustavo Quaresma', '(11)1231-2233', 3, 1002);
                        
insert into Acompanhante values (1000, 100, 'Leonardo Domke', 'Irmão'),
								(1000, 101, 'Ingrid Domke', 'Mãe'),
                                (1001, 102, 'Abner Nunes', 'Amigo'),
                                (1002, 103, 'Julia Araripe', 'Namorada'),
                                (1003, 104, 'Fernando Marques', 'Amigo'),
                                (1004, 105, 'Gustavo Silva', 'Namorado'),
                                (1005, 106, 'Aline Moraes', 'Namorada');
                                
select * from Projeto;
select * from Aluno;
select * from Acompanhante;

select * from Aluno, Projeto where fkProjeto = idProjeto;
select * from Aluno, Acompanhante where ra = fkAluno;

select * from Aluno as Aluno, Aluno as Representante where Aluno.fkRepresentante = Representante.ra;

select * from Aluno, Projeto where fkProjeto = idProjeto and nomeProjeto = 'LUMOS';

select * from Aluno, Projeto, Acompanhante where fkProjeto = idProjeto and ra = fkAluno;