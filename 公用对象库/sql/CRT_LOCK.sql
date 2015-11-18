--系统日志表
DROP TABLE operatelock;
CREATE TABLE operatelock
(
  lockname    VARCHAR2(10)  NOT NULL,
  lockvalue   VARCHAR2(20)  NOT NULL,
  lockuser    VARCHAR2(10)  NOT NULL,
  constraint pk_operatelock primary key(lockname,lockvalue)
);