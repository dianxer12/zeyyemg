--用户表
DROP TABLE yhb;
CREATE TABLE yhb 
(
  XTXH   NUMBER(2)         NOT NULL,
  YHDM   VARCHAR2(5)       NOT NULL,
  YHM    VARCHAR2(10)      NOT NULL,
  YHMM   VARCHAR2(15)      NULL,
  SRM    VARCHAR2(10)      NULL,
  YHZXH  NUMBER(1)         NOT NULL,
  CONSTRAINT PK_YHB PRIMARY KEY(XTXH,YHDM)
);

INSERT INTO YHB(xtxh,yhdm,yhm,yhmm,srm,yhzxh)
VALUES(5,'DBA','超级用户',null,null,0);
COMMIT;

CREATE INDEX idx_yhb_yhdm on yhb(yhdm);
CREATE INDEX idx_yhb_srm on yhb(srm);
