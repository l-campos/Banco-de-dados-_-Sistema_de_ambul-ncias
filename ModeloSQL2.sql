-- Criação do Banco de Dados
CREATE DATABASE db_ambulancia;
USE db_ambulancia;

-- 1. Tabelas Independentes (Sem Chaves Estrangeiras)

CREATE TABLE TipoAmbulancia (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    equipamentos_padrao TEXT
);

CREATE TABLE StatusAmbulancia (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL -- Ex: Disponível, Manutenção
);

CREATE TABLE Hospital (
    id_hospital INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(10, 8)
);

CREATE TABLE Equipe (
    id_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    cargo VARCHAR(50), -- Ex: Médico, Motorista
    registro_profissional VARCHAR(50) -- CRM, COREN
);

CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    data_nascimento DATE,
    sexo CHAR(1)
);

CREATE TABLE Administrador (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- 2. Tabelas com Dependências (Chaves Estrangeiras)

CREATE TABLE Ambulancia (
    id_ambulancia INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    ano_fabricacao INT,
    foto LONGBLOB, -- Requisito de dado binário
    id_tipo INT,
    id_status INT,
    FOREIGN KEY (id_tipo) REFERENCES TipoAmbulancia(id_tipo),
    FOREIGN KEY (id_status) REFERENCES StatusAmbulancia(id_status)
);

CREATE TABLE Rastreamento (
    id_rastreio INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    latitude_atual DECIMAL(10, 8),
    longitude_atual DECIMAL(10, 8),
    id_ambulancia INT NOT NULL,
    FOREIGN KEY (id_ambulancia) REFERENCES Ambulancia(id_ambulancia)
);

CREATE TABLE Chamado (
    id_chamado INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    descricao_ocorrencia TEXT,
    latitude_ocorrencia DECIMAL(10, 8),
    longitude_ocorrencia DECIMAL(10, 8),
    prioridade VARCHAR(20), -- Alta, Média, Baixa
    status_chamado VARCHAR(20), -- Aberto, Fechado
    id_admin INT,
    FOREIGN KEY (id_admin) REFERENCES Administrador(id_admin)
);

-- 3. Tabelas de Processo (Conectam tudo)

CREATE TABLE Despacho (
    id_despacho INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_saida DATETIME,
    data_hora_chegada DATETIME,
    id_chamado INT NOT NULL,
    id_ambulancia INT NOT NULL,
    id_equipe INT NOT NULL,
    FOREIGN KEY (id_chamado) REFERENCES Chamado(id_chamado),
    FOREIGN KEY (id_ambulancia) REFERENCES Ambulancia(id_ambulancia),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE Atendimento (
    id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    relatorio_medico TEXT,
    procedimentos_realizados TEXT,
    id_despacho INT NOT NULL,
    id_paciente INT NOT NULL,
    id_hospital_destino INT NOT NULL,
    FOREIGN KEY (id_despacho) REFERENCES Despacho(id_despacho),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_hospital_destino) REFERENCES Hospital(id_hospital)
);
