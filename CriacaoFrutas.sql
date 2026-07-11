-- Banco de dados: fruits
-- Tabela de frutas para primeira conexão com o pandas

IF DB_ID('fruits') IS NULL
    CREATE DATABASE fruits;
GO

USE fruits;
GO

IF OBJECT_ID('dbo.frutas') IS NOT NULL
    DROP TABLE dbo.frutas;
GO

CREATE TABLE dbo.frutas (
    id            INT IDENTITY(1,1) PRIMARY KEY,
    nome          NVARCHAR(50)  NOT NULL,
    cor           NVARCHAR(30)  NOT NULL,
    peso_gramas   DECIMAL(7,2)  NOT NULL,
    preco_kg      DECIMAL(8,2)  NOT NULL,
    estoque       INT           NOT NULL DEFAULT 0,
    organica      BIT           NOT NULL DEFAULT 0,
    data_colheita DATE          NULL,
    criado_em     DATETIME2     NOT NULL DEFAULT SYSDATETIME()
);
GO

INSERT INTO dbo.frutas (nome, cor, peso_gramas, preco_kg, estoque, organica, data_colheita) VALUES
 (N'Maçã',     N'Vermelha', 150.00,  8.90, 120, 1, '2026-06-28'),
 (N'Banana',   N'Amarela',  120.00,  5.50, 300, 0, '2026-07-01'),
 (N'Laranja',  N'Laranja',  200.00,  4.20, 250, 0, '2026-06-30'),
 (N'Manga',    N'Amarela',  350.00,  9.80,  80, 1, '2026-07-02'),
 (N'Uva',      N'Roxa',       8.50, 15.90, 500, 0, '2026-06-25'),
 (N'Abacaxi',  N'Amarela', 1500.00,  6.75,  45, 0, '2026-06-29'),
 (N'Morango',  N'Vermelha',  25.00, 22.40, 150, 1, '2026-07-03'),
 (N'Melancia', N'Verde',   6000.00,  3.10,  30, 0, '2026-07-01');
GO

SELECT * FROM dbo.frutas;