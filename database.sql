USE carros;

CREATE TABLE marcas(
	id INT NOT NULL AUTO_INCREMENT,
    nome_marca VARCHAR(255) NOT NULL,
    origem VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE inventario(
	id INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(255) NOT NULL,
    transmissao VARCHAR(255) NOT NULL,
    motor VARCHAR(255) NOT NULL,
    combustivel VARCHAR(255) NOT NULL,
    marcas_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(marcas_id) REFERENCES marcas(id)

);

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE vendas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    carro_id INT NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (carro_id) REFERENCES inventario(id)
);

INSERT INTO clientes (nome, sobrenome, endereco)
VALUES 
	('Andre', ' Iacono', 'Rua 1'),
	('Mariane', 'Martins', 'Rua 2'),
	('Silvia', 'Nonato', 'Rua 3'),
	('Jose', 'Bertucci', 'Rua 4'),
    ('Maria', 'Leonel', 'Rua 5');
    
INSERT INTO marcas (nome_marca, origem)
VALUES 
	('Toyota', 'Japão'),
	('Ford', 'EUA'),
	('Volkswagen', 'Alemanha'),
    ('Hyundai', 'Coreia do Sul'),
    ('Chevrolet', 'EUA');

INSERT INTO inventario (modelo, transmissao, motor, combustivel, marcas_id)
VALUES 
	('Corolla', 'Automática', '2.0', 'Flex', '1' ),
	('Hillux', 'Manual', '2.8', 'Diesel', '1'),
	('Fiesta', 'Manual', '1.6', 'Flex', '2'),
    ('Golf', 'Automática', '1.4 TSI', 'Gasolina', '3'),
    ('HB20', 'Manual', '1.0', 'Flex', '4');
    
INSERT INTO vendas (cliente_id, carro_id, data_venda)
VALUES
(1, 1, '2024-01-10'),
(2, 3, '2024-02-15'),
(3, 5, '2024-03-05'),
(1, 2, '2024-03-20'),
(4, 4, '2024-04-02'),
(5, 1, '2024-04-18'),
(2, 2, '2024-05-10'),
(3, 3, '2024-06-12'),
(1, 5, '2024-07-01');

ALTER TABLE inventario
ADD preco DECIMAL(10,2);

UPDATE inventario SET preco = 120000 WHERE id = 1;
UPDATE inventario SET preco = 180000 WHERE id = 2;
UPDATE inventario SET preco = 65000 WHERE id = 3;
UPDATE inventario SET preco = 110000 WHERE id = 4;
UPDATE inventario SET preco = 75000 WHERE id = 5;


