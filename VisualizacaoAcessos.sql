/* ============================================================
   Autor: Cristian Matias de Souza
   Empresa: ciruscom informatica
   Arquivo:  VisualizacaoAcessos.sql
   Criado:   28/06/2026 18:56
   Banco: cmsouza
   Descrição: Gerenciamento de Administração
   ============================================================ */
-- Login do sql server
SELECT DB_NAME() AS banco_atual;

-- Usuario do Banco
select user_name() as Usuario_BD;

-- Visao Geral do Acesso.
SELECT
            SYSTEM_USER          AS login_servidor,
            USER_NAME()          AS usuario_banco,
            SUSER_SNAME()        AS nome_login_sid,
            DB_NAME()            AS banco_atual,
            @@SERVERNAME         AS servidor,
            HOST_NAME()          AS maquina_cliente,
            APP_NAME()           AS aplicacao

-- Verificando se usuario em outras sessoes
SELECT
    session_id,
    login_name,
    host_name,
    program_name,
    status
FROM sys.dm_exec_sessions
WHERE is_user_process = 1
ORDER BY session_id;

-- ============================================================
-- BLOCO 1: Limpeza (executar como sysadmin antes de recriar)
-- ============================================================

-- Remove usuario do banco antes de dropar o login
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'cmsouza')
    BEGIN
        EXEC('USE cmsouza; IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = ''cmsouza'') DROP USER cmsouza;');
    END

-- Remove o login do servidor
IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'cmsouza')
    DROP LOGIN cmsouza;
GO

-- ============================================================
-- BLOCO 2: Criacao do login (executar como sysadmin)
-- DEFAULT_DATABASE = master evita erro de conexao cancelada
-- ============================================================
CREATE LOGIN cmsouza
    WITH PASSWORD = 'sql.123',
    DEFAULT_DATABASE = master,
    CHECK_EXPIRATION = OFF,
    CHECK_POLICY = OFF;
GO

-- Concede permissao para criar bancos de dados
ALTER SERVER ROLE dbcreator ADD MEMBER cmsouza;
GO

-- ============================================================
-- BLOCO 3: Criacao do banco e usuario dentro do banco
-- ============================================================

-- Criacao do Banco
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'SQLDB1')
BEGIN
    CREATE DATABASE SQLDB1;
    PRINT 'Banco de dados SQLDB1 criado com sucesso.';
END
GO

-- Cria usuario dentro do banco e concede db_owner
USE SQLDB1;
GO

CREATE USER cmsouza FOR LOGIN cmsouza;

ALTER ROLE db_owner ADD MEMBER cmsouza;
GO

-- Confirmar banco atual
SELECT DB_NAME() AS banco_atual;

-- Opcional: alterar banco padrao apos confirmar acesso ao banco desejado
-- ALTER LOGIN cmsouza WITH DEFAULT_DATABASE = SQLDB1;



create database Fruits



































