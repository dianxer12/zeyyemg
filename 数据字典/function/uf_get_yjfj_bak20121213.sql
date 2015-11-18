create or replace function uf_get_yjfj(vhx in number,vxybhd in number,vssy in number,vmb in number,vavpu in varchar2) return varchar2 is
   ln_xybhd number(8,4);
   Result varchar2(50);
begin
	 if vxybhd > 1 then
	 	  ln_xybhd := vxybhd * 0.01;
   else
      ln_xybhd := vxybhd;
	 end if;
   if vavpu is null then --AVPU反应处理
      Return null;
   elsif upper(vavpu) = 'A' then
   		if (vhx >= 36 or vhx <= 8) or (vxybhd < 0.85) or (vssy < 80) then
      	Result := 'Ⅰ级';
      	return(Result);
      end if;
   		if (vhx between 31 and 35) or (ln_xybhd between 0.85 and 0.89) or (vssy >= 200 or vssy between 80 and 90) or (vmb >= 130 or vmb <= 39) then
      	Result := 'Ⅱ级';
      	return(Result);
      end if;
      if (vhx between 21 and 30) or (ln_xybhd between 0.90 and 0.94) or (vssy between 141 and 199) or (vmb between 100 and 129 or vmb between 40 and 49) then
      	Result := 'Ⅲ级';
      	return(Result);
      end if;
      if (vhx between 9 and 20) or (ln_xybhd >= 0.95) or (vssy between 91 and 140) or (vmb between 50 and 99) then
      	Result := 'Ⅳ级';
      	return(Result);
      end if;
   elsif upper(vavpu) = 'V' or upper(vavpu) = 'P' or upper(vavpu) = 'U' then
   		if (vhx >= 36 or vhx <= 8) or (vxybhd < 0.85) or (vssy < 80) then
      	Result := 'Ⅰ级';
      	return(Result);
      end if;
   		if (vhx between 31 and 35) or (ln_xybhd between 0.85 and 0.89) or (vssy >= 200 or vssy between 80 and 90) or (vmb >= 130 or vmb <= 39) then
      	Result := 'Ⅱ级';
      	return(Result);
      end if;
      if (vhx between 21 and 30) or (ln_xybhd between 0.90 and 0.94) or (vssy between 141 and 199) or (vmb between 100 and 129 or vmb between 40 and 49) then
      	Result := 'Ⅲ级';
      	return(Result);
      end if;
      Result := 'Ⅳ级';
      return(Result);
   else
      Return null;
   end if;
   
   return(Result);
end uf_get_yjfj;

/
