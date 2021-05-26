create database Musica;
use Musica;
 create table Musicas (
 idMusica int primary key,
 titulo varchar(40),
 artista varchar(40),
 genero varchar(40)
 );

insert into Musicas values ('1', 'Cupinúteis', 'Sanza', 'Indie');
insert into Musicas values ('2', 'Chop Suey!', 'System Of A Down', 'Metal');
insert into Musicas values ('3', 'Interlude: I´m Not Angry Anymore', 'Paramore', 'Rock');
insert into Musicas values ('4', 'Dreams Of You', 'Brennan Savage', 'Trap');
insert into Musicas values ('5', 'Extinction', 'Killstation', 'Trap');
insert into Musicas values ('6', 'Toxicity', 'System Of A Down', 'Metal');
insert into Musicas values ('7', 'Freaks', 'Surf Curse', 'Indie');
insert into Musicas values ('8', 'Vira-Lata Caramelo - Oficial', 'Sanza', 'Indie');
insert into Musicas values ('9', 'Sarcoma', 'Killstation', 'Trap');

select * from Musicas;
select titulo, artista from Musicas;
select genero, artista from Musicas;
select * from Musicas where genero = 'Metal';
select * from Musicas where artista = 'Sanza';
select titulo from Musicas where genero = 'Trap';
select titulo, genero from Musicas where artista = 'System Of A Down';
select * from Musicas where idMusica > 6 && idMusica < 9;
select * from Musicas where idMusica <= 8;
select * from Musicas where idMusica > 3;

create table Album (
 idAlbum int primary key auto_increment,
 nome varchar(40),
 gravadora varchar(40)
 ) auto_increment = 100;

 insert into Album values (null, 'Cupinúteis', 'Sanza'),
						(null, 'Toxicity', 'Columbia Records'),
                        (null, 'Paramore', 'Atlantic Records'),
                        (null, 'Tragedy', 'Brennan Savage'),
                        (null, 'Extinction', 'Killstation'),
                        (null, 'Buds', 'Big Joy Records'),
                        (null, 'Vira-Lata Caramelo', 'Sanza'),
                        (null, 'The Two of Us Are Dying', 'Killstation');
                        
alter table Musicas add fkAlbum int;
alter table Musicas add foreign key(fkAlbum) references Album(idAlbum);

update Musicas set fkAlbum = 100 where idMusica = 1;
update Musicas set fkAlbum = 101 where idMusica in (2, 6);
update Musicas set fkAlbum = 102 where idMusica = 3;
update Musicas set fkAlbum = 103 where idMusica = 4;
update Musicas set fkAlbum = 104 where idMusica = 5;
update Musicas set fkAlbum = 105 where idMusica = 7;
update Musicas set fkAlbum = 106 where idMusica = 8;
update Musicas set fkAlbum = 107 where idMusica = 9;


select * from Musicas, Album where fkAlbum = idAlbum;

select * from Musicas, Album where fkAlbum = idAlbum and nome = 'Toxicity';

select * from Musicas, Album where fkAlbum = idAlbum and gravadora = 'Killstation';

drop table musicas;
drop table album;