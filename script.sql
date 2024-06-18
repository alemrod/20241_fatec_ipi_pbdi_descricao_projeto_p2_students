CREATE TABLE alunos (
    id serial PRIMARY KEY,
    nome VARCHAR(255),
    status VARCHAR(50),
    pai_formacao VARCHAR(50),
    mae_formacao VARCHAR(50),
    estuda_sozinho BOOLEAN,
    salario DECIMAL(10, 2),
    frequencia_estudos VARCHAR(50)
);