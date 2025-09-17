# Loja Online – API REST (CP1)

## 1. Requisitos
- **Java 17**
- **Spring Boot 3.3.4**
- **Maven**
- **MySQL 8** ou **H2 Database**

---

## 2. Como executar

### 2.1. Clonar e compilar
```bash
git clone <repo>
cd cp1-loja-online
mvn clean package -DskipTests

2.2. Rodar com Maven

mvn spring-boot:run

Por padrão a aplicação sobe na porta 8080.
Se precisar alterar (ex.: Codespaces), rode:

mvn spring-boot:run -Dspring-boot.run.arguments="--server.port=8081"

2.3. Rodar o JAR

java -jar target/cp1-loja-online-0.0.1-SNAPSHOT.jar


⸻

3. Banco de Dados

3.1. Opção com Docker (MySQL 8)

docker run --name mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=byteshop_db \
  -p 3306:3306 -d mysql:8

3.2. Opção com Script SQL

Use o arquivo schema.sql para criar as tabelas e dados de exemplo.

3.3. Configurações (application.properties)

H2 (memória):

spring.datasource.url=jdbc:h2:mem:testdb
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console

MySQL:

spring.datasource.url=jdbc:mysql://localhost:3306/byteshop_db
spring.datasource.username=root
spring.datasource.password=root
spring.jpa.hibernate.ddl-auto=update


⸻

4. Swagger

Acesse a documentação em:

http://localhost:8080/swagger-ui.html
ou
http://localhost:8080/swagger-ui/index.html


⸻

5. Endpoints

5.1. Clientes (/clientes)
	•	GET /clientes → lista (filtros opcionais: nome, email) – 200
	•	GET /clientes/{id} → detalhe – 200 ou 404
	•	POST /clientes → cria cliente – 201, 400/409 (email duplicado)
	•	PUT /clientes/{id} → atualiza – 200/204 ou 404
	•	DELETE /clientes/{id} → exclui – 204 ou 404

Validações:
	•	nome: obrigatório
	•	email: formato válido e único
	•	documento: obrigatório

DTOs:

// ClienteRequestDTO
{ "nome": "Kaio Meireles", "email": "kaiomeireles@email.com", "documento": "123.456.789-00" }

// ClienteResponseDTO
{ "id": 1, "nome": "Lucas Souza", "email": "lucasouza@email.com", "documento": "123.456.789-00" }


⸻

5.2. Produtos (/produtos)
	•	GET /produtos → lista (filtros: categoria, ativo) – 200
	•	GET /produtos/{id} → detalhe – 200 ou 404
	•	POST /produtos → cria produto – 201
	•	PUT /produtos/{id} → atualiza – 200/204 ou 404
	•	DELETE /produtos/{id} → exclui – 204 ou 404

Validações:
	•	nome: obrigatório
	•	preco: > 0
	•	ativo: default true se não informado

DTOs:

// ProdutoRequestDTO
{ "nome": "Mouse sem fio", "preco": 120.00, "categoria": "Acessórios", "descricao": "USB", "ativo": true }

// ProdutoResponseDTO
{ "id": 7, "nome": "Mouse sem fio", "preco": 120.00, "categoria": "Acessórios", "descricao": "USB", "ativo": true }


⸻

6. Tratamento de Erros

Formato de resposta:

{
  "timestamp": "2025-09-14T21:00:00Z",
  "status": 400,
  "error": "Bad Request",
  "message": "email já cadastrado",
  "path": "/clientes"
}


⸻

7. Arquitetura

br.com.seuprojeto
 ├─ controller
 ├─ service
 ├─ repository
 ├─ domain (entities)
 ├─ dto
 ├─ exception (handler e classes de erro)
 └─ config


⸻

8. Testes rápidos (cURL)

Criar cliente

curl -X POST http://localhost:8080/clientes \
  -H "Content-Type: application/json" \
  -d '{"nome":"Ana","email":"ana@email.com","documento":"123"}'

Listar clientes

curl http://localhost:8080/clientes

Criar produto

curl -X POST http://localhost:8080/produtos \
  -H "Content-Type: application/json" \
  -d '{"nome":"Mouse","preco":120.0,"categoria":"Acessórios","descricao":"USB"}'


⸻

9. Integrantes
	•	Kaio Vinicius Meireles Alves – RM553282
	•	Lucas Alves de Souza – RM553956
	•	Lucas de Freitas Pagung – RM553242
	•	Guilherme Fernandes de Freitas – RM554323
	•	João Pedro Chizzolini de Freitas – RM553172

