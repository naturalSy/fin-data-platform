-- 아카이브 로그 모드 전환
-- 데이터 적재 전에 한 번만 실행한다. 켠 시점 이후의 변경만 복구 가능하다.

ALTER SYSTEM SET db_recovery_file_dest_size = 15G SCOPE=BOTH;
ALTER SYSTEM SET db_recovery_file_dest = '/opt/oracle/oradata/FRA' SCOPE=BOTH;

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;

SELECT log_mode FROM v$database;
