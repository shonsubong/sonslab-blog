# 클로드 코드 한국어 출판 프로젝트

위키독스·시판 도서를 조사해, **최신 Claude Code**를 다루는 한국어 책을
두 권으로 출판하기 위한 작업 공간이다.

- **Vol.1 — 초급**: 처음 켜는 사람을 위한 책. 따라 하면 된다.
- **Vol.2 — 중·고급**: 스스로 설계하는 사람을 위한 책. 자동화·확장·운영.

두 권 모두 저장소가 주간으로 갱신하는 가이드북 자산
(`../manuals/manifest.json`, 현재 `v2026.22`, 141p / 123섹션)을 출판 품질의
단행본으로 재편성한 결과물이다. 최신 변경사항은 일주일 간격으로 반영한다
(→ `weekly/README.md`).

## 폴더 구조

```
books/
├─ README.md                  ← 지금 이 파일
├─ progress/                  ← 진행과정 기록 (체계적 편집·수정 이력)
│  ├─ 00-master-index.md         전체 진행 현황 한눈에
│  ├─ 01-skill-activation.md     Humanizer·Outline Planner 설치/활성화 기록
│  ├─ 02-competitive-research.md 위키독스·시판 도서 경쟁 분석
│  ├─ 03-decision-log.md         주요 의사결정 로그
│  └─ 04-changelog.md            원고 편집 이력
├─ shared/
│  ├─ style-guide.md          문체·표기 규칙 (Humanizer 기준)
│  └─ glossary.md             한·영 용어 표기 통일
├─ vol1-beginner/
│  ├─ outline.md              Vol.1 전체 아웃라인
│  └─ manuscript/             원고 (장별 마크다운)
├─ vol2-advanced/
│  ├─ outline.md              Vol.2 전체 아웃라인
│  └─ manuscript/             원고 (장별 마크다운)
└─ weekly/
   ├─ README.md               주간 업데이트 런북
   └─ update-runbook.sh       주간 갱신 보조 스크립트
```

## 작업 원칙

1. **스킬 먼저.** 모든 집필은 Outline Planner로 뼈대를 잡고, 초안 뒤
   Humanizer로 문체를 교정한다. (스킬 정의: `../.claude/skills/`)
2. **기록 먼저.** 의사결정과 편집은 `progress/`에 남겨 되짚을 수 있게 한다.
3. **사실은 자산에서.** 기능·버전·명령어는 `../manuals/manifest.json`과
   저장소의 최신 글을 근거로 한다. 추측으로 채우지 않는다.
4. **주간 반영.** Claude Code가 바뀌면 `weekly/` 절차로 두 권에 반영한다.
