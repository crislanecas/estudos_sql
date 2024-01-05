-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Criando bando de dados

-- COMMAND ----------

-- Cria um banco de dados.
CREATE SCHEMA sucos;

-- COMMAND ----------

-- Cria um banco de dados, mas caso exista não será feita nenhuma ação.
CREATE DATABASE IF NOT EXISTS db_teste;

-- COMMAND ----------

-- Específica tabela ASCII, o padrão do conjuntos de caracteres e se o banco de dados será criptografado ou não.
-- create_specification:
-- [DEFAULT] CHARACTER SET [=] charset_name (utf8)
-- [DEFAULT] COLLATE [=] collation_name
-- DEFAULT ENCRYPTION [=] { 'Y' | 'N'}

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC # Apagando banco de dados

-- COMMAND ----------

-- DBTITLE 0,Apagando bando de dados
-- Apaga o banco de dados.
DROP DATABASE db_teste;

-- COMMAND ----------

-- Apaga o banco de dados, se existir.
DROP SCHEMA IF EXISTS db_teste;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Criando tabelas

-- COMMAND ----------

-- Cria uma tabela de teste.
CREATE TABLE sucos.tb_teste (
  CPF VARCHAR (11) ,
  NOME VARCHAR (100),
  ENDERECO1 VARCHAR (150),
  ENDERECO2 VARCHAR (150),
  BAIRRO VARCHAR (50),
  CIDADE VARCHAR (50),
  ESTADO VARCHAR (2),
  CEP VARCHAR (8),
  IDADE SMALLINT,
  SEXO VARCHAR (1),
  LIMITE_CREDITO FLOAT,
  VOLUME_COMPRA FLOAT,
  PRIMEIRA_COMPRA BINARY);

-- COMMAND ----------

-- Seleciona o banco de dado para uso.
USE sucos;

-- COMMAND ----------

-- Cria uma tabela com as informações de clientes.
CREATE TABLE tbclientes (
  CPF VARCHAR (11) ,
  NOME VARCHAR (100) ,
  ENDERECO1 VARCHAR (150) ,
  ENDERECO2 VARCHAR (150) ,
  BAIRRO VARCHAR (50) ,
  CIDADE VARCHAR (50) ,
  ESTADO VARCHAR (20) ,
  CEP VARCHAR (8) ,
  DATA_NASCIMENTO DATE,
  IDADE SMALLINT,
  SEXO VARCHAR (1) ,
  LIMITE_CREDITO FLOAT ,
  VOLUME_COMPRA FLOAT ,
  PRIMEIRA_COMPRA BINARY);

-- COMMAND ----------

-- Cria uma tabela com as informações de produtos.
CREATE TABLE tbprodutos (
  PRODUTO VARCHAR (20),
  NOME VARCHAR (150),
  EMBALAGEM VARCHAR (50),
  TAMANHO VARCHAR (50),
  SABOR VARCHAR (50),
  PRECO_LISTA FLOAT)

-- COMMAND ----------

-- Cria uma tabela com as informações de vendedores.
CREATE TABLE tbvendedores (
  MATRICULA VARCHAR(5),
  NOME VARCHAR(100),
  PERCENTUAL_COMISSAO FLOAT,
  DATA_ADMISSAO DATE,
  DE_FERIAS BINARY);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Adicionando coluna

-- COMMAND ----------

-- Adiciona uma nova coluna a tabela de teste.
ALTER TABLE tb_teste ADD COLUMN (DATA_NASCIMENTO DATE);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Apagando tabelas

-- COMMAND ----------

-- Apaga a tabela.
DROP TABLE sucos.tb_teste;

-- COMMAND ----------

-- Apaga a tabela, se existir.
DROP TABLE IF EXISTS tb_teste;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Definindo chave primária para tabela

-- COMMAND ----------

-- Define a coluna CPF como chave primária.
ALTER TABLE tbclientes ADD PRIMARY KEY (CPF);

-- COMMAND ----------

-- Define a coluna PRODUTO como chave primária.
ALTER TABLE tbprodutos ADD PRIMARY KEY (PRODUTO);

-- COMMAND ----------

-- Define a coluna MATRICULA como chave primária.
ALTER TABLE tbvendedores ADD PRIMARY KEY (MATRICULA);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Inserindo registros na tabela

-- COMMAND ----------

-- MAGIC %python
-- MAGIC from pyspark.sql import SparkSession
-- MAGIC
-- MAGIC spark = SparkSession.builder.appName("exemplo").config("spark.sql.storeAssignmentPolicy", "LEGACY").getOrCreate()

-- COMMAND ----------

-- Insere registro na tabela de clientes.
INSERT INTO tbclientes (
  CPF,
  NOME,
  ENDERECO1,
  ENDERECO2,
  BAIRRO,
  CIDADE,
  ESTADO,
  CEP,
  IDADE,
  SEXO,
  LIMITE_CREDITO,
  VOLUME_COMPRA,
  PRIMEIRA_COMPRA,
  DATA_NASCIMENTO) VALUES ('00388934505', 'João da Silva', 'Rua projetada A número 10', '', 'VILA ROMAN', 'CARATINGA', 'AMAZONAS', '2222222', 30, 'M', 10000.00, 2000, 0, '1989-10-05');

-- COMMAND ----------

-- Insere registro na tabela de produtos.
INSERT INTO tbprodutos (
  PRODUTO,
  NOME,
  EMBALAGEM,
  TAMANHO,
  SABOR,
  PRECO_LISTA) VALUES ('544931', 'Frescor do Verão - 350 ml - Limão', 'PET', '350 ml', 'Limão', 3.20);

INSERT INTO tbprodutos (
  PRODUTO,
  NOME,
  EMBALAGEM,
  TAMANHO,
  SABOR,
  PRECO_LISTA) VALUES ('1078680', 'Frescor do Verão - 470 ml - Manga', 'Lata', '470 ml','Manga',5.18);

-- COMMAND ----------

-- Insere registro na tabela de vendedores.
INSERT INTO tbvendedores (
  MATRICULA,
  NOME,
  PERCENTUAL_COMISSAO) VALUES ('00233', 'João Geraldo da Fonseca', 0.10);

INSERT INTO tbvendedores (
  MATRICULA,
  NOME,
  PERCENTUAL_COMISSAO) VALUES ('00235','Márcio Almeida Silva',0.08);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Atualizando registros

-- COMMAND ----------

-- Atualiza os dados da tabela de produtos, conforme novos valores específicados.
UPDATE tbprodutos SET EMBALAGEM = 'Lata', PRECO_LISTA = 2.46
WHERE PRODUTO = '544931';

UPDATE tbprodutos SET EMBALAGEM = 'Garrafa'
WHERE PRODUTO = '1078680';

UPDATE tbprodutos SET SABOR = 'Cítricos' 
WHERE SABOR = 'Limão';

-- Seleciona a tabela de produtos e exibe todas as colunas e resgistos.
SELECT * FROM tbprodutos;

-- COMMAND ----------

-- Atualiza os dados da tabela de vendedores, conforme novos valores específicados.
UPDATE tbvendedores SET PERCENTUAL_COMISSAO = 0.11
WHERE MATRICULA = '00236';

UPDATE tbvendedores SET NOME = 'José Geraldo da Fonseca Junior'
WHERE MATRICULA = '00233';

-- Seleciona a tabela de vendedores e exibe todas as colunas e resgistos.
SELECT * FROM tbvendedores;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Apagando registros

-- COMMAND ----------

-- Apaga o resgistro na tabela de produtos, conforme específicado.
DELETE FROM tbprodutos WHERE PRODUTO = '1078680';

-- Seleciona a tabela de produtos e exibe todas as colunas e resgistos.
SELECT * FROM tbprodutos;

-- COMMAND ----------

-- Apaga o resgistro na tabela vendedores, conforme específicado.
DELETE FROM tbvendedores WHERE MATRICULA = '00233';

-- Seleciona a tabela de vendedores e exibe todas as colunas e resgistos.
SELECT * FROM tbvendedores;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Inserindo vários registros

-- COMMAND ----------

-- Insere vários resgistros de clientes na tabela de clientes.
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','','Água Santa','Rio de Janeiro','RJ','22000000','2000-02-12',18,'M',100000,200000,1);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('2600586709','César Teixeira','Rua Conde de Bonfim','','Tijuca','Rio de Janeiro','RJ','22020001','2000-03-12',18,'M',120000,220000,0);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('95939180787','Fábio Carvalho','R. dos Jacarandás da Península','','Barra da Tijuca','Rio de Janeiro','RJ','22002020','1992-01-05',16,'M',90000,180000,1);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('9283760794','Edson Meilelles','R. Pinto de Azevedo','','Cidade Nova','Rio de Janeiro','RJ','22002002','1995-10-07',22,'M',150000,250000,1);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('7771579779','Marcelo Mattos','R. Eduardo Luís Lopes','','Brás','São Paulo','SP','88202912','1992-03-25',25,'M',120000,200000,1);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('5576228758','Petra Oliveira','R. Benício de Abreu','','Lapa','São Paulo','SP','88192029','1995-11-14',22,'F',70000,160000,1);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('8502682733','Valdeci da Silva','R. Srg. Édison de Oliveira','','Jardins','São Paulo','SP','82122020','1995-10-07',22,'M',110000,190000,0);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('1471156710','Érica Carvalho','R. Iriquitia','','Jardins','São Paulo','SP','80012212','1990-09-01',27,'F',170000,245000,0);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('3623344710','Marcos Nougeuira','Av. Pastor Martin Luther King Junior','','Inhauma','Rio de Janeiro','RJ','22002012','1995-01-13',23,'M',110000,220000,1);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('50534475787','Abel Silva ','Rua Humaitá','','Humaitá','Rio de Janeiro','RJ','22000212','1995-09-11',22,'M',170000,260000,0);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('5840119709','Gabriel Araujo','R. Manuel de Oliveira','','Santo Amaro','São Paulo','SP','80010221','1985-03-16',32,'M',140000,210000,1);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('94387575700','Walber Lontra','R. Cel. Almeida','','Piedade','Rio de Janeiro','RJ','22000201','1989-06-20',28,'M',60000,120000,1);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('8719655770','Carlos Eduardo','Av. Gen. Guedes da Fontoura','','Jardins','São Paulo','SP','81192002','1983-12-20',34,'M',200000,240000,0);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('5648641702','Paulo César Mattos','Rua Hélio Beltrão','','Tijuca','Rio de Janeiro','RJ','21002020','1991-08-30',26,'M',120000,220000,0);
INSERT INTO tbclientes (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('492472718','Eduardo Jorge','R. Volta Grande','','Tijuca','Rio de Janeiro','RJ','22012002','1994-07-19',23,'M',75000,95000,1);

-- COMMAND ----------

-- Insere vários resgistros de produtos na tabela de produtos.
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1040107','Light - 350 ml - Melância','Lata','350 ml','Melância',4.555);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1037797','Clean - 2 Litros - Laranja','PET','2 Litros','Laranja',16.008);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1000889','Sabor da Montanha - 700 ml - Uva','Garrafa','700 ml','Uva',6.309);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1004327','Videira do Campo - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.51);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1088126','Linha Citros - 1 Litro - Limão','PET','1 Litro','Limão',7.004);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('544931','Frescor do Verão - 350 ml - Limão','Lata','350 ml','Limão',2.4595);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1078680','Frescor do Verão - 470 ml - Manga','Garrafa','470 ml','Manga',5.1795);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1042712','Linha Citros - 700 ml - Limão','Garrafa','700 ml','Limão',4.904);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('788975','Pedaços de Frutas - 1,5 Litros - Maça','PET','1,5 Litros','Maça',18.011);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1002767','Videira do Campo - 700 ml - Cereja/Maça','Garrafa','700 ml','Cereja/Maça',8.41);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('231776','Festival de Sabores - 700 ml - Açai','Garrafa','700 ml','Açai',13.312);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('479745','Clean - 470 ml - Laranja','Garrafa','470 ml','Laranja',3.768);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1051518','Frescor do Verão - 470 ml - Limão','Garrafa','470 ml','Limão',3.2995);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1101035','Linha Refrescante - 1 Litro - Morango/Limão','PET','1 Litro','Morango/Limão',9.0105);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('229900','Pedaços de Frutas - 350 ml - Maça','Lata','350 ml','Maça',4.211);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1086543','Linha Refrescante - 1 Litro - Manga','PET','1 Litro','Manga',11.0105);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('695594','Festival de Sabores - 1,5 Litros - Açai','PET','1,5 Litros','Açai',28.512);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('838819','Clean - 1,5 Litros - Laranja','PET','1,5 Litros','Laranja',12.008);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('326779','Linha Refrescante - 1,5 Litros - Manga','PET','1,5 Litros','Manga',16.5105);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('520380','Pedaços de Frutas - 1 Litro - Maça','PET','1 Litro','Maça',12.011);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1041119','Linha Citros - 700 ml - Lima/Limão','Garrafa','700 ml','Lima/Limão',4.904);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('243083','Festival de Sabores - 1,5 Litros - Maracujá','PET','1,5 Litros','Maracujá',10.512);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('394479','Sabor da Montanha - 700 ml - Cereja','Garrafa','700 ml','Cereja',8.409);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('746596','Light - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.505);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('773912','Clean - 1 Litro - Laranja','PET','1 Litro','Laranja',8.008);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('826490','Linha Refrescante - 700 ml - Morango/Limão','Garrafa','700 ml','Morango/Limão',6.3105);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('723457','Festival de Sabores - 700 ml - Maracujá','Garrafa','700 ml','Maracujá',4.912);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('812829','Clean - 350 ml - Laranja','Lata','350 ml','Laranja',2.808);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('290478','Videira do Campo - 350 ml - Melância','Lata','350 ml','Melância',4.56);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('783663','Sabor da Montanha - 700 ml - Morango','Garrafa','700 ml','Morango',7.709);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('235653','Frescor do Verão - 350 ml - Manga','Lata','350 ml','Manga',3.8595);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1002334','Linha Citros - 1 Litro - Lima/Limão','PET','1 Litro','Lima/Limão',7.004);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1013793','Videira do Campo - 2 Litros - Cereja/Maça','PET','2 Litros','Cereja/Maça',24.01);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1096818','Linha Refrescante - 700 ml - Manga','Garrafa','700 ml','Manga',7.7105);
INSERT INTO tbprodutos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES ('1022450','Festival de Sabores - 2 Litros - Açai','PET','2 Litros','Açai',38.012);

-- COMMAND ----------

-- Insere vários resgistros de vendedores na tabela vendedores.
INSERT INTO tbvendedores (MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO, DE_FERIAS)
VALUES ('00236','Cláudia Morais','2013-09-17',0.08,1);
INSERT INTO tbvendedores (MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO, DE_FERIAS)
VALUES ('00237','Roberta Martins','2017-03-18',0.11,1);
INSERT INTO tbvendedores (MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO, DE_FERIAS)
VALUES ('00238','Pericles Alves','2016-08-21',0.11,0);

-- Seleciona a tabela de teste e exibe todas as colunas e resgistos.
SELECT * FROM tbvendedores;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Fazendo consultas 

-- COMMAND ----------

-- Seleciona a tabela de clientes e exibe todas as colunas e resgistos.
SELECT * FROM tbclientes;

-- COMMAND ----------

-- Seleciona a tabela de clientes e exibe apenas as colunas específicadas.
SELECT CPF, NOME FROM tbclientes;

-- COMMAND ----------

-- Seleciona a tabela de clientes e exibe apenas as colunas específicadas, limitadas aos 5 primeiros registros.
SELECT CPF, NOME FROM tbclientes LIMIT 5;

-- COMMAND ----------

-- Seleciona a tabela de clientes e renomeia as colunas CPF e NOME na exibição.
SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbclientes;

-- COMMAND ----------

-- Seleciona a tabela de clientes apenas as colunas específicadas.
SELECT NOME, CPF, SEXO, IDADE, DATA_NASCIMENTO FROM tbclientes;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Filtrando registros

-- COMMAND ----------

-- Seleciona a tabela de produtos apenas o PRODUTOI que é igual ao específicado.
SELECT * FROM tbprodutos WHERE PRODUTO = '544931';

-- COMMAND ----------

-- Seleciona a tabela de clientes apenas os clientes que a CIDADE é igual a específicada.
SELECT * FROM tbclientes WHERE CIDADE = 'Rio de Janeiro';

-- COMMAND ----------

-- Seleciona a tabela de produtos apenas os produtos que tem SABOR igual ao específicado.
SELECT * FROM tbprodutos WHERE SABOR = 'Cítricos';

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Filtrando registros usando maior, menor e diferente

-- COMMAND ----------

SELECT * FROM tbclientes WHERE IDADE = 22;

-- COMMAND ----------

SELECT * FROM tbclientes WHERE IDADE > 22;

-- COMMAND ----------

SELECT * FROM tbclientes WHERE IDADE < 22;

-- COMMAND ----------

SELECT * FROM tbclientes WHERE IDADE <= 22;

-- COMMAND ----------

SELECT * FROM tbclientes WHERE IDADE <> 22;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Filtrando palavras

-- COMMAND ----------

SELECT * FROM tbclientes WHERE NOME >= 'Fernando Cavalcante';

-- COMMAND ----------

SELECT * FROM tbclientes WHERE NOME >= 'Fernando Cavalcante';

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Filtrando preços

-- COMMAND ----------

SELECT * FROM tbprodutos WHERE PRECO_LISTA > 16.008;

-- COMMAND ----------

SELECT * FROM tbprodutos WHERE PRECO_LISTA < 16.008;

-- COMMAND ----------

-- Para valores FLOAT não é possível filtrar valores exatos utilizando condições com =, <=, >= e <>.
-- Sendo possível nesses casos utilizar o BETWEEN, conforme abaixo.
SELECT * FROM tbprodutos WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Filtrando datas

-- COMMAND ----------

SELECT * FROM tbclientes WHERE DATA_NASCIMENTO = '1995-01-13';

-- COMMAND ----------

SELECT * FROM tbclientes WHERE DATA_NASCIMENTO > '1995-01-13';

-- COMMAND ----------

SELECT * FROM tbclientes WHERE DATA_NASCIMENTO <= '1995-01-13';

-- COMMAND ----------

SELECT * FROM tbclientes WHERE YEAR(DATA_NASCIMENTO) = 1995;

-- COMMAND ----------

SELECT * FROM tbclientes WHERE MONTH(DATA_NASCIMENTO) = 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Filtros compostos

-- COMMAND ----------

SELECT * FROM tbprodutos WHERE PRECO_LISTA >= 16.007 AND PRECO_LISTA <= 16.009;

-- COMMAND ----------

SELECT * FROM tbclientes WHERE IDADE >= 18 AND IDADE <= 22;

-- COMMAND ----------

SELECT * FROM tbclientes WHERE IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M';

-- COMMAND ----------

SELECT * FROM tbclientes WHERE cidade = 'Rio de Janeiro' OR BAIRRO = 'Jardins';

-- COMMAND ----------

SELECT * FROM tbclientes WHERE (IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M') OR (cidade = 'Rio de Janeiro' OR BAIRRO = 'Jardins');
