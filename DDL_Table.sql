/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     7/4/2021 7:25:54 PM                          */
/*==============================================================*/


drop index BIOSKOP_PK;

drop table BIOSKOP;

drop index RELATIONSHIP_2_FK;

drop index FILM_PK;

drop table FILM;

drop index RELATIONSHIP_10_FK;

drop index RELATIONSHIP_4_FK;

drop index JADWAL_PK;

drop table JADWAL;

drop index KATEGORI_FILM_PK;

drop table KATEGORI_FILM;

drop index RELATIONSHIP_5_FK;

drop index KURSI_PK;

drop table KURSI;

drop index RELATIONSHIP_7_FK;

drop index METODE_PEMBAYARAN_PK;

drop table METODE_PEMBAYARAN;

drop index PELANGGAN_PK;

drop table PELANGGAN;

drop index RELATIONSHIP_9_FK;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_8_PK;

drop table RELATIONSHIP_8;

drop index RELATIONSHIP_3_FK;

drop index STUDIO_PK;

drop table STUDIO;

drop index RELATIONSHIP_18_FK;

drop index RELATIONSHIP_17_FK;

drop index RELATIONSHIP_16_FK;

drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_13_FK;

drop index RELATIONSHIP_12_FK;

drop index TIKET_PK;

drop table TIKET;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_6_FK;

drop index TRANSAKSI_PK;

drop table TRANSAKSI;

drop index VOUCHER_PK;

drop table VOUCHER;

/*==============================================================*/
/* Table: BIOSKOP                                               */
/*==============================================================*/
create table BIOSKOP (
   CIN_ID               VARCHAR(15)          not null,
   CIN_NAMA             VARCHAR(50)          null,
   CIN_LOKASI           VARCHAR(50)          not null,
   CIN_CREATED_AT       DATE                 null,
   CIN_UPDATED_AT       DATE                 null,
   constraint PK_BIOSKOP primary key (CIN_ID)
);

/*==============================================================*/
/* Index: BIOSKOP_PK                                            */
/*==============================================================*/
create unique index BIOSKOP_PK on BIOSKOP (
CIN_ID
);

/*==============================================================*/
/* Table: FILM                                                  */
/*==============================================================*/
create table FILM (
   MOV_ID               VARCHAR(15)          not null,
   CAT_ID               VARCHAR(15)          not null,
   MOV_JUDUL            VARCHAR(50)          not null,
   MOV_DURASI           INT4                 not null,
   MOV_CREATED_AT       DATE                 null,
   MOV_UPDATED_AT       DATE                 null,
   constraint PK_FILM primary key (MOV_ID)
);

/*==============================================================*/
/* Index: FILM_PK                                               */
/*==============================================================*/
create unique index FILM_PK on FILM (
MOV_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on FILM (
CAT_ID
);

/*==============================================================*/
/* Table: JADWAL                                                */
/*==============================================================*/
create table JADWAL (
   SCH_ID               VARCHAR(15)          not null,
   MOV_ID               VARCHAR(15)          not null,
   STD_ID               VARCHAR(15)          not null,
   SCH_WAKTU            DATE                 not null,
   SCH_HARGA            INT4                 null,
   SCH_CREATED_AT       DATE                 null,
   SCH_UPDATED_AT       DATE                 null,
   constraint PK_JADWAL primary key (SCH_ID)
);

/*==============================================================*/
/* Index: JADWAL_PK                                             */
/*==============================================================*/
create unique index JADWAL_PK on JADWAL (
SCH_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on JADWAL (
STD_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on JADWAL (
MOV_ID
);

/*==============================================================*/
/* Table: KATEGORI_FILM                                         */
/*==============================================================*/
create table KATEGORI_FILM (
   CAT_ID               VARCHAR(15)          not null,
   CAT_NAMA             VARCHAR(50)          not null,
   CAT_CREATED_AT       DATE                 null,
   CAT_UPDATED_AT       DATE                 null,
   constraint PK_KATEGORI_FILM primary key (CAT_ID)
);

/*==============================================================*/
/* Index: KATEGORI_FILM_PK                                      */
/*==============================================================*/
create unique index KATEGORI_FILM_PK on KATEGORI_FILM (
CAT_ID
);

/*==============================================================*/
/* Table: KURSI                                                 */
/*==============================================================*/
create table KURSI (
   CHR_ID               VARCHAR(15)          not null,
   SCH_ID               VARCHAR(15)          not null,
   CHR_KODE             VARCHAR(3)           not null,
   CHR_CREATED_AT       DATE                 null,
   CHR_UPDATED_AT       DATE                 null,
   constraint PK_KURSI primary key (CHR_ID)
);

/*==============================================================*/
/* Index: KURSI_PK                                              */
/*==============================================================*/
create unique index KURSI_PK on KURSI (
CHR_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on KURSI (
SCH_ID
);

/*==============================================================*/
/* Table: METODE_PEMBAYARAN                                     */
/*==============================================================*/
create table METODE_PEMBAYARAN (
   MTD_ID               VARCHAR(15)          not null,
   PEL_ID               VARCHAR(15)          not null,
   MTD_JENIS            VARCHAR(10)          not null,
   MTD_BANK             VARCHAR(10)          not null,
   MTD_NOMOR_KARTU      VARCHAR(16)          not null,
   MTD_EXPIRED          VARCHAR(4)           not null,
   MTD_CVV              VARCHAR(3)           not null,
   MTD_CREATED_AT       DATE                 null,
   MTD_UPDATED_AT       DATE                 null,
   constraint PK_METODE_PEMBAYARAN primary key (MTD_ID)
);

/*==============================================================*/
/* Index: METODE_PEMBAYARAN_PK                                  */
/*==============================================================*/
create unique index METODE_PEMBAYARAN_PK on METODE_PEMBAYARAN (
MTD_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on METODE_PEMBAYARAN (
PEL_ID
);

/*==============================================================*/
/* Table: PELANGGAN                                             */
/*==============================================================*/
create table PELANGGAN (
   PEL_ID               VARCHAR(15)          not null,
   PEL_NAMA             VARCHAR(50)          not null,
   PEL_EMAIL            VARCHAR(50)          not null,
   PEL_NO_TELEPON       VARCHAR(15)          not null,
   PEL_CREATED_AT       DATE                 null,
   PEL_UPDATED_AT       DATE                 null,
   constraint PK_PELANGGAN primary key (PEL_ID)
);

/*==============================================================*/
/* Index: PELANGGAN_PK                                          */
/*==============================================================*/
create unique index PELANGGAN_PK on PELANGGAN (
PEL_ID
);

/*==============================================================*/
/* Table: RELATIONSHIP_8                                        */
/*==============================================================*/
create table RELATIONSHIP_8 (
   TRX_ID               VARCHAR(15)          not null,
   VOC_ID               VARCHAR(15)          not null,
   constraint PK_RELATIONSHIP_8 primary key (TRX_ID, VOC_ID)
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_8_PK on RELATIONSHIP_8 (
TRX_ID,
VOC_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on RELATIONSHIP_8 (
TRX_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on RELATIONSHIP_8 (
VOC_ID
);

/*==============================================================*/
/* Table: STUDIO                                                */
/*==============================================================*/
create table STUDIO (
   STD_ID               VARCHAR(15)          not null,
   CIN_ID               VARCHAR(15)          not null,
   STD_KAPASITAS        INT4                 not null,
   STD_CREATED_AT       DATE                 null,
   STD_UPDATED_AT       DATE                 null,
   constraint PK_STUDIO primary key (STD_ID)
);

/*==============================================================*/
/* Index: STUDIO_PK                                             */
/*==============================================================*/
create unique index STUDIO_PK on STUDIO (
STD_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on STUDIO (
CIN_ID
);

/*==============================================================*/
/* Table: TIKET                                                 */
/*==============================================================*/
create table TIKET (
   TIK_ID               VARCHAR(15)          not null,
   MOV_ID               VARCHAR(15)          not null,
   TRX_ID               VARCHAR(15)          not null,
   SCH_ID               VARCHAR(15)          not null,
   CIN_ID               VARCHAR(15)          not null,
   STD_ID               VARCHAR(15)          not null,
   CHR_ID               VARCHAR(15)          null,
   TIK_CREATED_AT       DATE                 null,
   TIK_UPDATED_AT       DATE                 null,
   constraint PK_TIKET primary key (TIK_ID)
);

/*==============================================================*/
/* Index: TIKET_PK                                              */
/*==============================================================*/
create unique index TIKET_PK on TIKET (
TIK_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on TIKET (
TRX_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on TIKET (
SCH_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on TIKET (
STD_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on TIKET (
CHR_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on TIKET (
MOV_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on TIKET (
CIN_ID
);

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
create table TRANSAKSI (
   TRX_ID               VARCHAR(15)          not null,
   PEL_ID               VARCHAR(15)          not null,
   MTD_ID               VARCHAR(15)          not null,
   TRX_TOTAL_HARGA      INT4                 null,
   TRX_TOTAL_TIKET      INT4                 null,
   TRX_CREATED_AT       DATE                 null,
   TRX_UPDATED_AT       DATE                 null,
   constraint PK_TRANSAKSI primary key (TRX_ID)
);

/*==============================================================*/
/* Index: TRANSAKSI_PK                                          */
/*==============================================================*/
create unique index TRANSAKSI_PK on TRANSAKSI (
TRX_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on TRANSAKSI (
PEL_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on TRANSAKSI (
MTD_ID
);

/*==============================================================*/
/* Table: VOUCHER                                               */
/*==============================================================*/
create table VOUCHER (
   VOC_ID               VARCHAR(15)          not null,
   VOC_KODE_VOUCHER     VARCHAR(15)          not null,
   VOC_NOMINAL          INT4                 not null,
   VOC_CREATED_AT       DATE                 null,
   VOC_UPDATED_AT       DATE                 null,
   constraint PK_VOUCHER primary key (VOC_ID)
);

/*==============================================================*/
/* Index: VOUCHER_PK                                            */
/*==============================================================*/
create unique index VOUCHER_PK on VOUCHER (
VOC_ID
);

alter table FILM
   add constraint FK_FILM_RELATIONS_KATEGORI foreign key (CAT_ID)
      references KATEGORI_FILM (CAT_ID)
      on delete restrict on update restrict;

alter table JADWAL
   add constraint FK_JADWAL_RELATIONS_FILM foreign key (MOV_ID)
      references FILM (MOV_ID)
      on delete restrict on update restrict;

alter table JADWAL
   add constraint FK_JADWAL_RELATIONS_STUDIO foreign key (STD_ID)
      references STUDIO (STD_ID)
      on delete restrict on update restrict;

alter table KURSI
   add constraint FK_KURSI_RELATIONS_JADWAL foreign key (SCH_ID)
      references JADWAL (SCH_ID)
      on delete restrict on update restrict;

alter table METODE_PEMBAYARAN
   add constraint FK_METODE_P_RELATIONS_PELANGGA foreign key (PEL_ID)
      references PELANGGAN (PEL_ID)
      on delete restrict on update restrict;

alter table RELATIONSHIP_8
   add constraint FK_RELATION_RELATIONS_TRANSAKS foreign key (TRX_ID)
      references TRANSAKSI (TRX_ID)
      on delete restrict on update restrict;

alter table RELATIONSHIP_8
   add constraint FK_RELATION_RELATIONS_VOUCHER foreign key (VOC_ID)
      references VOUCHER (VOC_ID)
      on delete restrict on update restrict;

alter table STUDIO
   add constraint FK_STUDIO_RELATIONS_BIOSKOP foreign key (CIN_ID)
      references BIOSKOP (CIN_ID)
      on delete restrict on update restrict;

alter table TIKET
   add constraint FK_TIKET_RELATIONS_TRANSAKS foreign key (TRX_ID)
      references TRANSAKSI (TRX_ID)
      on delete restrict on update restrict;

alter table TIKET
   add constraint FK_TIKET_RELATIONS_JADWAL foreign key (SCH_ID)
      references JADWAL (SCH_ID)
      on delete restrict on update restrict;

alter table TIKET
   add constraint FK_TIKET_RELATIONS_STUDIO foreign key (STD_ID)
      references STUDIO (STD_ID)
      on delete restrict on update restrict;

alter table TIKET
   add constraint FK_TIKET_RELATIONS_KURSI foreign key (CHR_ID)
      references KURSI (CHR_ID)
      on delete restrict on update restrict;

alter table TIKET
   add constraint FK_TIKET_RELATIONS_FILM foreign key (MOV_ID)
      references FILM (MOV_ID)
      on delete restrict on update restrict;

alter table TIKET
   add constraint FK_TIKET_RELATIONS_BIOSKOP foreign key (CIN_ID)
      references BIOSKOP (CIN_ID)
      on delete restrict on update restrict;

alter table TRANSAKSI
   add constraint FK_TRANSAKS_RELATIONS_METODE_P foreign key (MTD_ID)
      references METODE_PEMBAYARAN (MTD_ID)
      on delete restrict on update restrict;

alter table TRANSAKSI
   add constraint FK_TRANSAKS_RELATIONS_PELANGGA foreign key (PEL_ID)
      references PELANGGAN (PEL_ID)
      on delete restrict on update restrict;

