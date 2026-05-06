-- 조건에 맞는 개발자 찾기
-- 🔗https://school.programmers.co.kr/learn/courses/30/lessons/276034

-- SKILL_CODE가 비트마스크(여러 스킬의 합) 구조이기에 비트 연산자를 써서 확인해야한다 D.SKILL_CODE & S.CODE != 0
SELECT DISTINCT D.ID,D.EMAIL,D.FIRST_NAME,D.LAST_NAME	
FROM DEVELOPERS AS D
LEFT JOIN SKILLCODES AS S ON S.CODE & D.SKILL_CODE !=0
WHERE S.NAME IN ('Python','C#')
ORDER BY D.ID ASC;
