#!/bin/bash
set -euo pipefail

# 변수 설정
POD="mysql-59f7d5bdfc-n4brn"
PASS="1234"
FILES=("attendance_dump.sql" "banking_dump.sql" "member_dump.sql")

# SQL 파일을 Pod 내부 /tmp 경로에 복사하고 import 실행
for FILE in "${FILES[@]}"; do
  echo "➤ ${FILE} 복사 중..."
  kubectl cp "${FILE}" "${POD}:/tmp/${FILE}"

  DB_NAME=$(basename "${FILE}" _dump.sql)

  echo "➤ ${DB_NAME} 데이터베이스로 ${FILE} import 중..."
  kubectl exec -i "${POD}" -- sh -c "mysql -uroot -p${PASS} ${DB_NAME} < /tmp/${FILE}"
done

echo "✅ 모든 dump 파일이 MySQL에 성공적으로 import되었습니다."
