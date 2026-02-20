CREATE VIEW relatorio_completo AS
SELECT 
    c.nome AS cliente,
    m.nome_marca,
    i.modelo,
    i.preco,
    v.data_venda
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN inventario i ON v.carro_id = i.id
JOIN marcas m ON i.marcas_id = m.id;