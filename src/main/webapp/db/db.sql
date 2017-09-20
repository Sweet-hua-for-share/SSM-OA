CREATE TABLE oadb.sys_user (
  id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  company_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属公司',
  office_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属部门',
  login_name varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登录名',
  password varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  no varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
  name varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  email varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  phone varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  mobile varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  user_type char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型',
  login_date datetime DEFAULT NULL COMMENT '最后登陆时间',
  login_flag varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可登录',
  create_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  create_date datetime NOT NULL COMMENT '创建时间',
  update_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  update_date datetime NOT NULL COMMENT '更新时间',
  remarks varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  del_flag char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

insert  into oadb.sys_user(id,company_id,office_id,login_name,password,no,name,email,phone,mobile,user_type,login_date,login_flag,create_by,create_date,update_by,update_date,remarks,del_flag) values ('1','1','2','admin','admin','0001','系统管理员','admin@163.com','865','8675',NULL,NULL,'1','1','2017-05-27 08:00:00','1','2017-05-27 08:00:00','最高管理员','0');


CREATE TABLE oadb.sys_office (
  id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  parent_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  parent_ids varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  name varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  sort decimal(10,0) NOT NULL COMMENT '排序',
  area_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  code varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  type char(1) COLLATE utf8_bin NOT NULL COMMENT '机构类型',
  grade char(1) COLLATE utf8_bin NOT NULL COMMENT '机构等级',
  address varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  zip_code varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  master varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  phone varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  fax varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  email varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  USEABLE varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用',
  PRIMARY_PERSON varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
  DEPUTY_PERSON varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
  create_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  create_date datetime NOT NULL COMMENT '创建时间',
  update_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  update_date datetime NOT NULL COMMENT '更新时间',
  remarks varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  del_flag char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (id),
  KEY sys_office_parent_id (parent_id),
  KEY sys_office_del_flag (del_flag),
  KEY sys_office_type (type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

insert  into oadb.sys_office(id,parent_id,parent_ids,name,sort,area_id,code,type,grade,address,zip_code,master,phone,fax,email,USEABLE,PRIMARY_PERSON,DEPUTY_PERSON,create_by,create_date,update_by,update_date,remarks,del_flag) values ('1','0','0,','山东省总公司','10','2','100000','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','7','0,1,7,','市场部','30','3','200003','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','7','0,1,7,','技术部','40','3','200004','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','7','0,1,7,','历城区分公司','0','4','201000','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','12','0,1,7,12,','公司领导','10','4','201001','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','12','0,1,7,12,','综合部','20','4','201002','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','12','0,1,7,12,','市场部','30','4','201003','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','12','0,1,7,12,','技术部','40','4','201004','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','0,1,7,','历下区分公司','40','5','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,7,17,','公司领导','10','5','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,7,17,','综合部','20','5','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','公司领导','10','2','100001','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','17','0,1,7,17,','市场部','30','5','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','17','0,1,7,17,','技术部','40','5','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','7','0,1,7,','高新区分公司','50','6','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','22','0,1,7,22,','公司领导','10','6','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','22','0,1,7,22,','综合部','20','6','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','22','0,1,7,22,','市场部','30','6','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','22','0,1,7,22,','技术部','40','6','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','0,1,','综合部','20','2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','0,1,','市场部','30','2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','1','0,1,','技术部','40','2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','研发部','50','2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','1','0,1,','济南市分公司','20','3','200000','1','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','7','0,1,7,','公司领导','10','3','200001','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','7','0,1,7,','综合部','20','3','200002','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

CREATE TABLE sys_area (
  id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  parent_id varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  parent_ids varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  name varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  sort decimal(10,0) NOT NULL COMMENT '排序',
  code varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  type char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '区域类型',
  create_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  create_date datetime NOT NULL COMMENT '创建时间',
  update_by varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  update_date datetime NOT NULL COMMENT '更新时间',
  remarks varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  del_flag char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (id),
  KEY sys_area_parent_id (parent_id),
  KEY sys_area_del_flag (del_flag)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';


insert  into sys_area(id,parent_id,parent_ids,name,sort,code,type,create_by,create_date,update_by,update_date,remarks,del_flag) values ('1','0','0,','中国','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','山东省','20','110000','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','济南市','30','110101','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','0,1,2,3,','历城区','40','110102','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','0,1,2,3,','历下区','50','110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','0,1,2,3,','高新区','60','110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

