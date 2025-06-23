--view simples (fixa)
CREATE VIEW ProfessoresChefes_Ativos AS
SELECT DISTINCT
    m.nome_professor,
    m.sobrenome_professor,
    m.telefone_professor,
    m.codigo_disciplina,
    m.ano_letivo,
    m.semestre
FROM Ministra m
JOIN Chefe c
  ON m.nome_professor = c.nome_professor
 AND m.sobrenome_professor = c.sobrenome_professor
 AND m.telefone_professor = c.telefone_professor;


--view materializada
CREATE MATERIALIZED VIEW Aprovados2025_1 AS
SELECT
    m.nome_aluno,
    m.sobrenome_aluno,
    m.telefone_aluno,
    m.codigo_disciplina,
    AVG(n.numero) AS media_final
FROM
    Matricula m
JOIN
    Notas n ON
        m.nome_aluno = n.nome_aluno AND
        m.sobrenome_aluno = n.sobrenome_aluno AND
        m.telefone_aluno = n.telefone_aluno AND
        m.codigo_disciplina = n.codigo_disciplina AND
        m.ano_letivo = n.ano_letivo AND
        m.semestre = n.semestre
WHERE
    m.ano_letivo = 2025 AND m.semestre = 1
GROUP BY
    m.nome_aluno, m.sobrenome_aluno, m.telefone_aluno, m.codigo_disciplina
HAVING
    AVG(n.numero) >= 5.0;

SELECT * FROM Aprovados2025_1 para listar todos os alunos aprovados no 1 semestre de 2025

--view simples
CREATE VIEW Grade_Curricular AS
SELECT
    c.codigo AS codigo_curso,
    c.nome AS nome_curso,
    cp.codigo_disciplina
FROM Curso c
JOIN Composicao cp ON c.codigo = cp.codigo_curso;
