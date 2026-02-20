-- Faturamento total
SELECT SUM(i.preco) AS faturamento_total
FROM vendas v
JOIN inventario i ON v.carro_id = i.id;

-- Faturamento por marca
SELECT m.nome_marca, SUM(i.preco) AS faturamento
FROM vendas v
JOIN inventario i ON v.carro_id = i.id
JOIN marcas m ON i.marcas_id = m.id
GROUP BY m.nome_marca
ORDER BY faturamento DESC;

-- Cliente que mais gastou
SELECT 
    c.nome,
    SUM(i.preco) AS total_gasto
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN inventario i ON v.carro_id = i.id
GROUP BY c.nome
ORDER BY total_gasto DESC;

-- Ticket médio
SELECT AVG(i.preco) AS ticket_medio
FROM vendas v
JOIN inventario i ON v.carro_id = i.id;