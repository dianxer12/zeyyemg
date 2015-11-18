create index IDX_JZ_JZLQXXDJB_BRXM on JZ_JZLQXXDJB (
   BRXM ASC
);
create index IDX_JZ_JZLQXXDJB_DJRQ on JZ_JZLQXXDJB (
   DJRQ ASC
);
create index IDX_JZ_JZLQXXDJB_JZKH on JZ_JZLQXXDJB (
   JZKH ASC
);
create index IDX_JZ_JZLQXXDJB_KSMC on JZ_JZLQXXDJB (
   KSMC ASC
);
create index IDX_JZ_JZLQXXDJB_LQSJ on JZ_JZLQXXDJB (
   LQSJ ASC
);
create unique index UIDX_JZ_JZLQXXDJB_YJJLXH on JZ_JZLQXXDJB (
   YJJLXH ASC
);

alter table jz_jzlqxxdjb add constraint pk_jz_jzlqxxdjb primary key(jlxh);

alter table jz_jzlqxxdjb drop column mbxh;