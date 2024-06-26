CREATE TABLE Antena_Comunic (
  Antena_Comunic SERIAL NOT NULL,
  Complexo_Comunicacao SERIAL NOT NULL,
  idAntena_Comunic INTEGER NOT NULL,
  Complexo_Comunicacao_Org_Pub_Civil SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Antena_Comunic)
);

CREATE INDEX antena_comunic_fkindex1 ON Antena_Comunic (Complexo_Comunicacao_Org_Pub_Civil, Complexo_Comunicacao);

CREATE TABLE Area_Comunicacao (
  Area_Comunicacao SERIAL NOT NULL,
  idArea_Comunicacao POLYGON NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Area_Comunicacao)
);

CREATE TABLE Area_Energia_Eletrica (
  Area_Energia_Eletrica SERIAL NOT NULL,
  Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil SERIAL NOT NULL,
  idArea_Energia_Eletrica POLYGON NOT NULL ,
  Complexo_Gerador_Energia_Eletrica SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Area_Energia_Eletrica)
);

CREATE INDEX area_energia_eletrica_fkindex1 ON Area_Energia_Eletrica (Complexo_Gerador_Energia_Eletrica, Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil);

CREATE TABLE Barragem (
  Barragem SERIAL NOT NULL,
  Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil SERIAL NOT NULL,
  Complexo_Gerador_Energia_Eletrica SERIAL NOT NULL,
    idBarragem MULTIPOINT NOT NULL,

  Desc_2 TEXT NULL,
  PRIMARY KEY(Barragem),
  INDEX Barragem_FKIndex1(Complexo_Gerador_Energia_Eletrica, Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil)
);

CREATE INDEX barragem_fkindex1 ON Barragem (Complexo_Gerador_Energia_Eletrica, Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil);

CREATE TABLE Complexo_Comunicacao (
  Org_Pub_Civil SERIAL NOT NULL,
  Complexo_Comunicacao SERIAL NOT NULL,
  Area_Comunicacao SERIAL NOT NULL,
  idComplexo_Comunicacao MULTIPOLYGON NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Org_Pub_Civil, Complexo_Comunicacao)
);

CREATE INDEX Complexo_Comunicacao_FKIndex1 ON Complexo_Comunicacao (Area_Comunicacao);
CREATE INDEX Complexo_Comunicacao_FKIndex2 ON Complexo_Comunicacao (Org_Pub_Civil);

CREATE TABLE Complexo_Gerador_Energia_Eletrica (
  Complexo_Gerador_Energia_Eletrica SERIAL NOT NULL,
  Org_Pub_Civil SERIAL NOT NULL,
  Subest_Transm_Distrib_Energia_Eletrica SERIAL NOT NULL,
  Subest_Transm_Distrib_Energia_Eletrica_Ponto_Trecho_Energia SERIAL NOT NULL,
  Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia SERIAL NOT NULL,
  Edif_Energia SERIAL NOT NULL,
  Est_Gerad_Energia_Eletrica SERIAL NOT NULL,
  idComplexo_Gerador_Energia_Eletrica MULTIPOLYGON NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Complexo_Gerador_Energia_Eletrica, Org_Pub_Civil)
);

CREATE INDEX Complexo_Gerador_Energia_Eletrica_FKIndex1 ON Complexo_Gerador_Energia_Eletrica (Org_Pub_Civil);
CREATE INDEX Complexo_Gerador_Energia_Eletrica_FKIndex2 ON Complexo_Gerador_Energia_Eletrica (Est_Gerad_Energia_Eletrica, Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia);
CREATE INDEX Complexo_Gerador_Energia_Eletrica_FKIndex3 ON Complexo_Gerador_Energia_Eletrica (Edif_Energia);
CREATE INDEX Complexo_Gerador_Energia_Eletrica_FKIndex4 ON Complexo_Gerador_Energia_Eletrica (Subest_Transm_Distrib_Energia_Eletrica_Ponto_Trecho_Energia, Subest_Transm_Distrib_Energia_Eletrica);

CREATE TABLE Condutor_Hidrico (
  Condutor_Hidrico SERIAL NOT NULL,
  Hidreletrica_Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia SERIAL NOT NULL,
  Termeletrica_Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia SERIAL NOT NULL,
  Hidreletrica_Hidreletrica SERIAL NOT NULL,
  Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil SERIAL NOT NULL,
  Hidreletrica_Est_Gerad_Energia_Eletrica SERIAL NOT NULL,
  Termeletrica_Est_Gerad_Energia_Eletrica SERIAL NOT NULL,
  Termeletrica SERIAL NOT NULL,
  idCondutor_Hidrico LINESTRING NOT NULL ,
  Massa_Dagua SERIAL NOT NULL,
  Complexo_Gerador_Energia_Eletrica SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Condutor_Hidrico)
);

CREATE INDEX Condutor_Hidrico_FKIndex1 ON Condutor_Hidrico (Massa_Dagua);
CREATE INDEX Condutor_Hidrico_FKIndex2 ON Condutor_Hidrico (Complexo_Gerador_Energia_Eletrica, Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil);
CREATE INDEX Condutor_Hidrico_FKIndex3 ON Condutor_Hidrico (Termeletrica, Termeletrica_Est_Gerad_Energia_Eletrica, Termeletrica_Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia);
CREATE INDEX Condutor_Hidrico_FKIndex4 ON Condutor_Hidrico (Hidreletrica_Est_Gerad_Energia_Eletrica, Hidreletrica_Hidreletrica, Hidreletrica_Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia);

CREATE TABLE Desposito_Geral (
  Desposito_Geral SERIAL NOT NULL,
  idDesposito_Geral MULTIPOLYGON NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Desposito_Geral)
);

CREATE TABLE Edif_comunic (
  Edif_comunic SERIAL NOT NULL,
  Complexo_Comunicacao SERIAL NOT NULL,
  idEdif_comunic MULTIPOLYGON NOT NULL ,
  Complexo_Comunicacao_Org_Pub_Civil SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Edif_comunic)
);

CREATE INDEX Edif_comunic_FKIndex1 ON Edif_comunic (Complexo_Comunicacao_Org_Pub_Civil, Complexo_Comunicacao);

CREATE TABLE Edif_Energia (
  Edif_Energia SERIAL NOT NULL,
  Subest_Transm_Distrib_Energia_Eletrica SERIAL NOT NULL,
  Subest_Transm_Distrib_Energia_Eletrica_Ponto_Trecho_Energia SERIAL NOT NULL,
  idEdif_Energia MULTIPOLYGON NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Edif_Energia)
);

CREATE INDEX Edif_Energia_FKIndex1 ON Edif_Energia (Subest_Transm_Distrib_Energia_Eletrica_Ponto_Trecho_Energia, Subest_Transm_Distrib_Energia_Eletrica);

CREATE TABLE Est_Gerad_Energia_Eletrica (
  Est_Gerad_Energia_Eletrica SERIAL NOT NULL,
  Ponto_Trecho_Energia SERIAL NOT NULL,
  idEst_Gerad_Energia_Eletrica MULTIPOLYGON NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Est_Gerad_Energia_Eletrica, Ponto_Trecho_Energia)
);

CREATE INDEX Est_Gerad_Energia_Eletrica_FKIndex1 ON Est_Gerad_Energia_Eletrica (Ponto_Trecho_Energia);

CREATE TABLE Hidreletrica (
  Est_Gerad_Energia_Eletrica SERIAL NOT NULL,
  Hidreletrica SERIAL NOT NULL,
  Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia SERIAL NOT NULL,
  idHidreletrica MULTIPOLYGON NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Est_Gerad_Energia_Eletrica, Hidreletrica, Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia)
);

CREATE INDEX Hidreletrica_FKIndex1 ON Hidreletrica (Est_Gerad_Energia_Eletrica, Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia);

CREATE TABLE Massa_Dagua (
  Massa_Dagua SERIAL NOT NULL,
  idMassa_Dagua POLYGON NOT NULL ,
  Reservatorio_Hidrico SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Massa_Dagua)
);

CREATE INDEX Massa_Dagua_FKIndex1 ON Massa_Dagua(Reservatorio_Hidrico);

CREATE TABLE Org_Pub_Civil (
  Org_Pub_Civil SERIAL NOT NULL,
  idOrg_Pub_Civil MULTIPOLYGON NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Org_Pub_Civil)
);

CREATE TABLE Ponto_Trecho_Energia (
  Ponto_Trecho_Energia SERIAL NOT NULL,
  idPonto_Trecho_Energia INTEGER NOT NULL,
  PRIMARY KEY(Ponto_Trecho_Energia)
);

CREATE TABLE Reservatorio_Hidrico (
  Reservatorio_Hidrico SERIAL NOT NULL,
  Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil SERIAL NOT NULL,
  idReservatorio_Hidrico POLYGON NOT NULL ,
  Complexo_Gerador_Energia_Eletrica SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Reservatorio_Hidrico)
);

CREATE INDEX Reservatorio_Hidrico_FKIndex1 ON Reservatorio_Hidrico (Complexo_Gerador_Energia_Eletrica, Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil);

CREATE TABLE Subest_Transm_Distrib_Energia_Eletrica (
  Ponto_Trecho_Energia SERIAL NOT NULL,
  Subest_Transm_Distrib_Energia_Eletrica SERIAL NOT NULL,
  idSubest_Transm_Distrib_Energia_Eletrica MULTIPOLYGON NOT NULL ,
  Area_Energia_Eletrica_Area_Energia_Eletrica SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Ponto_Trecho_Energia, Subest_Transm_Distrib_Energia_Eletrica)
);

CREATE INDEX Subest_Transm_Distrib_Energia_Eletrica_FKIndex1 ON Subest_Transm_Distrib_Energia_Eletrica (Ponto_Trecho_Energia);
CREATE INDEX Subest_Transm_Distrib_Energia_Eletrica_FKIndex2 ON Subest_Transm_Distrib_Energia_Eletrica (Area_Energia_Eletrica_Area_Energia_Eletrica);

CREATE TABLE Termeletrica (
  Termeletrica SERIAL NOT NULL,
  Est_Gerad_Energia_Eletrica SERIAL NOT NULL,
  Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia SERIAL NOT NULL,
  Trecho_Duto_Trecho_Duto SERIAL NOT NULL,
  Desposito_Geral_Desposito_Geral SERIAL NOT NULL,
  idTermeletrica MULTIPOLYGON NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Termeletrica, Est_Gerad_Energia_Eletrica, Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia)
);

CREATE INDEX Termeletrica_FKIndex1 ON Termeletrica (Est_Gerad_Energia_Eletrica, Est_Gerad_Energia_Eletrica_Ponto_Trecho_Energia);
CREATE INDEX Termeletrica_FKIndex2 ON Termeletrica (Desposito_Geral_Desposito_Geral);
CREATE INDEX Termeletrica_FKIndex3 ON Termeletrica (Trecho_Duto_Trecho_Duto);

CREATE TABLE Torre_Comunic (
  Torre_Comunic SERIAL NOT NULL,
  Complexo_Comunicacao SERIAL NOT NULL,
  Antena_Comunic SERIAL NOT NULL,
  idTorre_Comunic INTEGER NOT NULL,
  Trecho_Cominic_Trecho_Cominic SERIAL NOT NULL,
  Complexo_Comunicacao_Org_Pub_Civil SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Torre_Comunic)
);

CREATE INDEX Torre_Comunic_FKIndex1 ON Torre_Comunic (Trecho_Cominic_Trecho_Cominic);
CREATE INDEX Torre_Comunic_FKIndex2 ON Torre_Comunic (Antena_Comunic);
CREATE INDEX Torre_Comunic_FKIndex3 ON Torre_Comunic (Complexo_Comunicacao_Org_Pub_Civil, Complexo_Comunicacao);

CREATE TABLE Torre_Energia (
  Torre_Energia SERIAL NOT NULL,
  idTorre_Energia INTEGER NOT NULL,
  Zona_Linhas_Energia_Comunicacao SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Torre_Energia)
);

CREATE INDEX Torre_Energia_FKIndex1 ON Torre_Energia (Zona_Linhas_Energia_Comunicacao);

CREATE TABLE Trecho_Cominic (
  Trecho_Cominic SERIAL NOT NULL,
  idTrecho_Cominic LINESTRING NOT NULL ,
  Zona_Linhas_Energia_Comunicacao SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Trecho_Cominic)
);

CREATE INDEX Trecho_Cominic_FKIndex1 ON Trecho_Cominic (Zona_Linhas_Energia_Comunicacao);

CREATE TABLE Trecho_Duto (
  Trecho_Duto SERIAL NOT NULL,
  idTrecho_Duto LINESTRING NOT NULL ,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Trecho_Duto)
);

CREATE TABLE Trecho_Energia (
  Trecho_Energia SERIAL NOT NULL,
  idTrecho_Energia LINESTRING NOT NULL ,
  Torre_Energia SERIAL NOT NULL,
  Zona_Linhas_Energia_Comunicacao SERIAL NOT NULL,
  Ponto_Trecho_Energia SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Trecho_Energia)
);

CREATE INDEX Trecho_Energia_FKIndex1 ON Trecho_Energia (Ponto_Trecho_Energia);
CREATE INDEX Trecho_Energia_FKIndex2 ON Trecho_Energia (Torre_Energia);
CREATE INDEX Trecho_Energia_FKIndex3 ON Trecho_Energia (Zona_Linhas_Energia_Comunicacao);

CREATE TABLE Zona_Linhas_Energia_Comunicacao (
  Zona_Linhas_Energia_Comunicacao SERIAL NOT NULL,
  Complexo_Comunicacao SERIAL NOT NULL,
  idZona_Linhas_Energia_Comunicacao POLYGON NOT NULL ,
  Complexo_Comunicacao_Org_Pub_Civil SERIAL NOT NULL,
  Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil SERIAL NOT NULL,
  Complexo_Gerador_Energia_Eletrica SERIAL NOT NULL,
  Desc_2 TEXT NULL,
  PRIMARY KEY(Zona_Linhas_Energia_Comunicacao)
);

CREATE INDEX Zona_Linhas_Energia_Comunicacao_FKIndex1 ON Zona_Linhas_Energia_Comunicacao (Complexo_Gerador_Energia_Eletrica, Complexo_Gerador_Energia_Eletrica_Org_Pub_Civil);
CREATE INDEX Zona_Linhas_Energia_Comunicacao_FKIndex2 ON Zona_Linhas_Energia_Comunicacao (Complexo_Comunicacao_Org_Pub_Civil, Complexo_Comunicacao);