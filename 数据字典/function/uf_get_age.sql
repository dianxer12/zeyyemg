CREATE OR REPLACE FUNCTION uf_get_age(ad_csrq IN date,ad_dqrq IN date,ai_cs IN VARCHAR2) RETURN number IS
   RESULT VARCHAR2(50);
   n_months  number;
   n_cs      number;
   d_dqrq    date;
   n_nl      number;
   /*Modi daq  2011/08/03 对 9,10 bug处理  */
BEGIN
    Begin
         IF ad_csrq is null  OR ad_csrq <= TO_DATE('19010101','yyyymmdd') THEN
             RESULT := null;
             RETURN(RESULT);
         END IF;
         IF ad_dqrq is null  OR ad_dqrq <= TO_DATE('19010101','yyyymmdd') THEN
            d_dqrq := SYSDATE;
         ELSE
            d_dqrq := ad_dqrq;
         END IF;

         n_cs := ai_cs;

         If n_cs is Null Or n_cs<=0 Then
            n_cs := 1;
         End If;

         IF n_cs = 1 Then  -- 以实(周)岁 算
              select to_number(to_char(d_dqrq,'YYYY'))*12 + to_number(to_char(d_dqrq,'MM')) -
                    (to_number(to_char(ad_csrq,'YYYY'))*12 + to_number(to_char(ad_csrq,'MM')))
              into n_months
              from dual;    ---// (当前年份*12+当前月份) – (出生年份*12+出生月份)
              IF n_months >= 12 THEN    	--//如果大于等于12个月
                ---	//周岁的算法
                 If	to_char(ad_csrq,'MM')= to_char(d_dqrq,'MM')	Then		--	//同月的时候
                   If	to_char(ad_csrq,'DD')>to_char(d_dqrq,'DD')	then
                      n_nl:=trunc(n_months/12,0) -1;
                   else
                      n_nl:=trunc(n_months/12,0);
                   End If;
                 Else
                   n_nl:=trunc(n_months/12,0);
                 End If;
               ELSE              ---//0岁
                 n_nl:= 0;
               END IF;
         END IF;
         RESULT := n_nl;
   EXCEPTION
    WHEN OTHERS THEN
       RESULT := null;
    End;


    RETURN(RESULT);
END;
/
