drop sequence greply_seq;
drop table greply;
drop sequence ginfo_seq;
drop table ginfo;
drop table gmember;
drop table gtrainer;



--트레이너 테이블
create table gtrainer
(
    tid varchar2(20) primary key,
    tpwd varchar2(20) not null,
    tname varchar2(30) not null,
    temail varchar2(50) not null,
    tsex varchar2(20) not null,
    tidno varchar2(15) not null,
    tddress varchar2(200),
    originalfilename varchar2(300),
    savedfilename varchar2(300),
    pr varchar2(3000)
);

--짐 멤버 테이블
create table gmember
(
    mid varchar2(20) primary key,
    mpwd varchar2(20) not null,
    mname varchar2(30) not null,
    memail varchar2(50) not null,
    msex varchar2(20) not null,
    midno varchar2(15) not null,
    mddress varchar2(200),
    cupon number default 0,
    originalfilename varchar2(300),
    savedfilename varchar2(300),
    nokori number default 0,
    tid varchar2(20) references gtrainer(tid) on delete cascade
);



--트레이너들이 올리는 공지사항 테이블
create table ginfo
(
     infono number primary key,
     writer varchar2(30) not null,
     title varchar2(200) not null,
     content varchar2(4000) not null,
     regdate date default sysdate,
     hitcount number default 0,
     originalfilename varchar2(300),
     savedfilename varchar2(300),
     tid varchar2(20) references gtrainer(tid) on delete cascade   
  );
  
create sequence ginfo_seq;

--공지사항에 답글남기는 테이블
create table greply 
(
   replyno number primary key,
   writer varchar2(30) not null,
   regdate date default sysdate,
   replytext varchar2(1000) not null,
   tid varchar2(20) references gtrainer(tid) on delete cascade,
   mid varchar2(20) references gmember(mid) on delete cascade,
   infono number references ginfo(infono) on delete cascade
 );
 
 create sequence greply_seq;