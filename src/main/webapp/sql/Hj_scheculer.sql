<--https://github.com/ssimhye/Test-->

<--�����녑������ ����占썲������-->

create table hj_Scheduler_user(
user_no	number	primary key,	
user_kakao_no number	NOT NULL
)

delete  from hj_Scheduler_user

select * from hj_Scheduler_user
select * from hj_Scherduler_Calender

	select nvl(user_kakao_no,0) from hj_Scheduler_user where user_kakao_no = 1111
	    
insert into t86_board(           
		    no, title, writer, content   
		) values (                       
		    #{no}, #{title}, #{writer}, #{content} 
		)      

insert into hj_Scheduler_user (user_kakao_no) values (1121) 

select user_kakao_no as userKakaoNo from hj_Scheduler_user where user_kakao_no = 121
drop table  hj_Scherduler_Calender

select * from hj_Scherduler_Calender where user_no = 1234
insert into hj_Scherduler_Calender (user_no,event_name,event_date,ap,start_hours,end_hours)
values(1234,'후암',20130101,1,12,13)


<--嶺�占쏙옙瑗띰옙逾������� ����逾���寃밸��占쎈� ����苡삣�β�쎌�� -->

create table hj_Scherduler_Calender(
event_id number	primary key,     
user_no number	NOT NULL,
event_name	varchar2(20)	NOT NULL,
event_date	date NOT NULL,
ap number NOT NULL,
start_hours	date NULL,
end_hours	date NULL,	
event_color	 number	NULL 
);



