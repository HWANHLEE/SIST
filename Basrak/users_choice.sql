-- 사용자 선택 정보 입력 프로시저
create or replace PROCEDURE sp_users_choice_insert
(
    v_S_SEQ         IN      user_choice.s_seq%TYPE,
    v_D_SEQ         IN      user_choice.d_seq%TYPE,
    v_nickname      IN      user_choice.nickname%TYPE
)
IS
BEGIN
    INSERT INTO user_choice(choice_seq, S_SEQ, D_SEQ, NICKNAME)
    VALUES(SEQ_USER_CHOICE_CHOICE_SEQ.NEXTVAL, v_S_SEQ, v_D_SEQ, v_NICKNAME);
    COMMIT;
END;

--회원 선택 전체조회
create or replace PROCEDURE sp_users_choice_select_all
(
    users_choice_record    OUT     SYS_REFCURSOR
)
AS
BEGIN
    OPEN users_choice_record FOR
    SELECT CHOICE_SEQ, S_SEQ, D_SEQ, nickname
    FROM USER_CHOICE;
END;
