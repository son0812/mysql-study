### 1. SELECT문 오답노트

**1-(1) 조건에 맞는 개발자 찾기**

🔗 https://school.programmers.co.kr/learn/courses/30/lessons/276034

<img width="1235" height="585" alt="image" src="https://github.com/user-attachments/assets/e5ddbb86-4e11-41dc-a044-9b8b4b8c8098" />

DEVELOPERS 테이블에서 Python이나 C# 스킬을 가진 개발자의 정보를 조회하는 것이 핵심인 문제였다.

이때 `DEVELOPERS` 테이블의 `SKILL_CODE` 컬럼은  400 (=b'110010000')과 같이 비트마스크(2의 제곱 합) 형태로 저장하는 구조이다.

이런 경우, 특정 스킬 보유 여부는 비트 연산 (&) 으로 확인해야 한다. 

처음에 문제를 접근했을 때는 LEFT JOIN SKILLCODES AS S ON S.CODE = D.SKILL_CODE과 같이 접근했으나 이런 경우, 하나의 스킬만 가진 경우만 매칭되고 여러 스킬을 가진 경우 전부 누락된다는 문제가 존재한다. 

즉, `SKILL_CODE`는 하나의 값이 아니라여러 스킬의 합(비트)이기에 비교 방식이 아니라 포함 여부 체크 가 필요하다.

특정 스킬 비트가 포함되어 있으면 0이 아니라는 특성을 반영하여 `D.SKILL_CODE & S.CODE != 0`와 같은 코드를 WHERE절에 넣는다. 

➕ 추가적으로 JOIN 구조상 Python + C# 둘 다 가진 경우 중복 행 발생할 수 있기에 SELECT 절에 `DISTINCT`를 사용하여 중복을 제거한다. 

최종적으로 구현된 코드는 다음과 같다

```
-- SKILL_CODE가 비트마스크(여러 스킬의 합) 구조이기에 비트 연산자를 써서 확인해야한다 D.SKILL_CODE & S.CODE != 0
SELECT DISTINCT D.ID,D.EMAIL,D.FIRST_NAME,D.LAST_NAME	
FROM DEVELOPERS AS D
LEFT JOIN SKILLCODES AS S ON S.CODE & D.SKILL_CODE !=0
WHERE S.NAME IN ('Python','C#')
ORDER BY D.ID ASC;
```
**최종 정리본**

1️⃣ 비트마스크 컬럼 특징
하나의 값 = 여러 상태의 조합
`&` 연산으로 포함 여부 확인이 가능

2️⃣ 포함 vs 일부 포함 구분
`& != 0` → 하나라도 포함 (OR 조건과 유사)
`& = 값` → 완전히 포함 (AND 조건과 유사)
