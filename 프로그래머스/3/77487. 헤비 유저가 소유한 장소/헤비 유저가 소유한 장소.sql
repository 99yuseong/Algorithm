# 임대 서비스 공간 정보
# 공간을 2개 이상 > 헤비유저

# 헤비유저의 공간 정보를 아이디순 조회

SELECT
    ID,
    NAME,
    HOST_ID
FROM (
    SELECT 
        *,
        COUNT(*) OVER (PARTITION BY HOST_ID) AS PLACE_COUNT
    FROM PLACES
) PLACES_WIHT_COUNT
WHERE PLACE_COUNT >= 2
ORDER BY ID
