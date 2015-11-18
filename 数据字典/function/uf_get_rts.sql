create or replace function uf_get_rts(vcsbz in number,vhx in number,vssy in number,gcs_e in number,gcs_v in number,gcs_m in number) return number is
   vgcs_e number;
   vgcs_v number;
   vgcs_m number;
   vgcs   number;
   vrts		number;
   Result number;
begin 
	 if vcsbz = 0 then
	 	  Return null;
	 end if;
	 
	 vgcs := gcs_e + gcs_v + gcs_m;
	 vrts := 0;
	 
   if vhx is null then --呼吸处理
      Return null;
   elsif vhx > 29 then
      vrts := vrts + 3;
   elsif vhx between 10 and 29 then
      vrts := vrts + 4;
   elsif vhx between 6 and 9 then
      vrts := vrts + 2;
   elsif vhx between 1 and 5 then
      vrts := vrts + 1;
   elsif vhx = 0 then
      vrts := vrts + 0;
   else
      Return null;
   end if;
   
   if vssy is null then --收缩压处理
      Return null;
   elsif vssy > 89 then
      vrts := vrts + 4;
   elsif vssy between 76 and 89 then
      vrts := vrts + 3;
   elsif vssy between 50 and 75 then
      vrts := vrts + 2;
   elsif vssy between 1 and 49 then
      vrts := vrts + 1;
   elsif vssy = 0 then
      vrts := vrts + 0;
   else
      Return null;
   end if;
   
   if vgcs is null then --心率处理
      Return null;
   elsif vgcs between 13 and 15 then
      vrts := vrts + 4;
   elsif vgcs between 9 and 12 then
      vrts := vrts + 3;
   elsif vgcs between 6 and 8 then
      vrts := vrts + 2;
   elsif vgcs between 4 and 5 then
      vrts := vrts + 1;
   elsif vgcs = 3 then
      vrts := vrts + 0;
   else
      Return null;
   end if;

   Result := vrts;
   return(Result);
end;

/
