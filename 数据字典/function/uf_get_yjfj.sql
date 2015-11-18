create or replace function uf_get_yjfj(vcbzd in varchar2,vhx in number,vxybhd in number,vssy in number,vmb in number,vavpu in varchar2,vgcs_e in number,vgcs_v in number,vgcs_m in number) return varchar2 is
   ln_xybhd number(8,4);
   lv_avpu varchar2(20);
   ln_gcs number(4);
   vyjfj varchar2(50);
   Result varchar2(50);
begin
	 if vxybhd > 1 then
	 	  ln_xybhd := vxybhd * 0.01;
   else
      ln_xybhd := vxybhd;
	 end if;
   
   lv_avpu := vavpu;
   ln_gcs := vgcs_e + vgcs_v + vgcs_m;
	 if lv_avpu is null and ln_gcs > 0 then
	    if ln_gcs = 15 then
	    	lv_avpu := 'A';
	    elsif ln_gcs between 9 and 14 then
	    	lv_avpu := 'V';
	    elsif ln_gcs between 4 and 8 then
	    	lv_avpu := 'P';
	    elsif ln_gcs = 3 then
	    	lv_avpu := 'U';
	    end if;
	 end if;
	 vyjfj := 'Ⅴ级';

	 if (vhx between 12 and 20) or (ln_xybhd >= 0.95) or (vssy between 90 and 140) or (vmb between 60 and 100) then
    	vyjfj := 'Ⅳ级';
   end if;

   if (vhx between 21 and 29) or (ln_xybhd between 0.90 and 0.94) or (vssy between 141 and 199) or (vmb between 101 and 129 or vmb between 50 and 59) then
    	vyjfj := 'Ⅲ级';
   end if;

   if (vhx between 30 and 35 or vhx between 9 and 11) or (ln_xybhd between 0.85 and 0.89) or (vssy >= 200 or vssy between 70 and 89) or (vmb >= 130 or vmb <= 49) then
    	vyjfj := 'Ⅱ级';
   end if;
   if (lv_avpu = 'V' or lv_avpu = 'P' or lv_avpu = 'U') then
   		vyjfj := 'Ⅱ级';
   end if;
   if (instr(vcbzd,'自发性蛛网膜下腔出血') > 0 or
   		 instr(vcbzd,'蛛血') > 0 or
   		 instr(vcbzd,'动脉瘤') > 0 or
   		 instr(vcbzd,'急性冠脉综合征') > 0 or
   		 instr(vcbzd,'急性心肌梗死') > 0 or
   		 instr(vcbzd,'心梗') > 0 or
   		 instr(vcbzd,'主动脉夹层') > 0 or
   		 instr(vcbzd,'癫痫') > 0) or
   		 instr(vcbzd,'消化道出血') > 0 or
   		 instr(vcbzd,'多发伤') > 0 or
   		 instr(vcbzd,'中毒') > 0 or
   		 instr(vcbzd,'脑梗塞') > 0 or
   		 instr(vcbzd,'脑出血') > 0 or
   		 instr(vcbzd,'脑血管意外') > 0 or
   		 instr(vcbzd,'心衰') > 0 or
   		 instr(vcbzd,'呼衰') > 0 or
   		 instr(vcbzd,'肾衰') > 0 or
   		 instr(vcbzd,'胸痛待查') > 0 or
   		 instr(vcbzd,'开放性骨折') > 0 or
   		 instr(vcbzd,'毁损伤') > 0 or
   		 instr(vcbzd,'挤压伤') > 0 then
      vyjfj := 'Ⅱ级';
   end if;

	 if (vhx >= 36 or vhx <= 8) or (ln_xybhd < 0.85) or (vssy < 70) then
    	vyjfj := 'Ⅰ级';
   end if;

   Result := vyjfj;

   return(Result);
end;

/