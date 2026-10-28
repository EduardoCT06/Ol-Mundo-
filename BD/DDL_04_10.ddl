-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2026-10-04 17:48:16 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE
alter session set "_ORACLE_SCRIPT" = TRUE;
CREATE USER APP IDENTIFIED BY APP
QUOTA UNLIMITED ON USERS;
GRANT CONNECT, RESOURCE TO APP;

CREATE USER APP_AUDIT IDENTIFIED BY APP_AUDIT
QUOTA UNLIMITED ON USERS;
GRANT CONNECT, RESOURCE TO APP_AUDIT;

GRANT CREATE ANY TRIGGER TO APP_AUDIT;
CREATE SEQUENCE APP.SEQ_ADV 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE APP.SEQ_AUT 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE APP.SEQ_CID 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE APP.SEQ_EST 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE APP.SEQ_ORG 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE APP.SEQ_PRO 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE APP.SEQ_REU 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE TABLE APP.ADVOGADO 
    ( 
     adv_id          NUMBER  NOT NULL , 
     adv_nome        VARCHAR2 (255) , 
     adv_nascimento  DATE , 
     adv_logradouro  VARCHAR2 (20) , 
     adv_bairro      VARCHAR2 (30) , 
     adv_cep         CHAR (9) , 
     adv_casa_numero VARCHAR2 (10) , 
     adv_email       VARCHAR2 (255) , 
     adv_cid_id      NUMBER  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.ADVOGADO IS 'Tabela responsável por armazenar os dados pessoais, de contato e endereço dos advogados que atuam nos processos do escritório.'
;

COMMENT ON COLUMN APP.ADVOGADO.adv_id IS 'Chave primária. Identificador único e sequencial do advogado no sistema.' 
;

COMMENT ON COLUMN APP.ADVOGADO.adv_nome IS 'Armazena o nome completo do advogado.' 
;

COMMENT ON COLUMN APP.ADVOGADO.adv_nascimento IS 'Armazena a data de nascimento do advogado.' 
;

COMMENT ON COLUMN APP.ADVOGADO.adv_logradouro IS 'Armazena a rua ou avenida do endereço profissional ou residencial do advogado.' 
;

COMMENT ON COLUMN APP.ADVOGADO.adv_bairro IS 'Armazena o bairro do endereço do advogado.' 
;

COMMENT ON COLUMN APP.ADVOGADO.adv_cep IS 'Armazena o CEP do advogado, sem pontuação.' 
;

COMMENT ON COLUMN APP.ADVOGADO.adv_casa_numero IS 'Armazena o número do prédio ou casa do advogado.' 
;

COMMENT ON COLUMN APP.ADVOGADO.adv_email IS 'Armazena o endereço de e-mail de contato profissional do advogado.' 
;

ALTER TABLE APP.ADVOGADO 
    ADD CONSTRAINT ADVOGADO_PK PRIMARY KEY ( adv_id ) ;

CREATE TABLE APP_AUDIT.AUDITORIA 
    ( 
     aud_id           NUMBER (5)  NOT NULL , 
     aud_tabela       VARCHAR2 (30) , 
     aud_coluna       VARCHAR2 (30) , 
     aud_valor_antigo VARCHAR2 (255) , 
     aud_tp_operacao  CHAR (1) , 
     aud_valor_novo   VARCHAR2 (255) , 
     aud_data_entrada DATE , 
     aud_bd_user      VARCHAR2 (255) , 
     aud_so_user      VARCHAR2 (255) 
    ) 
    LOGGING 
;

ALTER TABLE APP_AUDIT.AUDITORIA 
    ADD CONSTRAINT AUDITORIA_PK PRIMARY KEY ( aud_id ) ;

CREATE TABLE APP.AUTOR 
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
     aut_cid_id      NUMBER  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.AUTOR IS 'Tabela responsável por armazenar os dados qualificativos e de contato dos autores (requerentes/clientes) dos processos judiciais.'
;

COMMENT ON COLUMN APP.AUTOR.aut_id IS 'Chave primária. Identificador único e sequencial do autor no sistema.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_nome IS 'Armazena o nome completo do autor.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_rg IS 'Armazena o número do Registro Geral (RG) do autor.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_pis IS 'Armazena o número do PIS/PASEP do autor, dado importante para ações trabalhistas.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_ctps IS 'Armazena o número da Carteira de Trabalho e Previdência Social do autor.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_ctps_serie IS 'Armazena o número de série da CTPS do autor.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_nascimento IS 'Armazena a data de nascimento do autor.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_logradouro IS 'Armazena o nome da rua, avenida ou praça onde o autor reside.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_bairro IS 'Armazena o bairro de residência do autor.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_cep IS 'Armazena o Código de Endereçamento Postal (CEP) do autor, sem pontuação.' 
;

COMMENT ON COLUMN APP.AUTOR.aut_casa_numero IS 'Armazena o número da residência do autor. Tipo texto para permitir valores como ''S/N'' ou complementos curtos.' 
;

ALTER TABLE APP.AUTOR 
    ADD CONSTRAINT AUTOR_PK PRIMARY KEY ( aut_id ) ;

CREATE TABLE APP.CIDADE 
    ( 
     cid_id     NUMBER  NOT NULL , 
     cid_nome   VARCHAR2 (255) , 
     cid_est_id NUMBER  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.CIDADE IS 'Tabela responsável por armazenar o nome da cidade'
;

COMMENT ON COLUMN APP.CIDADE.cid_id IS 'Identificador para a entidade cidade' 
;

COMMENT ON COLUMN APP.CIDADE.cid_nome IS 'Nome da cidade' 
;

ALTER TABLE APP.CIDADE 
    ADD CONSTRAINT CIDADE_PK PRIMARY KEY ( cid_id ) ;

CREATE TABLE APP.ESTADO 
    ( 
     est_id   NUMBER  NOT NULL , 
     est_nome VARCHAR2 (255) 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.ESTADO IS 'Tabela responsável por armazenar o nome do estado'
;

COMMENT ON COLUMN APP.ESTADO.est_id IS 'Identificador para a entidade estado' 
;

COMMENT ON COLUMN APP.ESTADO.est_nome IS 'Nome do estado' 
;

ALTER TABLE APP.ESTADO 
    ADD CONSTRAINT ESTADO_PK PRIMARY KEY ( est_id ) ;

CREATE TABLE APP.H_ADVOGADO 
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
     adv_cid_id      NUMBER , 
     adv_dt_entrada  DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.H_ADVOGADO IS 'Tabela responsável por armazenar os dados pessoais, de contato e endereço dos advogados que atuam nos processos do escritório.'
;

COMMENT ON COLUMN APP.H_ADVOGADO.adv_id IS 'Chave primária. Identificador único e sequencial do advogado no sistema.' 
;

COMMENT ON COLUMN APP.H_ADVOGADO.adv_nome IS 'Armazena o nome completo do advogado.' 
;

COMMENT ON COLUMN APP.H_ADVOGADO.adv_nascimento IS 'Armazena a data de nascimento do advogado.' 
;

COMMENT ON COLUMN APP.H_ADVOGADO.adv_logradouro IS 'Armazena a rua ou avenida do endereço profissional ou residencial do advogado.' 
;

COMMENT ON COLUMN APP.H_ADVOGADO.adv_bairro IS 'Armazena o bairro do endereço do advogado.' 
;

COMMENT ON COLUMN APP.H_ADVOGADO.adv_cep IS 'Armazena o CEP do advogado, sem pontuação.' 
;

COMMENT ON COLUMN APP.H_ADVOGADO.adv_casa_numero IS 'Armazena o número do prédio ou casa do advogado.' 
;

COMMENT ON COLUMN APP.H_ADVOGADO.adv_email IS 'Armazena o endereço de e-mail de contato profissional do advogado.' 
;

ALTER TABLE APP.H_ADVOGADO 
    ADD CONSTRAINT H_ADVOGADO_PK PRIMARY KEY ( adv_id, adv_dt_entrada ) ;

CREATE TABLE APP.H_AUTOR 
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
     aut_cid_id      NUMBER , 
     aut_dt_entrada  DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.H_AUTOR IS 'Tabela responsável por armazenar os dados qualificativos e de contato dos autores (requerentes/clientes) dos processos judiciais.'
;

COMMENT ON COLUMN APP.H_AUTOR.aut_id IS 'Chave primária. Identificador único e sequencial do autor no sistema.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_nome IS 'Armazena o nome completo do autor.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_rg IS 'Armazena o número do Registro Geral (RG) do autor.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_pis IS 'Armazena o número do PIS/PASEP do autor, dado importante para ações trabalhistas.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_ctps IS 'Armazena o número da Carteira de Trabalho e Previdência Social do autor.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_nascimento IS 'Armazena a data de nascimento do autor.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_logradouro IS 'Armazena o nome da rua, avenida ou praça onde o autor reside.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_bairro IS 'Armazena o bairro de residência do autor.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_cep IS 'Armazena o Código de Endereçamento Postal (CEP) do autor, sem pontuação.' 
;

COMMENT ON COLUMN APP.H_AUTOR.aut_casa_numero IS 'Armazena o número da residência do autor. Tipo texto para permitir valores como ''S/N'' ou complementos curtos.' 
;

ALTER TABLE APP.H_AUTOR 
    ADD CONSTRAINT H_AUTOR_PK PRIMARY KEY ( aut_id, aut_dt_entrada ) ;

CREATE TABLE APP.H_CIDADE 
    ( 
     cid_id         NUMBER 
         CONSTRAINT NNC_CIDADEv1_cid_id NOT NULL , 
     cid_nome       VARCHAR2 (255) , 
     cid_est_id     NUMBER , 
     cid_dt_entrada DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.H_CIDADE IS 'Tabela responsável por armazenar o nome da cidade'
;

COMMENT ON COLUMN APP.H_CIDADE.cid_id IS 'Identificador para a entidade cidade' 
;

COMMENT ON COLUMN APP.H_CIDADE.cid_nome IS 'Nome da cidade' 
;

ALTER TABLE APP.H_CIDADE 
    ADD CONSTRAINT H_CIDADE_PK PRIMARY KEY ( cid_id, cid_dt_entrada ) ;

CREATE TABLE APP.H_ESTADO 
    ( 
     est_id         NUMBER 
         CONSTRAINT NNC_ESTADOv1_est_id NOT NULL , 
     est_nome       VARCHAR2 (255) , 
     est_dt_entrada DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.H_ESTADO IS 'Tabela responsável por armazenar o nome do estado'
;

COMMENT ON COLUMN APP.H_ESTADO.est_id IS 'Identificador para a entidade estado' 
;

COMMENT ON COLUMN APP.H_ESTADO.est_nome IS 'Nome do estado' 
;

ALTER TABLE APP.H_ESTADO 
    ADD CONSTRAINT H_ESTADO_PK PRIMARY KEY ( est_id, est_dt_entrada ) ;

CREATE TABLE APP.H_ORGAO 
    ( 
     org_id         NUMBER 
         CONSTRAINT NNC_ORGAOv1_org_id NOT NULL , 
     org_nome       VARCHAR2 (255) , 
     org_dt_entrada DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.H_ORGAO IS 'Tabela responsavel por armazena o nome da vara ou tribunal onde o processo está tramitando.'
;

COMMENT ON COLUMN APP.H_ORGAO.org_id IS 'Identificador para a tabela orgão' 
;

COMMENT ON COLUMN APP.H_ORGAO.org_nome IS 'Armazena o nome da vara ou tribunal onde o processo está tramitando.' 
;

ALTER TABLE APP.H_ORGAO 
    ADD CONSTRAINT H_ORGAO_PK PRIMARY KEY ( org_id, org_dt_entrada ) ;

CREATE TABLE APP.H_ORGAO_CIDADE 
    ( 
     orc_org_id     NUMBER  NOT NULL , 
     orc_cid_id     NUMBER  NOT NULL , 
     orc_dt_entrada DATE  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE APP.H_ORGAO_CIDADE 
    ADD CONSTRAINT H_ORGAO_CIDADE_PK PRIMARY KEY ( orc_org_id, orc_cid_id, orc_dt_entrada ) ;

CREATE TABLE APP.H_PROCESSO 
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
     pro_aut_id          NUMBER , 
     pro_org_id          NUMBER , 
     pro_dt_ini          DATE , 
     pro_dt_fim          DATE , 
     pro_dt_entrada      DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.H_PROCESSO IS 'Tabela principal de movimentação, responsável por registrar as informações dos processos judiciais, incluindo dados da vara, valores financeiros e o autor vinculado.'
;

COMMENT ON COLUMN APP.H_PROCESSO.pro_id IS 'Chave primária. Identificador único e sequencial do processo no sistema.' 
;

COMMENT ON COLUMN APP.H_PROCESSO.pro_numero IS 'Armazena o número oficial do processo judicial (padrão CNJ).' 
;

COMMENT ON COLUMN APP.H_PROCESSO.pro_valor_total IS 'Armazena o valor total da causa ou da condenação estipulada no processo.' 
;

COMMENT ON COLUMN APP.H_PROCESSO.pro_custas IS 'Armazena o valor das custas processuais fixadas pelo juízo.' 
;

COMMENT ON COLUMN APP.H_PROCESSO.pro_honorarios_cont IS 'Armazena o percentual ou valor dos honorários contratuais ajustados com o cliente.' 
;

COMMENT ON COLUMN APP.H_PROCESSO.pro_honorarios_suc IS 'Armazena o percentual ou valor dos honorários de sucumbência devidos pela parte contrária.' 
;

COMMENT ON COLUMN APP.H_PROCESSO.pro_valor IS 'Armazena o valor financeiro líquido ou base de cálculo a ser recebido no processo.' 
;

COMMENT ON COLUMN APP.H_PROCESSO.pro_alvaras IS 'Armazena o valor a receber do processo
' 
;

ALTER TABLE APP.H_PROCESSO 
    ADD CONSTRAINT H_PROCESSO_PK PRIMARY KEY ( pro_id, pro_dt_entrada ) ;

CREATE TABLE APP.H_PROCESSO_ADVOGADO 
    ( 
     pdv_pro_id     NUMBER  NOT NULL , 
     pdv_adv_id     NUMBER  NOT NULL , 
     pdv_dt_entrada DATE  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE APP.H_PROCESSO_ADVOGADO 
    ADD CONSTRAINT H_PROCESSO_ADVOGADO_PK PRIMARY KEY ( pdv_pro_id, pdv_adv_id, pdv_dt_entrada ) ;

CREATE TABLE APP.H_PROCESSO_REU 
    ( 
     prr_pro_id     NUMBER  NOT NULL , 
     prr_reu_id     NUMBER  NOT NULL , 
     prr_dt_entrada DATE  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE APP.H_PROCESSO_REU 
    ADD CONSTRAINT H_PROCESSO_REU_PK PRIMARY KEY ( prr_pro_id, prr_reu_id, prr_dt_entrada ) ;

CREATE TABLE APP.H_REU 
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
     reu_cid_id      NUMBER , 
     reu_dt_entrada  DATE  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.H_REU IS 'Tabela responsável por armazenar os dados cadastrais e de localização da parte contrária (réu, reclamado ou executado) vinculada a um processo.'
;

COMMENT ON COLUMN APP.H_REU.reu_id IS 'Chave primária. Identificador único e sequencial do réu no sistema.' 
;

COMMENT ON COLUMN APP.H_REU.reu_nome IS 'Armazena o nome completo ou Razão Social do réu.' 
;

COMMENT ON COLUMN APP.H_REU.reu_rg IS 'Armazena o número do Registro Geral (RG) ou Inscrição Estadual do réu.' 
;

COMMENT ON COLUMN APP.H_REU.reu_nascimento IS 'Armazena a data de nascimento ou de fundação da empresa ré.' 
;

COMMENT ON COLUMN APP.H_REU.reu_logradouro IS 'Armazena o nome da rua, avenida ou rodovia do endereço do réu.' 
;

COMMENT ON COLUMN APP.H_REU.reu_bairro IS 'Armazena o bairro do endereço do réu.' 
;

COMMENT ON COLUMN APP.H_REU.reu_cep IS 'Armazena o CEP de localização do réu, sem pontuações.' 
;

COMMENT ON COLUMN APP.H_REU.reu_casa_numero IS 'Armazena o número do estabelecimento ou residência do réu.
' 
;

ALTER TABLE APP.H_REU 
    ADD CONSTRAINT H_REU_PK PRIMARY KEY ( reu_id, reu_dt_entrada ) ;

CREATE TABLE APP.ORGAO 
    ( 
     org_id   NUMBER  NOT NULL , 
     org_nome VARCHAR2 (255) 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.ORGAO IS 'Tabela responsavel por armazena o nome da vara ou tribunal onde o processo está tramitando.'
;

COMMENT ON COLUMN APP.ORGAO.org_id IS 'Identificador para a tabela orgão' 
;

COMMENT ON COLUMN APP.ORGAO.org_nome IS 'Armazena o nome da vara ou tribunal onde o processo está tramitando.' 
;

ALTER TABLE APP.ORGAO 
    ADD CONSTRAINT ORGAO_PK PRIMARY KEY ( org_id ) ;

CREATE TABLE APP.ORGAO_CIDADE 
    ( 
     orc_org_id NUMBER  NOT NULL , 
     orc_cid_id NUMBER  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE APP.ORGAO_CIDADE 
    ADD CONSTRAINT ORGAO_CIDADE_PK PRIMARY KEY ( orc_org_id, orc_cid_id ) ;

CREATE TABLE APP.PROCESSO 
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
     pro_aut_id          NUMBER  NOT NULL , 
     pro_org_id          NUMBER  NOT NULL , 
     pro_dt_ini          DATE , 
     pro_dt_fim          DATE 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.PROCESSO IS 'Tabela principal de movimentação, responsável por registrar as informações dos processos judiciais, incluindo dados da vara, valores financeiros e o autor vinculado.'
;

COMMENT ON COLUMN APP.PROCESSO.pro_id IS 'Chave primária. Identificador único e sequencial do processo no sistema.' 
;

COMMENT ON COLUMN APP.PROCESSO.pro_numero IS 'Armazena o número oficial do processo judicial (padrão CNJ).' 
;

COMMENT ON COLUMN APP.PROCESSO.pro_valor_total IS 'Armazena o valor total da causa ou da condenação estipulada no processo.' 
;

COMMENT ON COLUMN APP.PROCESSO.pro_custas IS 'Armazena o valor das custas processuais fixadas pelo juízo.' 
;

COMMENT ON COLUMN APP.PROCESSO.pro_honorarios_cont IS 'Armazena o percentual ou valor dos honorários contratuais ajustados com o cliente.' 
;

COMMENT ON COLUMN APP.PROCESSO.pro_honorarios_suc IS 'Armazena o percentual ou valor dos honorários de sucumbência devidos pela parte contrária.' 
;

COMMENT ON COLUMN APP.PROCESSO.pro_valor IS 'Armazena o valor financeiro líquido ou base de cálculo a ser recebido no processo.' 
;

COMMENT ON COLUMN APP.PROCESSO.pro_alvaras IS 'Armazena o valor a receber do processo
' 
;

ALTER TABLE APP.PROCESSO 
    ADD CONSTRAINT PROCESSO_PK PRIMARY KEY ( pro_id ) ;

CREATE TABLE APP.PROCESSO_ADVOGADO 
    ( 
     pdv_pro_id NUMBER  NOT NULL , 
     pdv_adv_id NUMBER  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE APP.PROCESSO_ADVOGADO 
    ADD CONSTRAINT PROCESSO_ADVOGADO_PK PRIMARY KEY ( pdv_pro_id, pdv_adv_id ) ;

CREATE TABLE APP.PROCESSO_REU 
    ( 
     prr_pro_id NUMBER  NOT NULL , 
     prr_reu_id NUMBER  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE APP.PROCESSO_REU 
    ADD CONSTRAINT PROCESSO_REU_PK PRIMARY KEY ( prr_pro_id, prr_reu_id ) ;

CREATE TABLE APP.REU 
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
     reu_cid_id      NUMBER  NOT NULL 
    ) 
    LOGGING 
;

COMMENT ON TABLE APP.REU IS 'Tabela responsável por armazenar os dados cadastrais e de localização da parte contrária (réu, reclamado ou executado) vinculada a um processo.'
;

COMMENT ON COLUMN APP.REU.reu_id IS 'Chave primária. Identificador único e sequencial do réu no sistema.' 
;

COMMENT ON COLUMN APP.REU.reu_nome IS 'Armazena o nome completo ou Razão Social do réu.' 
;

COMMENT ON COLUMN APP.REU.reu_rg IS 'Armazena o número do Registro Geral (RG) ou Inscrição Estadual do réu.' 
;

COMMENT ON COLUMN APP.REU.reu_nascimento IS 'Armazena a data de nascimento ou de fundação da empresa ré.' 
;

COMMENT ON COLUMN APP.REU.reu_logradouro IS 'Armazena o nome da rua, avenida ou rodovia do endereço do réu.' 
;

COMMENT ON COLUMN APP.REU.reu_bairro IS 'Armazena o bairro do endereço do réu.' 
;

COMMENT ON COLUMN APP.REU.reu_cep IS 'Armazena o CEP de localização do réu, sem pontuações.' 
;

COMMENT ON COLUMN APP.REU.reu_casa_numero IS 'Armazena o número do estabelecimento ou residência do réu.
' 
;

ALTER TABLE APP.REU 
    ADD CONSTRAINT REU_PK PRIMARY KEY ( reu_id ) ;

ALTER TABLE APP.ADVOGADO 
    ADD CONSTRAINT ADVOGADO_CIDADE_FK FOREIGN KEY 
    ( 
     adv_cid_id
    ) 
    REFERENCES APP.CIDADE 
    ( 
     cid_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.AUTOR 
    ADD CONSTRAINT AUTOR_CIDADE_FK FOREIGN KEY 
    ( 
     aut_cid_id
    ) 
    REFERENCES APP.CIDADE 
    ( 
     cid_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.CIDADE 
    ADD CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY 
    ( 
     cid_est_id
    ) 
    REFERENCES APP.ESTADO 
    ( 
     est_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.ORGAO_CIDADE 
    ADD CONSTRAINT ORGAO_CIDADE_CIDADE_FK FOREIGN KEY 
    ( 
     orc_cid_id
    ) 
    REFERENCES APP.CIDADE 
    ( 
     cid_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.ORGAO_CIDADE 
    ADD CONSTRAINT ORGAO_CIDADE_ORGAO_FK FOREIGN KEY 
    ( 
     orc_org_id
    ) 
    REFERENCES APP.ORGAO 
    ( 
     org_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.PROCESSO_ADVOGADO 
    ADD CONSTRAINT PROCESSO_ADVOGADO_ADVOGADO_FK FOREIGN KEY 
    ( 
     pdv_adv_id
    ) 
    REFERENCES APP.ADVOGADO 
    ( 
     adv_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.PROCESSO_ADVOGADO 
    ADD CONSTRAINT PROCESSO_ADVOGADO_PROCESSO_FK FOREIGN KEY 
    ( 
     pdv_pro_id
    ) 
    REFERENCES APP.PROCESSO 
    ( 
     pro_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.PROCESSO 
    ADD CONSTRAINT PROCESSO_AUTOR_FK FOREIGN KEY 
    ( 
     pro_aut_id
    ) 
    REFERENCES APP.AUTOR 
    ( 
     aut_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.PROCESSO 
    ADD CONSTRAINT PROCESSO_ORGAO_FK FOREIGN KEY 
    ( 
     pro_org_id
    ) 
    REFERENCES APP.ORGAO 
    ( 
     org_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.PROCESSO_REU 
    ADD CONSTRAINT PROCESSO_REU_PROCESSO_FK FOREIGN KEY 
    ( 
     prr_pro_id
    ) 
    REFERENCES APP.PROCESSO 
    ( 
     pro_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.PROCESSO_REU 
    ADD CONSTRAINT PROCESSO_REU_REU_FK FOREIGN KEY 
    ( 
     prr_reu_id
    ) 
    REFERENCES APP.REU 
    ( 
     reu_id
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE APP.REU 
    ADD CONSTRAINT REU_CIDADE_FK FOREIGN KEY 
    ( 
     reu_cid_id
    ) 
    REFERENCES APP.CIDADE 
    ( 
     cid_id
    ) 
    NOT DEFERRABLE 
;

CREATE OR REPLACE TRIGGER APP.tg_hadv 
    BEFORE DELETE OR UPDATE ON APP.ADVOGADO 
    FOR EACH ROW 
BEGIN 
    insert into H_ADVOGADO values (:old.adv_id,:old.adv_nome,:old.adv_nascimento,:old.adv_logradouro,:old.adv_bairro,:old.adv_cep,:old.adv_casa_numero,:old.adv_email,:old.adv_cid_id,sysdate); 
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_haut 
    BEFORE DELETE OR UPDATE ON APP.AUTOR 
    FOR EACH ROW 
BEGIN 
    insert into H_AUTOR values (:old.aut_id,:old.aut_nome,:old.aut_cpf_cnpj,:old.aut_rg,:old.aut_pis,:old.aut_ctps,:old.aut_ctps_serie,:old.aut_nascimento,:old.aut_logradouro,:old.aut_bairro,:old.aut_cep,:old.aut_casa_numero,:old.aut_cid_id,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_hcid 
    BEFORE DELETE OR UPDATE ON APP.CIDADE 
    FOR EACH ROW 
BEGIN 
    insert into H_CIDADE values (:old.cid_id,:old.cid_nome,:old.cid_est_id,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_hest 
    BEFORE DELETE OR UPDATE ON APP.ESTADO 
    FOR EACH ROW 
BEGIN 
    insert into H_ESTADO values (:old.est_id,:old.est_nome,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_horc 
    BEFORE DELETE OR UPDATE ON APP.ORGAO_CIDADE 
    FOR EACH ROW 
BEGIN 
    insert into H_ORGAO_CIDADE values (:old.orc_org_id,:old.orc_cid_id,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_horg 
    BEFORE DELETE OR UPDATE ON APP.ORGAO 
    FOR EACH ROW 
BEGIN 
    insert into H_ORGAO values (:old.org_id,:old.org_nome,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_hpdv 
    BEFORE DELETE OR UPDATE ON APP.PROCESSO_ADVOGADO 
    FOR EACH ROW 
BEGIN 
    insert into H_PROCESSO_ADVOGADO values (:old.pdv_pro_id,:old.pdv_adv_id,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_hpro 
    BEFORE DELETE OR UPDATE ON APP.PROCESSO 
    FOR EACH ROW 
BEGIN 
    insert into H_PROCESSO values (:old.pro_id,:old.pro_numero,:old.pro_esfera,:old.pro_valor_total,:old.pro_fase,:old.pro_custas,:old.pro_honorarios_cont,:old.pro_honorarios_suc,:old.pro_valor,:old.pro_alvaras,:old.pro_aut_id,:old.pro_org_id,:old.pro_dt_ini,:old.pro_dt_fim,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_hprr 
    BEFORE DELETE OR UPDATE ON APP.PROCESSO_REU 
    FOR EACH ROW 
BEGIN 
    insert into H_PROCESSO_REU values (:old.prr_pro_id,:old.prr_reu_id,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.tg_hreu 
    BEFORE DELETE OR UPDATE ON APP.REU 
    FOR EACH ROW 
BEGIN 
    insert into H_REU values (:old.reu_id,:old.reu_nome,:old.reu_cpf_cnpj,:old.reu_rg,:old.reu_nascimento,:old.reu_logradouro,:old.reu_bairro,:old.reu_cep,:old.reu_casa_numero,:old.reu_cid_id,sysdate);
END; 
/

CREATE OR REPLACE TRIGGER APP.TRG_SEQ_ADV 
    BEFORE INSERT ON APP.ADVOGADO 
    FOR EACH ROW 
BEGIN 
    :NEW.adv_id := SEQ_ADV.NEXTVAL; 
END; 
/

CREATE OR REPLACE TRIGGER APP.TRG_SEQ_AUT 
    BEFORE INSERT ON APP.AUTOR 
    FOR EACH ROW 
BEGIN 
    :NEW.aut_id := SEQ_AUT.NEXTVAL; 
END; 
/

CREATE OR REPLACE TRIGGER APP.TRG_SEQ_CID 
    BEFORE INSERT ON APP.CIDADE 
    FOR EACH ROW 
BEGIN 
    :NEW.cid_id := SEQ_CID.NEXTVAL; 
END; 
/

CREATE OR REPLACE TRIGGER APP.TRG_SEQ_EST 
    BEFORE INSERT ON APP.ESTADO 
    FOR EACH ROW 
BEGIN 
    :NEW.est_id := SEQ_EST.NEXTVAL; 
END; 
/

CREATE OR REPLACE TRIGGER APP.TRG_SEQ_ORG 
    BEFORE INSERT ON APP.ORGAO 
    FOR EACH ROW 
BEGIN 
    :NEW.org_id := SEQ_ORG.NEXTVAL; 
END; 
/

CREATE OR REPLACE TRIGGER APP.TRG_SEQ_PRO 
    BEFORE INSERT ON APP.PROCESSO 
    FOR EACH ROW 
BEGIN 
    :NEW.pro_id := SEQ_PRO.NEXTVAL; 
END; 
/

CREATE OR REPLACE TRIGGER APP.TRG_SEQ_REU 
    BEFORE INSERT ON APP.REU 
    FOR EACH ROW 
BEGIN 
    :NEW.reu_id := SEQ_REU.NEXTVAL; 
END; 
/

CREATE SEQUENCE APP_AUDIT.AUDITORIA_aud_id_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER APP_AUDIT.AUDITORIA_aud_id_TRG  
BEFORE INSERT ON APP_AUDIT.AUDITORIA 
FOR EACH ROW 
BEGIN 
    :NEW.aud_id := AUDITORIA_aud_id_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE PROCEDURE APP_AUDIT.PR_INSERE_AUDITORIA (
    P_TABELA           IN VARCHAR2,
    P_COLUNA           IN VARCHAR2, 
    P_VALOR_ANTIGO     IN VARCHAR2,
    P_VALOR_NOVO       IN VARCHAR2,
    P_TP_OPERACAO      IN VARCHAR2,
    P_DATA_ENTRADA     IN DATE,
    P_BD_USER          IN VARCHAR2,
    P_SO_USER          IN VARCHAR2
)
IS
BEGIN
    INSERT INTO AUDITORIA (
        AUD_TABELA,AUD_COLUNA,
        AUD_VALOR_ANTIGO,AUD_VALOR_NOVO,
        AUD_TP_OPERACAO,AUD_DATA_ENTRADA,
        AUD_BD_USER,AUD_SO_USER
    )
    VALUES (
        P_TABELA,P_COLUNA,
        P_VALOR_ANTIGO,P_VALOR_NOVO,
        P_TP_OPERACAO,P_DATA_ENTRADA,
        P_BD_USER,P_SO_USER
    );
END;
/

GRANT EXECUTE ON APP_AUDIT.PR_INSERE_AUDITORIA TO APP;


CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_advogado
BEFORE DELETE OR UPDATE ON APP.H_ADVOGADO
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_ADVOGADO';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_ID', :OLD.adv_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.adv_nome <> :NEW.adv_nome) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_NOME', :OLD.adv_nome, :NEW.adv_nome, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.adv_nascimento <> :NEW.adv_nascimento) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_NASCIMENTO', :OLD.adv_nascimento, :NEW.adv_nascimento, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.adv_logradouro <> :NEW.adv_logradouro) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_LOGRADOURO', :OLD.adv_logradouro, :NEW.adv_logradouro, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.adv_bairro <> :NEW.adv_bairro) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_BAIRRO', :OLD.adv_bairro, :NEW.adv_bairro, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.adv_cep <> :NEW.adv_cep) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_CEP', :OLD.adv_cep, :NEW.adv_cep, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.adv_casa_numero <> :NEW.adv_casa_numero) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_CASA_NUMERO', :OLD.adv_casa_numero, :NEW.adv_casa_numero, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.adv_email <> :NEW.adv_email) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_EMAIL', :OLD.adv_email, :NEW.adv_email, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.adv_cid_id <> :NEW.adv_cid_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ADV_CID_ID', :OLD.adv_cid_id, :NEW.adv_cid_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_autor
BEFORE DELETE OR UPDATE ON APP.H_AUTOR
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_AUTOR';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_ID', :OLD.aut_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.aut_nome <> :NEW.aut_nome) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_NOME', :OLD.aut_nome, :NEW.aut_nome, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_cpf_cnpj <> :NEW.aut_cpf_cnpj) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_CPF_CNPJ', :OLD.aut_cpf_cnpj, :NEW.aut_cpf_cnpj, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_rg <> :NEW.aut_rg) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_RG', :OLD.aut_rg, :NEW.aut_rg, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_pis <> :NEW.aut_pis) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_PIS', :OLD.aut_pis, :NEW.aut_pis, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_ctps <> :NEW.aut_ctps) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_CTPS', :OLD.aut_ctps, :NEW.aut_ctps, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_ctps_serie <> :NEW.aut_ctps_serie) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_CTPS_SERIE', :OLD.aut_ctps_serie, :NEW.aut_ctps_serie, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_nascimento <> :NEW.aut_nascimento) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_NASCIMENTO', :OLD.aut_nascimento, :NEW.aut_nascimento, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_logradouro <> :NEW.aut_logradouro) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_LOGRADOURO', :OLD.aut_logradouro, :NEW.aut_logradouro, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_bairro <> :NEW.aut_bairro) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_BAIRRO', :OLD.aut_bairro, :NEW.aut_bairro, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_cep <> :NEW.aut_cep) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_CEP', :OLD.aut_cep, :NEW.aut_cep, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_casa_numero <> :NEW.aut_casa_numero) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_CASA_NUMERO', :OLD.aut_casa_numero, :NEW.aut_casa_numero, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.aut_cid_id <> :NEW.aut_cid_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'AUT_CID_ID', :OLD.aut_cid_id, :NEW.aut_cid_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_cidade
BEFORE DELETE OR UPDATE ON APP.H_CIDADE
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_CIDADE';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'CID_ID', :OLD.cid_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.cid_nome <> :NEW.cid_nome) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'CID_NOME', :OLD.cid_nome, :NEW.cid_nome, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.cid_est_id <> :NEW.cid_est_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'CID_EST_ID', :OLD.cid_est_id, :NEW.cid_est_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_estado
BEFORE DELETE OR UPDATE ON APP.H_ESTADO
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_ESTADO';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'EST_ID', :OLD.est_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.est_nome <> :NEW.est_nome) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'EST_NOME', :OLD.est_nome, :NEW.est_nome, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_orgao
BEFORE DELETE OR UPDATE ON APP.H_ORGAO
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_ORGAO';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ORG_ID', :OLD.org_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.org_nome <> :NEW.org_nome) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ORG_NOME', :OLD.org_nome, :NEW.org_nome, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_orgao_cidade
BEFORE DELETE OR UPDATE ON APP.H_ORGAO_CIDADE
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_ORGAO_CIDADE';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ORC_ORG_ID', :OLD.orc_org_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.orc_org_id <> :NEW.orc_org_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ORC_ORG_ID', :OLD.orc_org_id, :NEW.orc_org_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.orc_cid_id <> :NEW.orc_cid_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'ORC_CID_ID', :OLD.orc_cid_id, :NEW.orc_cid_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_processo
BEFORE DELETE OR UPDATE ON APP.H_PROCESSO
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_PROCESSO';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_ID', :OLD.pro_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.pro_numero <> :NEW.pro_numero) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_NUMERO', :OLD.pro_numero, :NEW.pro_numero, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_esfera <> :NEW.pro_esfera) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_ESFERA', :OLD.pro_esfera, :NEW.pro_esfera, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_valor_total <> :NEW.pro_valor_total) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_VALOR_TOTAL', :OLD.pro_valor_total, :NEW.pro_valor_total, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_fase <> :NEW.pro_fase) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_FASE', :OLD.pro_fase, :NEW.pro_fase, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_custas <> :NEW.pro_custas) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_CUSTAS', :OLD.pro_custas, :NEW.pro_custas, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_honorarios_cont <> :NEW.pro_honorarios_cont) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_HONORARIOS_CONT', :OLD.pro_honorarios_cont, :NEW.pro_honorarios_cont, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_honorarios_suc <> :NEW.pro_honorarios_suc) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_HONORARIOS_SUC', :OLD.pro_honorarios_suc, :NEW.pro_honorarios_suc, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_valor <> :NEW.pro_valor) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_VALOR', :OLD.pro_valor, :NEW.pro_valor, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_alvaras <> :NEW.pro_alvaras) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_ALVARAS', :OLD.pro_alvaras, :NEW.pro_alvaras, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_aut_id <> :NEW.pro_aut_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_AUT_ID', :OLD.pro_aut_id, :NEW.pro_aut_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_org_id <> :NEW.pro_org_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_ORG_ID', :OLD.pro_org_id, :NEW.pro_org_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_dt_ini <> :NEW.pro_dt_ini) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_DT_INI', :OLD.pro_dt_ini, :NEW.pro_dt_ini, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pro_dt_fim <> :NEW.pro_dt_fim) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRO_DT_FIM', :OLD.pro_dt_fim, :NEW.pro_dt_fim, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_processo_advogado
BEFORE DELETE OR UPDATE ON APP.H_PROCESSO_ADVOGADO
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_PROCESSO_ADVOGADO';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PDV_PRO_ID', :OLD.pdv_pro_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.pdv_pro_id <> :NEW.pdv_pro_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PDV_PRO_ID', :OLD.pdv_pro_id, :NEW.pdv_pro_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.pdv_adv_id <> :NEW.pdv_adv_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PDV_ADV_ID', :OLD.pdv_adv_id, :NEW.pdv_adv_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_processo_reu
BEFORE DELETE OR UPDATE ON APP.H_PROCESSO_REU
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_PROCESSO_REU';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRR_PRO_ID', :OLD.prr_pro_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.prr_pro_id <> :NEW.prr_pro_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRR_PRO_ID', :OLD.prr_pro_id, :NEW.prr_pro_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.prr_reu_id <> :NEW.prr_reu_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'PRR_REU_ID', :OLD.prr_reu_id, :NEW.prr_reu_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/


CREATE OR REPLACE TRIGGER APP_AUDIT.tg_aud_h_reu
BEFORE DELETE OR UPDATE ON APP.H_REU
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(30) := 'H_REU';
    V_USU_BD VARCHAR(255);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;
    
    IF DELETING THEN
        V_TP_OPERACAO := 'D';
        APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_ID', :OLD.reu_id, NULL, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
    ELSIF UPDATING THEN
        V_TP_OPERACAO := 'U';   
        IF (:OLD.reu_nome <> :NEW.reu_nome) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_NOME', :OLD.reu_nome, :NEW.reu_nome, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.reu_cpf_cnpj <> :NEW.reu_cpf_cnpj) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_CPF_CNPJ', :OLD.reu_cpf_cnpj, :NEW.reu_cpf_cnpj, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.reu_rg <> :NEW.reu_rg) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_RG', :OLD.reu_rg, :NEW.reu_rg, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.reu_nascimento <> :NEW.reu_nascimento) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_NASCIMENTO', :OLD.reu_nascimento, :NEW.reu_nascimento, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.reu_logradouro <> :NEW.reu_logradouro) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_LOGRADOURO', :OLD.reu_logradouro, :NEW.reu_logradouro, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.reu_bairro <> :NEW.reu_bairro) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_BAIRRO', :OLD.reu_bairro, :NEW.reu_bairro, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.reu_cep <> :NEW.reu_cep) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_CEP', :OLD.reu_cep, :NEW.reu_cep, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.reu_casa_numero <> :NEW.reu_casa_numero) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_CASA_NUMERO', :OLD.reu_casa_numero, :NEW.reu_casa_numero, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
        IF (:OLD.reu_cid_id <> :NEW.reu_cid_id) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(V_TABELA, 'REU_CID_ID', :OLD.reu_cid_id, :NEW.reu_cid_id, V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO);
        END IF;
    END IF;
END;
/


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            21
-- CREATE INDEX                             0
-- ALTER TABLE                             33
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          18
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
-- CREATE SEQUENCE                          8
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
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
