create database bd_escola;
use bd_escola;

create table aluno(
id_aluno int primary key not null auto_increment,
nome varchar(30) not null,
telefone varchar(15),
email varchar(30)
);

create table professor(
id_professor int primary key auto_increment,
nome varchar(30) not null,
telefone varchar(15),
email varchar(30)
);

create table aula(
id_aula int primary key auto_increment,
fk_aluno int,
fk_professor int,
componente varchar(45),
foreign key(fk_aluno) references aluno(id_aluno),
foreign key(fk_professor) references professor(id_professor)
);

insert into aluno values(null, 'Julio da Silva', '33343552', 'julinho@etec.sp.gov.br');

insert into professor values(null, 'Gabriel Anoe', '262535363', 'bielanoe@etec.sp.gov.br');

insert into aula values(null, 1, 1, 'Banco de Dados 50');

select aluno.nome as 'Aluno', professor.nome as 'Professor', aula.componente as 'Componente' from aula 
inner join aluno on aula.fk_aluno = aluno.id_aluno
inner join professor on aula.fk_professor = professor.id_professor;