USE projetosaude;

CREATE TABLE usuarios (
    idpessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(15) NOT NULL,
    qualusuario ENUM("Paciente", "profissional") NOT NULL,
    telefone VARCHAR(15),
    datanasc DATE,
    diacadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nome, cpf, email, senha, qualusuario, telefone, datanasc, diacadastro)
VALUES 
("hiago", "19273728894", "hiagguinha@gmail.com", "15645864", "profissional", "81991866428", "2008-08-07", default);

SELECT * FROM usuarios;