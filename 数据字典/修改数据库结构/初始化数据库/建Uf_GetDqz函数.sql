create or replace function Uf_GetYjjlxh(ai_bz integer)
return varchar2 is
PRAGMA AUTONOMOUS_TRANSACTION; --使用自治事务
ls_sysdate varchar2(20);
ls_dqz varchar2(20);
begin
SELECT TO_CHAR(sysdate,'yymmdd'),SUBSTR(dqz,1,6)
  INTO ls_sysdate,ls_dqz
  FROM xhb
 WHERE name = 'JZYJBRDJ';

If ls_sysdate <> ls_dqz Then
  UPDATE xhb
     SET dqz = ls_sysdate||'001'
   WHERE name = 'JZYJBRDJ';
  commit;
End If;

SELECT dqz
  INTO ls_dqz
  FROM xhb
 WHERE name = 'JZYJBRDJ';

If ai_bz = 1 Then
  UPDATE xhb
     SET dqz = SUBSTR(TO_CHAR(TO_NUMBER(dqz)+zz,'000000000'),2,9)
   WHERE name = 'JZYJBRDJ';
  commit;
End If;

return ls_dqz;
end;
