需求:
1. 20150330 - 预检分级保存时判断非空
2. 201503232 - 急诊分区自动生成
请同护士长确认下对于备注栏的需求，我将按照会诊科室的设计来做，是否可行。

jzs用户执行以下sql
UPDATE GYDMB SET BZ = 'A区' where DMMC ='Ⅰ级';
UPDATE GYDMB SET BZ = 'A区' where DMMC ='Ⅱ级';
UPDATE GYDMB SET BZ = 'B区' where DMMC ='Ⅲ级';
UPDATE GYDMB SET BZ = 'B区' where DMMC ='Ⅳ级';
UPDATE GYDMB SET BZ = 'C区' where DMMC ='Ⅴ级';
commit;