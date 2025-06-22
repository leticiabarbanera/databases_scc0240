--1) recuperação das mensagens em ordem cronológica
CREATE INDEX idx_data_envio ON Mensagem USING BRIN (data_envio)

--2) disciplinas ministradas por cada prof
CREATE INDEX idx_ministra_professor ON Ministra (nome_professor, sobrenome_professor, telefone_professor);

--3) disciplinas oferecidas em cada período
CREATE INDEX idx_matricula_data ON Matricula (ano_letivo, semestre, codigo_disciplina);
