-- Python 개발자 찾기
-- 🔗https://school.programmers.co.kr/learn/courses/30/lessons/276013

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPER_INFOS
WHERE 'Python' IN(SKILL_1,SKILL_2,SKILL_3) -- 이건 MYSQL에서만 사용가능한 문법 
ORDER BY ID ASC;
