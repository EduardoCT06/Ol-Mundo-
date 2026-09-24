-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2026-09-20 12:21:11 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c


-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE


CREATE SEQUENCE SEQ_ADV 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE SEQ_AUT 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE SEQ_CID 
    START WITH 1 
    NOCACHE 
    ORDER 
;


CREATE SEQUENCE SEQ_EST 
    START WITH 1 
    NOCACHE 
    ORDER 
;


CREATE SEQUENCE SEQ_ORG 
    START WITH 1 
    NOCACHE 
    ORDER 
;


CREATE SEQUENCE SEQ_PRO 
    START WITH 1 
    NOCACHE 
    ORDER 
;


CREATE SEQUENCE SEQ_REU 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE TABLE ADVOGADO 
    ( 
     adv_id          NUMBER  NOT NULL , 
     adv_nome        VARCHAR2 (255) , 
     adv_nascimento  DATE , 
     adv_logradouro  VARCHAR2 (20) , 
     adv_bairro      VARCHAR2 (30) , 
     adv_cep         CHAR (9) , 
     adv_casa_numero VARCHAR2 (10) , 
     adv_email       VARCHAR2 (255) , 
     adv_cid_id   NUMBER  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE ADVOGADO IS 'Tabela responsável por armazenar os dados pessoais, de contato e endereço dos advogados que atuam nos processos do escritório.'
;

COMMENT ON COLUMN ADVOGADO.adv_id IS 'Chave primária. Identificador único e sequencial do advogado no sistema.' 
;

COMMENT ON COLUMN ADVOGADO.adv_nome IS 'Armazena o nome completo do advogado.' 
;

COMMENT ON COLUMN ADVOGADO.adv_nascimento IS 'Armazena a data de nascimento do advogado.' 
;

COMMENT ON COLUMN ADVOGADO.adv_logradouro IS 'Armazena a rua ou avenida do endereço profissional ou residencial do advogado.' 
;

COMMENT ON COLUMN ADVOGADO.adv_bairro IS 'Armazena o bairro do endereço do advogado.' 
;

COMMENT ON COLUMN ADVOGADO.adv_cep IS 'Armazena o CEP do advogado, sem pontuação.' 
;

COMMENT ON COLUMN ADVOGADO.adv_casa_numero IS 'Armazena o número do prédio ou casa do advogado.' 
;

COMMENT ON COLUMN ADVOGADO.adv_email IS 'Armazena o endereço de e-mail de contato profissional do advogado.' 
;

ALTER TABLE ADVOGADO 
    ADD CONSTRAINT ADVOGADO_PK PRIMARY KEY ( adv_id ) ;

CREATE TABLE AUTOR 
    ( 
     aut_id          NUMBER  NOT NULL , 
     aut_nome        VARCHAR2 (255) , 
     aut_cpf_cnpj    VARCHAR2 (255) , 
     aut_rg          VARCHAR2 (20) , 
     aut_pis         VARCHAR2 (16) , 
     aut_ctps        VARCHAR2 (9) , 
     aut_ctps_serie  VARCHAR2 (9) , 
     aut_nascimento  DATE , 
     aut_logradouro  VARCHAR2 (50) , 
     aut_bairro      VARCHAR2 (30) , 
     aut_cep         CHAR (9) , 
     aut_casa_numero VARCHAR2 (10) , 
     aut_cid_id   NUMBER  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE AUTOR IS 'Tabela responsável por armazenar os dados qualificativos e de contato dos autores (requerentes/clientes) dos processos judiciais.'
;

COMMENT ON COLUMN AUTOR.aut_id IS 'Chave primária. Identificador único e sequencial do autor no sistema.' 
;

COMMENT ON COLUMN AUTOR.aut_nome IS 'Armazena o nome completo do autor.' 
;

COMMENT ON COLUMN AUTOR.aut_rg IS 'Armazena o número do Registro Geral (RG) do autor.' 
;

COMMENT ON COLUMN AUTOR.aut_pis IS 'Armazena o número do PIS/PASEP do autor, dado importante para ações trabalhistas.' 
;

COMMENT ON COLUMN AUTOR.aut_ctps IS 'Armazena o número da Carteira de Trabalho e Previdência Social do autor.' 
;

COMMENT ON COLUMN AUTOR.aut_ctps_serie IS 'Armazena o número de série da CTPS do autor.' 
;

COMMENT ON COLUMN AUTOR.aut_nascimento IS 'Armazena a data de nascimento do autor.' 
;

COMMENT ON COLUMN AUTOR.aut_logradouro IS 'Armazena o nome da rua, avenida ou praça onde o autor reside.' 
;

COMMENT ON COLUMN AUTOR.aut_bairro IS 'Armazena o bairro de residência do autor.' 
;

COMMENT ON COLUMN AUTOR.aut_cep IS 'Armazena o Código de Endereçamento Postal (CEP) do autor, sem pontuação.' 
;

COMMENT ON COLUMN AUTOR.aut_casa_numero IS 'Armazena o número da residência do autor. Tipo texto para permitir valores como ''S/N'' ou complementos curtos.' 
;

ALTER TABLE AUTOR 
    ADD CONSTRAINT AUTOR_PK PRIMARY KEY ( aut_id ) ;

CREATE TABLE CIDADE 
    ( 
     cid_id        NUMBER  NOT NULL , 
     cid_nome      VARCHAR2 (255) , 
     cid_est_id NUMBER  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE CIDADE IS 'Tabela responsável por armazenar o nome da cidade'
;

COMMENT ON COLUMN CIDADE.cid_id IS 'Identificador para a entidade cidade' 
;

COMMENT ON COLUMN CIDADE.cid_nome IS 'Nome da cidade' 
;

ALTER TABLE CIDADE 
    ADD CONSTRAINT CIDADE_PK PRIMARY KEY ( cid_id ) ;

CREATE TABLE ESTADO 
    ( 
     est_id   NUMBER  NOT NULL , 
     est_nome VARCHAR2 (255) 
    ) 
    LOGGING 
;

COMMENT ON TABLE ESTADO IS 'Tabela responsável por armazenar o nome do estado'
;

COMMENT ON COLUMN ESTADO.est_id IS 'Identificador para a entidade estado' 
;

COMMENT ON COLUMN ESTADO.est_nome IS 'Nome do estado' 
;

ALTER TABLE ESTADO 
    ADD CONSTRAINT ESTADO_PK PRIMARY KEY ( est_id ) ;

CREATE TABLE H_ADVOGADO 
    ( 
     adv_id          NUMBER 
         CONSTRAINT NNC_ADVOGADOv1_adv_id NOT NULL , 
     adv_nome        VARCHAR2 (255) , 
     adv_nascimento  DATE , 
     adv_logradouro  VARCHAR2 (20) , 
     adv_bairro      VARCHAR2 (30) , 
     adv_cep         CHAR (9) , 
     adv_casa_numero VARCHAR2 (10) , 
     adv_email       VARCHAR2 (255) , 
     adv_cid_id      NUMBER,
     adv_dt_entrada  DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE H_ADVOGADO IS 'Tabela responsável por armazenar os dados pessoais, de contato e endereço dos advogados que atuam nos processos do escritório.'
;

COMMENT ON COLUMN H_ADVOGADO.adv_id IS 'Chave primária. Identificador único e sequencial do advogado no sistema.' 
;

COMMENT ON COLUMN H_ADVOGADO.adv_nome IS 'Armazena o nome completo do advogado.' 
;

COMMENT ON COLUMN H_ADVOGADO.adv_nascimento IS 'Armazena a data de nascimento do advogado.' 
;

COMMENT ON COLUMN H_ADVOGADO.adv_logradouro IS 'Armazena a rua ou avenida do endereço profissional ou residencial do advogado.' 
;

COMMENT ON COLUMN H_ADVOGADO.adv_bairro IS 'Armazena o bairro do endereço do advogado.' 
;

COMMENT ON COLUMN H_ADVOGADO.adv_cep IS 'Armazena o CEP do advogado, sem pontuação.' 
;

COMMENT ON COLUMN H_ADVOGADO.adv_casa_numero IS 'Armazena o número do prédio ou casa do advogado.' 
;

COMMENT ON COLUMN H_ADVOGADO.adv_email IS 'Armazena o endereço de e-mail de contato profissional do advogado.' 
;

ALTER TABLE H_ADVOGADO 
    ADD CONSTRAINT H_ADVOGADO_PK PRIMARY KEY ( adv_id, adv_dt_entrada ) ;

CREATE TABLE H_AUTOR 
    ( 
     aut_id          NUMBER 
         CONSTRAINT NNC_AUTORv1_aut_id NOT NULL , 
     aut_nome        VARCHAR2 (255) , 
     aut_cpf_cnpj    VARCHAR2 (255) , 
     aut_rg          CHAR (9) , 
     aut_pis         VARCHAR2 (16) , 
     aut_ctps        VARCHAR2 (9) , 
     aut_ctps_serie  VARCHAR2 (9) , 
     aut_nascimento  DATE , 
     aut_logradouro  VARCHAR2 (50) , 
     aut_bairro      VARCHAR2 (30) , 
     aut_cep         CHAR (9) , 
     aut_casa_numero VARCHAR2 (10) ,
     aut_cid_id      NUMBER, 
     aut_dt_entrada  DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE H_AUTOR IS 'Tabela responsável por armazenar os dados qualificativos e de contato dos autores (requerentes/clientes) dos processos judiciais.'
;

COMMENT ON COLUMN H_AUTOR.aut_id IS 'Chave primária. Identificador único e sequencial do autor no sistema.' 
;

COMMENT ON COLUMN H_AUTOR.aut_nome IS 'Armazena o nome completo do autor.' 
;

COMMENT ON COLUMN H_AUTOR.aut_rg IS 'Armazena o número do Registro Geral (RG) do autor.' 
;

COMMENT ON COLUMN H_AUTOR.aut_pis IS 'Armazena o número do PIS/PASEP do autor, dado importante para ações trabalhistas.' 
;

COMMENT ON COLUMN H_AUTOR.aut_ctps IS 'Armazena o número da Carteira de Trabalho e Previdência Social do autor.' 
;


COMMENT ON COLUMN H_AUTOR.aut_nascimento IS 'Armazena a data de nascimento do autor.' 
;

COMMENT ON COLUMN H_AUTOR.aut_logradouro IS 'Armazena o nome da rua, avenida ou praça onde o autor reside.' 
;

COMMENT ON COLUMN H_AUTOR.aut_bairro IS 'Armazena o bairro de residência do autor.' 
;

COMMENT ON COLUMN H_AUTOR.aut_cep IS 'Armazena o Código de Endereçamento Postal (CEP) do autor, sem pontuação.' 
;

COMMENT ON COLUMN H_AUTOR.aut_casa_numero IS 'Armazena o número da residência do autor. Tipo texto para permitir valores como ''S/N'' ou complementos curtos.' 
;

ALTER TABLE H_AUTOR 
    ADD CONSTRAINT H_AUTOR_PK PRIMARY KEY ( aut_id, aut_dt_entrada ) ;

CREATE TABLE H_CIDADE 
    ( 
     cid_id         NUMBER 
         CONSTRAINT NNC_CIDADEv1_cid_id NOT NULL , 
     cid_nome       VARCHAR2 (255) , 
     cid_est_id     NUMBER,
     cid_dt_entrada DATE NOT NULL
    ) 
    LOGGING 
;

COMMENT ON TABLE H_CIDADE IS 'Tabela responsável por armazenar o nome da cidade'
;

COMMENT ON COLUMN H_CIDADE.cid_id IS 'Identificador para a entidade cidade' 
;

COMMENT ON COLUMN H_CIDADE.cid_nome IS 'Nome da cidade' 
;

ALTER TABLE H_CIDADE 
    ADD CONSTRAINT H_CIDADE_PK PRIMARY KEY ( cid_id, cid_dt_entrada ) ;

CREATE TABLE H_ESTADO 
    ( 
     est_id         NUMBER 
         CONSTRAINT NNC_ESTADOv1_est_id NOT NULL , 
     est_nome       VARCHAR2 (255) , 
     est_dt_entrada DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE H_ESTADO IS 'Tabela responsável por armazenar o nome do estado'
;

COMMENT ON COLUMN H_ESTADO.est_id IS 'Identificador para a entidade estado' 
;

COMMENT ON COLUMN H_ESTADO.est_nome IS 'Nome do estado' 
;

ALTER TABLE H_ESTADO 
    ADD CONSTRAINT H_ESTADO_PK PRIMARY KEY ( est_id, est_dt_entrada ) ;

CREATE TABLE H_ORGAO 
    ( 
     org_id         NUMBER 
         CONSTRAINT NNC_ORGAOv1_org_id NOT NULL , 
     org_nome       VARCHAR2 (255) , 
     org_dt_entrada DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE H_ORGAO IS 'Tabela responsavel por armazena o nome da vara ou tribunal onde o processo está tramitando.'
;

COMMENT ON COLUMN H_ORGAO.org_id IS 'Identificador para a tabela orgão' 
;

COMMENT ON COLUMN H_ORGAO.org_nome IS 'Armazena o nome da vara ou tribunal onde o processo está tramitando.' 
;

ALTER TABLE H_ORGAO 
    ADD CONSTRAINT H_ORGAO_PK PRIMARY KEY ( org_id, org_dt_entrada ) ;

CREATE TABLE H_ORGAO_CIDADE 
    ( 
     orc_org_id  NUMBER  NOT NULL , 
     orc_cid_id NUMBER  NOT NULL,
     orc_dt_entrada DATE NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE H_ORGAO_CIDADE 
    ADD CONSTRAINT H_ORGAO_CIDADE_PK PRIMARY KEY ( orc_org_id, orc_cid_id,orc_dt_entrada ) ;

CREATE TABLE H_PROCESSO 
    ( 
     pro_id              NUMBER 
         CONSTRAINT NNC_PROCESSOv1_pro_id NOT NULL , 
     pro_numero          VARCHAR2 (50) , 
     pro_esfera          VARCHAR2 (20) , 
     pro_valor_total     NUMBER (13,2) , 
     pro_fase            VARCHAR2 (20) , 
     pro_custas          NUMBER (11,2) , 
     pro_honorarios_cont NUMBER (5,2) , 
     pro_honorarios_suc  NUMBER (5,2) , 
     pro_valor           NUMBER (13,2) , 
     pro_alvaras         NUMBER (13,2) , 
     pro_aut_id          NUMBER, 
     pro_org_id          NUMBER,
     pro_dt_ini          DATE , 
     pro_dt_fim          DATE , 
     pro_dt_entrada      DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE H_PROCESSO IS 'Tabela principal de movimentação, responsável por registrar as informações dos processos judiciais, incluindo dados da vara, valores financeiros e o autor vinculado.'
;

COMMENT ON COLUMN H_PROCESSO.pro_id IS 'Chave primária. Identificador único e sequencial do processo no sistema.' 
;

COMMENT ON COLUMN H_PROCESSO.pro_numero IS 'Armazena o número oficial do processo judicial (padrão CNJ).' 
;

COMMENT ON COLUMN H_PROCESSO.pro_valor_total IS 'Armazena o valor total da causa ou da condenação estipulada no processo.' 
;

COMMENT ON COLUMN H_PROCESSO.pro_custas IS 'Armazena o valor das custas processuais fixadas pelo juízo.' 
;

COMMENT ON COLUMN H_PROCESSO.pro_honorarios_cont IS 'Armazena o percentual ou valor dos honorários contratuais ajustados com o cliente.' 
;

COMMENT ON COLUMN H_PROCESSO.pro_honorarios_suc IS 'Armazena o percentual ou valor dos honorários de sucumbência devidos pela parte contrária.' 
;

COMMENT ON COLUMN H_PROCESSO.pro_valor IS 'Armazena o valor financeiro líquido ou base de cálculo a ser recebido no processo.' 
;

COMMENT ON COLUMN H_PROCESSO.pro_alvaras IS 'Armazena o valor a receber do processo
' 
;

ALTER TABLE H_PROCESSO 
    ADD CONSTRAINT H_PROCESSO_PK PRIMARY KEY ( pro_id, pro_dt_entrada ) ;

CREATE TABLE H_PROCESSO_ADVOGADO 
    ( 
     pdv_pro_id NUMBER  NOT NULL , 
     pdv_adv_id NUMBER  NOT NULL,
     pdv_dt_entrada DATE NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE H_PROCESSO_ADVOGADO 
    ADD CONSTRAINT H_PROCESSO_ADVOGADO_PK PRIMARY KEY ( pdv_pro_id, pdv_adv_id, pdv_dt_entrada ) ;

CREATE TABLE H_PROCESSO_REU 
    ( 
     prr_pro_id NUMBER  NOT NULL , 
     prr_reu_id      NUMBER  NOT NULL,
     prr_dt_entrada DATE NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE H_PROCESSO_REU 
    ADD CONSTRAINT H_PROCESSO_REU_PK PRIMARY KEY ( prr_pro_id, prr_reu_id, prr_dt_entrada ) ;

CREATE TABLE H_REU 
    ( 
     reu_id          NUMBER 
         CONSTRAINT NNC_REUv1_reu_id NOT NULL , 
     reu_nome        VARCHAR2 (255) , 
     reu_cpf_cnpj    VARCHAR2 (19) , 
     reu_rg          VARCHAR2 (20) , 
     reu_nascimento  DATE , 
     reu_logradouro  VARCHAR2 (50) , 
     reu_bairro      VARCHAR2 (30) , 
     reu_cep         CHAR (9) , 
     reu_casa_numero VARCHAR2 (10) ,
     reu_cid_id      NUMBER, 
     reu_dt_entrada  DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE H_REU IS 'Tabela responsável por armazenar os dados cadastrais e de localização da parte contrária (réu, reclamado ou executado) vinculada a um processo.'
;

COMMENT ON COLUMN H_REU.reu_id IS 'Chave primária. Identificador único e sequencial do réu no sistema.' 
;

COMMENT ON COLUMN H_REU.reu_nome IS 'Armazena o nome completo ou Razão Social do réu.' 
;

COMMENT ON COLUMN H_REU.reu_rg IS 'Armazena o número do Registro Geral (RG) ou Inscrição Estadual do réu.' 
;

COMMENT ON COLUMN H_REU.reu_nascimento IS 'Armazena a data de nascimento ou de fundação da empresa ré.' 
;

COMMENT ON COLUMN H_REU.reu_logradouro IS 'Armazena o nome da rua, avenida ou rodovia do endereço do réu.' 
;

COMMENT ON COLUMN H_REU.reu_bairro IS 'Armazena o bairro do endereço do réu.' 
;

COMMENT ON COLUMN H_REU.reu_cep IS 'Armazena o CEP de localização do réu, sem pontuações.' 
;

COMMENT ON COLUMN H_REU.reu_casa_numero IS 'Armazena o número do estabelecimento ou residência do réu.
' 
;

ALTER TABLE H_REU 
    ADD CONSTRAINT H_REU_PK PRIMARY KEY ( reu_id, reu_dt_entrada ) ;

CREATE TABLE ORGAO 
    ( 
     org_id   NUMBER  NOT NULL , 
     org_nome VARCHAR2 (255) 
    ) 
    LOGGING 
;

COMMENT ON TABLE ORGAO IS 'Tabela responsavel por armazena o nome da vara ou tribunal onde o processo está tramitando.'
;

COMMENT ON COLUMN ORGAO.org_id IS 'Identificador para a tabela orgão' 
;

COMMENT ON COLUMN ORGAO.org_nome IS 'Armazena o nome da vara ou tribunal onde o processo está tramitando.' 
;

ALTER TABLE ORGAO 
    ADD CONSTRAINT ORGAO_PK PRIMARY KEY ( org_id ) ;

CREATE TABLE ORGAO_CIDADE 
    ( 
     orc_org_id  NUMBER  NOT NULL , 
     orc_cid_id NUMBER  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE ORGAO_CIDADE 
    ADD CONSTRAINT ORGAO_CIDADE_PK PRIMARY KEY ( orc_org_id, orc_cid_id ) ;

CREATE TABLE PROCESSO 
    ( 
     pro_id              NUMBER  NOT NULL , 
     pro_numero          VARCHAR2 (50) , 
     pro_esfera          VARCHAR2 (20) , 
     pro_valor_total     NUMBER (13,2) , 
     pro_fase            VARCHAR2 (20) , 
     pro_custas          NUMBER (11,2) , 
     pro_honorarios_cont NUMBER (5,2) , 
     pro_honorarios_suc  NUMBER (5,2) , 
     pro_valor           NUMBER (13,2) , 
     pro_alvaras         NUMBER (13,2) , 
     pro_aut_id        NUMBER  NOT NULL , 
     pro_org_id        NUMBER  NOT NULL , 
     pro_dt_ini          DATE , 
     pro_dt_fim          DATE 
    ) 
    LOGGING 
;

COMMENT ON TABLE PROCESSO IS 'Tabela principal de movimentação, responsável por registrar as informações dos processos judiciais, incluindo dados da vara, valores financeiros e o autor vinculado.'
;

COMMENT ON COLUMN PROCESSO.pro_id IS 'Chave primária. Identificador único e sequencial do processo no sistema.' 
;

COMMENT ON COLUMN PROCESSO.pro_numero IS 'Armazena o número oficial do processo judicial (padrão CNJ).' 
;

COMMENT ON COLUMN PROCESSO.pro_valor_total IS 'Armazena o valor total da causa ou da condenação estipulada no processo.' 
;

COMMENT ON COLUMN PROCESSO.pro_custas IS 'Armazena o valor das custas processuais fixadas pelo juízo.' 
;

COMMENT ON COLUMN PROCESSO.pro_honorarios_cont IS 'Armazena o percentual ou valor dos honorários contratuais ajustados com o cliente.' 
;

COMMENT ON COLUMN PROCESSO.pro_honorarios_suc IS 'Armazena o percentual ou valor dos honorários de sucumbência devidos pela parte contrária.' 
;

COMMENT ON COLUMN PROCESSO.pro_valor IS 'Armazena o valor financeiro líquido ou base de cálculo a ser recebido no processo.' 
;

COMMENT ON COLUMN PROCESSO.pro_alvaras IS 'Armazena o valor a receber do processo
' 
;

ALTER TABLE PROCESSO 
    ADD CONSTRAINT PROCESSO_PK PRIMARY KEY ( pro_id ) ;

CREATE TABLE PROCESSO_ADVOGADO 
    ( 
     pdv_pro_id NUMBER  NOT NULL , 
     pdv_adv_id NUMBER  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE PROCESSO_ADVOGADO 
    ADD CONSTRAINT PROCESSO_ADVOGADO_PK PRIMARY KEY ( pdv_pro_id, pdv_adv_id ) ;

CREATE TABLE PROCESSO_REU 
    ( 
     prr_pro_id NUMBER  NOT NULL , 
     prr_reu_id      NUMBER  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE PROCESSO_REU 
    ADD CONSTRAINT PROCESSO_REU_PK PRIMARY KEY ( prr_pro_id, prr_reu_id ) ;

CREATE TABLE REU 
    ( 
     reu_id          NUMBER  NOT NULL , 
     reu_nome        VARCHAR2 (255) , 
     reu_cpf_cnpj    VARCHAR2 (19) , 
     reu_rg          VARCHAR2 (20) , 
     reu_nascimento  DATE , 
     reu_logradouro  VARCHAR2 (50) , 
     reu_bairro      VARCHAR2 (30) , 
     reu_cep         CHAR (9) , 
     reu_casa_numero VARCHAR2 (10) , 
     reu_cid_id   NUMBER  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE REU IS 'Tabela responsável por armazenar os dados cadastrais e de localização da parte contrária (réu, reclamado ou executado) vinculada a um processo.'
;

COMMENT ON COLUMN REU.reu_id IS 'Chave primária. Identificador único e sequencial do réu no sistema.' 
;

COMMENT ON COLUMN REU.reu_nome IS 'Armazena o nome completo ou Razão Social do réu.' 
;

COMMENT ON COLUMN REU.reu_rg IS 'Armazena o número do Registro Geral (RG) ou Inscrição Estadual do réu.' 
;

COMMENT ON COLUMN REU.reu_nascimento IS 'Armazena a data de nascimento ou de fundação da empresa ré.' 
;

COMMENT ON COLUMN REU.reu_logradouro IS 'Armazena o nome da rua, avenida ou rodovia do endereço do réu.' 
;

COMMENT ON COLUMN REU.reu_bairro IS 'Armazena o bairro do endereço do réu.' 
;

COMMENT ON COLUMN REU.reu_cep IS 'Armazena o CEP de localização do réu, sem pontuações.' 
;

COMMENT ON COLUMN REU.reu_casa_numero IS 'Armazena o número do estabelecimento ou residência do réu.
' 
;

ALTER TABLE REU 
    ADD CONSTRAINT REU_PK PRIMARY KEY ( reu_id ) ;

ALTER TABLE ADVOGADO 
    ADD CONSTRAINT ADVOGADO_CIDADE_FK FOREIGN KEY 
    ( 
     adv_cid_id
    ) 
    REFERENCES CIDADE 
    ( 
     cid_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE AUTOR 
    ADD CONSTRAINT AUTOR_CIDADE_FK FOREIGN KEY 
    ( 
     aut_cid_id
    ) 
    REFERENCES CIDADE 
    ( 
     cid_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE CIDADE 
    ADD CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY 
    ( 
     cid_est_id
    ) 
    REFERENCES ESTADO 
    ( 
     est_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE ORGAO_CIDADE 
    ADD CONSTRAINT ORGAO_CIDADE_CIDADE_FK FOREIGN KEY 
    ( 
     orc_cid_id
    ) 
    REFERENCES CIDADE 
    ( 
     cid_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE ORGAO_CIDADE 
    ADD CONSTRAINT ORGAO_CIDADE_ORGAO_FK FOREIGN KEY 
    ( 
     orc_org_id
    ) 
    REFERENCES ORGAO 
    ( 
     org_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PROCESSO_ADVOGADO 
    ADD CONSTRAINT PROCESSO_ADVOGADO_ADVOGADO_FK FOREIGN KEY 
    ( 
     pdv_adv_id
    ) 
    REFERENCES ADVOGADO 
    ( 
     adv_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PROCESSO_ADVOGADO 
    ADD CONSTRAINT PROCESSO_ADVOGADO_PROCESSO_FK FOREIGN KEY 
    ( 
     pdv_pro_id
    ) 
    REFERENCES PROCESSO 
    ( 
     pro_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PROCESSO 
    ADD CONSTRAINT PROCESSO_AUTOR_FK FOREIGN KEY 
    ( 
     pro_aut_id
    ) 
    REFERENCES AUTOR 
    ( 
     aut_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PROCESSO 
    ADD CONSTRAINT PROCESSO_ORGAO_FK FOREIGN KEY 
    ( 
     pro_org_id
    ) 
    REFERENCES ORGAO 
    ( 
     org_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PROCESSO_REU 
    ADD CONSTRAINT PROCESSO_REU_PROCESSO_FK FOREIGN KEY 
    ( 
     prr_pro_id
    ) 
    REFERENCES PROCESSO 
    ( 
     pro_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE PROCESSO_REU 
    ADD CONSTRAINT PROCESSO_REU_REU_FK FOREIGN KEY 
    ( 
     prr_reu_id
    ) 
    REFERENCES REU 
    ( 
     reu_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE REU 
    ADD CONSTRAINT REU_CIDADE_FK FOREIGN KEY 
    ( 
     reu_cid_id
    ) 
    REFERENCES CIDADE 
    ( 
     cid_id
    ) 
    NOT DEFERRABLE 
;


CREATE OR REPLACE TRIGGER TRG_SEQ_ADV 
BEFORE INSERT ON ADVOGADO 
FOR EACH ROW 
BEGIN 
    :NEW.adv_id := SEQ_ADV.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TRG_SEQ_AUT 
BEFORE INSERT ON AUTOR 
FOR EACH ROW 
BEGIN 
    :NEW.aut_id := SEQ_AUT.NEXTVAL; 
END;
/


CREATE OR REPLACE TRIGGER TRG_SEQ_CID 
BEFORE INSERT ON CIDADE 
FOR EACH ROW 
BEGIN 
    :NEW.cid_id := SEQ_CID.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TRG_SEQ_EST  
BEFORE INSERT ON ESTADO 
FOR EACH ROW 
BEGIN 
    :NEW.est_id := SEQ_EST.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER tg_hadv 
BEFORE UPDATE OR DELETE ON ADVOGADO 
FOR EACH ROW 
BEGIN 
    insert into H_ADVOGADO values (:old.adv_id,:old.adv_nome,:old.adv_nascimento,:old.adv_logradouro,:old.adv_bairro,:old.adv_cep,:old.adv_casa_numero,:old.adv_email,:old.adv_cid_id,sysdate); 
END;
/


CREATE OR REPLACE TRIGGER tg_haut 
BEFORE UPDATE OR DELETE ON AUTOR 
FOR EACH ROW 
BEGIN 
    insert into H_AUTOR values (:old.aut_id,:old.aut_nome,:old.aut_cpf_cnpj,:old.aut_rg,:old.aut_pis,:old.aut_ctps,:old.aut_ctps_serie,:old.aut_nascimento,:old.aut_logradouro,:old.aut_bairro,:old.aut_cep,:old.aut_casa_numero,:old.aut_cid_id,sysdate);
END;
/


CREATE OR REPLACE TRIGGER tg_hcid 
BEFORE UPDATE OR DELETE ON CIDADE 
FOR EACH ROW 
BEGIN 
    insert into H_CIDADE values (:old.cid_id,:old.cid_nome,:old.cid_est_id,sysdate);
END;
/


CREATE OR REPLACE TRIGGER tg_hest
BEFORE UPDATE OR DELETE ON ESTADO 
FOR EACH ROW 
BEGIN 
    insert into H_ESTADO values (:old.est_id,:old.est_nome,sysdate);
END;
/

CREATE OR REPLACE TRIGGER tg_horg 
BEFORE UPDATE OR DELETE ON ORGAO 
FOR EACH ROW 
BEGIN 
    insert into H_ORGAO values (:old.org_id,:old.org_nome,sysdate);
END;
/

CREATE OR REPLACE TRIGGER tg_horc 
BEFORE UPDATE OR DELETE ON ORGAO_CIDADE 
FOR EACH ROW 
BEGIN 
    insert into H_ORGAO_CIDADE values (:old.orc_org_id,:old.orc_cid_id,sysdate);
END;
/

CREATE OR REPLACE TRIGGER tg_hpdv 
BEFORE UPDATE OR DELETE ON PROCESSO_ADVOGADO 
FOR EACH ROW 
BEGIN 
    insert into H_PROCESSO_ADVOGADO values (:old.pdv_pro_id,:old.pdv_adv_id,sysdate);
END;
/

CREATE OR REPLACE TRIGGER tg_hprr 
BEFORE UPDATE OR DELETE ON PROCESSO_REU 
FOR EACH ROW 
BEGIN 
    insert into H_PROCESSO_REU values (:old.prr_pro_id,:old.prr_reu_id,sysdate);
END;
/

CREATE OR REPLACE TRIGGER tg_hpro 
BEFORE UPDATE OR DELETE ON PROCESSO 
FOR EACH ROW 
BEGIN 
    insert into H_PROCESSO values (:old.pro_id,:old.pro_numero,:old.pro_esfera,:old.pro_valor_total,:old.pro_fase,:old.pro_custas,:old.pro_honorarios_cont,:old.pro_honorarios_suc,:old.pro_valor,:old.pro_alvaras,:old.pro_aut_id,:old.pro_org_id,:old.pro_dt_ini,:old.pro_dt_fim,sysdate);
END;
/

CREATE OR REPLACE TRIGGER tg_hreu 
BEFORE UPDATE OR DELETE ON REU 
FOR EACH ROW 
BEGIN 
    insert into H_REU values (:old.reu_id,:old.reu_nome,:old.reu_cpf_cnpj,:old.reu_rg,:old.reu_nascimento,:old.reu_logradouro,:old.reu_bairro,:old.reu_cep,:old.reu_casa_numero,:old.reu_cid_id,sysdate);
END;
/

CREATE OR REPLACE TRIGGER TRG_SEQ_ORG 
BEFORE INSERT ON ORGAO 
FOR EACH ROW 
BEGIN 
    :NEW.org_id := SEQ_ORG.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TRG_SEQ_PRO 
BEFORE INSERT ON PROCESSO 
FOR EACH ROW 
BEGIN 
    :NEW.pro_id := SEQ_PRO.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TRG_SEQ_REU 
BEFORE INSERT ON REU 
FOR EACH ROW 
BEGIN 
    :NEW.reu_id := SEQ_REU.NEXTVAL; 
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             0
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          14
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         28
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
