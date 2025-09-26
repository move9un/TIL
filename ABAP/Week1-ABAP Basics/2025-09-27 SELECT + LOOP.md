## 📚 Today I Learned
- ERP(Enterprise Resource Planning): 기업 자원 관리 시스템
- SAP: 대표적인 ERP 솔루션
- ABAP: SAP ERP에서 돌아가는 전용 프로그래밍 언어
- 마스터 데이터: 기업의 핵심 업무를 처리할 때 반복적으로 사용되는 기본 데이터
- 트랜잭션 데이터: 실제 업무가 발생할 때 생성되는 데이터
- 클라이언트: SAP 시스템에서 가장 최상위에 위치한 조직 단위
- SAP는 Tier Architecture(3계층 구조)로 이루어져있음. 표현,응용,데이터베이스
- ABAP에서 데이터 읽고 루프로 출력(SELECT + LOOP 실습)

## ⌨️ 실습 코드
```
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
```

## 💻 결과 화면

![Pasted-image-20250927002728](Pasted-image-20250927002728.png)
---
## 💡 내가 이해한 점
#### `UP TO 10 ROWS` - 데이터 제한 옵션
```
SELECT * 
  FROM sflight
  INTO TABLE lt_flights
  UP TO 10 ROWS.
```
의미: `SFLIGHT` 테이블에서 최대 10행만 가져옴
사용한 이유: 학습이나 테스트할 때는 데이터가 수천/수만건일 수 있기에 일부만 가져오면 빠르고 안전.

#### `FIELD-SYMBOL (<fs>)` — 일종의 "참조 변수"
```
LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs>).
  WRITE: / <fs>-carrid, <fs>-connid, <fs>-fldate, <fs>-price.
ENDLOOP.
```
의미: 내부 테이블의 각 행을 `<fs>`라는 **참조(포인터)** 에 연결
특징
1. 데이터 복사 없이 직접 접근
	- `LOOP AT lt_flights INTO wa.` → 행 데이터를 `wa`라는 변수에 복사
	- `ASSIGNING FIELD-SYMBOL(<fs>)` → 행 데이터를 **참조** (성능 ↑, 메모리 ↓)
2. `<fs>`는 "가상 변수"라서, LOOP 내부에서만 유효
3. `< >` 안에 이름을 넣는 문법은 ABAP만의 특징 (예: `<fs>`)

예시
```
"복사 방식"
DATA wa_flight TYPE sflight.
LOOP AT lt_flights INTO wa_flight.
  wa_flight-price = wa_flight-price * 1.1.
ENDLOOP.

"참조 방식 (FIELD-SYMBOL)"
FIELD-SYMBOLS <fs> TYPE sflight.
LOOP AT lt_flights ASSIGNING <fs>.
  <fs>-price = <fs>-price * 1.1.
ENDLOOP.
```
---
## 원본 테이블 값 수정의 장단점

### 좋은 경우 (실무에서 쓰는 이유)

- **성능**: 대용량 데이터를 처리할 때, 복사본을 계속 만드는 건 메모리 낭비  
    → FIELD-SYMBOL로 직접 수정하면 훨씬 효율적
    
- **업무 로직상 수정이 필요할 때**: 예를 들어
    - 가격에 세금 10%를 더해야 한다
    - 특정 조건의 상태 플래그를 바꿔야 한다
    - 이런 경우는 원본 테이블을 업데이트해야 함

### 조심해야 하는 경우

- 단순히 “조회” 목적이라면 원본을 바꾸지 않는 게 안전
- 실수로 잘못된 수정이 들어가면 이후 로직 전체가 틀어질 수 있음
- 디버깅이 어려워질 수 있음 (어디서 값이 바뀌었는지 추적 힘듦)

---

## 안전한 접근 방법

#### 1. **조회용**
👉 `INTO wa_flight` (복사 방식)
- 원본은 그대로 두고, 작업 영역에서만 확인

#### 2. **수정용**
👉 `ASSIGNING <fs>` (참조 방식)
- 원본 수정이 의도된 상황에서만 사용
- 주석/코드로 “원본 변경함”을 명확히 표시