DELIMITER //

CREATE PROCEDURE vendas_por_marca(IN marca_nome VARCHAR(255))
BEGIN
    SELECT m.nome_marca, COUNT(v.id) AS total_vendas
    FROM vendas v
    JOIN inventario i ON v.carro_id = i.id
    JOIN marcas m ON i.marcas_id = m.id
    WHERE m.nome_marca = marca_nome
    GROUP BY m.nome_marca;
END //

DELIMITER ;