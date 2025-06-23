# Trabalho Final - Banco de Dados (SCC0240)

Este repositório contém os scripts SQL desenvolvidos pelo grupo para o trabalho final da disciplina **SCC0240 - Banco de Dados**.
Grupo composto por: Letícia Barbanera, Julia Pravato, Murilo Lirani e Marcos Baltazar.

## Estrutura do Repositório
- `README.md`: Arquivo com instruções para configuração e execução do projeto.
- `tabelass.sql`: cria todas as tabelas do banco de dados.
- `banco_inicial.sql`: insere dados sintéticos em todas as tabelas.
- `consultas.sql`: exercício 6: 7 consultas SQL.
- `indexes.sql`:  exercício 7: criação de 3 índices.
- `views.sql`: exercício 8: criação de 3 views.

## Para Executar o Projeto
Requisitos: PostgreSQL 13

```bash
1. Clone o repositório
git clone https://github.com/leticiabarbanera/bancos_de_dados_scc0240.git
cd bancos_de_dados_scc0240
2. Crie um banco de dados no PostgreSQL
Acesse o terminal do PostgreSQL e execute:
sql
Copy
Edit
CREATE DATABASE trabalho_final;
3. Conecte-se ao banco criado
No terminal:
bash
Copy
Edit
psql -U postgres -d trabalho_final
Ou pelo pgAdmin, conecte-se ao banco trabalho_final.
4. Execute os scripts na seguinte ordem:
sql
Copy
Edit
\i create_tables.sql
\i insert_data.sql
\i views.sql
\i queries.sql
Certifique-se de estar no diretório correto onde estão salvos os arquivos .sql.```
