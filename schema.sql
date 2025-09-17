-- =====================================================================
-- E-COMMERCE - SCHEMA SIMPLES (CLIENTE, CARRINHO, PRODUTO, PEDIDO, etc.)
-- Compatível com MySQL e H2 (em modo MySQL).
-- =====================================================================
-- ===========================================
-- 1) CRIAR O SCHEMA (DATABASE)
-- =====================================================================
CREATE SCHEMA IF NOT EXISTS byteshop_db 
  DEFAULT CHARACTER SET utf8mb4 
  DEFAULT COLLATE utf8mb4_0900_ai_ci; 
   
-- (Opcional, mas recomendado no Workbench:)
USE byteshop_db; 
   
-- ===========================================
-- 2) TABELAS
-- =========================================== 
 
-- ============================
-- CLIENTE
--    Guarda dados básicos do cliente.
-- ============================
CREATE TABLE cliente ( 
  id           BIGINT AUTO_INCREMENT PRIMARY KEY,  -- identificador único 
  nome         VARCHAR(150)      NOT NULL,         -- nome completo 
  email        VARCHAR(150)      NOT NULL,         -- e-mail (único) 
  documento    VARCHAR(30)       NOT NULL,         -- CPF/CNPJ (texto simples) 
  UNIQUE (email)                                   -- impede e-mails duplicados 
); 
 
-- ============================
-- PRODUTO
--    Catálogo de produtos simples.
-- ============================
CREATE TABLE produto ( 
  id            BIGINT AUTO_INCREMENT PRIMARY KEY, 
  nome          VARCHAR(120)     NOT NULL,         -- nome do produto 
  preco         DECIMAL(10,2)    NOT NULL,         -- preço unitário 
  categoria     VARCHAR(60)      NULL,             -- categoria simples (texto curto) 
  descricao     TEXT             NULL,             -- descrição (texto livre) 
  ativo         BOOLEAN          NOT NULL DEFAULT TRUE  -- se está visível/vendável 
);  
 
-- SEEDS
INSERT INTO cliente (nome, email, documento) VALUES ('Kaio Meireles','kaiomeireles@email.com','123'); 
INSERT INTO cliente (nome, email, documento) VALUES ('Lucas Souza','carlos@email.com','456'); 
 
INSERT INTO produto (nome, preco, categoria, descricao, ativo) VALUES ('Notebook', 3500.00, 'Informática', 'Básico', TRUE); 
INSERT INTO produto (nome, preco, categoria, descricao, ativo) VALUES ('Mouse', 120.00, 'Acessórios', 'USB', TRUE);
