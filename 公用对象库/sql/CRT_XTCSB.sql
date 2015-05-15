--系统参数表
DROP TABLE xtcsb;
CREATE TABLE xtcsb 	       
(
  XTXH      	NUMBER(1)       NOT NULL,  --系统序号
  CSFL		VARCHAR2(10)    NOT NULL,  --参数分类
  CSMC   	VARCHAR2(20)    NOT NULL,  --参数名称
  CSZ1   	VARCHAR2(100)   NULL,      --参数值1
  CSZ2   	NUMBER(1)       NULL,      --参数值2
  BZ     	VARCHAR2(200)   NULL,      --备注
  ISUPDATE 	NUMBER(1)   	NULL,      --允许更新
  CONSTRAINT PK_XTCSB_XTXHCSMC PRIMARY KEY (xtxh,csfl,csmc)
)tablespace JZGLXT;

--界面参数
INSERT INTO xtcsb(xtxh,csfl,csmc,csz1,csz2,bz,isupdate)
VALUES(1,'JMCS','DLXSDHCK',null,0,'登陆是否显示导航窗口 0:不显示 1:显示',1);
--数据库参数
INSERT INTO xtcsb(xtxh,csfl,csmc,csz1,csz2,bz,isupdate)
VALUES(1,'SJKCS','DLXSDHCK',null,0,'登陆是否显示导航窗口 0:不显示 1:显示',1);
--业务参数
INSERT INTO xtcsb(xtxh,csfl,csmc,csz1,csz2,bz,isupdate)
VALUES(1,'YWCS','DLXSDHCK',null,0,'登陆是否显示导航窗口 0:不显示 1:显示',1);

COMMIT;