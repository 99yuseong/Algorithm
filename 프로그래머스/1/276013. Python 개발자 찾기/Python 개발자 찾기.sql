# 개발자들의 스킬정보
# 파이썬 할줄 아는 사람들

SELECT
    ID,
    EMAIL,
    FIRST_NAME,
    LAST_NAME
FROM DEVELOPER_INFOS
WHERE
    SKILL_1 = 'Python'
    OR SKILL_2 = 'Python'
    OR SKILL_3 = 'Python'
ORDER BY ID