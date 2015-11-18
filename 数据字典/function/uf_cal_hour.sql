create or replace function uf_cal_hour(adt_rq1 in date,adt_rq2 in date) return number is
   vResult number(4);
begin
   select floor(to_number((adt_rq2 - adt_rq1)*24))
     into vResult
     from dual;
   if vResult is null then
      vResult := 0;
   end if;
   return(vResult);
end;

/