-- 희연
--b-1 

--b-2 

--b-3 

--b-4 

--b-5 


-- 원준
--b-6 

--b-7 

--b-8 

--b-10 

--b-11


-- 원혁
--b-12 

--b-13 

--b-14 

--b-15 

--b-16


-- 혜정
-- 수정 필요

--c-2 배점 입출력
-- 1. 교사가 강의를 마친 과목에 대한 성적 처리를 위해서 배점 입출력을 할 수 있어야 한다.

-- 1.1. 배점 입력
insert into  tblGrades(seq_grades, seq_traineelist, seq_subjectlist,WRITTENGRADE,WRITTENDATE, PRACTICALGRADE,PRACTICALDATE,ATTENDANCEGRADE) 
values (1, 1, 47, 33, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 33, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 15);

-- 1.2. 배점 출력
select * from tblGrades where SEQ_GRADES = 1;


--2. 교사는 자신이 강의를 마친 과목의 목록 중에서 특정 과목을 선택하고 해당 과목의 배점 정보를 출결, 필기, 실기로 구분해서 등록할 수 있어야 한다. 시험 날짜, 시험 문제를 추가할 수 있어야 한다.

-- 2.1. 특정 과목 선택
insert into tblGrades(seq_grades, seq_traineelist, seq_subjectlist) 
values (1, 1, 47);

-- 2.2. 필기 점수 등록
update tblGrades 
set writtengrade = 33,
    writtendate = TO_DATE('2024-01-15', 'YYYY-MM-DD')
where seq_grades = 1;

-- 2.3.실기 점수 등록
update tblGrades 
set practicalgrade = 33,
    practicaldate = TO_DATE('2024-01-16', 'YYYY-MM-DD')
where seq_grades = 1;

-- 2.4. 출결 점수 등록
update tblGrades 
set attendancegrade = 15
where seq_grades = 1;

-- 2.5. 시험 날짜 추가
-- 테이블 수정 중

-- 2.6. 시험 문제 추가
insert into tblExampaper(seq_attendancepapers, seq_question, seq_subject, kind) 
values (1, 1, 1, '필기');


--3. 출결, 필기, 실기의 배점 비중은 담당 교사가 과목별로 결정한다. 단, 출결은 최소 20점 이상이어야 하고, 출결, 필기, 실기의 합은 100점이 되도록 한다.

-- 수정 필요

insert into  tblGrades(seq_grades, seq_traineelist, seq_subjectlist,WRITTENGRADE,WRITTENDATE, PRACTICALGRADE,PRACTICALDATE,ATTENDANCEGRADE) 
values (1, 1, 47, 33, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 33, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 15);

--4. 과목 목록 출력 시 과목번호, 과정명, 과정기간(시작 년월일, 끝 년월일), 강의실, 과목명, 과목기간(시작 년월일, 끝 년월일), 교재명, 출결, 필기, 실기 배점 등이 출력되고, 
-- 특정 과목을 과목번호로 선택 시 출결 배점, 필기 배점, 실기 배점, 시험 날짜, 시험 문제를 입력할 수 있는 화면으로 연결되어야 한다.
select 
    l.seq_subject 과목번호,
    c.name 과정명,
    o.startdate 과정시작일,
    o.enddate 과정종료일,
    r.name 강의실,
    s.name 과목명,
    s.period 과목기간수정해야
    
        from tblSubjectList l
            join tblsubject s
                on l.seq_subject = s.seq_subject
                    join tblcurriculum c
                        on l.seq_subject = s.seq_subject
                            join tblopencurriculum o
                                on o.seq_curriculum = c.seq_curriculum
                                    join tblRoom r
                                        on r.seq_room = o.seq_room
                                            join tblTextbookList bl
                                                on l.seq_subject = bl.seq_subject
                                                    join tbltextbook b
                                                        on bl.seq_textbook = b.seq_textbook;


--5. 배점 등록이 안 된 과목인 경우는 과목 정보가 출력될 때 배점 부분은 null 값으로 출력한다.
select * from tblOpenCurriculum;


--c-3 성적 입출력
-- 교사가 강의를 마친 과목에 대한 성적 처리를 위해서 성적 입출력을 할 수 있어야 한다.

-- 교사는 자신이 강의를 마친 과목의 목록 중에서 특정 과목을 선택하면, 교육생 정보가 출력되고, 특정 교육생 정보를 선택하면, 해당 교육생의 시험 점수를 입력할 수 있어야 한다. 이때, 출결, 필기, 실기 점수를 구분해서 입력할 수 있어야 한다.

-- 과목 목록 출력시 과목번호, 과정명, 과정기간(시작 년월일, 끝 년월일), 강의실, 과목명, 과목기간(시작 년월일, 끝 년월일), 교재명, 출결, 필기, 실기 배점, 성적 등록 여부 등이 출력되고, 특정 과목을 과목번호로 선택시 교육생 정보(이름, 전화번호, 수료 또는 중도탈락) 및 성적이 출결, 필기, 실기 점수로 구분되어서 출력되어야 한다.

-- 성적 등록 여부는 교육생 전체에 대해서 성적을 등록했는지의 여부를 출력한다.

-- 과정을 중도 탈락해서 성적 처리가 제외된 교육생이더라도 교육생 명단에는 출력되어야 한다. 중도 탈락 여부를 확인할 수 있도록 해야 한다.

-- 중도 탈락인 경우 중도탈락 날짜가 출력되도록 한다.

-- 중도 탈락 처리된 교육생의 성적인 경우 중도탈락 이후 날짜의 성적은 입력하지 않는다.



--c-4 출결 관리 및 출결 조회
-- 교사가 강의한 과정에 한해 선택하는 경우 모든 교육생의 출결을 조회할 수 있어야 한다.

-- 출결 현황을 기간별(년, 월, 일) 조회할 수 있어야 한다.

-- 특정(특정 과정, 특정 인원) 출결 현황을 조회할 수 있어야 한다.

-- 모든 출결 조회는 근태 상황을 구분할 수 있어야 한다.(정상, 지각, 조퇴, 외출, 병가, 기타)



--c-6 추천 도서 관리
--1. 교재 추가
--새로운 교재 정보를 추가한다.


--2. 교재 추천
-- 교재를 추천할 수 있다.



--c-7 후기 관리
-- 1. 후기 관리
-- 프로젝트 종료 이후 교육생이 작성한 후기를 조회 및 관리 할 수 있다.



-- 민곤
--d-1 

--d-2 

--c-1 

--c-5