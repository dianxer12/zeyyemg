create or replace view jzs.batj_v_bajk50 as
select a.jlxh key5001,	--��¼���
       a.brxm col5001,	--����
       decode(a.xb,'��',1,'Ů',2) col5002,	--�Ա�
       a.csrq col5003,	--��������
       to_char(jzs.uf_get_age(a.csrq,sysdate,1))||'Y' col5004,	--����
       b.sfzh col5005,	--���֤��
       b.lxdz col5006,	--��ϵ��ַ
       b.lxdh col5007,	--��ϵ�绰
       a.rysj col5008,	--Ԥ��ʱ��
       (select baksdm from jzs.jz_ksmc where ksdm = c.ghksdm) col5009,	--�������Ҵ���
       (select dm from jzs.gydmb where dmlb = 'RYTJ' and dmmc = a.rytj) col5010,	--��Ժ;��
       a.rytjmx col5011,	--��Ժ;��˵��
       a.tw col5012,	--����
       a.mb col5013,	--����
       a.hx col5014,	--����
       decode(a.ssy||'/'||a.szy,'/',null,a.ssy||'/'||a.szy) col5015, --Ѫѹ
       (select jzs.uf_get_ews(a.hx,a.xybhd,a.tw,a.ssy,a.mb,a.avpu) from dual) col5016,	--ews����
       a.ttpf col5017,	--��ʹ����
       d.lqsj col5018,	--����ʱ��
       (select baksdm from jzs.jz_ksmc aa,jzs.ksdmb bb where aa.ksdm = bb.ghksdm and bb.ksdm = d.ksdm) col5019,	--������������
       d.lqzd col5020,	--�������
       e.lqsj col5021,	--����ʱ��
       null col5022,	--����������֢״
       e.ttpf col5023,	--������ʹ����
       null col5024,	--��Ⱦ
       null col5025,	--��Ⱦ�Լ���
       (select dm from jzs.gydmb where dmlb = 'LQQX0' and dmmc = e.lqqx) col5027,	--����ȥ��
       e.lqqxmx col5028,	--����ȥ��˵��
       null col5029,	--���ܿ���
       (select bb.baksdm from jzs.jz_bqmc aa,jzs.jz_ksmc bb where aa.bqdm = bb.ksdm and aa.bqdm = e.bqdm) col5030,	--��ס����
       (select dm from jzs.gydmb where dmlb = 'ZYTJ' and dmmc = e.zytj) col5031,	--ת��;��
       e.zytjmx col5032,	--ת��;����ϸ
       e.ysgh col5033,	--����ҽʦ
       null col5034,	--����ҽʦ
       null col5035,	--���λ�ʿ
       null col5036,	--��ס����
       to_number(nvl(e.zyh,a.bah)) col5037,	--������
       0 flag	--��˱�־
  from jzs.jz_jzyjbrdjb a,jzs.jz_brjbxxk b,jzs.ksdmb c,jzs.jz_jzlqxxdjb d,jzs.jz_jzlqxxdjb0 e
 where a.jzkh = b.jzkh
   and nvl(a.ksdm,d.ksdm) = c.ksdm
   and a.jlxh = d.yjjlxh
   and a.jlxh = e.yjjlxh
   and e.lqsj >= to_date('20120101','yyyymmdd');