CREATE TABLE Informacoes_Geograficas (
    cidade VARCHAR(50) PRIMARY KEY,
    estado VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE Unidade_Escolar (
    campus VARCHAR(50),
    bloco VARCHAR(20),
    cidade VARCHAR(50),
    PRIMARY KEY (campus),
    FOREIGN KEY (cidade) REFERENCES Informacoes_Geograficas(cidade)
);

CREATE TABLE Departamento (
    codigo VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Curso (
    codigo VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100),
    nivel_ensino VARCHAR(50),
    carga_horaria INT,
    numero_vagas INT,
    ementa TEXT,
    codigo_departamento VARCHAR(20),
    campus VARCHAR(50),
    FOREIGN KEY (codigo_departamento) REFERENCES Departamento(codigo),
    FOREIGN KEY (campus) REFERENCES Unidade_Escolar(campus)
);

CREATE TABLE Disciplina (
    codigo VARCHAR(20) PRIMARY KEY,
    aulas_semanal INT,
    material_didatico VARCHAR(100),
    campus VARCHAR(50),
    FOREIGN KEY (campus) REFERENCES Unidade_Escolar(campus)
);

CREATE TABLE Turma (
    ano_letivo INT,
    semestre INT,
    codigo_disciplina VARCHAR(20),
    n_alunos INT,
    sala VARCHAR(20),
    PRIMARY KEY (ano_letivo, semestre, codigo_disciplina),
    FOREIGN KEY (codigo_disciplina) REFERENCES Disciplina(codigo)
);

CREATE TABLE Informacoes_Salas (
    sala VARCHAR(20) PRIMARY KEY,
    capacidade_max INT
);

CREATE TABLE Infraestrutura (
    codigo_curso VARCHAR(20),
    equipamento VARCHAR(100),
    PRIMARY KEY (codigo_curso, equipamento),
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo)
);

CREATE TABLE Regras (
    codigo_curso VARCHAR(20) PRIMARY KEY,
    criterios_aprovacao TEXT,
    frequencia_minima INT,
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo)
);

CREATE TABLE Usuario (
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    telefone VARCHAR(20),
    telefone_fixo VARCHAR(20),
    rua VARCHAR(100),
    bairro VARCHAR(50),
    numero_residencial INT,
    complemento VARCHAR(50),
    data_nascimento DATE,
    sexo VARCHAR(10),
    email VARCHAR(100),
    senha VARCHAR(100),
    vinculo VARCHAR(30),
    PRIMARY KEY (nome, sobrenome, telefone)
);

CREATE TABLE Aluno (
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    telefone VARCHAR(20),
    campus VARCHAR(50),

    PRIMARY KEY (nome, sobrenome, telefone),
    FOREIGN KEY (nome, sobrenome, telefone)
        REFERENCES Usuario (nome, sobrenome, telefone),
    FOREIGN KEY (campus)
        REFERENCES Unidade_Escolar (campus)
);

CREATE TABLE Professor (
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    telefone VARCHAR(20),
    especializacao VARCHAR(100),
    titulacao VARCHAR(100),
    campus VARCHAR(50),

    PRIMARY KEY (nome, sobrenome, telefone),
    FOREIGN KEY (nome, sobrenome, telefone)
        REFERENCES Usuario (nome, sobrenome, telefone),
    FOREIGN KEY (campus)
        REFERENCES Unidade_Escolar (campus)
);

CREATE TABLE Mensagem (
    nome_remetente VARCHAR(50),
    sobrenome_remetente VARCHAR(50),
    telefone_remetente VARCHAR(20),
    nome_destinatario VARCHAR(50),
    sobrenome_destinatario VARCHAR(50),
    telefone_destinatario VARCHAR(20),
    data_envio TIMESTAMP,
    aviso_mensagem_SN BOOLEAN,
    texto TEXT,
    PRIMARY KEY (nome_remetente, sobrenome_remetente, telefone_remetente, nome_destinatario, sobrenome_destinatario, telefone_destinatario, data_envio),
    FOREIGN KEY (nome_remetente, sobrenome_remetente, telefone_remetente)
        REFERENCES Usuario (nome, sobrenome, telefone),

    FOREIGN KEY (nome_destinatario, sobrenome_destinatario, telefone_destinatario)
        REFERENCES Usuario (nome, sobrenome, telefone)
);

CREATE TABLE Matricula (
    nome_aluno VARCHAR(50),
    sobrenome_aluno VARCHAR(50),
    telefone_aluno VARCHAR(20),
    ano_letivo INT,
    semestre INT,
    codigo_disciplina VARCHAR(20),
    status_matricula VARCHAR(30),
    data_matricula DATE,
    data_limite_confirmacao DATE,
    data_cancelamento DATE,
    data_efetivacao DATE,
    bolsa NUMERIC,
    taxas NUMERIC,
    status_pagamento VARCHAR(30),

    PRIMARY KEY (nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina),

    FOREIGN KEY (nome_aluno, sobrenome_aluno, telefone_aluno)
        REFERENCES Usuario (nome, sobrenome, telefone),

    FOREIGN KEY (codigo_disciplina)
        REFERENCES Disciplina (codigo)
);

CREATE TABLE Notas (
    avaliacao VARCHAR(50),
    nome_aluno VARCHAR(50),
    sobrenome_aluno VARCHAR(50),
    telefone_aluno VARCHAR(20),
    ano_letivo INT,
    semestre INT,
    codigo_disciplina VARCHAR(20),
    numero NUMERIC,

    PRIMARY KEY (
        avaliacao, nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina),

    FOREIGN KEY (nome_aluno, sobrenome_aluno, telefone_aluno,ano_letivo, semestre, codigo_disciplina) 
        REFERENCES Matricula (nome_aluno, sobrenome_aluno, telefone_aluno,ano_letivo, semestre, codigo_disciplina)
);

CREATE TABLE Avaliacao_Disciplina (
    nome_aluno VARCHAR(50),
    sobrenome_aluno VARCHAR(50),
    telefone_aluno VARCHAR(20),
    ano_letivo INT,
    semestre INT,
    codigo_disciplina VARCHAR(20),
    comentario TEXT,
    nota_infraestrutura NUMERIC,
    nota_conteudo NUMERIC,
    nota_material NUMERIC,

    FOREIGN KEY (nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina)
        REFERENCES Matricula (nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina)
);

CREATE TABLE Chefe (
    nome_professor VARCHAR(50),
    sobrenome_professor VARCHAR(50),
    telefone_professor VARCHAR(20),
    codigo_departamento VARCHAR(20),
    data_inicio DATE,
    data_termino DATE,

    PRIMARY KEY (nome_professor, sobrenome_professor, telefone_professor, codigo_departamento, data_inicio),

    FOREIGN KEY (nome_professor, sobrenome_professor, telefone_professor)
        REFERENCES Professor (nome, sobrenome, telefone),
    FOREIGN KEY (codigo_departamento)
        REFERENCES Departamento (codigo)
);

CREATE TABLE Ministra (
    nome_professor VARCHAR(50),
    sobrenome_professor VARCHAR(50),
    telefone_professor VARCHAR(20),
    codigo_disciplina VARCHAR(20),
    semestre INT,
    ano_letivo INT,

    PRIMARY KEY (nome_professor, sobrenome_professor, telefone_professor, codigo_disciplina, semestre, ano_letivo),

    FOREIGN KEY (nome_professor, sobrenome_professor, telefone_professor)
        REFERENCES Professor (nome, sobrenome, telefone),
    FOREIGN KEY (codigo_disciplina)
        REFERENCES Disciplina (codigo)
);

CREATE TABLE Avaliacao_Professor (
    nome_aluno VARCHAR(50),
    sobrenome_aluno VARCHAR(50),
    telefone_aluno VARCHAR(20),
    ano_letivo INT,
    semestre INT,
    codigo_disciplina VARCHAR(20),
    nome_professor VARCHAR(50),
    sobrenome_professor VARCHAR(50),
    telefone_professor VARCHAR(20),
    comentario TEXT,
    nota_didatico NUMERIC,

    FOREIGN KEY (nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina)
        REFERENCES Matricula (nome_aluno, sobrenome_aluno, telefone_aluno, ano_letivo, semestre, codigo_disciplina),

    FOREIGN KEY (nome_professor, sobrenome_professor, telefone_professor, codigo_disciplina, semestre, ano_letivo)
        REFERENCES Ministra (nome_professor, sobrenome_professor, telefone_professor, codigo_disciplina, semestre, ano_letivo)
);

CREATE TABLE PreRequisitos_Cursos (
    codigo_curso_que_exige VARCHAR(20),
    codigo_curso_exigido VARCHAR(20),

    PRIMARY KEY (codigo_curso_que_exige, codigo_curso_exigido),

    FOREIGN KEY (codigo_curso_que_exige) REFERENCES Curso(codigo),
    FOREIGN KEY (codigo_curso_exigido) REFERENCES Curso(codigo)
);

CREATE TABLE PreRequisitos_CursoDisciplina (
    codigo_curso_que_exige VARCHAR(20),
    codigo_disciplina_exigida VARCHAR(20),

    PRIMARY KEY (codigo_curso_que_exige, codigo_disciplina_exigida),

    FOREIGN KEY (codigo_curso_que_exige) REFERENCES Curso(codigo),
    FOREIGN KEY (codigo_disciplina_exigida) REFERENCES Disciplina(codigo)
);

CREATE TABLE PreRequisitos_Disciplinas (
    codigo_disciplina_que_exige VARCHAR(20),
    codigo_disciplina_exigida VARCHAR(20),

    PRIMARY KEY (codigo_disciplina_que_exige, codigo_disciplina_exigida),

    FOREIGN KEY (codigo_disciplina_que_exige) REFERENCES Disciplina(codigo),
    FOREIGN KEY (codigo_disciplina_exigida) REFERENCES Disciplina(codigo)
);

CREATE TABLE Composicao (
    codigo_curso VARCHAR(20),
    codigo_disciplina VARCHAR(20),

    PRIMARY KEY (codigo_curso, codigo_disciplina),

    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo),
    FOREIGN KEY (codigo_disciplina) REFERENCES Disciplina(codigo)
);
