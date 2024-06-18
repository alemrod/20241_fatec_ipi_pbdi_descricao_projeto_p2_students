-- CREATE TABLE tb_students (
--     studentid VARCHAR(50) PRIMARY KEY,
--     age INT,
--     gender INT,
--     hs_type INT,
--     scholarship INT,
--     work INT,
--     activity INT,
--     partner INT,
--     salary INT,
--     transport INT,
--     living INT,
--     mother_edu INT,
--     father_edu INT,
--     num_siblings INT,
--     kids INT,
--     mother_job INT,
--     father_job INT,
--     study_hrs INT,
--     read_freq INT,
--     read_freq_sci INT,
--     attend_dept INT,
--     impact INT,
--     attend INT,
--     prep_study INT,
--     prep_exam INT,
--     notes INT,
--     listens INT,
--     likes_discuss INT,
--     classroom INT,
--     cuml_gpa INT,
--     exp_gpa INT,
--     course_id INT,
--     grade INT
-- );
 
 
-- select * from tb_students
 
 
-- ALTER TABLE tb_students drop column age 
-- ALTER TABLE tb_students drop column gender;
-- ALTER TABLE tb_students drop column hs_type;
-- ALTER TABLE tb_students drop column scholarship;
-- ALTER TABLE tb_students drop column work;
-- ALTER TABLE tb_students drop column activity;
-- ALTER TABLE tb_students drop column partner;
-- ALTER TABLE tb_students drop column transport;
-- ALTER TABLE tb_students drop column living;
-- ALTER TABLE tb_students drop column num_siblings;
-- ALTER TABLE tb_students drop column kids;
-- ALTER TABLE tb_students drop column mother_job;
-- ALTER TABLE tb_students drop column study_hrs;
-- ALTER TABLE tb_students drop column read_freq;
-- ALTER TABLE tb_students drop column read_freq_sci;
-- ALTER TABLE tb_students drop column attend;
-- ALTER TABLE tb_students drop column notes;
-- ALTER TABLE tb_students drop column listens;
-- ALTER TABLE tb_students drop column likes_discuss;
-- ALTER TABLE tb_students drop column classroom;
-- ALTER TABLE tb_students drop column cuml_gpa;
-- ALTER TABLE tb_students drop column exp_gpa;
-- ALTER TABLE tb_students drop column course_id;
-- ALTER TABLE tb_students drop column attend_dept;
-- ALTER TABLE tb_students drop column impact;
 
-- select * from tb_students

--2

-- CREATE OR REPLACE FUNCTION aprovados_pais_phd()
-- RETURNS INTEGER AS $$
-- DECLARE
--     aprovados INTEGER;
-- BEGIN
--     SELECT COUNT(*)
--     INTO aprovados
--     FROM tb_students
--     WHERE grade > 0 
--     AND mother_edu = 6
--     AND father_edu = 6;
 
--     RETURN aprovados;
-- END;
-- $$ LANGUAGE plpgsql;
 
-- SELECT aprovados_pais_phd();

--3
 
 
CREATE OR REPLACE PROCEDURE aprovados_sozinho(
    OUT aprovado INT
    )
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COUNT (studentid)
    INTO aprovado
    FROM tb_students
    WHERE prep_study = 1 and  grade > 0;
END;
$$
DO $$
DECLARE
    aprovado INT;
BEGIN
    CALL aprovados_sozinho(aprovado);
    RAISE NOTICE 'A quantidade de aprovados que estudam sozinho é %', aprovado;
END;
$$;