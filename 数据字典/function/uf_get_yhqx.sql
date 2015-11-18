create or replace function uf_get_yhqx(as_id in varchar2,as_cdx in varchar2) return number is
   vResult number(4);
begin
   select nvl(count(*),0)
     into vResult
     from yhb a,yhqx b,yhzqx c
    where a.xtxh = b.xtxh
      and a.xtxh = c.xtxh
      and a.yhdm = b.yhdm
      and b.yhzxh = c.yhzxh
      and a.xtxh = 1
      and a.yhdm = as_id
      and upper(c.cdx) = upper(as_cdx);
   if vResult is null then
      vResult := 0;
   end if;
   return(vResult);
end uf_get_yhqx;

/