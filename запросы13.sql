--Задание 1
SELECT dep_id FROM public.departments WHERE graduating_dep = true AND dep_name ILIKE '%математ%'
--Задание 2
SELECT * FROM public.teachers WHERE dep_id = 15 AND cont_phone IS NULL
--Задание 3
SELECT departments.dep_id, dep_name, teacher_surname
INTO public."TASK3"
FROM public.departments
JOIN public.teachers ON departments.dep_id = teachers.dep_id
WHERE graduating_dep = true AND dep_name ILIKE '%математ%'
--Задание 4
INSERT INTO public."TASK3" (dep_id, dep_name, teacher_surname)
SELECT teachers.dep_id, dep_name, teacher_surname
FROM public.teachers
JOIN public.departments ON teachers.dep_id = departments.dep_id
WHERE LEFT(teacher_surname, 1) = LEFT(teacher_name, 1) AND LEFT(teacher_name, 1) = LEFT(teacher_patronymic, 1);
--Задание 5
UPDATE public."TASK3"
SET dep_name = 'прикладная математика и информатика' WHERE dep_id % 2 = 0;
--Задание 6
DELETE FROM public."TASK3"
WHERE regexp_count(dep_name, '\s') = 3;
--Задание 7
SELECT faculty_id, COUNT (teacher_id) AS teacher_count
FROM public.departments
JOIN public.teachers ON departments.dep_id = teachers.dep_id
WHERE graduating_dep = true
GROUP BY faculty_id
