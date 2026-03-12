-- 코드를 입력하세요

# 동일한 회원, 동일한 상품 재구매한 데이터
# 회원, 상품
# ORDER 회원, 상품 DESC

# group count > 1

SELECT USER_ID, PRODUCT_ID
FROM (
    SELECT USER_ID, PRODUCT_ID
    FROM ONLINE_SALE
    GROUP BY USER_ID, PRODUCT_ID
    HAVING COUNT(*) > 1
) AS T
ORDER BY USER_ID, PRODUCT_ID DESC