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

```
CREATE DATABASE biblioteca;

USE biblioteca;
```

#### 1.2 Criando a tabela 'editora
```
CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL
);
```

#### 1.3 Criando a tabela 'autor'
```
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(200) NOT NULL,
    data_nascimento DATE NOT NULL
);
```

#### 1.4 Criando a tabela 'assunto'
```
CREATE TABLE assunto (
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao_assunto VARCHAR(300) NOT NULL
);
```

#### 1.5 Criando a tabela 'livro'
```
CREATE TABLE livro(
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao YEAR NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES editora(id_editora), 
    FOREIGN KEY (id_descricao) REFERENCES descricao(id_descricao),
    FOREINGN KEY (id_editora) REFERENCES editora(id_editora)
);
```

#### 1.6 Criando uma tabela EXTRA
A tabela EXTRA vai servir para exemplificar a exclusão

```
CREATE TABLE extra(
    id INT PRIMARY KEY AUTO_INCREMENT,
    produtos VARCHAR(50) NOT NULL,
    quantidade INT(20) NOT NULL,
    preco DOUBLE NOT NULL
)
```