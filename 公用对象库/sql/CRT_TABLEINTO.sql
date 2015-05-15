--系统日志表
DROP TABLE tableinfo;
CREATE TABLE tableinfo
(
  TABLE_ID        VARCHAR2(30)  NOT NULL,
  TABLE_NAME      VARCHAR2(30)  NULL,
  TABLESPACE_NAME VARCHAR2(30)  NOT NULL,
  COMMENTS	  VARCHAR2(100) NULL,
  LAST_ANALYZED   DATE          NULL,
  COUNT           NUMBER(10)    NULL,
  COUNT_DATE      DATE          NULL,
  XTXH            NUMBER(2)     NOT NULL,
  CONSTRAINT PK_TABLEINFO PRIMARY KEY(TABLE_ID)
)tablespace JZGLXT;

insert into tableinfo(table_id,tablespace_name,comments,last_analyzed,xtxh)
SELECT a.table_name,
       a.tablespace_name,
       b.comments,
       a.last_analyzed,
       1
  FROM user_tables a,user_tab_comments b
 WHERE a.table_name = b.table_name
   and not exists(select * from tableinfo where table_id = a.table_name);
COMMIT;