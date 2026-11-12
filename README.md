# fin-data-platform
Oracle 기반 금융 공개데이터 수집·가공·서빙 플랫폼

## 커밋 컨벤션
`<타입>: <내용>` 형식을 쓴다.

| 타입 | 용도 |
|---|---|
| feat | 기능 추가 |
| fix | 버그 수정 |
| perf | 성능 개선 (튜닝) |
| db | 스키마 변경, 마이그레이션 |
| refactor | 동작 변경 없는 구조 개선 |
| docs | 문서 |
| test | 테스트 |
| chore | 빌드·설정 |

## 문서
- `docs/adr/` 기술 선택 기록
- `docs/api/` API 명세 초안
- `docs/tuning/` 튜닝 전·후 측정 기록

## 로컬 실행

```bash
cd docker
cp .env.example .env   # ORACLE_SYS_PASSWORD 채우기
mkdir -p diag          # 진단 로그 마운트 지점 (깃 추적 제외)
docker compose up -d
```

`docker compose logs -f oracle`에 `DATABASE IS READY TO USE!`가 뜨면 기동 완료다.

### 첫 기동 주의
faststart 이미지는 데이터파일을 포함한 상태로 배포된다. 그래서 첫 기동에서 `ORACLE_PASSWORD`가 무시되고 접속 시 ORA-01017이 난다. 볼륨을 지우고 다시 올려도 같다.

```bash
docker exec fdp-oracle resetPassword <비밀번호>
```

한 번 실행하면 이후로는 유지된다.

### 접속 정보
| 항목 | 값 |
|---|---|
| 호스트 | localhost:1521 |
| 서비스 | FREEPDB1 |
| 버전 | Oracle AI Database 26ai Free 23.26.3.0.0 |
| 문자셋 | AL32UTF8 |
| Redis | localhost:6379 |
