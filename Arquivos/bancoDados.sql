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
	codigo VARCHAR(50),
    nome VARCHAR(100),
    cor VARCHAR(50),
    data_cadastrado DATETIME DEFAULT now(),
    status_FK INT DEFAULT 1,
    localizacao_FK INT,
    
    PRIMARY KEY (codigo),
    FOREIGN KEY (status_FK) REFERENCES Status(id),
    FOREIGN KEY (localizacao_FK) REFERENCES Localizacao(id)
);

CREATE TABLE Devolucao (
    objeto_FK VARCHAR (50),
    data_devolucao DATETIME DEFAULT now(),
    pessoa VARCHAR(255),
    observacao VARCHAR (2000),
    
	PRIMARY KEY (objeto_FK, data_devolucao),
    FOREIGN KEY (objeto_FK) REFERENCES Objeto(codigo)
);

#-----TRIGGER--------------------------------------------------------------------------------
CREATE TRIGGER `trg_senha` BEFORE INSERT ON `Usuario` FOR EACH ROW
SET NEW.senha = md5(NEW.senha);

DELIMITER $$
CREATE
    TRIGGER `trg_devolucao` BEFORE INSERT ON `Devolucao` 
    FOR EACH ROW BEGIN
       UPDATE Objeto 
       SET status_FK = (SELECT id FROM Status WHERE status = "Devolvido")
       WHERE codigo = new.objeto_FK; 
    END;
$$
DELIMITER ;

#-----STORED---------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE `login` (IN p_login varchar(50), IN p_senha varchar(50), OUT resultado varchar(50))
BEGIN
	DECLARE login_tmp VARCHAR (50);
	SET login_tmp = (SELECT login FROM Usuario WHERE p_login = login AND senha = md5(p_senha));
    IF (login_tmp IS NOT NULL) 
    THEN
        SET resultado = 'Login efetuado com sucesso!';
    ELSE
		SET resultado = 'Nome de usuário ou senha inválidos!';
    END IF;
END $$
DELIMITER ;

#-----INSERT---------------------------------------------------------------------------------
INSERT INTO Usuario (login, senha, email) VALUES ("admin", "admin", "admin@admin.com");

INSERT INTO Categoria (categoria) VALUES ("Documentos");
INSERT INTO Categoria (categoria) VALUES ("Eletrônicos");
INSERT INTO Categoria (categoria) VALUES ("Material escolar");
INSERT INTO Categoria (categoria) VALUES ("Chaves");

INSERT INTO Status (id, status) VALUES (1, "Disponível");
INSERT INTO Status (id, status) VALUES (2, "Devolvido");
INSERT INTO Status (id, status) VALUES (3, "Com avarias");
INSERT INTO Status (id, status) VALUES (4, "Para doação");

INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Vermelho", 5);
INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Vermelho", 6);
INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Azul", 2);
INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Amarelo", 1);
INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Verde", 3);
INSERT INTO Localizacao (cor_bloco, numero_bloco) VALUES ("Laranja", 4);

INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Blusa de Moletom", "Vermelho", "1234-ABC", 1);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "1043-APG", 2);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "q043-APG", 2);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "2d043-APG", 2);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "2d43-APG", 2);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "20d43-APG", 2);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "204f3-APG", 2);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "2043f-APG", 2);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "2043-dAPG", 2);
INSERT INTO Objeto (nome, cor, codigo, localizacao_FK) VALUES ("Guarda-Chuva", "Preto", "2043-AsPG", 2);

select * from objeto;

-- INSERT INTO Devolucao (pessoa, objeto_FK, usuario_FK, observacao) VALUES ("Paulo Zanese", "1234-ABC", 1, "TESTE");

#-----SELECT---------------------------------------------------------------------------------
-- SELECT * FROM Localizacao ORDER BY numero_bloco ASC;
-- select * from Usuario;

-- SELECT id FROM Localizacao L WHERE L.cor_bloco = "Vermelho" AND L.numero_bloco = 6;
-- SELECT DISTINCT cor_bloco FROM Localizacao;
-- SELECT numero_bloco FROM Localizacao WHERE cor_bloco = "Vermelho";

-- SELECT nome, cor, codigo, data_cadastrado, cor_bloco, numero_bloco FROM Objeto O 
	-- INNER JOIN Localizacao L ON O.localizacao_FK = L.id 
	-- WHERE status_FK = 1 AND nome LIKE '%BLusa%';
