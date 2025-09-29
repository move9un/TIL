*&---------------------------------------------------------------------*
*& Report Z01_05
*&---------------------------------------------------------------------*
*&직원 가족정보 가져오기
*&---------------------------------------------------------------------*
REPORT Z01_05.

TYPES: BEGIN OF ts_test,
        empcd TYPE zemplist-empcd,
        ename TYPE zemplist-ename,
        depcd TYPE zemplist-depcd,
        dname TYPE zteamlist-dname,
        relation TYPE zfamily-relation,
        fname TYPE zfamily-fname,
        bdate TYPE zfamily-bdate,
  END OF ts_test.

DATA gt_test TYPE TABLE OF ts_test.

TABLES: zemplist.
SELECT-OPTIONS s_empcd
FOR zemplist-empcd.

SELECT a~empcd, a~ename, a~depcd, b~dname,
   c~relation, c~fname, c~bdate
  FROM zemplist AS a
  INNER JOIN zteamlist AS b
    ON b~depcd EQ a~depcd
  LEFT JOIN zfamily AS c
    ON c~empcd EQ a~empcd
  WHERE a~empcd IN @s_empcd
  INTO TABLE @gt_test.

cl_demo_output=>display( gt_test ).