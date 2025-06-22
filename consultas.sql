--1) listar todos os alunos matriculados na Disciplina de código SCC0270 no 1 semestre de 2025
SELECT
    m.nome_aluno,
    m.sobrenome_aluno,
    m.telefone_aluno
FROM
    Matricula m
WHERE
    m.codigo_disciplina = 'SCC0270'
    AND m.ano_letivo = 2025
    AND m.semestre = 1;

--2) média de notas da aluna Leticia Barbanera, cujo telefone é 017981215023, na disciplina SCC0270, no 1 semestre de 2025
SELECT
    AVG(n.numero) AS media_notas
FROM
    Notas n
JOIN
    Matricula m ON
        n.nome_aluno = m.nome_aluno AND
        n.sobrenome_aluno = m.sobrenome_aluno AND
        n.telefone_aluno = m.telefone_aluno AND
        n.ano_letivo = m.ano_letivo AND
        n.semestre = m.semestre AND
        n.codigo_disciplina = m.codigo_disciplina
WHERE
    m.nome_aluno = 'Leticia'
    AND m.sobrenome_aluno = 'Barbanera'
    AND m.telefone_aluno = '017981215023'
    AND m.codigo_disciplina = 'SCC0270'
    AND m.ano_letivo = 2025
    AND m.semestre = 1;

--3) todos os nomes e seus respectivos códigos de todas as disciplinas ministradas pela professora Mirela Cazzolato, de telefone 016991046788, no 2 semestre de 2024
SELECT
    d.codigo
FROM
    Ministra m
JOIN
    Disciplina d ON m.codigo_disciplina = d.codigo
WHERE
    m.nome_professor = 'Mirela'
    AND m.sobrenome_professor = 'Cazzolato'
    AND m.telefone_professor = '016991046788'
    AND m.ano_letivo = 2024
    AND m.semestre = 2;

--4) disciplinas que receberam mais de 3 avaliações na tabela Avaliacao_Disciplina e que tiveram média inferior a 5.0 em pelo menos um dos critérios
  SELECT
    d.codigo
FROM
    Disciplina d
JOIN
    Avaliacao_Disciplina a ON d.codigo = a.codigo_disciplina
GROUP BY
    d.codigo
HAVING
    COUNT(*) > 3 AND (
        AVG(a.nota_conteudo) < 5.0 OR
        AVG(a.nota_material) < 5.0 OR
        AVG(a.nota_infraestrutura) < 5.0
    );

--5) nomes e telefones dos alunos que têm bolsa maior que 1532 em qualquer matrícula.
SELECT
    nome_aluno,
    sobrenome_aluno,
    telefone_aluno
FROM
    Matricula
WHERE
    bolsa > 1532;
o nome das disciplinas que foram ministradas, mas não receberam nenhuma avaliação de disciplina
SELECT DISTINCT d.codigo
FROM Ministra m
JOIN Disciplina d ON m.codigo_disciplina = d.codigo
LEFT JOIN Avaliacao_Disciplina a
    ON m.codigo_disciplina = a.codigo_disciplina
    AND m.ano_letivo = a.ano_letivo
    AND m.semestre = a.semestre
WHERE a.codigo_disciplina IS NULL;

--6) professores que ministraram a mesma disciplina por 2 anos consecutivos
SELECT DISTINCT
    p.nome,
    p.sobrenome,
    m1.codigo_disciplina
FROM
    Ministra m1
JOIN
    Ministra m2 ON
        m1.nome_professor = m2.nome_professor AND
        m1.sobrenome_professor = m2.sobrenome_professor AND
        m1.telefone_professor = m2.telefone_professor AND
        m1.codigo_disciplina = m2.codigo_disciplina AND
        m1.ano_letivo = m2.ano_letivo - 1
JOIN
    Professor p ON
        m1.nome_professor = p.nome AND
        m1.sobrenome_professor = p.sobrenome AND
        m1.telefone_professor = p.telefone;
