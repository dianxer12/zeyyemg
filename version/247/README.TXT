JZS用户执行以下sql
insert into gydmb (DMLB,DMMC,SRM,BZ,PXXH,DM) VALUES ('FZBZTX','SSY','70,220','70-80,200-219','10','FZBZTX');
insert into gydmb (DMLB,DMMC,SRM,BZ,PXXH,DM) VALUES ('FZBZTX','MB','40,180','41-50,141-179','20','FZBZTX');
insert into gydmb (DMLB,DMMC,SRM,BZ,PXXH,DM) VALUES ('FZBZTX','HX','8,36','','30','FZBZTX');
insert into gydmb (DMLB,DMMC,SRM,BZ,PXXH,DM) VALUES ('FZBZTX','XYBHD','85,90','85-89','40','FZBZTX');
insert into gydmb (DMLB,DMMC,SRM,BZ,PXXH,DM) VALUES ('FZBZTX','TW','32,41','','50','FZBZTX');
insert into gydmb (DMLB,DMMC,SRM,BZ,PXXH,DM) VALUES ('FZBZTX','TTPF','0','8-10','60','FZBZTX');
commit;


需求
1. 根据最新的预检分诊标准计算预检分级
2. 查询界面 - 3级患者 30 分钟未就诊， 4级患者60分钟未就诊，5级患者120分钟未就诊，背景显示紫色
3. 再状态栏显示提醒，有超时病人，请去查询界面