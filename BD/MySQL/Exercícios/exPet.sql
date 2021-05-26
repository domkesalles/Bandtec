create database Pet;
use Pet;

create table Cliente (
		idCliente int primary key auto_increment,
        nomeCliente varchar(45),
        telefoneFixo char(13),
        telefoneCelular char(14),
        logradouro varchar(45),
        bairro varchar(45),
        cep char(9),
        cidade varchar(45),
        estado char(2)
) auto_increment = 1;
create table Pet (
		idPet int primary key auto_increment,
        tipoAnimal varchar(45),
        nomeAnimal varchar(45),
        racaAnimal varchar(45),
        pesoAnimal decimal(4,2),
        fkCliente int, foreign key (fkCliente) references Cliente(idCliente)
) auto_increment = 101;

insert into Cliente values (null, 'Felipe Domke Salles', '(11)4008-8922', '(11)98404-4237', 'Rua Mercedes Salano Castineiras', 'Jardim Patente Novo', '04256-177', 'São Paulo', 'SP'),
							(null, 'Giovanna Salles de Paula', '(11)2538-9855', '(11)95386-7141', 'Rua Moisés Jorge Mussi', 'Jardim Patente Novo', '01774-256', 'São Paulo', 'SP');
insert into Pet values (null, 'Gato', 'Spock', 'Siamês', 5.00, 1),
						(null, 'Gato', 'Jake', 'Persa', 10.00, 2),
                        (null, 'Gato', 'Salém', 'Ragdoll', 7.50, 2),
                        (null, 'Cachorro', 'Romeu', 'Buldogue', 4.00, 2);

select * from Cliente;

select * from Pet;

alter table Cliente modify nomeCliente varchar(50);

select * from Pet where tipoAnimal = 'Gato';

select nomeAnimal, pesoAnimal from Pet;

select * from Pet order by nomeAnimal;

select * from Cliente order by bairro;

select * from Pet where nomeAnimal like 'S%';

select * from Cliente where nomeCliente like '% Domke %';

update Cliente set telefoneCelular = '(11)91543-1876' where idCliente = 2;

select * from Pet, Cliente where fkCliente = idCliente;

select * from Pet, Cliente where fkCliente = idCliente and nomeCliente = 'Giovanna Salles de Paula';

select sum(pesoAnimal) as 'Soma dos Pesos', avg(pesoAnimal) as 'Média dos Pesos' from Pet;

select max(pesoAnimal) as 'Maior peso', min(pesoAnimal) as 'Menor peso' from Pet;

select sum(pesoAnimal) as 'Soma dos Pesos', avg(pesoAnimal) as 'Média dos Pesos' from Pet where tipoAnimal = "Cachorro";

select max(pesoAnimal) as 'Maior peso', min(pesoAnimal) as 'Menor peso' from Pet where tipoAnimal = "Cachorro";

delete from Pet where idPet = 103;

drop table Pet;
drop table Cliente;