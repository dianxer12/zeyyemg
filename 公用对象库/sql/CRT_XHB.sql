--ÐòºÅ±í
DROP TABLE xhb;
CREATE TABLE xhb 		
(
  name     VARCHAR2(20)      NOT NULL,
  dqz      VARCHAR2(20)      NULL,
  zz       VARCHAR2(2)       NULL,
  bz       VARCHAR2(50)      NULL,
  constraint pk_xhb_bm primary key (xtxh,name)
)tablespace JZGLXT;

/*insert into xhb
values ( 'JZYJBRDJ','030715001',1,null);
COMMIT;
*/
