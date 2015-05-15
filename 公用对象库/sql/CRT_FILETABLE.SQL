--文件表
DROP TABLE filetable CASCADE CONSTRAINTS;
CREATE TABLE filetable
(
  XTMC      	 VARCHAR2(50)      NULL,                      --系统名称
  FILEGROUPID    VARCHAR2(10)      NULL,                      --文件组号  (程序更新，程序备份)
  FILENAME  	 VARCHAR2(50)      NULL,                      --文件名
  VERSION        VARCHAR2(20)      NULL,                      --版本
  FILESIZE  	 NUMBER(10)        NULL,                      --文件大小
  SOURCE    	 LONG RAW          DEFAULT EMPTY_BLOB() NULL, --文件源
  REMARK         VARCHAR2(200)     NULL,                      --备注 
  SCRQ           DATE              NOT NULL,                  --上传日期
  CONSTRAINT PK_FILETABLE PRIMARY KEY(XTMC,FILEGROUPID,FILENAME,VERSION)
);

CREATE INDEX IDX_FILETABLE_XTMC ON filetable(xtmc);