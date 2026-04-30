-- 과일로 만든 아이스크림 고르기
-- 🔗https://school.programmers.co.kr/learn/courses/30/lessons/133025
SELECT H.FLAVOR
FROM FIRST_HALF AS H
LEFT JOIN ICECREAM_INFO AS I ON I.FLAVOR = H.FLAVOR
WHERE H.TOTAL_ORDER >3000 AND I.INGREDIENT_TYPE = 'fruit_based'
ORDER BY H.TOTAL_ORDER DESC; 
