-- 가격이 제일 비싼 식품의 정보 출력하기
-- 🔗https://school.programmers.co.kr/learn/courses/30/lessons/131115

-- 📍WHERE 절에서는 바로 MAX() 같은 집계함수를 사용할 수 없다

SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD_PRODUCT);
