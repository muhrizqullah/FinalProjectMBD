/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     7/4/2021 2:50:29 PM                          */
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

drop index RELATIONSHIP_12_FK;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_10_PK;

drop table RELATIONSHIP_10;

drop index RELATIONSHIP_9_FK;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_8_PK;

drop table RELATIONSHIP_8;

drop index RELATIONSHIP_3_FK;

drop index STUDIO_PK;

drop table STUDIO;

drop index RELATIONSHIP_14_FK;

drop index TIKET_PK;

drop table TIKET;

drop index RELATIONSHIP_13_FK;

drop index RELATIONSHIP_6_FK;

drop index TRANSAKSI_PK;

drop table TRANSAKSI;

drop index VOUCHER_PK;

drop table VOUCHER;

/*==============================================================*/
/* Table: BIOSKOP                                               */
/*==============================================================*/
create table BIOSKOP (
   ID_BIOSKOP           VARCHAR(15)          not null,
   NAMA                 VARCHAR(50)          not null,
   LOKASI               VARCHAR(50)          not null,
   constraint PK_BIOSKOP primary key (ID_BIOSKOP)
);

/*==============================================================*/
/* Index: BIOSKOP_PK                                            */
/*==============================================================*/
create unique index BIOSKOP_PK on BIOSKOP (
ID_BIOSKOP
);

/*==============================================================*/
/* Table: FILM                                                  */
/*==============================================================*/
create table FILM (
   ID_FILM              VARCHAR(15)          not null,
   ID_KATEGORI_FILM     VARCHAR(50)          not null,
   JUDUL                VARCHAR(50)          not null,
   DURASI               INT4                 not null,
   constraint PK_FILM primary key (ID_FILM)
);

/*==============================================================*/
/* Index: FILM_PK                                               */
/*==============================================================*/
create unique index FILM_PK on FILM (
ID_FILM
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on FILM (
ID_KATEGORI_FILM
);

/*==============================================================*/
/* Table: JADWAL                                                */
/*==============================================================*/
create table JADWAL (
   ID_JADWAL            VARCHAR(15)          not null,
   ID_FILM              VARCHAR(15)          not null,
   ID_STUDIO            VARCHAR(15)          not null,
   WAKTU                DATE                 not null,
   HARGA                INT4                 not null,
   constraint PK_JADWAL primary key (ID_JADWAL)
);

/*==============================================================*/
/* Index: JADWAL_PK                                             */
/*==============================================================*/
create unique index JADWAL_PK on JADWAL (
ID_JADWAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on JADWAL (
ID_STUDIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on JADWAL (
ID_FILM
);

/*==============================================================*/
/* Table: KATEGORI_FILM                                         */
/*==============================================================*/
create table KATEGORI_FILM (
   ID_KATEGORI_FILM     VARCHAR(50)          not null,
   NAMA                 VARCHAR(50)          not null,
   constraint PK_KATEGORI_FILM primary key (ID_KATEGORI_FILM)
);

/*==============================================================*/
/* Index: KATEGORI_FILM_PK                                      */
/*==============================================================*/
create unique index KATEGORI_FILM_PK on KATEGORI_FILM (
ID_KATEGORI_FILM
);

/*==============================================================*/
/* Table: KURSI                                                 */
/*==============================================================*/
create table KURSI (
   ID_KURSI             CHAR(10)             not null,
   ID_JADWAL            VARCHAR(15)          not null,
   constraint PK_KURSI primary key (ID_KURSI)
);

/*==============================================================*/
/* Index: KURSI_PK                                              */
/*==============================================================*/
create unique index KURSI_PK on KURSI (
ID_KURSI
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on KURSI (
ID_JADWAL
);

/*==============================================================*/
/* Table: METODE_PEMBAYARAN                                     */
/*==============================================================*/
create table METODE_PEMBAYARAN (
   ID_METODE_PEMBAYARAN VARCHAR(15)          not null,
   ID_PELANGGAN         VARCHAR(15)          not null,
   JENIS                VARCHAR(10)          not null,
   BANK                 VARCHAR(10)          not null,
   NOMOR_KARTU          VARCHAR(16)          not null,
   EXPIRED              VARCHAR(4)           not null,
   CVV                  VARCHAR(3)           not null,
   constraint PK_METODE_PEMBAYARAN primary key (ID_METODE_PEMBAYARAN)
);

/*==============================================================*/
/* Index: METODE_PEMBAYARAN_PK                                  */
/*==============================================================*/
create unique index METODE_PEMBAYARAN_PK on METODE_PEMBAYARAN (
ID_METODE_PEMBAYARAN
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on METODE_PEMBAYARAN (
ID_PELANGGAN
);

/*==============================================================*/
/* Table: PELANGGAN                                             */
/*==============================================================*/
create table PELANGGAN (
   ID_PELANGGAN         VARCHAR(15)          not null,
   NAMA                 VARCHAR(50)          not null,
   EMAIL                VARCHAR(50)          not null,
   NO_TELEPON           VARCHAR(15)          not null,
   constraint PK_PELANGGAN primary key (ID_PELANGGAN)
);

/*==============================================================*/
/* Index: PELANGGAN_PK                                          */
/*==============================================================*/
create unique index PELANGGAN_PK on PELANGGAN (
ID_PELANGGAN
);

/*==============================================================*/
/* Table: RELATIONSHIP_10                                       */
/*==============================================================*/
create table RELATIONSHIP_10 (
   ID_TRANSAKSI         VARCHAR(15)          not null,
   ID_JADWAL            VARCHAR(15)          not null,
   constraint PK_RELATIONSHIP_10 primary key (ID_TRANSAKSI, ID_JADWAL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_PK                                    */
/*==============================================================*/
create unique index RELATIONSHIP_10_PK on RELATIONSHIP_10 (
ID_TRANSAKSI,
ID_JADWAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on RELATIONSHIP_10 (
ID_TRANSAKSI
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on RELATIONSHIP_10 (
ID_JADWAL
);

/*==============================================================*/
/* Table: RELATIONSHIP_8                                        */
/*==============================================================*/
create table RELATIONSHIP_8 (
   ID_TRANSAKSI         VARCHAR(15)          not null,
   ID_VOUCHER           VARCHAR(15)          not null,
   constraint PK_RELATIONSHIP_8 primary key (ID_TRANSAKSI, ID_VOUCHER)
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_8_PK on RELATIONSHIP_8 (
ID_TRANSAKSI,
ID_VOUCHER
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on RELATIONSHIP_8 (
ID_TRANSAKSI
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on RELATIONSHIP_8 (
ID_VOUCHER
);

/*==============================================================*/
/* Table: STUDIO                                                */
/*==============================================================*/
create table STUDIO (
   ID_STUDIO            VARCHAR(15)          not null,
   ID_BIOSKOP           VARCHAR(15)          not null,
   KAPASITAS            INT4                 not null,
   constraint PK_STUDIO primary key (ID_STUDIO)
);

/*==============================================================*/
/* Index: STUDIO_PK                                             */
/*==============================================================*/
create unique index STUDIO_PK on STUDIO (
ID_STUDIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on STUDIO (
ID_BIOSKOP
);

/*==============================================================*/
/* Table: TIKET                                                 */
/*==============================================================*/
create table TIKET (
   ID_TIKET             VARCHAR(15)          not null,
   ID_TRANSAKSI         VARCHAR(15)          not null,
   constraint PK_TIKET primary key (ID_TIKET)
);

/*==============================================================*/
/* Index: TIKET_PK                                              */
/*==============================================================*/
create unique index TIKET_PK on TIKET (
ID_TIKET
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on TIKET (
ID_TRANSAKSI
);

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
create table TRANSAKSI (
   ID_TRANSAKSI         VARCHAR(15)          not null,
   ID_PELANGGAN         VARCHAR(15)          not null,
   ID_METODE_PEMBAYARAN VARCHAR(15)          not null,
   TOTAL_HARGA          INT4                 not null,
   constraint PK_TRANSAKSI primary key (ID_TRANSAKSI)
);

/*==============================================================*/
/* Index: TRANSAKSI_PK                                          */
/*==============================================================*/
create unique index TRANSAKSI_PK on TRANSAKSI (
ID_TRANSAKSI
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on TRANSAKSI (
ID_PELANGGAN
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on TRANSAKSI (
ID_METODE_PEMBAYARAN
);

/*==============================================================*/
/* Table: VOUCHER                                               */
/*==============================================================*/
create table VOUCHER (
   ID_VOUCHER           VARCHAR(15)          not null,
   KODE_VOUCHER         VARCHAR(15)          not null,
   NOMINAL              INT4                 not null,
   constraint PK_VOUCHER primary key (ID_VOUCHER)
);

/*==============================================================*/
/* Index: VOUCHER_PK                                            */
/*==============================================================*/
create unique index VOUCHER_PK on VOUCHER (
ID_VOUCHER
);

alter table FILM
   add constraint FK_FILM_RELATIONS_KATEGORI foreign key (ID_KATEGORI_FILM)
      references KATEGORI_FILM (ID_KATEGORI_FILM)
      on delete restrict on update restrict;

alter table JADWAL
   add constraint FK_JADWAL_RELATIONS_FILM foreign key (ID_FILM)
      references FILM (ID_FILM)
      on delete restrict on update restrict;

alter table JADWAL
   add constraint FK_JADWAL_RELATIONS_STUDIO foreign key (ID_STUDIO)
      references STUDIO (ID_STUDIO)
      on delete restrict on update restrict;

alter table KURSI
   add constraint FK_KURSI_RELATIONS_JADWAL foreign key (ID_JADWAL)
      references JADWAL (ID_JADWAL)
      on delete restrict on update restrict;

alter table METODE_PEMBAYARAN
   add constraint FK_METODE_P_RELATIONS_PELANGGA foreign key (ID_PELANGGAN)
      references PELANGGAN (ID_PELANGGAN)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_TRANSAKS foreign key (ID_TRANSAKSI)
      references TRANSAKSI (ID_TRANSAKSI)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_JADWAL foreign key (ID_JADWAL)
      references JADWAL (ID_JADWAL)
      on delete restrict on update restrict;

alter table RELATIONSHIP_8
   add constraint FK_RELATION_RELATIONS_TRANSAKS foreign key (ID_TRANSAKSI)
      references TRANSAKSI (ID_TRANSAKSI)
      on delete restrict on update restrict;

alter table RELATIONSHIP_8
   add constraint FK_RELATION_RELATIONS_VOUCHER foreign key (ID_VOUCHER)
      references VOUCHER (ID_VOUCHER)
      on delete restrict on update restrict;

alter table STUDIO
   add constraint FK_STUDIO_RELATIONS_BIOSKOP foreign key (ID_BIOSKOP)
      references BIOSKOP (ID_BIOSKOP)
      on delete restrict on update restrict;

alter table TIKET
   add constraint FK_TIKET_RELATIONS_TRANSAKS foreign key (ID_TRANSAKSI)
      references TRANSAKSI (ID_TRANSAKSI)
      on delete restrict on update restrict;

alter table TRANSAKSI
   add constraint FK_TRANSAKS_RELATIONS_METODE_P foreign key (ID_METODE_PEMBAYARAN)
      references METODE_PEMBAYARAN (ID_METODE_PEMBAYARAN)
      on delete restrict on update restrict;

alter table TRANSAKSI
   add constraint FK_TRANSAKS_RELATIONS_PELANGGA foreign key (ID_PELANGGAN)
      references PELANGGAN (ID_PELANGGAN)
      on delete restrict on update restrict;

