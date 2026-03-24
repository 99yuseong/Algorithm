# A 중고거래 게시판 정보
# B 중고거래 유저 정보

# 3개 이상 게시한 사용자 > GROUP을 해도 되겠다.

SELECT 
    B.USER_ID,
    B.NICKNAME,
    CONCAT(
        B.CITY,
        ' ',
        B.STREET_ADDRESS1, 
        ' ', 
        B.STREET_ADDRESS2
    ) AS 전체주소,
    CONCAT(
        SUBSTRING(B.TLNO, 1, 3), 
        '-', 
        SUBSTRING(B.TLNO, 4, 4), 
        '-', 
        SUBSTRING(B.TLNO, 8, 4)
    ) AS 전화번호
FROM USED_GOODS_BOARD A
JOIN USED_GOODS_USER B
ON A.WRITER_ID = B.USER_ID
GROUP BY A.WRITER_ID
HAVING COUNT(*) >= 3
ORDER BY B.USER_ID DESC

