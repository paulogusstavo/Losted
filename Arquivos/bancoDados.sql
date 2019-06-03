DROP DATABASE IF EXISTS LOSTED;
CREATE DATABASE IF NOT EXISTS LOSTED;
USE LOSTED;

CREATE TABLE Localizacao (
	id INT AUTO_INCREMENT,
    cor_bloco VARCHAR(50),
    numero_bloco INT(2),
    
	PRIMARY KEY (id)
);

CREATE TABLE Tag (
	id INT AUTO_INCREMENT,
	tag VARCHAR(50),
    
	PRIMARY KEY (id)
);

CREATE TABLE Categoria (
	id INT AUTO_INCREMENT,
	categoria VARCHAR(50),
    
	PRIMARY KEY (id)
);

CREATE TABLE Status (
	id INT AUTO_INCREMENT,
	status VARCHAR(50),
    
	PRIMARY KEY (id)
);

CREATE TABLE Usuario (
	id INT AUTO_INCREMENT,
	login VARCHAR(50) NOT NULL UNIQUE,
    senha varchar(50) NOT NULL,
    email varchar(50) UNIQUE,
    
	PRIMARY KEY (id)
);

CREATE TABLE Objeto (
	id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    cor VARCHAR(50),
    codigo VARCHAR(50),
    data_cadastrado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    encontrado bool DEFAULT FALSE,
    localizacao_FK INT,
    
    PRIMARY KEY (id),
    FOREIGN KEY (localizacao_FK) REFERENCES Localizacao(id)
);

CREATE TABLE Devolucao (
    objeto_FK INT,
    pessoa VARCHAR(255),
    
    
	PRIMARY KEY (objeto_FK),
    FOREIGN KEY (objeto_FK) REFERENCES Objeto(id)
);

#-----TRIGGER--------------------------------------------------------------------------------
create trigger trg_Senha before insert on Usuario for each row 
set new.senha = md5(new.senha);

#-----STORED---------------------------------------------------------------------------------
drop procedure if exists login;

delimiter $$
create procedure login (in p_login varchar(50), in p_senha varchar(50), out resultado varchar(50))
begin
	declare login_tmp varchar (50);

	set login_tmp = (select login from Usuario where p_login = login and senha = md5(p_senha));
    
    if (login_tmp is not null) 
    then
        set resultado = 'Login efetuado com sucesso!';
    else
		set resultado = 'Nome de usuário ou senha inválidos!';
    end if;
    
end $$
delimiter ;

#-----INSERT---------------------------------------------------------------------------------
insert into Usuario (login, senha, email) values ("admin", "admin", "admin@admin.com");

INSERT INTO Categoria (categoria) VALUES ("Documentos");
INSERT INTO Categoria (categoria) VALUES ("Eletrônicos");
INSERT INTO Categoria (categoria) VALUES ("Material escolar");
INSERT INTO Categoria (categoria) VALUES ("Chaves");

INSERT INTO Status (id, status) VALUES (1, "Disponível");
INSERT INTO Status (id, status) VALUES (2, "Devolvido");

INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Vermelho", 5);
INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Vermelho", 6);
INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Azul", 3);

INSERT INTO Objeto (id, nome, cor, codigo, localizacao_FK) VALUES (1, "Blusa", "Vermelho", "1234-ABC", 1);
#-----SELECT---------------------------------------------------------------------------------
select * from Usuario;

SELECT id FROM Localizacao L WHERE L.cor_bloco = "Vermelho" AND L.numero_bloco = 6;

SELECT nome, cor, codigo, data_cadastrado, cor_bloco, numero_bloco FROM Objeto O INNER JOIN Localizacao L ON O.localizacao_FK = L.id WHERE encontrado = false AND nome LIKE '%BLusa%';
