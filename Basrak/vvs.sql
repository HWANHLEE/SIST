CREATE SEQUENCE  
"BASRAK"."SEQ_USERS_BOARD_U_SEQ"  
MINVALUE 1 
MAXVALUE 999999999 
INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

-- 게시판 테이블 생성(수정완료)
CREATE TABLE USER_BOARD
(
    U_SEQ        VARCHAR2(10),
    TITLE        VARCHAR2(60)     CONSTRAINT USER_BOARD_TITLE_NN NOT NULL, 
    CONTENT      VARCHAR2(3000)   CONSTRAINT USER_BOARD_CONTENT_NN NOT NULL,
    REGDATE      DATE   DEFAULT SYSDATE  CONSTRAINT USER_BOARD_REGDATE_NN NOT NULL,
    READNUM      NUMBER(6)  DEFAULT 0   CONSTRAINT USER_BOARD_READNUM_NN NOT NULL,
    NICKNAME     VARCHAR2(20)     CONSTRAINT USER_BOARD_NICKNAME_NN NOT NULL,
    CONSTRAINT USER_BOARD_U_SEQ_PK PRIMARY KEY(U_SEQ),
    CONSTRAINT USER_BOARD_NICKNAME_FK    FOREIGN KEY (NICKNAME)
    REFERENCES USERS(NICKNAME)
);

-- 게시판 목록 가져오기(수정완료)
CREATE OR REPLACE PROCEDURE sp_vvs_select_all
(
    vvs_record      OUT         SYS_REFCURSOR
)
AS
BEGIN
    OPEN vvs_record FOR
    SELECT U_SEQ AS bno, title, TO_CHAR(regdate, 'YYYY-MM-DD') AS writedate, readnum, nickname
    FROM user_board 
    ORDER BY U_SEQ DESC;
END;

-- 게시판 입력하기 (수정 완료)
CREATE OR REPLACE PROCEDURE sp_vvs_insert
(
    v_title             IN      USER_BOARD.title%TYPE,
    v_content        IN      USER_BOARD.content%TYPE,
    v_nickname     IN      USER_BOARD.nickname%TYPE
)
IS
BEGIN
    INSERT INTO USER_BOARD(U_SEQ, title, content, nickname)
    VALUES(SEQ_USERS_BOARD_U_SEQ.NEXTVAL, v_title, v_content, v_nickname);
    COMMIT;
END;

-- 글 번호로 한개의 게시판 글 가져오기 (수정 완료)
CREATE OR REPLACE PROCEDURE sp_vvs_select_one
(
    v_U_SEQ                 IN        USER_BOARD.U_SEQ%TYPE,
    vvs_record            OUT       SYS_REFCURSOR
)
AS
BEGIN
    OPEN vvs_record FOR
    SELECT U_SEQ, title, content, TO_CHAR(regdate, 'YYYY-MM-DD') AS writeday, readnum, nickname, email
    FROM USER_BOARD INNER JOIN USERS USING(nickname)
    WHERE U_SEQ = v_U_SEQ;
END;

-- 조회수 증가
CREATE OR REPLACE PROCEDURE sp_bbs_readnum_update
(
    v_bno                   IN          Board.bno%TYPE
)
IS
BEGIN
    UPDATE Board
    SET readnum = readnum + 1
    WHERE bno = v_bno;
    COMMIT;
END;

-- 게시판 글 수정하기
CREATE OR REPLACE PROCEDURE sp_vvs_update
(
    v_title                 IN         USER_BOARD.title%TYPE,
    v_content            IN          USER_BOARD.content%TYPE,
    v_u_seq               IN           USER_BOARD.u_seq%TYPE
)
IS
BEGIN
    UPDATE USER_BOARD
    SET title = v_title, content = v_content
    WHERE u_seq = v_u_seq;

    COMMIT;
END;

