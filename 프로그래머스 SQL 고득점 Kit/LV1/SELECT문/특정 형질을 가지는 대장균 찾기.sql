-- 특정 형질을 가지는 대장균 찾기
-- 🔗https://school.programmers.co.kr/learn/courses/30/lessons/301646

-- & : 특정 비트 위치가 켜져 있는지 확인하는 연산자
-- 결과가 0이면 해당 형질 없음, 0이 아니면 있음
-- CONV(데이터, 원본 진법, 변환할 진법) 으로 숫자 기반 시스템을 다른 진법의 수로 표시
-- 1번형질은 1, 2번형질은 2, 3번형질은 4, 4번형질은 8

SELECT COUNT(*) AS `COUNT`
FROM ECOLI_DATA
WHERE (GENOTYPE & 2) = 0
      AND ((GENOTYPE & 1) != 0  OR (GENOTYPE & 4) != 0); 
