create database ac2felipe;
use ac2felipe;

create table Editora (
	idEditora int primary key auto_increment,
	nomeEditora varchar(45),
    dataFund date,
    rua varchar(45),
    numero char(6),
    cidade varchar(40),
    estado char(2),
    pais varchar(35)
);

create table Heroi (
	idHeroi int primary key auto_increment,
    nomeReal varchar(45),
    codinome1 varchar(40),
    codinome2 varchar(40),
    localNascimento varchar(45),
    especie varchar(35),
    afiliacao varchar(30),
    altura int,
    peso int,
    genero char(1) check (genero = 'm' or genero = 'f' or genero = 'n'),
    fkEditora int, foreign key (fkEditora) references Editora(idEditora),
    fkMentor int, foreign key (fkMentor) references Heroi(idHeroi)
) auto_increment = 100;

insert into Editora values (null, 'Marvel Comics', '1939-12-04', '50th Street', '135', 'Nova York', 'NY', 'Estados Unidos'),
							(null, 'DC Comics', '1934-02-18', '25th Street', '209', 'Burbank', 'CA', 'Estados Unidos');
                      
insert into Heroi values (null, 'Anthony Stark', 'Homem de Ferro', 'Mestre das Máquinas', 'Long Island', 'Humano', 'Vingadores', 185, 102, 'm', 1, null),
						(null, 'Peter Parker', 'Homem-Aranha', 'Cabeça de Teia', 'Queens', 'Mutante', 'Vingadores', 183, 78, 'm', 1, 100),
                        (null, 'Bruce Wayne', 'Batman', 'O Cavaleiro das Trevas', 'Gotham', 'Humano', 'Liga da Justiça', 188, 95, 'm', 2, null),
                        (null, 'Barbara Gordon', 'Batgirl', 'Oráculo', 'Gotham', 'Humano', 'Liga da Justiça', 180, 61, 'f', 2, 102),
                        (null, 'Dick Grayson', 'Asa Noturna', 'Robin', 'Gotham', 'Humano', 'Jovens Titãs', 183, 82, 'm', 2, 102),
                        (null, 'Clark Kent', 'Superman', 'O Homem de Aço', 'Krypton', 'Kryptoniano', 'Liga da Justiça', 190, 107, 'm', 2, null);
                        
select * from Editora;

select * from Heroi;

select * from Editora, Heroi where idEditora = fkEditora;

select * from Editora, Heroi where idEditora = fkEditora and nomeEditora = 'Marvel Comics';

select avg(altura) as 'Média das Alturas' from Heroi;

select * from Heroi as Heroi, Heroi as Mentor where Heroi.fkMentor = Mentor.idHeroi;

select * from Heroi as Heroi, Heroi as Mentor where Heroi.fkMentor = Mentor.idHeroi and Mentor.nomeReal = 'Bruce Wayne';

select * from Editora, Heroi as Heroi, Heroi as Mentor where Heroi.fkMentor = Mentor.idHeroi and idEditora = Heroi.fkEditora;

select * from Editora, Heroi as Heroi, Heroi as Mentor where Heroi.fkMentor = Mentor.idHeroi and idEditora = Heroi.fkEditora and Mentor.nomeReal = 'Anthony Stark';