*&------------------------------------------*
* 1. 직원 목록에서 직원 1명의 이름을 화면에 출력하기
*&------------------------------------------*
REPORT Z01_01.

DATA gv_ename TYPE zemplist-ename.

SELECT SINGLE ename FROM zemplist
  WHERE empcd EQ '1001'
  INTO @gv_ename.

  WRITE gv_ename.

*&------------------------------------------*
* 2. 파라미터 명령어로 사번 입력받아 출력하기
*&------------------------------------------*
REPORT Z01_01.

DATA gv_ename TYPE zemplist-ename.
PARAMETERS: p_empcd TYPE zemplist-empcd.

SELECT SINGLE ename
  FROM zemplist
  WHERE empcd = @p_empcd
  INTO @gv_ename.

WRITE: gv_ename.