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
	 vyjfj := '����';

	 if (vhx between 12 and 20) or (ln_xybhd >= 0.95) or (vssy between 90 and 140) or (vmb between 60 and 100) then
    	vyjfj := '����';
   end if;

   if (vhx between 21 and 29) or (ln_xybhd between 0.90 and 0.94) or (vssy between 141 and 199) or (vmb between 101 and 129 or vmb between 50 and 59) then
    	vyjfj := '��';
   end if;

   if (vhx between 30 and 35 or vhx between 9 and 11) or (ln_xybhd between 0.85 and 0.89) or (vssy >= 200 or vssy between 70 and 89) or (vmb >= 130 or vmb <= 49) then
    	vyjfj := '��';
   end if;
   if (lv_avpu = 'V' or lv_avpu = 'P' or lv_avpu = 'U') then
   		vyjfj := '��';
   end if;
   if (instr(vcbzd,'�Է�������Ĥ��ǻ��Ѫ') > 0 or
   		 instr(vcbzd,'��Ѫ') > 0 or
   		 instr(vcbzd,'������') > 0 or
   		 instr(vcbzd,'���Թ����ۺ���') > 0 or
   		 instr(vcbzd,'�����ļ�����') > 0 or
   		 instr(vcbzd,'�Ĺ�') > 0 or
   		 instr(vcbzd,'�������в�') > 0 or
   		 instr(vcbzd,'���') > 0) or
   		 instr(vcbzd,'��������Ѫ') > 0 or
   		 instr(vcbzd,'�෢��') > 0 or
   		 instr(vcbzd,'�ж�') > 0 or
   		 instr(vcbzd,'�Թ���') > 0 or
   		 instr(vcbzd,'�Գ�Ѫ') > 0 or
   		 instr(vcbzd,'��Ѫ������') > 0 or
   		 instr(vcbzd,'��˥') > 0 or
   		 instr(vcbzd,'��˥') > 0 or
   		 instr(vcbzd,'��˥') > 0 or
   		 instr(vcbzd,'��ʹ����') > 0 or
   		 instr(vcbzd,'�����Թ���') > 0 or
   		 instr(vcbzd,'������') > 0 or
   		 instr(vcbzd,'��ѹ��') > 0 then
      vyjfj := '��';
   end if;

	 if (vhx >= 36 or vhx <= 8) or (ln_xybhd < 0.85) or (vssy < 70) then
    	vyjfj := '��';
   end if;

   Result := vyjfj;

   return(Result);
end;

/