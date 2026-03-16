# 입양게시판
# 아이디 순서
# 이름 없음 > No name

SELECT
    ANIMAL_TYPE,
    If(NAME IS NULL, 'No name', NAME) AS NAME,
    SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID