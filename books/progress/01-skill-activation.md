# 01 · 스킬 설치 및 활성화 기록

목표 요구사항: "Humanizer skills 와 Outline Planner skills 를 먼저 설치하고
스킬을 먼저 활성화하여 체계적으로 진행."

## 설치 내역

| 스킬 | 경로 | 역할 |
|------|------|------|
| `humanizer` | `.claude/skills/humanizer/SKILL.md` | 한국어 원고에서 AI 티 제거, 사람 저자 문체로 교정 |
| `outline-planner` | `.claude/skills/outline-planner/SKILL.md` | 학습 곡선 기반 목차/아웃라인 설계 |

두 스킬은 프로젝트 스코프 스킬로 설치되어, 이 저장소에서 작업하는 모든
세션에서 `Skill` 도구로 호출할 수 있다. (`/humanizer`, `/outline-planner`)

## 활성화 방식 (집필 워크플로에 내장)

스킬은 단순 설치로 끝나지 않고, 집필 파이프라인의 **고정 단계**로 박아 두었다.

```
주제 선정
  └─> [Outline Planner] 부/장/절 + 학습목표·실습·함정 설계   (집필 전 필수)
        └─> 장별 초안 집필
              └─> [Humanizer] 문체 교정 + 사실 보존 체크      (출판 전 필수)
                    └─> progress/04-changelog.md 에 편집 이력 기록
```

- **Outline Planner 적용 결과**: `vol1-beginner/outline.md`,
  `vol2-advanced/outline.md` — 두 권의 아웃라인이 이 스킬의 출력 형식과
  품질 체크리스트를 따른다.
- **Humanizer 적용 기준**: `shared/style-guide.md`가 스킬의 '제거 대상'
  목록을 프로젝트 표기 규칙으로 고정. 모든 원고는 이 기준으로 교정한다.

## 검증

- [x] `humanizer/SKILL.md` 작성 — frontmatter `name`/`description` 포함
- [x] `outline-planner/SKILL.md` 작성 — frontmatter 포함
- [x] 두 스킬의 산출물이 실제 아웃라인/스타일가이드에 반영됨
- [x] 집필 절차에 스킬 호출 지점 명시 (위 다이어그램)
