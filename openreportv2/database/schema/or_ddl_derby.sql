create table OR_PROPERTIES (PROPERTY_ID integer not null, PROPERTY_KEY varchar(255) not null unique, PROPERTY_VALUE varchar(255), primary key (PROPERTY_ID))

create table OR_TAGS (TAG_ID integer not null, TAGGED_OBJECT_ID integer not null, TAGGED_OBJECT_CLASS varchar(255) not null, TAG_VALUE varchar(255) not null, TAG_TYPE varchar(255) not null, primary key (TAG_ID))

create table REPORT (REPORT_ID integer not null, NAME varchar(255) not null unique, DESCRIPTION varchar(255) not null, REPORT_FILE varchar(255) not null, PDF_EXPORT smallint not null, CSV_EXPORT smallint not null, XLS_EXPORT smallint not null, HTML_EXPORT smallint not null, RTF_EXPORT smallint not null, TEXT_EXPORT smallint not null, EXCEL_EXPORT smallint not null, IMAGE_EXPORT smallint not null, FILL_VIRTUAL smallint not null, HIDDEN_REPORT smallint not null, REPORT_QUERY clob(255), DATASOURCE_ID integer, CHART_ID integer, EXPORT_OPTION_ID integer, primary key (REPORT_ID))

create table REPORT_ALERT (ALERT_ID integer not null, NAME varchar(255) not null unique, DESCRIPTION varchar(255) not null, ALERT_QUERY clob(255) not null, DATASOURCE_ID integer, primary key (ALERT_ID))

create table REPORT_CHART (CHART_ID integer not null, NAME varchar(255) not null unique, DESCRIPTION varchar(255) not null, CHART_QUERY clob(255) not null, CHART_TYPE integer not null, WIDTH integer not null, HEIGHT integer not null, X_AXIS_LABEL varchar(255), Y_AXIS_LABEL varchar(255), SHOW_LEGEND smallint not null, SHOW_TITLE smallint not null, SHOW_VALUES smallint not null, PLOT_ORIENTATION integer, DATASOURCE_ID integer, REPORT_ID integer, OVERLAY_CHART_ID integer, primary key (CHART_ID))

create table REPORT_DATASOURCE (DATASOURCE_ID integer not null, NAME varchar(255) not null unique, DRIVER varchar(255), URL varchar(255) not null, USERNAME varchar(255), PASSWORD varchar(255), MAX_IDLE integer, MAX_ACTIVE integer, MAX_WAIT bigint, VALIDATION_QUERY varchar(255), JNDI smallint, primary key (DATASOURCE_ID))

create table REPORT_DELIVERY_LOG (DELIVERY_LOG_ID integer not null, START_TIME timestamp, END_TIME timestamp, STATUS varchar(255), MESSAGE clob(255), DELIVERY_METHOD varchar(255), LOG_ID integer, DELIVERY_INDEX integer, primary key (DELIVERY_LOG_ID))

create table REPORT_EXPORT_OPTIONS (EXPORT_OPTION_ID integer not null, XLS_REMOVE_EMPTY_SPACE smallint not null, XLS_ONE_PAGE_PER_SHEET smallint not null, XLS_AUTO_DETECT_CELL smallint not null, XLS_WHITE_BACKGROUND smallint not null, HTML_REMOVE_EMPTY_SPACE smallint not null, HTML_WHITE_BACKGROUND smallint not null, HTML_USE_IMAGES smallint not null, HTML_WRAP_BREAK smallint not null, primary key (EXPORT_OPTION_ID))

create table REPORT_GROUP (GROUP_ID integer not null, NAME varchar(255) not null unique, DESCRIPTION varchar(255) not null, primary key (GROUP_ID))

create table REPORT_GROUP_MAP (GROUP_ID integer not null, REPORT_ID integer not null, MAP_ID integer not null, primary key (GROUP_ID, MAP_ID))

create table REPORT_LOG (LOG_ID integer not null, START_TIME timestamp, END_TIME timestamp, STATUS varchar(255), MESSAGE clob(255), EXPORT_TYPE integer, REQUEST_ID varchar(255), REPORT_ID integer, USER_ID integer, ALERT_ID integer, primary key (LOG_ID))

create table REPORT_PARAMETER (PARAMETER_ID integer not null, NAME varchar(255) not null unique, TYPE varchar(255) not null, CLASSNAME varchar(255) not null, DATA clob(255), DATASOURCE_ID integer, DESCRIPTION varchar(255), REQUIRED smallint, MULTI_SELECT smallint, DEFAULT_VALUE varchar(255), primary key (PARAMETER_ID))

create table REPORT_PARAMETER_MAP (REPORT_ID integer not null, PARAMETER_ID integer, REQUIRED smallint, SORT_ORDER integer, STEP integer, MAP_ID integer not null, primary key (REPORT_ID, MAP_ID))

create table REPORT_USER (REPORTUSER_ID integer not null, NAME varchar(255) not null unique, PASSWORD varchar(255) not null, EXTERNAL_ID varchar(255), EMAIL_ADDRESS varchar(255), PDF_EXPORT_TYPE integer not null, DEFAULT_REPORT_ID integer, primary key (REPORTUSER_ID))

create table USER_ALERT_MAP (USER_ID integer not null, ALERT_ID integer, REPORT_ID integer, ALERT_LIMIT integer, ALERT_OPERATOR varchar(255), MAP_ID integer not null, primary key (USER_ID, MAP_ID))

create table USER_GROUP_MAP (USER_ID integer not null, GROUP_ID integer not null, MAP_ID integer not null, primary key (USER_ID, MAP_ID))

create table USER_SECURITY (USER_ID integer not null, ROLE_NAME varchar(255))

alter table REPORT add constraint FK8FDF4934F4DD5A50 foreign key (EXPORT_OPTION_ID) references REPORT_EXPORT_OPTIONS

alter table REPORT add constraint FK8FDF49344330D5A7 foreign key (DATASOURCE_ID) references REPORT_DATASOURCE

alter table REPORT add constraint FK8FDF4934164AA2ED foreign key (CHART_ID) references REPORT_CHART

alter table REPORT_ALERT add constraint FKF81C86714330D5A7 foreign key (DATASOURCE_ID) references REPORT_DATASOURCE

alter table REPORT_CHART add constraint FKF836D4F3AAEF4A13 foreign key (REPORT_ID) references REPORT

alter table REPORT_CHART add constraint FKF836D4F34330D5A7 foreign key (DATASOURCE_ID) references REPORT_DATASOURCE

alter table REPORT_CHART add constraint FKF836D4F3C83B69FC foreign key (OVERLAY_CHART_ID) references REPORT_CHART

alter table REPORT_DELIVERY_LOG add constraint FKC783FD84632801ED foreign key (LOG_ID) references REPORT_LOG

alter table REPORT_GROUP_MAP add constraint FKEF946211AAEF4A13 foreign key (REPORT_ID) references REPORT

alter table REPORT_GROUP_MAP add constraint FKEF946211DF17134D foreign key (GROUP_ID) references REPORT_GROUP

alter table REPORT_LOG add constraint FK901BE599E4B42987 foreign key (USER_ID) references REPORT_USER

alter table REPORT_LOG add constraint FK901BE599AAEF4A13 foreign key (REPORT_ID) references REPORT

alter table REPORT_LOG add constraint FK901BE59920DA4A2D foreign key (ALERT_ID) references REPORT_ALERT

alter table REPORT_PARAMETER add constraint FKBC64163E4330D5A7 foreign key (DATASOURCE_ID) references REPORT_DATASOURCE

alter table REPORT_PARAMETER_MAP add constraint FK23FF1FBB1AFAD98D foreign key (PARAMETER_ID) references REPORT_PARAMETER

alter table REPORT_PARAMETER_MAP add constraint FK23FF1FBBAAEF4A13 foreign key (REPORT_ID) references REPORT

alter table REPORT_USER add constraint FK7364F3F6EE01FD95 foreign key (DEFAULT_REPORT_ID) references REPORT

alter table USER_ALERT_MAP add constraint FKD83C845E4B42987 foreign key (USER_ID) references REPORT_USER

alter table USER_ALERT_MAP add constraint FKD83C845AAEF4A13 foreign key (REPORT_ID) references REPORT

alter table USER_ALERT_MAP add constraint FKD83C84520DA4A2D foreign key (ALERT_ID) references REPORT_ALERT

alter table USER_GROUP_MAP add constraint FKC49EBE8E4B42987 foreign key (USER_ID) references REPORT_USER

alter table USER_GROUP_MAP add constraint FKC49EBE8DF17134D foreign key (GROUP_ID) references REPORT_GROUP

alter table USER_SECURITY add constraint FK7DE1C934E4B42987 foreign key (USER_ID) references REPORT_USER

create table hibernate_unique_key ( next_hi integer )

insert into hibernate_unique_key values ( 0 )

