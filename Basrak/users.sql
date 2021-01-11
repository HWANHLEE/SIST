--==희진작성==
--회원계정생성
create or replace PROCEDURE sp_users_insert
(
    v_nickname        IN    users.nickname%TYPE,
    v_email    IN    users.email%TYPE,
    v_passwd    IN    users.passwd%TYPE
)
IS
BEGIN
    INSERT INTO users(nickname, email, passwd)
    VALUES(v_nickname,v_email,v_passwd);
    COMMIT;
END;

--회원전체조회
create or replace PROCEDURE sp_users_select_all
(
    users_record    OUT     SYS_REFCURSOR
)
AS
BEGIN
    OPEN users_record FOR
    SELECT nickname, passwd, email
    FROM users;
END;

--회원1명조회
create or replace PROCEDURE sp_users_select_one
(
    v_nickname         IN     users.nickname%TYPE,
    users_record    OUT     SYS_REFCURSOR
)
AS
BEGIN
    OPEN users_record FOR
    SELECT nickname, passwd, email
    FROM users
    WHERE nickname = v_nickname;
END;

--회원로그인
create or replace PROCEDURE sp_users_login
(
    v_email     IN      users.email%TYPE,
    v_passwd     IN      users.passwd%TYPE,
    v_result    OUT     NUMBER
)
IS
    t_passwd    users.passwd%TYPE;
BEGIN
    SELECT passwd INTO t_passwd
    FROM users
    WHERE email = v_email;
    --그런 아이디가 있다면 
    IF v_passwd = t_passwd THEN --그리고 패스워드가 일치한다면
        v_result := 1;
        ELSE--그리고 패스워드가 일치하지 않는다면
            v_result := 0;
        END IF;

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
     v_result := -1;
END;

--회원계정삭제
create or replace PROCEDURE sp_users_delete
(
    v_nickname         IN     users.nickname%TYPE
)
IS
BEGIN
  DELETE FROM users
  WHERE nickname = v_nickname;
  COMMIT;
END;