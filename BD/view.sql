CREATE OR REPLACE VIEW USR_POWERBI.VW_ANALISE_FINANCEIRA AS
WITH DADOS_FINANCEIROS AS (
    SELECT pro_numero, pro_esfera, pro_valor_total, pro_custas, pro_honorarios_cont, pro_honorarios_suc, 'Ativa' AS carteira
    FROM APP.PROCESSO
    UNION ALL
    SELECT pro_numero, pro_esfera, pro_valor_total, pro_custas, pro_honorarios_cont, pro_honorarios_suc, 'Historico' AS carteira
    FROM APP.H_PROCESSO
)
SELECT 
    carteira,
    pro_esfera AS area_atuacao,
    NVL(pro_valor_total, 0) AS montante_em_disputa,
    NVL(pro_custas, 0) AS custos_processuais,
    NVL(pro_valor_total * (pro_honorarios_cont / 100), 0) AS receita_contrato,
    NVL(pro_valor_total * (pro_honorarios_suc / 100), 0) AS receita_sucumbencia,
    NVL(pro_valor_total * (pro_honorarios_cont / 100), 0) + 
    NVL(pro_valor_total * (pro_honorarios_suc / 100), 0) AS faturamento_total_estimado
FROM DADOS_FINANCEIROS;


CREATE MATERIALIZED VIEW APP.MV_RESUMO_FINANCEIRO
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT 
    pro_esfera AS area_atuacao,
    COUNT(pro_id) AS quantidade_processos,
    SUM(NVL(pro_valor_total, 0)) AS volume_financeiro_total,
    SUM(NVL(pro_valor_total * (pro_honorarios_cont / 100), 0)) AS receita_garantida_total
FROM APP.PROCESSO
GROUP BY pro_esfera;
