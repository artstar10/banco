-- CRIANDO TABELA DE CLIENTE
CREATE TABLE cliente(
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(100) NOT NULL, 
	email VARCHAR(70) NOT NULL UNIQUE,  
	senha VARCHAR(20) NOT NULL, 
	cpf VARCHAR(15) NOT NULL UNIQUE
);
--  CRIANDO TABELA DE DEPARTAMENTO
CREATE TABLE departamento(
	numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(30) NOT NULL, 
	descricao TEXT
);
--  CRIANDO TABELA DE ENDEREÇO
CREATE TABLE endereco(
	num_seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	tipo VARCHAR(5) NOT NULL, 
	logradouro VARCHAR(50) NOT NULL, 
	numero INTEGER, 
	complemento VARCHAR(20), 
	bairro VARCHAR(30), 
	cidade VARCHAR(50), 
	estado VARCHAR(2), 
	cep VARCHAR(10), 
	id_cliente INTEGER NOT NULL,
	CONSTRAINT endereco_cliente FOREIGN KEY
		(id_cliente) REFERENCES cliente(id)
);
--  CRIANDO TABELA DE PEDIDO
CREATE TABLE pedido(
	numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	status VARCHAR(1) NOT NULL, 
	data_pedido DATE, 
	valor_bruto DOUBLE, 
	desconto DOUBLE, 
	valor_liquido DOUBLE, 
	id_cliente INTEGER NOT NULL,
	CONSTRAINT cliente_pedido FOREIGN KEY
		(id_cliente) REFERENCES cliente(id)
);
--  CRIANDO TABELA DE PRODUTO
CREATE TABLE produto(
	codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(50) NOT NULL,
	descricao TEXT,
	preco DOUBLE, 
	estoque INTEGER, 
	link_foto VARCHAR(255), 
	numero_depto INTEGER NOT NULL, 
	CONSTRAINT produto_depto FOREIGN KEY
		(numero_depto) REFERENCES departamento(numero)
);
--  CRIANDO TABELA DE PEDIDO
CREATE TABLE item_pedido(
	seq INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	quantidade INTEGER,
	preco_unit DOUBLE,
	preco_final DOUBLE,
	codigo_produto INTEGER NOT NULL, 
	numero_pedido INTEGER NOT NULL, 
	CONSTRAINT item_produto FOREIGN KEY
		(codigo_produto) REFERENCES produto(codigo),
	CONSTRAINT item_pedido FOREIGN KEY
		(numero_pedido) REFERENCES pedido(numero)
);