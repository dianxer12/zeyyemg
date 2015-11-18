create or replace function uf_get_ews(as_yjjlxh in varchar2) return number is
   vhx number(3);
   vxybhd number(5,4);
   vtw number(3,1);
   vssy number(4);
   vmb number(3);
   vavpu varchar2(100);
   Result number;
   vews number(4,1);
begin
   vews := 0;
   select hx,xybhd,tw,ssy,mb,avpu
     into vhx,vxybhd,vtw,vssy,vmb,vavpu
     from jz_jzyjbrdjb
    where jlxh = as_yjjlxh;
   
   if vhx is null then --呼吸处理
      Return null;
   elsif vhx >= 36 then
      vews := vews + 3;
   elsif vhx between 31 and 35 then
      vews := vews + 2;
   elsif vhx between 21 and 30 then
      vews := vews + 1;
   elsif vhx between 9 and 20 then
      vews := vews + 0;
   elsif vhx < 9 then
      vews := vews + 3;
   else
      Return null;
   end if;
   
   if vxybhd is null then --血氧饱和度处理
      Return null;
   elsif vxybhd < 0.85 then
      vews := vews + 3;
   elsif vxybhd between 0.85 and 0.89 then
      vews := vews + 2;
   elsif vxybhd between 0.90 and 0.92 then
      vews := vews + 1;
   elsif vxybhd >= 0.93 then
      vews := vews + 0;
   else
      Return null;
   end if;
   
   if vtw is null then --体温处理
      Return null;
   elsif vtw = -1 then
      vews := vews + 3;
   elsif vtw >= 39 then
      vews := vews + 2;
   elsif vtw between 38 and 38.9 then
      vews := vews + 1;
   elsif vtw between 36 and 37.9 then
      vews := vews + 0;
   elsif vtw between 35 and 35.9 then
      vews := vews + 1;
   elsif vtw between 34 and 34.9 then
      vews := vews + 2;
   elsif vtw <= 33.9 then
      vews := vews + 3;
   else
      Return null;
   end if;
   
   if vssy is null then --收缩压处理
      Return null;
   elsif vssy >= 200 then
      vews := vews + 2;
   elsif vssy between 100 and 199 then
      vews := vews + 0;
   elsif vssy between 80 and 99 then
      vews := vews + 1;
   elsif vssy between 70 and 79 then
      vews := vews + 2;
   elsif vssy <= 69 then
      vews := vews + 3;
   else
      Return null;
   end if;
   
   if vmb is null then --心率处理
      Return null;
   elsif vmb >= 130 then
      vews := vews + 3;
   elsif vmb between 110 and 129 then
      vews := vews + 2;
   elsif vmb between 100 and 109 then
      vews := vews + 1;
   elsif vmb between 50 and 99 then
      vews := vews + 0;
   elsif vmb between 40 and 49 then
      vews := vews + 1;
   elsif vmb between 30 and 39 then
      vews := vews + 2;
   elsif vmb <= 29 then
      vews := vews + 3;
   else
      Return null;
   end if;
   
   if vavpu is null then --AVPU反应处理
      Return null;
   elsif instr(vavpu,'敏捷') > 0 then
      vews := vews + 0;
   elsif instr(vavpu,'声音') > 0 then
      vews := vews + 1;
   elsif instr(vavpu,'疼痛') > 0 then
      vews := vews + 2;
   elsif instr(vavpu,'无') > 0 then
      vews := vews + 3;
   else
      Return null;
   end if;

   Result := vews;
   return(Result);
end uf_get_ews;

/
