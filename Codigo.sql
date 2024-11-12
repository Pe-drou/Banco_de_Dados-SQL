# Passo a passo: criação de um banco de dados
Tutorial de como criar um banco de dados SQL que organiza as informações de 'livros', 'editora', 'autores' e 'assuntos'.
Este guia será dividido em etapas para demonstrar desde a criação de tabelas, chaves e até manipulação/consulta de dados

## Resumo de uma estrutura SQL
* __CREATE__: para criar 'Banco de dados' ou 'Tabelas'
* __ALTER__: para adicionar ou modificar colunas
* __DROP__: para remover 'Banco de dados' ou 'Tabelas'
* __INSERT__: para adicionar registros/informações na tabela
* __UPDATE__: para atualizar os (as)registros/informações
* __DELETE__: para remover os(as) registros/informações
* __SELECT__: para consultar e visualizar dados na tabela

## PASSO 1: criação do banco de dados e das tabelas
#### 1.1 Criando o DB

```SQL
CREATE DATABASE biblioteca;

USE biblioteca;
```

#### 1.2 Criando a tabela 'editora
```SQL
CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL
);
```

#### 1.3 Criando a tabela 'autor'
```SQL
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(200) NOT NULL,
    data_nascimento DATE NOT NULL
);
```

#### 1.4 Criando a tabela 'assunto'
```SQL
CREATE TABLE assunto (
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao_assunto VARCHAR(300) NOT NULL
);
```

#### 1.5 Criando a tabela 'livro'
```SQL
CREATE TABLE livro(
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao YEAR NOT NULL,
    id_autor INT,
    id_assunto INT,
    id_editora INT,
    FOREIGN KEY(id_autor) REFERENCES autor(id_autor), 
    FOREIGN KEY(id_assunto) REFERENCES assunto(id_assunto),
    FOREIGN KEY(id_editora) REFERENCES editora(id_editora)
);
```

#### 1.6 Criando uma tabela EXTRA
A tabela EXTRA vai servir para exemplificar a exclusão

```SQL
CREATE TABLE extra(
    id INT PRIMARY KEY AUTO_INCREMENT,
    produtos VARCHAR(50) NOT NULL,
    quantidade INT(20) NOT NULL,
    preco DOUBLE NOT NULL
)
```

## Passo 2: editar tabelas usando 'ALTER'
Após a criação da tabela, podemos adicionar novos campos. Vamos adicionar uma coluna 'email' na tabela 'autor'

```SQL
ALTER TABLE autor
ADD COLUMN email VARCHAR(100);
```

## Passo 3: remover tabela usando 'DROP'
Se precisar remover uma tabela usamos o comando 'DROP'
Neste exemplo vamos remover a tabela 'EXTRA'
```SQL
DROP TABLE extra;
```

## Passo 4: inserindo dados usando 'SEARCH'
Agora que as tabelas já estão prontas, vamos inserir dados nelas

#### 4.1 inserindo dados na tabela 'editora'
```SQL
INSERT INTO editora(nome_editora, pais)
VALUES('Editora Alfa', 'Brasil'),
('Editora Beta', 'Portugal'),
('Editora Sigma', 'Rússia');
```

#### 4.2 inserindo dados na tabela 'autor'
```SQL
INSERT INTO autor(nome_autor, data_nascimento, email)
VALUES
('Jorge Amado', '1912-08-10', 'jorginho@email.com'),
('Machado de Assis','1839-06-21','machadinho@email.com'),
('Matt Haig','1975-05-03','matt@email.com');
```

#### 4.3 inserindo dados na tabela 'assunto'
```SQL
INSERT INTO assunto(descricao)
VALUES ('Ficção'),
('Romance'),
('Terror'),
('Mistério');
```

#### 4.4 inserindo dados na tabela 'livro'
```SQL
INSERT INTO livro(titulo, ano_publicacao, editora, autor, assunto)
VALUES ('Capitães Da Areia', '1937', 3, 1, 2),
('Dom Casmurro', '1899', 2, 2, 2),
('A Biblioteca da Meia-Noite', '2020', 1, 3, 4),
('Memórias Póstumas de Brás Cubas', '1881', 1, 2, 2);
```

## Passo 5: atualizando os dados utilizando 'UPDATE'
Podemos atualizar os dados com o comando UPDATE
Vamos corrigir a data de publicação do livro 'Capitães da Areia'

```SQL
UPDATE livro
SET ano_publicacao = 1938
WHERE titulo = 'Capitães da Areia';
```

## Passo 6: excluir os dados utilizando 'DELETE'
Para remover os registros de uma tabela, usamos o comando 'DELETE'
Vamos excluir o livro 'Memórias Póstumas de Brás Cubas'
```SQL
DELETE FROM livro
WHERE id_livro = 4;
```

## Passo 7: Consultando os dados usando 'SELECT'
E possível selecionar os dados para visualizar da forma como quiser
Para isso usamos o comando 'SELECT'

#### 7.1 selecionar todos os livros com suas editoras e autores
Vamos usar dados das taberlas 'livros, 'editora', 'autor', e 'assunto' usando o commando JOIN
```SQL
SELECT  livro.titulo AS nome,
        editora.nome_editora AS editora,
        autor.nome_autor AS autor,
        assunto.descricao_assunto AS assunto,
        livro.ano_publicacao AS ano
FROM livro
JOIN editora ON livro.id_editora = editora.id_editora
JOIN autor ON livro.id_autor = autor.id_autor
JOIN assunto ON livro.id_assunto = assunto.id_assunto
```

consulta com filtro 'WHERE'

```SQL
SELECT  livro.titulo AS titulo,
        assunto.descricao_assunto AS tema,
FROM livro
JOIN assunto ON livro.assunto = assunto.id_assunto
WHERE assunto.descricao_assunto = 'Romance';
```