#!/usr/bin/env bash
# 주간 업데이트 보조 스크립트
# 역할: manifest 최신 버전과 책 기준 버전을 비교해, 다르면 그 주의 작업 파일을
#       books/weekly/pending/ 에 스캐폴드한다. (반영 자체는 사람/Claude가 수행)
#
# 사용: bash books/weekly/update-runbook.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MANIFEST="$ROOT/manuals/manifest.json"
OUTLINE1="$ROOT/books/vol1-beginner/outline.md"
PENDING="$ROOT/books/weekly/pending"
mkdir -p "$PENDING" "$ROOT/books/weekly/done"

if [ ! -f "$MANIFEST" ]; then
  echo "manifest 없음: $MANIFEST" >&2; exit 1
fi

# 최신 manifest 버전 라벨 추출 (예: v2026.22-guidebook)
LATEST="$(python3 -c "import json,sys; d=json.load(open(sys.argv[1])); print(d['versions'][0].get('week_label',''))" "$MANIFEST")"
# 책에 박힌 기준 버전 추출 (outline의 'v2026.22' 패턴)
CURRENT="$(grep -oE 'v20[0-9]{2}\.[0-9]+' "$OUTLINE1" | head -1 || true)"

echo "manifest 최신 : ${LATEST:-(없음)}"
echo "책 기준 버전  : ${CURRENT:-(없음)}"

# manifest 라벨에서 vYYYY.WW만 정규화
LATEST_V="$(echo "$LATEST" | grep -oE 'v20[0-9]{2}\.[0-9]+' | head -1 || true)"

if [ -z "$LATEST_V" ]; then
  echo "manifest에서 버전 파싱 실패. 수동 확인 필요." >&2; exit 2
fi

if [ "$LATEST_V" = "$CURRENT" ]; then
  echo "변경 없음 — 이번 주 반영 작업 불필요."
  exit 0
fi

TASKFILE="$PENDING/${LATEST_V}.md"
if [ -f "$TASKFILE" ]; then
  echo "이미 대기 작업 존재: $TASKFILE"
  exit 0
fi

cat > "$TASKFILE" <<EOF
# 주간 반영 작업 — $LATEST_V (이전: ${CURRENT:-unknown})

생성: 스크립트 자동. 처리: 사람/Claude 세션. 완료 시 done/ 으로 이동.

## 체크리스트 (books/weekly/README.md 절차)
- [ ] manifest $LATEST_V 변경분(diff) 추출 — 신규/변경 섹션 목록화
- [ ] 영향 장 매핑 (vol1/vol2 outline의 원천 자산 매핑 참조)
- [ ] Vol.1(초급): 안정된 기본만 반영
- [ ] Vol.2(중·고급): 신기능 반영 (필요 시 outline-planner로 새 절 신설)
- [ ] humanizer로 문체 교정 + 사실 보존 체크
- [ ] 두 outline.md + 서문의 기준 버전 → $LATEST_V 로 갱신
- [ ] progress/04-changelog.md 기록
- [ ] 커밋: docs(books): 주간 반영 $LATEST_V

## 변경분 메모
(여기에 추출한 diff 요약을 적는다)
EOF

echo "작업 파일 생성: $TASKFILE"
echo "다음 단계: README.md 절차대로 반영 후 done/ 으로 이동."
