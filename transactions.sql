1. select * from student stdnt 
inner join student_detail stddtl on stdnt.student_id=stddtl.student_id
inner join address addr on addr.person_id=stdnt.person_id
inner join address_detail addrdtl on addrdtl.address_id=addr.address_id
inner join contact_3 cnt3 on cnt3.person_id=stdnt.person_id
inner join contact_id_detail cntdtl on cntdtl.contact_id=cnt3.contact_id;

2. select module.module_name from module 
inner join module_3 mdl3 on module.module_id = mdl3.module_id 
group by module.module_name having count(mdl3.person_id)>1;

3. select prs.*,instrdtl.instructor_salary from instructor instr 
inner join instructor_detail instrdtl on instrdtl.instructor_id = instr.instructor_id
inner join person prs on prs.person_id=instr.person_id
where instrdtl.instructor_salary>50000 and prs.name like '%s%';

4. vayena

5. select prs.* from module_details mdldtls
inner join person prs on mdldtls.module_leader=prs.person_id;

6. vayena

7. select prs.*,modl.* from instructor instr
inner join person prs on prs.person_id = instr.person_id
inner join module_3 mdl3 on mdl3.person_id=instr.person_id
inner join module modl on modl.module_id=mdl3.module_id
where modl.module_name='Database';

8. select crs.*,spcftdtl.* from course crs
inner join specification spcft on spcft.course_id=crs.course_id
inner join specification_detail spcftdtl on spcft.specification_id=spcftdtl.specification_id
where crs.course_name='BIT';

9. vayena

10. select * from instructor inst
inner join person prs on prs.person_id = inst.person_id
where prs.name like '%a';


transaction

1. select stdnt.student_id,prs.name,crs.course_name,stdntdtl.student_fee,
case crs.course_name when 'BIT' then TO_NUMBER(stdntdtl.student_fee) - 10/100*TO_NUMBER(stdntdtl.student_fee)
else TO_NUMBER(stdntdtl.student_fee) end ten_percent_discounted_fee
from student stdnt
inner join student_detail stdntdtl on stdnt.student_id=stdntdtl.student_id
inner join person prs on prs.person_id=stdnt.person_id
inner join course crs on stdntdtl.course_id=crs.course_id;

2. update contact_id_detail set phone_number='1234567890' where phone_number is null;
alter table contact_id_detail rename column phone_number to contact_details;

3. select stdnt.student_id,prs.name,ROUND((CURRENT_DATE - stdntdtl.enroll_date)/7) as student_join_weeks from student stdnt 
inner join person prs on stdnt.person_id=prs.person_id
inner join student_detail stdntdtl on stdntdtl.student_id=stdnt.student_id;

4. hudaina

5. select crs.course_name,COUNT(stdntdtl.student_id),MAX(stdntdtl.student_marks) 
from student_detail stdntdtl
inner join course crs on crs.course_id=stdntdtl.course_id
GROUP BY crs.course_name;

6. select prs.*,crsdtl.* from course_detail crsdtl
inner join instructor instr on crsdtl.course_leader=instr.instructor_id
inner join person prs on prs.person_id=instr.person_id;

