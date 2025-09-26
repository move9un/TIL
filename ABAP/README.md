
# 🌱 SAP ABAP TIL (Today I Learned)
openSUSE 환경에 직접 **SAP ABAP 서버(Developer Edition)**를 설치하여 실습을 진행하며, 매일 배운 점을 `WeekX` 폴더 내 `YYYY-MM-DD-제목.md` 형식으로 저장하고, 주차별 `README.md` 파일에 요약본을 정리합니다.  

---
## 📚 학습 목표
- openSUSE에 SAP NetWeaver AS ABAP Developer Edition 설치 및 환경 세팅
- SAP GUI / Eclipse ADT 개발 환경 적응
- ABAP 기본 문법 (REPORT, WRITE, SELECT, LOOP)
- 내부테이블 및 SQL 연산
- ALV 리포트 (SALV) 개발
- 객체지향 ABAP 및 ABAP Unit
- CDS View 및 RAP 기초
- 미니 프로젝트: 항공편 KPI 리포트

---
## 📖 진행 현황

### ✅ Week 1 – ABAP Basics
- [Week 1](./ABAP/Week1-ABAP%20Basics/README.md)

---
## 🚀 포트폴리오 목표
- 단순한 TIL 기록을 넘어,  
  **“SAP ABAP 기초 → 실습 예제 → 미니 프로젝트”**로 발전시키는 것을 목표로 합니다.
- 완성된 미니 프로젝트: **항공편 KPI 모니터링 리포트**
  - 입력값: 항공사, 기간
  - 기능: 매출·탑승률 집계 / ALV 출력 / CDS KPI 뷰
  - 품질: ABAP Unit으로 테스트 커버리지 확보

---
## 📂 레포 구조
```
TIL/  
├─ Week1_Basics/ ← 1주차: ABAP 기초  
│ ├─ 2025-09-26-hello-abap.md
│ └─ 2025-09-27 SELECT + LOOP.md
└─ Project_Flight_KPI/ ← 최종 미니 프로젝트
```

---
> ⚠️ 주의: 본 레포지토리의 모든 코드는 **개인 학습 목적**으로 작성되었으며,  
> 실제 회사 프로젝트/데이터와는 무관합니다.
