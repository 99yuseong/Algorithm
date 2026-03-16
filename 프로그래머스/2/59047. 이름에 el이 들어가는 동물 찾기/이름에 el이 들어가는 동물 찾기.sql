-- 코드를 입력하세요

# 보호소에 들어온 동물 정보
# 이름에 el
# 이름 순

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE 
    ANIMAL_TYPE = 'Dog'
    AND NAME LIKE '%EL%' 
ORDER BY NAME