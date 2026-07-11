# 🗄️ Curso Completo de SQL Server

> Repositório de estudos e prática de **Microsoft SQL Server** — desde os fundamentos de banco de dados até administração, performance e integração com Python.

**Autor:** Cristian Matias de Souza
**Ambiente:** SQL Server 2022 (container Docker) · DataGrip / DBeaver · PyCharm (pymssql)

---

## 📚 Sobre o curso

Este repositório acompanha uma trilha de aprendizado prática de SQL Server. Cada módulo combina **teoria + scripts SQL executáveis**, evoluindo de comandos básicos de consulta até tópicos avançados de administração (DBA), tuning e automação.

---

## 🎯 Grade Curricular

### Módulo 1 — Fundamentos de Banco de Dados
- [ ] O que é um SGBD e o modelo relacional
- [ ] Instalação do SQL Server (container Docker / SQL Server 2022)
- [ ] Ferramentas: SSMS, Azure Data Studio, DataGrip
- [ ] Tipos de dados (`INT`, `VARCHAR`, `NVARCHAR`, `DECIMAL`, `DATE`, `DATETIME`)
- [ ] Criação de bancos: `CREATE DATABASE`, `USE`, `DROP DATABASE`

### Módulo 2 — DDL: Definição de Estruturas
- [ ] `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`
- [ ] Chaves primárias e `IDENTITY`
- [ ] Constraints: `NOT NULL`, `UNIQUE`, `DEFAULT`, `CHECK`
- [ ] Chaves estrangeiras e integridade referencial
- 📄 Scripts: [`CriacaoTabela.sql`](./CriacaoTabela.sql) · [`fks_ChavesEstrangeiras.sql`](./fks_ChavesEstrangeiras.sql)

### Módulo 3 — DML: Manipulação de Dados
- [ ] `INSERT`, `UPDATE`, `DELETE`
- [ ] `SELECT` e projeção de colunas
- [ ] Filtros com `WHERE`, operadores lógicos e `LIKE`
- [ ] Ordenação (`ORDER BY`) e limitação (`TOP`)
- 📄 Script: [`CriacaoFrutas.sql`](./CriacaoFrutas.sql)

### Módulo 4 — Consultas Avançadas
- [ ] `JOIN` (INNER, LEFT, RIGHT, FULL, CROSS)
- [ ] Funções de agregação (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
- [ ] `GROUP BY` e `HAVING`
- [ ] Subconsultas e CTEs (`WITH`)
- [ ] Funções de janela (`ROW_NUMBER`, `RANK`, `OVER`)

### Módulo 5 — Programação T-SQL
- [ ] Variáveis, `IF/ELSE`, `WHILE`
- [ ] Stored Procedures
- [ ] Functions (escalares e table-valued)
- [ ] Triggers
- [ ] Tratamento de erros (`TRY...CATCH`) e transações

### Módulo 6 — Views, Índices e Performance
- [ ] Views e views indexadas
- [ ] Índices clustered e non-clustered
- [ ] Plano de execução e otimização de consultas
- [ ] Estatísticas e fragmentação

### Módulo 7 — Administração (DBA)
- [ ] Segurança: logins, usuários, roles e permissões
- [ ] Gerenciamento de acessos e auditoria
- [ ] Backup e restore
- [ ] Monitoramento e manutenção
- 📄 Script: [`VisualizacaoAcessos.sql`](./VisualizacaoAcessos.sql)

### Módulo 8 — Integração e Projetos
- [ ] Conexão com Python via `pymssql` / `pandas`
- [ ] Projeto prático: banco **fruits** para análise de dados
- [ ] Versionamento de scripts com Git/GitHub
- 📄 Guia: [`CONECTAR-REPOSITORIO-GITHUB.md`](./CONECTAR-REPOSITORIO-GITHUB.md)

---

## 🗂️ Estrutura do Repositório

| Arquivo | Descrição |
|---------|-----------|
| [`CriacaoTabela.sql`](./CriacaoTabela.sql) | Criação das tabelas do sistema acadêmico (Alunos, Turmas, Cursos…) |
| [`fks_ChavesEstrangeiras.sql`](./fks_ChavesEstrangeiras.sql) | Definição das chaves estrangeiras entre as tabelas |
| [`CriacaoFrutas.sql`](./CriacaoFrutas.sql) | Banco `fruits` — tabela de frutas para prática e integração com pandas |
| [`VisualizacaoAcessos.sql`](./VisualizacaoAcessos.sql) | Consultas de administração: usuários, logins e acessos |
| [`CONECTAR-REPOSITORIO-GITHUB.md`](./CONECTAR-REPOSITORIO-GITHUB.md) | Guia para conectar um repositório existente ao GitHub |

---

## 🚀 Como usar

1. Suba um SQL Server (exemplo com Docker):
   ```bash
   docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=SuaSenha@123" \
     -p 1433:1433 --name sqlserver2022 \
     -d mcr.microsoft.com/mssql/server:2022-latest
   ```
2. Conecte-se via **DataGrip**, **Azure Data Studio** ou **sqlcmd**.
3. Execute os scripts na ordem dos módulos (Módulo 2 → 3 → …).

---

## 🛠️ Tecnologias

![SQL Server](https://img.shields.io/badge/SQL_Server-2022-CC2927?logo=microsoftsqlserver&logoColor=white)
![T-SQL](https://img.shields.io/badge/T--SQL-blue)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Python](https://img.shields.io/badge/Python-pymssql-3776AB?logo=python&logoColor=white)

---

## 📈 Progresso

Marque os itens `- [ ]` acima conforme avança nos estudos. 💪

---

<p align="center">Feito com 💙 para estudos de SQL Server</p>