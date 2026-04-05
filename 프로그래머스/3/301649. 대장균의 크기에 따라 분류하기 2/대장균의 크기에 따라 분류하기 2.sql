# 대장균 분화
# 크기를 기준으로 정렬 > 분류

SELECT
    A.ID,
    CASE
        WHEN A.RNK / A.TOTAL <= 0.25 THEN 'CRITICAL'
        WHEN A.RNK / A.TOTAL <= 0.50 THEN 'HIGH'
        WHEN A.RNK / A.TOTAL <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM (
    SELECT
        ID,
        RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS RNK,
        COUNT(*) OVER () AS TOTAL
    FROM ECOLI_DATA
) A
ORDER BY A.ID