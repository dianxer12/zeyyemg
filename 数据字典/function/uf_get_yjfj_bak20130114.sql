create or replace function uf_get_yjfj(vhx in number,vxybhd in number,vssy in number,vmb in number,vavpu in varchar2) return varchar2 is
   ln_xybhd number(8,4);
   vyjfj varchar2(50);
   Result varchar2(50);
begin
	 if vxybhd > 1 then
	 	  ln_xybhd := vxybhd * 0.01;
   else
      ln_xybhd := vxybhd;
	 end if;
	 
	 if (vhx between 12 and 20) or (ln_xybhd >= 0.95) or (vssy between 90 and 140) or (vmb between 60 and 100) then
    	vyjfj := 'Ⅳ级';
   end if;
   if (vhx between 21 and 29) or (ln_xybhd between 0.90 and 0.94) or (vssy between 141 and 199) or (vmb between 101 and 129 or vmb between 40 and 59) then
    	vyjfj := 'Ⅲ级';
   end if;
   if (vhx between 30 and 35 or vhx between 9 and 11) or (ln_xybhd between 0.85 and 0.89) or (vssy >= 200 or vssy between 70 and 89) or (vmb >= 130 or vmb <= 39) then
    	vyjfj := 'Ⅱ级';
   end if;
	 if (vhx >= 36 or vhx <= 8) or (ln_xybhd < 0.85) or (vssy < 70) then
    	vyjfj := 'Ⅰ级';
   end if;

   if vavpu is null then --AVPU反应处理
      Return null;
   end if;
   
   if vyjfj = 'Ⅳ级' and (vavpu = 'V' or vavpu = 'P') then
   		Result := 'Ⅲ级';
   elsif vyjfj = 'Ⅳ级' and vavpu = 'U' then
   		Result := 'Ⅱ级';
   elsif vyjfj = 'Ⅲ级' and (vavpu = 'P' or vavpu = 'U') then
   		Result := 'Ⅱ级';
   else
   		Result := vyjfj;
   end if;
   
   return(Result);
end uf_get_yjfj;

/
