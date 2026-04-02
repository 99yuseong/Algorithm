# 장바구니

# 우유와 요거트 동시 구입
# CART_ID로 Group > DISTINT하면서 count가 2인, 요거트와 우유

SELECT CART_ID
FROM 
    (
        SELECT 
            CART_ID,
            COUNT(DISTINCT NAME) AS A
        FROM CART_PRODUCTS
        WHERE NAME = 'Milk' OR NAME = 'Yogurt'
        GROUP BY CART_ID
    ) B
WHERE B.A = 2
ORDER BY CART_ID