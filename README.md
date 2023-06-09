# SQL SERVER BASICS


 ### Conceitos SQL 
<details>

 
#### Tabelas
Registros em forma de linhas e colunas.


### Chaves
Chave primária => DNA, só pode ter um 
Chave estrangeira  => Ligação entre uma tabela e outra. 
O conteúdo do campo cpf da tabela vendas deve ser o mesmo da tabela clientes.

### Schema -> grupo de tabelas dentro de um banco de dados 

Todo banco de dados criado no SQL server tem o nome padrão de dbo.

### Visão (View) 

Estrutura lógica, não existe de verdade. 
Consulta -> Resultado -> view (consulta a outras tabelas).

### Procedures e funções
Funções para manipular dados, calcular, trazer resultados. 
Função pode server de parametro para uma procedure ou para ação de dados em uma tabela

### Trigger
Comando que será executado quando uma ação for executada. 
  


## JOINs SQL SERVER
```diff 
- Precisa ser do mesmo tipo e mesmo tamanho.
```

Inner join = Interseção 

- **Left Join:** Todo mundo que está a esquerda do JOIN e aqueles em comum na tabela da direita.
- **Right Join:** Pega somente quem tem em comum na tabela esquerda e todos itens da tabela direita.
- **Full join**  (FULL OUTER JOIN): Pega todos tanto da esquerda quanto da direita.
- **Cross join**: cruza todos registros de uma tabela com a segunda tabela gerando uma combinação para cada registro.




</details>



### Downloads  
<details>
   
1. SQL Server (developer) https://www.microsoft.com/pt-br/sql-server/sql-server-downloads
2. Gerenciador: https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16



 </details>
 



### Comando de criar as tabelas para teste: 

<details> 

```sql

DROP TABLE ITENS_NOTAS_FISCAIS;
DROP TABLE NOTAS_FISCAIS;
DROP TABLE TABELA_DE_CLIENTES;
DROP TABLE TABELA_DE_PRODUTOS;
DROP TABLE TABELA_DE_VENDEDORES;

CREATE TABLE TABELA_DE_CLIENTES(
	CPF VARCHAR(11) NOT NULL,
	NOME VARCHAR(100) NULL,
	ENDERECO_1 VARCHAR(150) NULL,
	ENDERECO_2 VARCHAR(150) NULL,
	BAIRRO VARCHAR(50) NULL,
	CIDADE VARCHAR(50) NULL,
	ESTADO VARCHAR(2) NULL,
	CEP VARCHAR(8) NULL,
	DATA_DE_NASCIMENTO DATE NULL,
	IDADE INTEGER NULL,
	GENERO VARCHAR(1) NULL,
	LIMITE_DE_CREDITO FLOAT NULL,
	VOLUME_DE_COMPRA FLOAT NULL,
	PRIMEIRA_COMPRA BIT NULL);

ALTER TABLE TABELA_DE_CLIENTES ADD CONSTRAINT PK_TABELA_DE_CLIENTES PRIMARY KEY (CPF);

CREATE TABLE TABELA_DE_PRODUTOS(
	CODIGO_DO_PRODUTO VARCHAR(10) NOT NULL,
	NOME_DO_PRODUTO VARCHAR(50) NULL,
	EMBALAGEM VARCHAR(20) NULL,
	TAMANHO VARCHAR(10) NULL,
	SABOR VARCHAR(20) NULL,
	PRECO_DE_LISTA FLOAT NOT NULL);

	ALTER TABLE TABELA_DE_PRODUTOS ADD CONSTRAINT 
PK_TABELA_DE_PRODUTOS PRIMARY KEY (CODIGO_DO_PRODUTO);

CREATE TABLE TABELA_DE_VENDEDORES(
	MATRICULA VARCHAR(5) NOT NULL,
	NOME VARCHAR(100) NULL,
	PERCENTUAL_COMISSAO FLOAT NULL,
	DATA_ADMISSAO DATE NULL,
	DE_FERIAS BIT NULL,
	BAIRRO VARCHAR(50) NULL);

	ALTER TABLE TABELA_DE_VENDEDORES ADD CONSTRAINT 
PK_TABELA_DE_VENDEDORES PRIMARY KEY (MATRICULA);

 CREATE TABLE NOTAS_FISCAIS(
	CPF VARCHAR(11) NOT NULL,
	MATRICULA VARCHAR(5) NOT NULL,
	DATA_VENDA DATE NULL,
	NUMERO INTEGER NOT NULL,
	IMPOSTO FLOAT NOT NULL);

	ALTER TABLE NOTAS_FISCAIS ADD CONSTRAINT 
PK_NOTAS_FISCAIS PRIMARY KEY (NUMERO);

ALTER TABLE NOTAS_FISCAIS
ADD CONSTRAINT FK_NOTAS_FISCAIS1
   FOREIGN KEY (MATRICULA)
   REFERENCES TABELA_DE_VENDEDORES (MATRICULA);	
   
ALTER TABLE NOTAS_FISCAIS
ADD CONSTRAINT FK_NOTAS_FISCAIS2
   FOREIGN KEY (CPF)
   REFERENCES TABELA_DE_CLIENTES (CPF);	

   CREATE TABLE ITENS_NOTAS_FISCAIS(
	NUMERO INTEGER NOT NULL,
	CODIGO_DO_PRODUTO VARCHAR(10) NOT NULL,
	QUANTIDADE INTEGER NOT NULL,
	PRECO FLOAT NOT NULL);

	ALTER TABLE ITENS_NOTAS_FISCAIS ADD CONSTRAINT 
PK_ITENS_NOTAS_FISCAIS PRIMARY KEY (NUMERO, CODIGO_DO_PRODUTO);

ALTER TABLE ITENS_NOTAS_FISCAIS
ADD CONSTRAINT FK_ITENS_NOTAS_FISCAIS1
   FOREIGN KEY (CODIGO_DO_PRODUTO)
   REFERENCES TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO);

ALTER TABLE ITENS_NOTAS_FISCAIS
ADD CONSTRAINT FK_ITENS_NOTAS_FISCAIS2
   FOREIGN KEY (NUMERO)
   REFERENCES NOTAS_FISCAIS (NUMERO);	
 
``` 

 
 Criando tabela de CLIENTES e  

```sql
CREATE TABLE [TABELA DE CLIENTES]
( [CPF] [VARCHAR] (11) ,
[NOME] [VARCHAR] (100) ,
[ENDERECO 1] [VARCHAR] (150) ,
[ENDERECO 2] [VARCHAR] (150) ,
[BAIRRO] [VARCHAR] (50) ,
[CIDADE] [VARCHAR] (50) ,
[ESTADO] [VARCHAR] (2) ,
[CEP] [VARCHAR] (8) ,
[DATA DE NASCIMENTO] [DATE],
[IDADE] [SMALLINT],
[SEXO] [VARCHAR] (1) ,
[LIMITE DE CREDITO] [MONEY] ,
[VOLUME DE COMPRA] [FLOAT] ,
[PRIMEIRA COMPRA] [BIT] )
```




Inserts tabela CLIENTES, PRODUTOS E VENDEDORES 
```sql
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('1471156710', 'Erica Carvalho', 'R. Iriquitia', '', 'Jardins', 'Sao Paulo', 'SP', '80012212', '1990-09-01', 27, 'F', 170000.0000, 24500, 0);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', '', 'Agua Santa', 'Rio de Janeiro', 'RJ', '22000000', '2000-02-12', 18, 'M', 100000.0000, 20000, 1);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('2600586709', 'Cesar Teixeira', 'Rua Conde de Bonfim', '', 'Tijuca', 'Rio de Janeiro', 'RJ', '22020001', '2000-03-12', 18, 'M', 120000.0000, 22000, 0);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('3623344710', 'Marcos Nogueira', 'Av. Pastor Martin Luther King Junior', '', 'Inhauma', 'Rio de Janeiro', 'RJ', '22002012', '1995-01-13', 23, 'M', 110000.0000, 22000, 1);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('492472718', 'Eduardo Jorge', 'R. Volta Grande', '', 'Tijuca', 'Rio de Janeiro', 'RJ', '22012002', '1994-07-19', 23, 'M', 75000.0000, 9500, 1);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('50534475787', 'Abel Silva ', 'Rua Humaita', '', 'Humaita', 'Rio de Janeiro', 'RJ', '22000212', '1995-09-11', 22, 'M', 170000.0000, 26000, 0);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('5576228758', 'Petra Oliveira', 'R. Benicio de Abreu', '', 'Lapa', 'Sao Paulo', 'SP', '88192029', '1995-11-14', 22, 'F', 70000.0000, 16000, 1);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('5648641702', 'Paulo Cesar Mattos', 'Rua Helio Beltrao', '', 'Tijuca', 'Rio de Janeiro', 'RJ', '21002020', '1991-08-30', 26, 'M', 120000.0000, 22000, 0);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('5840119709', 'Gabriel Araujo', 'R. Manuel de Oliveira', '', 'Santo Amaro', 'Sao Paulo', 'SP', '80010221', '1985-03-16', 32, 'M', 140000.0000, 21000, 1);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('7771579779', 'Marcelo Mattos', 'R. Eduardo Luís Lopes', '', 'Bras', 'Sao Paulo', 'SP', '88202912', '1992-03-25', 25, 'M', 120000.0000, 20000, 1);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('8502682733', 'Valdeci da Silva', 'R. Srg. Edison de Oliveira', '', 'Jardins', 'Sao Paulo', 'SP', '82122020', '1995-10-07', 22, 'M', 110000.0000, 19000, 0);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('8719655770', 'Carlos Eduardo', 'Av. Gen. Guedes da Fontoura', '', 'Jardins', 'Sao Paulo', 'SP', '81192002', '1983-12-20', 34, 'M', 200000.0000, 24000, 0);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('9283760794', 'Edson Meilelles', 'R. Pinto de Azevedo', '', 'Cidade Nova', 'Rio de Janeiro', 'RJ', '22002002', '1995-10-07', 22, 'M', 150000.0000, 25000, 1);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('94387575700', 'Walber Lontra', 'R. Cel. Almeida', '', 'Piedade', 'Rio de Janeiro', 'RJ', '22000201', '1989-06-20', 28, 'M', 60000.0000, 12000, 1);
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) VALUES ('95939180787', 'Fabio Carvalho', 'R. dos Jacarandas da Peninsula', '', 'Barra da Tijuca', 'Rio de Janeiro', 'RJ', '22002020', '1992-01-05', 16, 'M', 90000.0000, 18000, 1);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.3090);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1002334', 'Linha Citros - 1 Litro - Lima/Limao', 'PET', '1 Litro', 'Lima/Limao', 7.0040);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1002767', 'Videira do Campo - 700 ml - Cereja/Maca', 'Garrafa', '700 ml', 'Cereja/Maca', 8.4100);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1004327', 'Videira do Campo - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.5100);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1013793', 'Videira do Campo - 2 Litros - Cereja/Maca', 'PET', '2 Litros', 'Cereja/Maca', 24.0100);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1022450', 'Festival de Sabores - 2 Litros - Acai', 'PET', '2 Litros', 'Acai', 38.0120);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1037797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.0080);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1040107', 'Light - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.5550);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1041119', 'Linha Citros - 700 ml - Lima/Limao', 'Garrafa', '700 ml', 'Lima/Limao', 4.9040);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1078680', 'Frescor do Verao - 470 ml - Manga', 'Garrafa', '470 ml', 'Manga', 5.1795);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1086543', 'Linha Refrescante - 1 Litro - Manga', 'PET', '1 Litro', 'Manga', 11.0105);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1096818', 'Linha Refrescante - 700 ml - Manga', 'Garrafa', '700 ml', 'Manga', 7.7105);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1101035', 'Linha Refrescante - 1 Litro - Morango/Limao', 'PET', '1 Litro', 'Morango/Limao', 9.0105);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('229900', 'Pedacos de Frutas - 350 ml - Maca', 'Lata', '350 ml', 'Maca', 4.2110);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('231776', 'Festival de Sabores - 700 ml - Acai', 'Garrafa', '700 ml', 'Acai', 13.3120);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('235653', 'Frescor do Verao - 350 ml - Manga', 'Lata', '350 ml', 'Manga', 3.8595);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('243083', 'Festival de Sabores - 1,5 Litros - Maracuja', 'PET', '1,5 Litros', 'Maracuja', 10.5120);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('290478', 'Videira do Campo - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.5600);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('326779', 'Linha Refrescante - 1,5 Litros - Manga', 'PET', '1,5 Litros', 'Manga', 16.5105);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('394479', 'Sabor da Montanha - 700 ml - Cereja', 'Garrafa', '700 ml', 'Cereja', 8.4090);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('479745', 'Clean - 470 ml - Laranja', 'Garrafa', '470 ml', 'Laranja', 3.7680);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('520380', 'Pedacos de Frutas - 1 Litro - Maca', 'PET', '1 Litro', 'Maca', 12.0110);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('695594', 'Festival de Sabores - 1,5 Litros - Acai', 'PET', '1,5 Litros', 'Acai', 28.5120);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('723457', 'Festival de Sabores - 700 ml - Maracuja', 'Garrafa', '700 ml', 'Maracuja', 4.9120);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('746596', 'Light - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.5050);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('773912', 'Clean - 1 Litro - Laranja', 'PET', '1 Litro', 'Laranja', 8.0080);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('783663', 'Sabor da Montanha - 700 ml - Morango', 'Garrafa', '700 ml', 'Morango', 7.7090);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('788975', 'Pedacos de Frutas - 1,5 Litros - Maca', 'PET', '1,5 Litros', 'Maca', 18.0110);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('812829', 'Clean - 350 ml - Laranja', 'Lata', '350 ml', 'Laranja', 2.8080);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('826490', 'Linha Refrescante - 700 ml - Morango/Limao', 'Garrafa', '700 ml', 'Morango/Limao', 6.3105);
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('838819', 'Clean - 1,5 Litros - Laranja', 'PET', '1,5 Litros', 'Laranja', 12.0080);
INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS, BAIRRO) VALUES ('00235', 'Marcio Almeida Silva', 0.08, '2014-08-15', 0, 'Tijuca');
INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS, BAIRRO) VALUES ('00236', 'Claudia Morais', 0.08,  '2013-09-17', 1, 'Jardins');
INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS, BAIRRO) VALUES ('00237', 'Roberta Martins', 0.11,  '2017-03-18', 1, 'Copacabana');
INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS, BAIRRO) VALUES ('00238', 'Pericles Alves', 0.11,  '2016-08-21', 0, 'Santo Amaro');

 

 ``` 
 
</details>



## Comandos básicos  
 <details>
 
 
Exemplo de select 

```sql 
SELECT * FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = '1000889'

SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE <> 18.

SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= '1999-11-14'

-- Todos os bairros cuja ordem alfabética começarem depois da palavra Lapa, vão aparecer nessa consulta.
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO >= 'Lapa' 


SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR in ('Manga','Laranja ','Melancia'); 
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE in ('Rio de Janeiro', 'Sao Paulo') AND (IDADE BETWEEN 20 AND 25)


SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO ='470 ml')  -- As duas condições respeitam o NOT


select  * from TABELA_DE_CLIENTES where NOME LIKE '%Silva%' -- todo nome que contém silva no começo, meio ou fim.
SELECT * FROM TABELA_DE_PRODUTOS WHERE (SABOR LIKE '%Morango') -- Tudo que *termina* com morango
SELECT * FROM TABELA_DE_PRODUTOS WHERE (SABOR LIKE 'Morango%') -- Tudo que *começa* com morango. 
SELECT DISTINCT SABOR from TABELA_DE_PRODUTOS -- traz os itens que tem valores diferentes 
 
-- EXIBE OS 10 primeiros do MENOR PARA O MAIOR
SELECT TOP 10 * FROM NOTAS_FISCAIS WHERE DATA_VENDA = '2017-01-01' ORDER BY MATRICULA ASC 
-- menor matriculo até a maior, maior imposto até o menor 
SELECT TOP 100 * FROM NOTAS_FISCAIS WHERE DATA_VENDA = '2017-01-01' ORDER BY MATRICULA asc, imposto desc 


 -- TRAZ TODAS AS CIDADES SEM REPETIR 
SELECT  CIDADE FROM TABELA_DE_CLIENTES GROUP BY CIDADE 
-- SOMA TOTAL DE IDADE E IDADE DAS CIDADES AGRUPADAS.
SELECT CIDADE, SUM(IDADE) AS IDADE, SUM(LIMITE_DE_CREDITO) AS CREDITO FROM TABELA_DE_CLIENTES GROUP BY CIDADE 
--  MEDIA DO TOTAL DE IDADES SOMANDO O TOTAL DE LIMITE DE CRÉDITO DAS CIDADES CADASTRADAS. 
SELECT CIDADE, AVG(IDADE) AS [MEDIA DAS IDADES], SUM(LIMITE_DE_CREDITO) AS [SOMA DOS LIMITES DE CREDITO] FROM TABELA_DE_CLIENTES GROUP BY CIDADE


-- MINIMO E MAXIMO
select EMBALAGEM, 
max(PRECO_DE_LISTA) AS [PRECO MAXIMO], 
MIN(PRECO_DE_LISTA) AS [PRECO MINIMO] 
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM



-- MINIMO E MAXIMO >= 20  
SELECT NOME_DO_PRODUTO, EMBALAGEM, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS 
GROUP BY NOME_DO_PRODUTO, EMBALAGEM, PRECO_DE_LISTA
HAVING MAX(PRECO_DE_LISTA) >= 20 


-- IF ELSE  = CASE WHEN ELSE END  -- Estrutura de decisão no select

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA, 
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA SEU MERDA PROBRE LIXO'
ELSE 'PRODUTO BARATO SEU MERDA' END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS 
WHERE SABOR = 'MANGA' ORDER BY CLASSIFICACAO

-- Exemplo mais complexo repetindo a estrutura de decisão 
SELECT (CASE WHEN PRECO_DE_LISTA >12 THEN 
'PRODUTO CARO' WHEN PRECO_DE_LISTA >= 7 AND 
PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA' 
ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO, COUNT(*) AS NUMERO_DE_PRODUTOS 
FROM TABELA_DE_PRODUTOS  GROUP BY (CASE WHEN PRECO_DE_LISTA >12 THEN 
'PRODUTO CARO' WHEN PRECO_DE_LISTA >= 7 AND 
PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA' 
ELSE 'PRODUTO BARATO' END)


-- SELECT INNER JOIN

 SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_NOTAS FROM TABELA_DE_VENDEDORES TV INNER JOIN NOTAS_FISCAIS NF ON NF.MATRICULA = TV.MATRICULA GROUP BY NF.MATRICULA, TV.NOME 



-- CRIAR UM TEXTO PARA CADA REGISTRO
SELECT 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES
 

-- UNIR DUAS CONSULTAS 
select DISTINCT BAIRRO  FROM TABELA_DE_CLIENTES
UNION 
SELECT DISTINCT BAIRRO  FROM TABELA_DE_VENDEDORES



-- UNIR DUAS CONSULTAS MOSTRANDO REGISTROS REPETIDOS
SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES 
UNION ALL 
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES

-- Seleciona uma lista de bairros únicos 
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES

-- Seleciona os clientes conforme a lista de bairros únicos 
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES)


-- select com interseção buscando conter soma de quantidade maior que um número específico  
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;


-- subquery 
-- OBS: É obrigado a usar ALIAS
SELECT MEDIA_EMBALAGENS.EMBALAGEM, MEDIA_EMBALAGENS.PRECO_MEDIO 
FROM (SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) MEDIA_EMBALAGENS 
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10


-- views - criando uma nova view
-- OBS: precisa ser o único comando do bloco de execução
create view MEDIA_EMBALAGEM AS 
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM


-- funcoes
-- FUNCAO REPLACE
-- Substitui a palavra Litros por L no resultado do select
SELECT TAMANHO, REPLACE(REPLACE(TAMANHO, 'Litros', 'L'), 'Litro', 'L') AS TAMANHO_MODIFICADO FROM TABELA_DE_PRODUTOS

-- funcoes de datas
-- Ver a data de hoje
SELECT GETDATE() DATA_HOJE, DATEPART(DAY, GETDATE()) AS DIA_DE_HOJE

-- total de dias desde o começo do ano 
select DATEDIFF(DAY, '2023-01-01', GETDATE()) AS DIAS_DESDE_INICIO_ANO
select DATEDIFF(DAY, CONCAT(DATEPART(YEAR, GETDATE()), '-01-01'), GETDATE()) AS DIAS_DESDE_INICIO_ANO



-- saber a data de 48 dias atrás 
DATEADD(DAY,-48, GETDATE()) AS DATA_48_DIAS_ATRAS

-- pega o dia atual
select DATEPART(DAY, GETDATE()) AS DIA_DE_HOJE

-- seleciona o mes atual 
select DATEPART(MONTH, GETDATE()) AS MES_HOJE

-- seleciona o ano atual 
select DATEPART(YEAR, GETDATE()) AS ANO_HOJE

 

-- funcao de conversão para poder concatenar
SELECT NOME_DO_PRODUTO, CONCAT('O preço de lista é: ', CAST(PRECO_DE_LISTA AS VARCHAR(10))) AS PRECO FROM TABELA_DE_PRODUTOS



``` 


Exemplo de alias (apelido)
```sql 

SELECT TDC.* FROM TABELA_DE_CLIENTES TDC
SELECT CPF AS IDENTIFICADOR, NOME AS [NOME DE CLIENTE], BAIRRO, CIDADE FROM TABELA_DE_CLIENTES AS TDC;
SELECT TDC.CPF, TDC.NOME, TDC. BAIRRO FROM TABELA_DE_CLIENTES TDC;

```


 Exemplo de insert

```sql
INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA])
VALUES
('1040107','Light - 350 ml - Melância', 'Lata', '350 ml', 'Melância', 4.56)

```


Exemplo de delete

```sql 

DELETE FROM [TABELA DE PRODUTOS] WHERE [SABOR] = 'Limpo'
  
```


  </details>
  
 

##  Exemplo de Join   
  <details>


```sql

CREATE TABLE TabelaA(
  Nome varchar(50) NULL
)

GO

CREATE TABLE TabelaB(
  Nome varchar(50) NULL
)

```



```sql

INSERT INTO TabelaA VALUES('Fernanda')
INSERT INTO TabelaA VALUES('Josefa')
INSERT INTO TabelaA VALUES('Luiz')
INSERT INTO TabelaA VALUES('Fernando')

INSERT INTO TabelaB VALUES('Carlos')
INSERT INTO TabelaB VALUES('Manoel')
INSERT INTO TabelaB VALUES('Luiz')
INSERT INTO TabelaB VALUES('Fernando')

```


### Inner join (interseção)
```sql

SELECT a.Nome, b.Nome
FROM TabelaA as A
INNER JOIN TabelaB as B
                on a.Nome = b.Nome

```

  </details>
