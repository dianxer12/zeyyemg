SELECT TO_CHAR(a.rysj,'yyyy-mm-dd') rysj,
       b.ksmc ksmc,
       NVL(SUM(DECODE(a.ksmc,b.ksmc,1,1,0)),0) jzrc,
       NVL(SUM(DECODE(SIGN(INSTR(a.hzksmc,'|'||b.ksmc||'|')),1,1,0)),0) hzrc
  From jz_jzyjbrdjb a,ksdmb b
 WHERE a.djrq < TO_DATE('20030826','yyyymmdd')
GROUP BY TO_CHAR(a.rysj,'yyyy-mm-dd'),b.ksmc
