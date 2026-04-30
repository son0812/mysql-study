-- 한 해에 잡은 물고기 수 구하기
-- 🔗https://school.programmers.co.kr/learn/courses/30/lessons/298516

SELECT COUNT(ID) AS FISH_COUNT
FROM FISH_INFO
WHERE YEAR(TIME) = 2021;
