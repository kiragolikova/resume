-- 1. найти предметы колвом часов больше ста. вывести название предмета и колво часов
-- 2. найти все лекции (вид занятия1) которые ведут преподаватели конкретной кафедры (вывести лекции)
-- 3. вывети топ 3 самых сложных предмета (по среднему баллу)
-- 4. определить макс колво практических часов среди всех предметов
-- 5. вывести студентов чей личный балл выше среднего по их группе
-- 6. создать процедуру для увеличения колва часов для всех предетов первого семестра на 10%
-- 7. создать триггер для автоматического обновления среднего балла при изменении оценок


-- 1. 
select name_pred, chas from predmet where chas > 100   -- работает, просто у меня нет таких


-- 2. 
select vid_zan from isuchenie, prepodavatel, kafedra 
where  kafedra.kod_kaf = prepodavatel.kod_kaf and     -- работает
prepodavatel.kod_prep = isuchenie.kod_prep
and name_kaf = 'машиноведение'

-- 3. 
select name_pred from isuchenie, predmet 
where predmet.kod_pred = isuchenie.kod_pred       -- работает
and sr_ball_predm < 5
limit 3

-- 4. определить макс колво практических часов среди всех предметов
select max(chas) max from predmet, isuchenie                            -- работает
where predmet.kod_pred = isuchenie.kod_pred and vid_zan = 2



-- 5. вывести студентов чей личный балл выше среднего по их группе

select first_name_stud from student, gruppa
where student.p_ball > gruppa.avg_ball                   -- криво, но работает


-- 6

delimiter //
create procedure pred_hours (
in name_pred varchar(100),
in chas int)
begin
update predmet set chas = chas * 1.1;
end //
delimiter ;

drop procedure pred_hours

call  pred_hours ()
select * from predmet









delimiter |
create trigger 
for each row begin 

end;





drop procedure insertusp;

call 
select * from isuchenie