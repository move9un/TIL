REPORT ZREAD_SFLIGHT.  
  
"항공편 데이터를 담을 내부 테이블 선언"  
DATA lt_flights TYPE TABLE OF sflight.  
  
"데이터베이스에서 SFLIGHT 테이블의 행 10개 읽어오기"  
SELECT *  
  FROM sflight  
  INTO TABLE lt_flights  
  UP TO 10 ROWS.  
  
"읽어온 데이터를 LOOP로 출력"  
LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs>).  
  WRITE: / <fs>-carrid,   "항공사 코드"  
           <fs>-connid,   "노선 번호"  
           <fs>-fldate,   "비행일자"  
           <fs>-price.    "운임"  
ENDLOOP.