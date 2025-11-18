CREATE TABLE Ambulancia 
( 
 id_ambulancia INT PRIMARY KEY,  
 placa INT,  
 modelo INT,  
 ano_fabricacao INT,  
 foto INT,  
 idRastreamento INT,  
); 

CREATE TABLE TipoAmbulancia 
( 
 id_tipo INT PRIMARY KEY,  
 equipamentos_padrao INT,  
 descricao INT,  
 idAmbulancia INT,  
); 

CREATE TABLE StatusAmbulancia 
( 
 id_status INT PRIMARY KEY,  
 descricao INT,  
 idAmbulancia INT,  
); 

CREATE TABLE Rastreamento 
( 
 id_rastreio INT PRIMARY KEY,  
 longitude_atual INT,  
 id_rastreio INT,  
 id_rastreio INT,  
); 

CREATE TABLE Hospital 
( 
 telefone INT,  
 endereco INT,  
 nome INT,  
 id_hospital INT PRIMARY KEY,  
 idAtendimento INT,  
); 

CREATE TABLE Equipe 
( 
 registro_profissional INT,  
 id_equipe INT PRIMARY KEY,  
 nome INT,  
 cargo INT,  
 cpf INT,  
 idDespacho INT,  
); 

CREATE TABLE Paciente 
( 
 id_paciente INT PRIMARY KEY,  
 sexo INT,  
 nome INT,  
 cpf INT,  
 data_nascimento INT,  
 idAtendimento INT,  
); 

CREATE TABLE Administrador 
( 
 id_admin INT PRIMARY KEY,  
 senha INT,  
 login INT,  
 nome INT,  
); 

CREATE TABLE Chamado 
( 
 id_chamado INT PRIMARY KEY,  
 data_hora_abertura INT,  
 descricao_ocorrencia INT,  
 endereco_ocorrencia INT,  
 prioridade INT,  
 status_chamado INT,  
 idAdministrador INT,  
); 

CREATE TABLE Despacho 
( 
 id_despacho INT PRIMARY KEY,  
 data_hora_chegada INT,  
 data_hora_saida INT,  
 idChamado INT,  
 idAmbulancia INT,  
); 

CREATE TABLE Atendimento 
( 
 id_atendimento INT PRIMARY KEY,  
 relatorio_medico INT,  
 procedimentos_realizados INT,  
 idDespacho INT,  
); 

ALTER TABLE Ambulancia ADD FOREIGN KEY(idRastreamento) REFERENCES Rastreamento (idRastreamento)
ALTER TABLE TipoAmbulancia ADD FOREIGN KEY(idAmbulancia) REFERENCES Ambulancia (idAmbulancia)
ALTER TABLE StatusAmbulancia ADD FOREIGN KEY(idAmbulancia) REFERENCES Ambulancia (idAmbulancia)
ALTER TABLE Hospital ADD FOREIGN KEY(idAtendimento) REFERENCES Atendimento (idAtendimento)
ALTER TABLE Equipe ADD FOREIGN KEY(idDespacho) REFERENCES Despacho (idDespacho)
ALTER TABLE Paciente ADD FOREIGN KEY(idAtendimento) REFERENCES Atendimento (idAtendimento)
ALTER TABLE Chamado ADD FOREIGN KEY(idAdministrador) REFERENCES Administrador (idAdministrador)
ALTER TABLE Despacho ADD FOREIGN KEY(idChamado) REFERENCES Chamado (idChamado)
ALTER TABLE Despacho ADD FOREIGN KEY(idAmbulancia) REFERENCES Ambulancia (idAmbulancia)
ALTER TABLE Atendimento ADD FOREIGN KEY(idDespacho) REFERENCES Despacho (idDespacho)
