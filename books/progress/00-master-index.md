# 00 · 마스터 진행 인덱스

이 프로젝트의 현황을 한 화면에서 본다. 세부는 각 문서로.

## 목표 (원문 요약)
위키독스 인기 클로드 코드 도서를 모두 조사 → 최신 Claude Code를 담은 한국어
책을 **초급 / 중·고급 두 권**으로 출판(베스트셀러 지향). Humanizer·Outline
Planner 스킬을 먼저 설치·활성화하고, 진행과정을 폴더에 체계적으로 기록하며,
최신 변경사항을 **일주일 간격**으로 반영.

## 단계별 현황

| # | 단계 | 산출물 | 상태 |
|---|------|--------|------|
| 1 | 스킬 설치·활성화 | `.claude/skills/{humanizer,outline-planner}` · `01-skill-activation.md` | ✅ 완료 |
| 2 | 경쟁 분석 | `02-competitive-research.md` | ✅ 완료 |
| 3 | 의사결정 로그 | `03-decision-log.md` | ✅ 진행(상시) |
| 4 | 스타일·용어 | `shared/style-guide.md` · `shared/glossary.md` | ✅ 완료 |
| 5 | 아웃라인 | `vol1-beginner/outline.md` · `vol2-advanced/outline.md` | ✅ 완료 |
| 6 | 샘플 원고 | `vol1.../manuscript/` · `vol2.../manuscript/` | 🟡 대표 챕터 착수 |
| 7 | 전권 집필 | 두 권 전 장 | ⬜ 예정(주차별) |
| 8 | 주간 갱신 체계 | `weekly/` | ✅ 완료 |
| 9 | 편집 이력 | `04-changelog.md` | ✅ 진행(상시) |

## 두 권 한눈에

| | Vol.1 초급 | Vol.2 중·고급 |
|--|-----------|---------------|
| 독자 | 비전공~입문, 터미널 처음 | 실무 개발자, 매일 사용 |
| 약속 | 오늘 저녁 앱 하나 완성 | 한 번 시킬 일을 시스템으로 |
| 구성 | 4부 16장 ~145p | 6부 24장+부록 ~250p |
| 대표 실습 | 30분 가계부 앱 | 워크트리 병렬 + /goal 자율 |
| 차별점 | 첫 30분 성취·완독률 | 자동화 ROI·최신 기능 |

## 다음에 할 일 (집필 백로그)
1. Vol.1 1-1, 1-3 본문 완성 → Humanizer 교정
2. Vol.2 2-3(Skills), 4-4(최신 병렬 기능) 본문 완성
3. 매주: `weekly/` 절차로 manifest 신버전 diff를 두 권에 반영
4. 장 완성 시마다 `04-changelog.md` 기록

## 기준 버전
- 현재: **v2026.22** (`manuals/manifest.json`)
- 갱신 주기: 매주 (월요일 권장) — `weekly/README.md`
