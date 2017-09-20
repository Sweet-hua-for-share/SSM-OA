CREATE TABLE oadb.sys_user (
  id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '���',
  company_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '������˾',
  office_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '��������',
  login_name varchar(100) COLLATE utf8_bin NOT NULL COMMENT '��¼��',
  password varchar(100) COLLATE utf8_bin NOT NULL COMMENT '����',
  no varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  name varchar(100) COLLATE utf8_bin NOT NULL COMMENT '����',
  email varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  phone varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '�绰',
  mobile varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '�ֻ�',
  user_type char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '�û�����',
  login_date datetime DEFAULT NULL COMMENT '����½ʱ��',
  login_flag varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ƿ�ɵ�¼',
  create_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '������',
  create_date datetime NOT NULL COMMENT '����ʱ��',
  update_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '������',
  update_date datetime NOT NULL COMMENT '����ʱ��',
  remarks varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע��Ϣ',
  del_flag char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�û���';

insert  into oadb.sys_user(id,company_id,office_id,login_name,password,no,name,email,phone,mobile,user_type,login_date,login_flag,create_by,create_date,update_by,update_date,remarks,del_flag) values ('1','1','2','admin','admin','0001','ϵͳ����Ա','admin@163.com','865','8675',NULL,NULL,'1','1','2017-05-27 08:00:00','1','2017-05-27 08:00:00','��߹���Ա','0');


CREATE TABLE oadb.sys_office (
  id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '���',
  parent_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '�������',
  parent_ids varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '���и������',
  name varchar(100) COLLATE utf8_bin NOT NULL COMMENT '����',
  sort decimal(10,0) NOT NULL COMMENT '����',
  area_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '��������',
  code varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '�������',
  type char(1) COLLATE utf8_bin NOT NULL COMMENT '��������',
  grade char(1) COLLATE utf8_bin NOT NULL COMMENT '�����ȼ�',
  address varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '��ϵ��ַ',
  zip_code varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  master varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '������',
  phone varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '�绰',
  fax varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  email varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  USEABLE varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ƿ�����',
  PRIMARY_PERSON varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  DEPUTY_PERSON varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  create_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '������',
  create_date datetime NOT NULL COMMENT '����ʱ��',
  update_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '������',
  update_date datetime NOT NULL COMMENT '����ʱ��',
  remarks varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע��Ϣ',
  del_flag char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  PRIMARY KEY (id),
  KEY sys_office_parent_id (parent_id),
  KEY sys_office_del_flag (del_flag),
  KEY sys_office_type (type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='������';

insert  into oadb.sys_office(id,parent_id,parent_ids,name,sort,area_id,code,type,grade,address,zip_code,master,phone,fax,email,USEABLE,PRIMARY_PERSON,DEPUTY_PERSON,create_by,create_date,update_by,update_date,remarks,del_flag) values ('1','0','0,','ɽ��ʡ�ܹ�˾','10','2','100000','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','7','0,1,7,','�г���','30','3','200003','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','7','0,1,7,','������','40','3','200004','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','7','0,1,7,','�������ֹ�˾','0','4','201000','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','12','0,1,7,12,','��˾�쵼','10','4','201001','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','12','0,1,7,12,','�ۺϲ�','20','4','201002','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','12','0,1,7,12,','�г���','30','4','201003','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','12','0,1,7,12,','������','40','4','201004','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','0,1,7,','�������ֹ�˾','40','5','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,7,17,','��˾�쵼','10','5','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,7,17,','�ۺϲ�','20','5','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','��˾�쵼','10','2','100001','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','17','0,1,7,17,','�г���','30','5','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','17','0,1,7,17,','������','40','5','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','7','0,1,7,','�������ֹ�˾','50','6','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','22','0,1,7,22,','��˾�쵼','10','6','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','22','0,1,7,22,','�ۺϲ�','20','6','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','22','0,1,7,22,','�г���','30','6','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','22','0,1,7,22,','������','40','6','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','0,1,','�ۺϲ�','20','2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','0,1,','�г���','30','2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','1','0,1,','������','40','2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','�з���','50','2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','1','0,1,','�����зֹ�˾','20','3','200000','1','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','7','0,1,7,','��˾�쵼','10','3','200001','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','7','0,1,7,','�ۺϲ�','20','3','200002','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

CREATE TABLE sys_area (
  id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '���',
  parent_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '�������',
  parent_ids varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '���и������',
  name varchar(100) COLLATE utf8_bin NOT NULL COMMENT '����',
  sort decimal(10,0) NOT NULL COMMENT '����',
  code varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '�������',
  type char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  create_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '������',
  create_date datetime NOT NULL COMMENT '����ʱ��',
  update_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '������',
  update_date datetime NOT NULL COMMENT '����ʱ��',
  remarks varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע��Ϣ',
  del_flag char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'ɾ�����',
  PRIMARY KEY (id),
  KEY sys_area_parent_id (parent_id),
  KEY sys_area_del_flag (del_flag)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�����';


insert  into sys_area(id,parent_id,parent_ids,name,sort,code,type,create_by,create_date,update_by,update_date,remarks,del_flag) values ('1','0','0,','�й�','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','ɽ��ʡ','20','110000','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','������','30','110101','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','0,1,2,3,','������','40','110102','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','0,1,2,3,','������','50','110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','0,1,2,3,','������','60','110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

