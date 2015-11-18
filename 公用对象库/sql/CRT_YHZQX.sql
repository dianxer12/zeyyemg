--用户组权限表
drop table yhzqx;
CREATE TABLE yhzqx
(
  XTXH        NUMBER(2)    NULL,      --系统序号
  YHZXH       NUMBER(2)    NOT NULL,  --用户代码
  CDX	      VARCHAR2(20) NOT NULL,  --菜单项
  CONSTRAINT PK_YHZQX PRIMARY KEY(XTXH,YHZXH,CDX)
)tablespace JZGLXT;