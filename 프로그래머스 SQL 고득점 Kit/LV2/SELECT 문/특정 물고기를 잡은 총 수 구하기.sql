-- 특정 물고기를 잡은 총 수 구하기
-- 🔗https://school.programmers.co.kr/learn/courses/30/lessons/298518

SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO AS I
LEFT JOIN FISH_NAME_INFO AS N ON I.FISH_TYPE = N.FISH_TYPE
WHERE N.FISH_NAME IN ('BASS','SNAPPER');
