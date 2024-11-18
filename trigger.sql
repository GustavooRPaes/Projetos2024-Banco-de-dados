create database loja;
use loja;
create table usuario(
		id int primary key auto_increment,
        nome varchar(50) not null,
        login varchar(100) not null,
        senha int not null
);

create table bkp_usuario(
	id int primary key auto_increment,
    idusuario int,
    nome varchar(50),
    login varchar(100),
    senha int not null
);

create table produto(
	id int primary key auto_increment,
    descricao varchar(150) not null,
    estoque int not null
);

create table venda(
	id int primary key auto_increment,
    fk_produto int not null,
    quantidade int not null,
    foreign key (fk_produto) references produto(id)
);

DELIMITER $
create trigger intrigante
BEFORE DELETE
ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO bkp_usuario
    VALUES (NULL, OLD.id, OLD.nome, OLD.login);
END;
$

INSERT INTO usuario values(null, 'gustavo', 'grp15@gmail.com', 1234);
select * from bkp_usuario;
select * from usuario;
DELETE FROM usuario WHERE id = 1;

DELIMITER $
create trigger vendinhas
AFTER INSERT
ON venda
FOR EACH ROW
BEGIN
	UPDATE produto SET estoque = estoque - new.quantidade 
    WHERE id = new.fk_produto;
    
END;
$

DELIMITER $
create trigger deletar_vendinhas
AFTER DELETE
ON venda
FOR EACH ROW
BEGIN
	UPDATE produto SET estoque = estoque + old.quantidade 
    WHERE id = old.fk_produto;
    
END;
$



