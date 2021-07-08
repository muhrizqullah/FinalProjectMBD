CREATE SEQUENCE Bioskop_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Film_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Jadwal_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Kategori_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Kursi_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Metode_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Pelanggan_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Studio_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Tiket_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Transaksi_Seq START 0 MINVALUE 0;
CREATE SEQUENCE Voucher_Seq START 0 MINVALUE 0;

/*==============================================================*/
/* Table: BIOSKOP                                               */
/*==============================================================*/
create table BIOSKOP (
   CIN_ID               VARCHAR(50)          PRIMARY KEY,
   CIN_NAMA             VARCHAR(50),
   CIN_LOKASI           VARCHAR(50)          NOT NULL,
   CIN_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   CIN_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: FILM                                                  */
/*==============================================================*/
create table FILM (
   MOV_ID               VARCHAR(50)          PRIMARY KEY,
   CAT_ID               VARCHAR(50)          NOT NULL,
   MOV_JUDUL            VARCHAR(50)          NOT NULL,
   MOV_DURASI           INTEGER              NOT NULL,
   MOV_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   MOV_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: JADWAL                                                */
/*==============================================================*/
create table JADWAL (
   SCH_ID               VARCHAR(50)          PRIMARY KEY,
   MOV_ID               VARCHAR(50)          NOT NULL,
   STD_ID               VARCHAR(50)          NOT NULL,
   SCH_WAKTU            TIMESTAMPTZ          NOT NULL,
   SCH_HARGA            INTEGER,
   SCH_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   SCH_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: KATEGORI_FILM                                         */
/*==============================================================*/
create table KATEGORI_FILM (
   CAT_ID               VARCHAR(50)          PRIMARY KEY,
   CAT_NAMA             VARCHAR(50)          NOT NULL,
   CAT_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   CAT_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: TIKET                                                 */
/*==============================================================*/
create table TIKET (
   TIK_ID               VARCHAR(50)          PRIMARY KEY,
   TRX_ID               VARCHAR(50)          NOT NULL,
   SCH_ID               VARCHAR(50)          NOT NULL,
   CHR_KODE               VARCHAR(50)          NOT NULL,
   TIK_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   TIK_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: KURSI                                                 */
/*==============================================================*/
create table KURSI (
   CHR_ID               VARCHAR(50)          PRIMARY KEY,
   CHR_KODE             VARCHAR(20)           NOT NULL,
   CHR_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   CHR_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: METODE_PEMBAYARAN                                     */
/*==============================================================*/
create table METODE_PEMBAYARAN (
   MTD_ID               VARCHAR(50)          PRIMARY KEY,
   PEL_ID               VARCHAR(50)          NOT NULL,
   MTD_JENIS            VARCHAR(50)          NOT NULL,
   MTD_BANK             VARCHAR(50)          NOT NULL,
   MTD_NOMOR_KARTU      VARCHAR(16)          NOT NULL,
   MTD_EXPIRED          VARCHAR(5)           NOT NULL,
   MTD_CVV              VARCHAR(3)           NOT NULL,
   MTD_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   MTD_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: PELANGGAN                                             */
/*==============================================================*/
create table PELANGGAN (
   PEL_ID               VARCHAR(50)          PRIMARY KEY,
   PEL_NAMA             VARCHAR(50)          NOT NULL,
   PEL_EMAIL            VARCHAR(50)          NOT NULL,
   PEL_NO_TELEPON       VARCHAR(50)          NOT NULL,
   PEL_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   PEL_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: DetailVoucher                                         */
/*==============================================================*/
create table DETAIL_VOUCHER (
   TRX_ID               VARCHAR(50),
   VOC_ID               VARCHAR(50),
   DV_Created_At        TIMESTAMPTZ          DEFAULT NOW(),
   DV_Updated_At        TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: STUDIO                                                */
/*==============================================================*/
create table STUDIO (
   STD_ID               VARCHAR(50)          PRIMARY KEY,
   CIN_ID               VARCHAR(50)          NOT NULL,
   STD_KAPASITAS        INTEGER                 NOT NULL,
   STD_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   STD_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
create table TRANSAKSI (
   TRX_ID               VARCHAR(50)          PRIMARY KEY,
   PEL_ID               VARCHAR(50)          NOT NULL,
   MTD_ID               VARCHAR(50)          NOT NULL,
   TRX_TOTAL_HARGA      INTEGER,
   TRX_TOTAL_TIKET      INTEGER,
   TRX_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   TRX_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);

/*==============================================================*/
/* Table: VOUCHER                                               */
/*==============================================================*/
create table VOUCHER (
   VOC_ID               VARCHAR(50)          PRIMARY KEY,
   VOC_KODE_VOUCHER     VARCHAR(50)          NOT NULL,
   VOC_NOMINAL          INTEGER              NOT NULL,
   VOC_CREATED_AT       TIMESTAMPTZ          DEFAULT NOW(),
   VOC_UPDATED_AT       TIMESTAMPTZ          DEFAULT NOW()
);



alter table FILM
   add constraint FK_FILM_RELATIONS_KATEGORI foreign key (CAT_ID)
      references KATEGORI_FILM (CAT_ID);

alter table JADWAL
   add constraint FK_JADWAL_RELATIONS_FILM foreign key (MOV_ID)
      references FILM (MOV_ID);

alter table JADWAL
   add constraint FK_JADWAL_RELATIONS_STUDIO foreign key (STD_ID)
      references STUDIO (STD_ID);

alter table KURSI
   add constraint FK_KURSI_RELATIONS_JADWAL foreign key (SCH_ID)
      references JADWAL (SCH_ID);

alter table METODE_PEMBAYARAN
   add constraint FK_METODE_P_RELATIONS_PELANGGA foreign key (PEL_ID)
      references PELANGGAN (PEL_ID);

alter table DETAIL_VOUCHER
   add constraint FK_RELATION_RELATIONS_TRANSAKS foreign key (TRX_ID)
      references TRANSAKSI (TRX_ID);

alter table DETAIL_VOUCHER
   add constraint FK_RELATION_RELATIONS_VOUCHER foreign key (VOC_ID)
      references VOUCHER (VOC_ID);

alter table STUDIO
   add constraint FK_STUDIO_RELATIONS_BIOSKOP foreign key (CIN_ID)
      references BIOSKOP (CIN_ID);

alter table TIKET
   add constraint FK_TIKET_RELATIONS_TRANSAKS foreign key (TRX_ID)
      references TRANSAKSI (TRX_ID);

alter table TIKET
   add constraint FK_TIKET_RELATIONS_KURSI foreign key (CHR_ID)
      references KURSI (CHR_ID);

alter table TRANSAKSI
   add constraint FK_TRANSAKS_RELATIONS_METODE_P foreign key (MTD_ID)
      references METODE_PEMBAYARAN (MTD_ID);

alter table TRANSAKSI
   add constraint FK_TRANSAKS_RELATIONS_PELANGGA foreign key (PEL_ID)
      references PELANGGAN (PEL_ID);
