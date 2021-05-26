create database exemplo_transaction;
use exemplo_transaction;

create table Aluno (
	ra int primary key auto_increment,
    nomeAluno varchar(40),
    bairro varchar(40)
);

insert into Aluno values (null, 'Maria Oliveira', 'Tatuapé'),
						(null, 'Beatriz Barbosa', 'Saúde'),
                        (null, 'João Teixeira', 'Paraíso');
				
select * from Aluno;

start transaction;
delete from Aluno where ra = 2;
select * from Aluno;
update Aluno set bairro = 'Mooca' where ra = 1;
rollback;

start transaction;
delete from Aluno where ra = 2;
select * from Aluno;
update Aluno set bairro = 'Mooca' where ra = 1;
commit;