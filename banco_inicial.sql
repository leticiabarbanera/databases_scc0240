INSERT INTO Informacoes_Salas (sala, capacidade_max) VALUES ('102A', 50) ON CONFLICT DO NOTHING;
INSERT INTO Informacoes_Salas (sala, capacidade_max) VALUES ('105A', 50) ON CONFLICT DO NOTHING;
INSERT INTO Informacoes_Salas (sala, capacidade_max) VALUES ('106B', 50) ON CONFLICT DO NOTHING;
INSERT INTO Informacoes_Salas (sala, capacidade_max) VALUES ('205C', 50) ON CONFLICT DO NOTHING;
INSERT INTO Informacoes_Salas (sala, capacidade_max) VALUES ('304D', 50) ON CONFLICT DO NOTHING;
INSERT INTO Informacoes_Salas (sala, capacidade_max) VALUES ('107C', 50) ON CONFLICT DO NOTHING;
INSERT INTO Informacoes_Salas (sala, capacidade_max) VALUES ('108A', 50) ON CONFLICT DO NOTHING;

INSERT INTO Usuario (
    nome, sobrenome, telefone, telefone_fixo,
    rua, bairro, numero_residencial, complemento,
    data_nascimento, sexo, email, senha, vinculo) VALUES
('Leticia', 'Barbanera', '017981215600', NULL, 'Rua Nova', 'Centro', 150, NULL, '2002-05-12', 'F', 'leticia2@usp.br', 'senha123', 'Aluno')
ON CONFLICT DO NOTHING;

INSERT INTO Informacoes_Geograficas (cidade, estado, pais) VALUES ('São Carlos', 'SP', 'Brasil') ON CONFLICT DO NOTHING;

INSERT INTO Unidade_Escolar (campus, bloco, cidade) VALUES ('ICMC', 'Bloco C', 'São Carlos') ON CONFLICT DO NOTHING;

INSERT INTO Disciplina (codigo, aulas_semanal, material_didatico, campus) VALUES
('MAC0310', 4, 'Estruturas Discretas', 'ICMC'),
('SCC0430', 3, 'Tópicos Avançados em Computação', 'ICMC')
ON CONFLICT DO NOTHING;

INSERT INTO Disciplina (codigo, aulas_semanal, material_didatico, campus) VALUES 
('SCC0251', 4, 'Livro Texto de Algoritmos II', 'ICMC'),
('SCC0270', 3, 'Banco de Dados - Norvig', 'ICMC'),
('SCC0201', 4, 'Algoritmos e Estruturas de Dados', 'ICMC')
 ON CONFLICT DO NOTHING;

INSERT INTO Informacoes_Geograficas (cidade, estado, pais) VALUES
('São Paulo', 'SP', 'Brasil'),
('Ribeirão Preto', 'SP', 'Brasil'),
('Piracicaba', 'SP', 'Brasil'),
('Bauru', 'SP', 'Brasil')
ON CONFLICT DO NOTHING;

INSERT INTO Unidade_Escolar (campus, bloco, cidade) VALUES
('Butantã', 'Bloco A', 'São Paulo'),
('Ribeirão', 'Bloco B', 'Ribeirão Preto'),
('ESALQ', 'Bloco D', 'Piracicaba'),
('FOB', 'Bloco E', 'Bauru')
ON CONFLICT DO NOTHING;

INSERT INTO Informacoes_Salas (sala, capacidade_max) VALUES
('101A', 50),
('203B', 45),
('204C', 50),
('301D', 60)
ON CONFLICT DO NOTHING;

INSERT INTO Departamento (codigo, nome) VALUES
('SCC', 'Ciências de Computação'),
('SME', 'Estatística'),
('SMA', 'Matemática Aplicada')
ON CONFLICT DO NOTHING;

INSERT INTO Curso (codigo, nome, nivel_ensino, carga_horaria, numero_vagas, ementa, codigo_departamento, campus) VALUES
('BCC001', 'Ciência da Computação', 'Bacharelado', 3000, 30, 'Estudo de algoritmos, estruturas de dados, software e sistemas.', 'SCC', 'ICMC'),
('BCD002', 'Ciência de Dados', 'Bacharelado', 3000, 84, 'Análise de dados, estatística, programação e aprendizado de máquina.', 'SCC', 'ICMC'),
('BST003', 'Estatística', 'Bacharelado', 2900, 68, 'Teoria estatística, inferência, análise de dados e modelagem.', 'SME', 'ICMC'),
('BSI004', 'Sistemas de Informação', 'Bacharelado', 70, 3000, 'Engenharia de software, bancos de dados, redes e gestão da informação.', 'SCC', 'ICMC'),
('BMA005', 'Matemática Aplicada', 'Bacharelado', 3000, 120, 'Modelagem matemática, computação científica e aplicações.', 'SMA', 'ICMC')
ON CONFLICT DO NOTHING;

INSERT INTO PreRequisitos_Cursos (codigo_curso_que_exige, codigo_curso_exigido) VALUES
('BCC001', 'BSI004'),
('BCD002', 'BMA005'),
('BCC001', 'BST003')
ON CONFLICT DO NOTHING;

INSERT INTO Disciplina (codigo, aulas_semanal, material_didatico, campus) VALUES
('SME0221', 3, 'Inferência Estatística - Casella & Berger', 'ICMC'),
('MAT0361', 5, 'Cálculo 1 - Stewart', 'ICMC'),
('MAC0122', 3, 'Programação Orientada a Objetos', 'ICMC'),
('SCC0251', 4, 'Computação Gráfica.', 'ICMC'),
('SCE1100', 2, 'Redes de Computadores - Tanenbaum', 'ICMC'),
('SMA0300', 3, 'Álgebra Linear', 'ICMC'),
('SCC0503', 2, 'Inteligência Artificial - Russell & Norvig', 'ICMC'),
('SCC0210', 4, 'Introdução à Ciência da Computação em C', 'ICMC')
ON CONFLICT DO NOTHING;

INSERT INTO PreRequisitos_CursoDisciplina (
    codigo_curso_que_exige, codigo_disciplina_exigida) VALUES
('BCD002', 'SCC0251'),
('BCD002', 'SCC0503')
ON CONFLICT DO NOTHING;

INSERT INTO PreRequisitos_Disciplinas (
    codigo_disciplina_que_exige, codigo_disciplina_exigida
) VALUES
('SCC0270', 'SCC0201'),  
('SCC0503', 'SCC0270'),  
('SMA0300', 'MAT0361')
ON CONFLICT DO NOTHING;

 INSERT INTO Turma (ano_letivo, semestre, codigo_disciplina, n_alunos, sala) VALUES
(2024, 1, 'SCC0201', 45, '101A'),
(2024, 2, 'SCC0270', 38, '203B'),
(2024, 1, 'SCC0270', 38, '203B'),
(2024, 1, 'SME0221', 50, '102A'),
(2025, 1, 'SCC0270', 42, '204C'),
(2025, 1, 'SCC0201', 46, '105A'),
(2025, 1, 'MAT0361', 40, '301D'),
(2025, 2, 'SCC0503', 37, '205C'),
(2025, 2, 'SMA0300', 41, '106B'),
(2024, 2, 'SCC0251', 35, '304D'),
(2024, 1, 'SCE1100', 48, '107C'),
(2025, 2, 'MAC0122', 44, '108A'),
(2024, 2, 'SME0221', 32, '105F'),
(2024, 2, 'MAT0361', 40, '301D'),
(2025, 2, 'SCC0201', 42, '105B'),
(2025, 1, 'SCC0210', 23, '109A')
ON CONFLICT DO NOTHING;

INSERT INTO Usuario (nome, sobrenome, telefone, telefone_fixo,
    rua, bairro, numero_residencial, complemento, data_nascimento, sexo, email, senha, vinculo) VALUES
('Leticia', 'Barbanera', '017981215023', '01633331111', 'Av. Brasil', 'Centro', 123, 'Apto 1', '2002-05-12', 'F', 'leticia@usp.br', 'senha123', 'Aluno'),
('Julia', 'Pravato', '017981215100', '01633332222', 'Rua das Flores', 'Jardins', 456, NULL, '2001-08-03', 'F', 'julia@usp.br', 'senha123', 'Aluno'),
('Murilo', 'Lirani', '017981215200', '01633333333', 'Rua A', 'Vila Nova', 789, NULL, '2000-11-20', 'M', 'murilo@usp.br', 'senha123', 'Aluno'),
('Marcos', 'Costa', '017981215300', '01633334444', 'Av. das Nações', 'Centro', 101, NULL, '2001-01-08', 'M', 'marcos@usp.br', 'senha123', 'Aluno'),
('Carla', 'Fernandes', '017981215400', NULL, 'Rua do Sol', 'Centro', 204, NULL, '2002-09-12', 'F', 'carla@usp.br', 'senha123', 'Aluno'),
('João', 'Silveira', '017981215401', NULL, 'Rua Amapá', 'Jardins', 303, NULL, '2000-03-30', 'M', 'joao@usp.br', 'senha123', 'Aluno'),
('Amanda', 'Vieira', '017981215402', NULL, 'Av. Aurora', 'Centro', 404, NULL, '2001-02-02', 'F', 'amanda@usp.br', 'senha123', 'Aluno'),
('Tiago', 'Pires', '017981215403', NULL, 'Rua H', 'Jardins', 405, NULL, '2000-07-19', 'M', 'tiago@usp.br', 'senha123', 'Aluno'),
('Renata', 'Dias', '017981215404', NULL, 'Rua I', 'Jardins', 406, NULL, '1999-03-04', 'F', 'renata@usp.br', 'senha123', 'Aluno'),
('Daniel', 'Souza', '017981215405', NULL, 'Rua J', 'Centro', 407, NULL, '2003-12-15', 'M', 'daniel@usp.br', 'senha123', 'Aluno'),
('Mirela', 'Cazzolato', '016991046788', '01632220000', 'Av. Rebouças', 'Centro', 900, NULL, '1980-01-01', 'F', 'mirela@icmc.usp.br', 'senha123', 'Professor'),
('Caetano', 'Traina', '016991011111', '01632221111', 'Rua X', 'Centro', 901, NULL, '1975-02-01', 'M', 'traina@icmc.usp.br', 'senha123', 'Professor'),
('Solange', 'Ribeiro', '016991022222', '01632222222', 'Rua Y', 'Centro', 902, NULL, '1970-03-01', 'F', 'solange@icmc.usp.br', 'senha123', 'Professor'),
('Maria', 'Cristina', '016991033333', '01632223333', 'Rua Z', 'Centro', 903, NULL, '1985-04-01', 'F', 'maria@icmc.usp.br', 'senha123', 'Professor'),
('Alneu', 'Souza', '016991044444', '01632224444', 'Rua W', 'Centro', 904, NULL, '1982-05-01', 'M', 'alneu@icmc.usp.br', 'senha123', 'Professor'),
('Bruna', 'Silva', '017981215406', NULL, 'Rua E', 'Centro', 111, NULL, '2000-06-22', 'F', 'bruna@usp.br', 'senha123', 'Funcionario'),
('Felipe', 'Rocha', '017981215407', NULL, 'Rua F', 'Vila Lobos', 112, NULL, '2002-10-10', 'M', 'felipe@usp.br', 'senha123', 'Funcionario'),
('Helena', 'Lopes', '017981215408', NULL, 'Rua K', 'Centro', 113, NULL, '2002-01-11', 'F', 'helena@usp.br', 'senha123', 'Funcionario'),
('Gabriel', 'Martins', '017981215409', NULL, 'Rua L', 'Jardins', 114, NULL, '2000-05-09', 'M', 'gabriel@usp.br', 'senha123', 'Funcionario')
ON CONFLICT DO NOTHING;

INSERT INTO Aluno (nome, sobrenome, telefone, campus) VALUES
('Leticia', 'Barbanera', '017981215023', 'ICMC'),
('Julia', 'Pravato', '017981215100', 'ICMC'),
('Murilo', 'Lirani', '017981215200', 'ICMC'),
('Marcos', 'Costa', '017981215300', 'ICMC'),
('Carla', 'Fernandes', '017981215400', 'ICMC'),
('João', 'Silveira', '017981215401', 'ICMC'),
('Amanda', 'Vieira', '017981215402', 'ICMC'),
('Tiago', 'Pires', '017981215403', 'ICMC'),
('Renata', 'Dias', '017981215404', 'ICMC'),
('Daniel', 'Souza', '017981215405', 'ICMC'), 
('Lucas', 'Ferreira', '017982315678', 'ICMC'),
('Mariana', 'Silva', '017983412567', 'ICMC'),
('Pedro', 'Oliveira', '017984523456', 'ICMC'),
('Ana', 'Souza', '017985634512', 'ICMC'),
('Bruno', 'Almeida', '017986745621', 'ICMC'),
('Juliana', 'Martins', '017987856734', 'ICMC'),
('Felipe', 'Lima', '017988967845', 'ICMC'),
('Camila', 'Rocha', '017989078956', 'ICMC'),
('Rafael', 'Carvalho', '017980189067', 'ICMC'),
('Larissa', 'Barbosa', '017981290178', 'ICMC'),
('Gustavo', 'Mendes', '017982301289', 'ICMC'),
('Beatriz', 'Ribeiro', '017983412390', 'ICMC'),
('Thiago', 'Pereira', '017984523401', 'ICMC')
ON CONFLICT DO NOTHING;

INSERT INTO Matricula (nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina,
    status_matricula, data_matricula, data_limite_confirmacao data_cancelamento, data_efetivacao, bolsa, taxas, status_pagamento) VALUES
('Leticia', 'Barbanera', '017981215023', 2025, 1, 'SCC0270', 'Efetivada', '2025-01-30', '2025-02-15', NULL, '2025-02-01', 1200, 200, 'Pago'),
('Leticia', 'Barbanera', '017981215023', 2025, 2, 'SMA0300', 'Efetivada', '2025-01-29', '2025-02-15', NULL, '2025-08-01', 2000, 150, 'Pago'),
('Leticia', 'Barbanera', '017981215023', 2024, 2, 'SME0221', 'Cancelada', '2024-07-25', '2024-08-05', '2024-11-10', NULL, 800, 180, 'Isento'),
('Julia', 'Pravato', '017981215100', 2025, 1, 'SCC0270', 'Efetivada', '2025-01-26', '2025-02-10', NULL, '2025-02-03', 950, 190, 'Pago'),
('Julia', 'Pravato', '017981215100', 2024, 2, 'SME0221', 'Efetivada', '2024-07-28', '2024-08-10', NULL, '2024-08-10', 750, 120, 'Pago'),
('Julia', 'Pravato', '017981215100', 2025, 2, 'SMA0300', 'Efetivada', '2025-01-28', '2025-02-20', NULL, '2025-08-15', 1100, 220, 'Pago'),
('Murilo', 'Lirani', '017981215200', 2025, 1, 'SCC0201', 'Efetivada', '2025-01-25', '2025-02-08', NULL, '2025-02-02', 1830, 200, 'Pago'),
('Murilo', 'Lirani', '017981215200', 2025, 2, 'SCC0503', 'Efetivada', '2025-02-01', '2025-02-25', NULL, '2025-08-01', 1604, 150, 'Pago'),
('Murilo', 'Lirani', '017981215200', 2024, 2, 'SME0221', 'Cancelada', '2024-07-20', '2024-08-03', '2024-11-10', NULL, 700, 100, 'Inadimplente'),
('Marcos', 'Costa', '017981215300', 2025, 1, 'MAT0361', 'Efetivada', '2025-01-27', '2025-02-10', NULL, '2025-02-05', 1300, 250, 'Pago'),
('Marcos', 'Costa', '017981215300', 2025, 2, 'SMA0300', 'Efetivada', '2025-01-29', '2025-02-22', NULL, '2025-08-05', 900, 180, 'Pago'),
('Marcos', 'Costa', '017981215300', 2024, 2, 'SME0221', 'Cancelada', '2024-07-18', '2024-08-01', '2024-10-01', NULL, 640, 90, 'Isento'),
('Leticia', 'Barbanera', '017981215023', 2025, 2, 'SCC0503', 'Efetivada', '2025-02-02', '2025-02-27', NULL, '2025-03-01', 800.00, 150.00, 'Pago'),
('Leticia', 'Barbanera', '017981215023', 2024, 2, 'MAT0361', 'Efetivada', '2024-07-30', '2024-08-15', NULL, '2024-08-15', 700.00, 120.00, 'Pago'),
('Julia', 'Pravato', '017981215100', 2025, 2, 'SCC0201', 'Efetivada', '2025-02-01', '2025-02-26', NULL, '2025-03-03', 900.00, 100.00, 'Pago'),
('Julia', 'Pravato', '017981215100', 2024, 2, 'SCC0503', 'Efetivada', '2024-07-25', '2024-08-10', NULL, '2024-08-10', 600.00, 90.00, 'Pago'),
('Murilo', 'Lirani', '017981215200', 2024, 2, 'MAT0361', 'Efetivada', '2024-07-27', '2024-08-15', NULL, '2024-08-18', 850.00, 110.00, 'Pago'),
('Murilo', 'Lirani', '017981215200', 2025, 1, 'SCC0270', 'Efetivada', '2025-01-28', '2025-02-10', NULL, '2025-02-10', 1000.00, 150.00, 'Pago'),
('Marcos', 'Costa', '017981215300', 2025, 2, 'SCC0503', 'Efetivada', '2025-02-03', '2025-02-28', NULL, '2025-03-05', 750.00, 100.00, 'Pago'),
('Murilo', 'Lirani', '017981215200', 2025, 2, 'SCC0270', 'Efetivada', '2025-02-02', '2025-02-25', NULL, '2025-02-10', 1000.00, 150.00, 'Pago'),
('Murilo', 'Lirani', '017981215200', 2025, 2, 'SCC0503', 'Efetivada', '2025-02-03', '2025-02-25', NULL, '2024-08-10', 600.00, 90.00, 'Pago')
ON CONFLICT DO NOTHING;

INSERT INTO Avaliacao_Disciplina (nome_aluno, sobrenome_aluno, telefone_aluno,
    ano_letivo, semestre, codigo_disciplina, comentario, nota_infraestrutura, nota_conteudo, nota_material) VALUES
('Leticia', 'Barbanera', '017981215023', 2025, 1, 'SCC0270', 'Boa estrutura da disciplina.', 8.0, 9.0, 8.5),
('Julia', 'Pravato', '017981215100', 2025, 1, 'SCC0270', 'Material didático poderia ser melhor.', 7.0, 8.5, 6.5),
('Murilo', 'Lirani', '017981215200', 2025, 1, 'SCC0201', 'Conteúdo bem distribuído.', 8.0, 9.0, 7.5),
('Marcos', 'Costa', '017981215300', 2025, 1, 'MAT0361', 'Infraestrutura deixa a desejar.', 5.5, 8.0, 6.0),
('Murilo', 'Lirani', '017981215200', 2025, 2, 'SCC0503', 'Aulas práticas foram bem aproveitadas.', 8.5, 9.0, 8.5),
('Murilo', 'Lirani', '017981215200', 2025, 2, 'SCC0270', 'Conteúdo teórico poderia ser aprofundado.', 7.0, 6.5, 7.5),
('Leticia', 'Barbanera', '017981215023', 2025, 2, 'SMA0300', 'Estrutura boa, mas conteúdo denso.', 5.0, 5.5, 4.0),
('Leticia', 'Barbanera', '017981215023', 2024, 2, 'SME0221', 'Didática ótima e bem organizada.', 9.0, 9.0, 9.0),
('Murilo', 'Lirani', '017981215200', 2024, 2, 'MAT0361', 'Muito conteúdo, mas bem explicado.', 8.0, 8.5, 8.0),
('Marcos', 'Costa', '017981215300', 2025, 2, 'SCC0503', 'Faltaram exemplos práticos.', 6.5, 7.0, 6.0),
('Julia', 'Pravato', '017981215100', 2025, 2, 'SMA0300', 'Esperava mais. Não sinto que aprendi', 5.0, 6.0, 5.0),
('Marcos', 'Costa', '017981215300', 2025, 2, 'SMA0300', 'Ensino péssimo, aula difícil de acompanhar', 4.0, 4.5, 3.0)
ON CONFLICT DO NOTHING;

INSERT INTO Professor (nome, sobrenome, telefone, especializacao, titulacao, campus) VALUES
('Mirela', 'Cazzolato', '016991046788', 'Bancos de Dados', 'Doutora', 'ICMC'),
('Caetano', 'Traina', '016991011111', 'Sistemas Inteligentes', 'Doutor', 'ICMC'),
('Solange', 'Ribeiro', '016991022222', 'Visualização Computacional', 'Doutora', 'ICMC'),
('Maria', 'Cristina', '016991033333', 'Estruturas de Dados', 'Doutora', 'ICMC'),
('Alneu', 'Souza', '016991044444', 'Engenharia de Software', 'Doutor', 'ICMC'),
('André', 'Ponce', '016992157899', 'Inteligência Artificial', 'Doutor', 'ICMC'),
('Cristina', 'Aguiar', '016993268900', 'Redes de Computadores', 'Mestre', 'ICMC'),
('Fernando', 'Osorio', '016994379011', 'Estruturas de Dados', 'Doutor', 'ICMC'),
('Thiago', 'Pardo', '016995480122', 'Computação Gráfica', 'Doutora', 'ICMC'),
('Ricardo', 'Macarccini', '016996591233', 'Algoritmos', 'Doutor', 'ICMC'),
('Katiane', 'Silva', '016997602344', 'Engenharia de Software', 'Mestre', 'ICMC'),
('Eduardo', 'Simoes', '016998713455', 'Sistemas Distribuídos', 'Doutor', 'ICMC'),
('Roseli', 'Aparecido', '016999824566', 'Processamento de Imagens', 'Doutora', 'ICMC'),
('Marcelo', 'Manzato', '016990935677', 'Programação Competitiva', 'Doutor', 'ICMC'),
('Francisco', 'Rodrigues', '016991046788', 'Computação em Nuvem', 'Mestre', 'ICMC'),
('Rudinei', 'Goularte', '016992157899', 'Mineração de Dados', 'Doutor', 'ICMC'),
('Elaine', 'Goularte', '016993268900', 'Ciência de Dados', 'Doutora', 'ICMC'),
('Joao', 'Rosa', '016994379011', 'Sistemas Operacionais', 'Mestre', 'ICMC')   
ON CONFLICT DO NOTHING;

INSERT INTO Ministra (nome_professor, sobrenome_professor, telefone_professor,
    codigo_disciplina, semestre, ano_letivo) VALUES
('Mirela', 'Cazzolato', '016991046788', 'SCC0270', 1, 2025), 
('Mirela', 'Cazzolato', '016991046788', 'SCC0270', 2, 2024),
('Mirela', 'Cazzolato', '016991046788', 'SCC0270', 1, 2024),
('Caetano', 'Traina', '016991011111', 'SCC0201', 1, 2025),
('Caetano', 'Traina', '016991011111', 'SCC0201', 2, 2025),
('Caetano', 'Traina', '016991011111', 'MAT0361', 2, 2024),
('Solange', 'Ribeiro', '016991022222', 'MAT0361', 1, 2025),
('Solange', 'Ribeiro', '016991022222', 'SME0221', 1, 2024),
('Solange', 'Ribeiro', '016991022222', 'MAC0122', 2, 2025),
('Maria', 'Cristina', '016991033333', 'SME0221', 2, 2024),
('Alneu', 'Souza', '016991044444', 'SCC0503', 2, 2025),
('Alneu', 'Souza', '016991044444', 'SCC0251', 2, 2024),
('Alneu', 'Souza', '016991044444', 'SCE1100', 1, 2024),
('Maria', 'Cristina', '016991033333', 'SMA0300', 2, 2025),
('Maria', 'Cristina', '016991033333', 'SCC0210', 1, 2025),
('Maria', 'Cristina', '016991033333', 'SCC0201', 1, 2024)
ON CONFLICT DO NOTHING;

INSERT INTO Avaliacao_Professor (nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina,
    nome_professor, sobrenome_professor, telefone_professor, comentario, nota_didatico) VALUES
('Leticia', 'Barbanera', '017981215023', 2025, 1, 'SCC0270', 'Mirela', 'Cazzolato', '016991046788', 'Explica muito bem, aulas claras.', 9.0),
('Julia', 'Pravato', '017981215100', 2025, 1, 'SCC0270', 'Mirela', 'Cazzolato', '016991046788', 'Boa didática, mas fala muito rápido.', 7.5),
('Murilo', 'Lirani', '017981215200', 2025, 1, 'SCC0201', 'Caetano', 'Traina', '016991011111', 'Ótimo domínio do conteúdo.', 8.5),
('Marcos', 'Costa', '017981215300', 2025, 1, 'MAT0361', 'Solange', 'Ribeiro', '016991022222', 'Precisa melhorar a interação com os alunos.', 6.5),
('Julia', 'Pravato', '017981215100', 2024, 2, 'SME0221', 'Maria', 'Cristina', '016991033333', 'Didática excelente e muito atenciosa.', 9.2),
('Murilo', 'Lirani', '017981215200', 2025, 2, 'SCC0503', 'Alneu', 'Souza', '016991044444', 'Faltou profundidade nos temas.', 6.8)
ON CONFLICT DO NOTHING;

INSERT INTO Funcionario_Administrativo (nome, sobrenome, telefone) VALUES
('Bruna', 'Silva', '017981215406'),
('Felipe', 'Rocha', '017981215407'),
('Helena', 'Lopes', '017981215408'),
('Gabriel', 'Martins', '017981215409')
ON CONFLICT DO NOTHING;

INSERT INTO Chefe (nome_professor, sobrenome_professor, telefone_professor,
    codigo_departamento, data_inicio, data_fim) VALUES
('Mirela', 'Cazzolato', '016991046788', 'SCC', '2022-01-01', '2023-12-31'),
('Maria', 'Cristina', '016991033333', 'SME', '2021-02-01', '2024-01-31'),
('Alneu', 'Souza', '016991044444', 'SCC', '2024-01-01', '2025-12-31'),
('Solange', 'Ribeiro', '016991022222', 'SMA', '2023-03-01', '2025-03-01')
ON CONFLICT DO NOTHING;

INSERT INTO Infraestrutura (codigo_curso, equipamento) VALUES
('BCC001', 'Laboratório de Computação'),
('BCD002', 'Cluster de Processamento de Dados'),
('BST003', 'Laboratório de Estatística Aplicada'),
('BMA005', 'Sala de Computação Matemática')
ON CONFLICT DO NOTHING;

INSERT INTO Regras (criterios_aprovacao, frequencia_minima, codigo_curso) VALUES
('Média final >= 5.0 e frequência >= 75%', 75, 'BCC001'),
('Nota mínima 5.0 em todas as avaliações e frequência >= 70%', 70, 'BCD002'),
('Nota final >= 6.0 ou recuperação >= 5.0', 75, 'BST003'),
('Avaliações práticas e teóricas com peso mínimo de 30%', 75, 'BSI004'),
('Média ponderada das avaliações >= 5.5 e presença mínima de 80%', 80, 'BMA005')
ON CONFLICT DO NOTHING;

INSERT INTO Composicao (codigo_curso, codigo_disciplina) VALUES
('BCD002', 'SCC0201'),  
('BCD002', 'SCC0270'),  
('BCC001', 'SCC0270'),  
('BST003', 'MAT0361'), 
('BSI004', 'SCC0503'),  
('BMA005', 'SMA0300')
ON CONFLICT DO NOTHING; 

INSERT INTO Notas (avaliacao, nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina, numero) VALUES
('P1', 'Leticia', 'Barbanera', '017981215023', 2025, 1, 'SCC0270', 6.5),
('P2', 'Leticia', 'Barbanera', '017981215023', 2025, 1, 'SCC0270', 7.0),
('Trabalho Final', 'Leticia', 'Barbanera', '017981215023', 2025, 1, 'SCC0270', 8.0),
('P1', 'Julia', 'Pravato', '017981215100', 2025, 1, 'SCC0270', 5.5),
('P2', 'Julia', 'Pravato', '017981215100', 2025, 1, 'SCC0270', 4.0),
('Trabalho Final', 'Julia', 'Pravato', '017981215100', 2025, 1, 'SCC0270', 6.0),
('P1', 'Murilo', 'Lirani', '017981215200', 2025, 1, 'SCC0201', 9.0),
('P2', 'Murilo', 'Lirani', '017981215200', 2025, 1, 'SCC0201', 8.5),
('P1', 'Marcos', 'Costa', '017981215300', 2025, 1, 'MAT0361', 6.0),
('P2', 'Marcos', 'Costa', '017981215300',  2025, 1, 'MAT0361', 7.0),
('Trabalho', 'Murilo', 'Lirani', '017981215200', 2025, 2, 'SCC0503', 9.5),
('Apresentação', 'Murilo', 'Lirani', '017981215200',  2025, 2, 'SCC0503', 8.5)
ON CONFLICT DO NOTHING;

INSERT INTO Mensagem (nome_remetente, sobrenome_remetente, telefone_remetente, nome_destinatario, 
    sobrenome_destinatario, telefone_destinatario, data_envio, aviso_mensagem_SN, texto) VALUES
('Leticia', 'Barbanera', '017981215023', 'Julia', 'Pravato', '017981215100', '2025-06-01 10:30:00', FALSE, 'Oi Ju, tudo bem com o trabalho de BD?'),
('Julia', 'Pravato', '017981215100', 'Leticia', 'Barbanera', '017981215023', '2025-06-01 10:45:00', FALSE, 'Tudo sim! Você conseguiu rodar a query com índice?'),
('Murilo', 'Lirani', '017981215200', 'Leticia', 'Barbanera', '017981215023', '2025-06-02 09:00:00', TRUE, 'Leticia, não esquece de entregar o relatório do projeto.'),
('Leticia', 'Barbanera', '017981215023', 'Murilo', 'Lirani', '017981215200', '2025-06-02 09:05:00', TRUE, 'Valeu pela lembrança!'),
('Julia', 'Pravato', '017981215100', 'Murilo', 'Lirani', '017981215200', '2025-06-02 14:00:00', FALSE, 'Murilo, me manda seu trecho da documentação.'),
('Murilo', 'Lirani', '017981215200', 'Julia', 'Pravato', '017981215100', '2025-06-02 14:20:00', FALSE, 'Acabei de te mandar no e-mail!'),
('Leticia', 'Barbanera', '017981215023', 'Marcos', 'Costa', '017981215300', '2025-06-03 08:00:00', FALSE, 'Oi Marcos, tudo pronto para a apresentação?'),
('Marcos', 'Costa', '017981215300', 'Leticia', 'Barbanera', '017981215023', '2025-06-03 08:15:00', FALSE, 'Sim! Só revisar os slides.'),
('Murilo', 'Lirani', '017981215200', 'Marcos', 'Costa', '017981215300', '2025-06-03 09:00:00', TRUE, 'Vamos nos encontrar na sala 12 às 9:30.'),
('Marcos', 'Costa', '017981215300', 'Murilo', 'Lirani', '017981215200', '2025-06-03 09:05:00', TRUE, 'Confirmado! Estarei lá.')
ON CONFLICT DO NOTHING;
