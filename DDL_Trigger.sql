-- Auto Increment ID

/*==============================================================*/
/* Table: BIOSKOP                                               */
/*==============================================================*/
CREATE OR REPLACE FUNCTION CIN_IDIncrement() RETURNS TRIGGER AS $CIN_IDIncrement$
    BEGIN
        NEW.CIN_ID = (SELECT 'CIN'||to_char(nextval('Bioskop_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$CIN_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER CIN_IDIncrement BEFORE INSERT ON BIOSKOP
FOR EACH ROW EXECUTE FUNCTION CIN_IDIncrement();

/*==============================================================*/
/* Table: FILM                                                  */
/*==============================================================*/
CREATE OR REPLACE FUNCTION MOV_IDIncrement() RETURNS TRIGGER AS $MOV_IDIncrement$
    BEGIN
        NEW.MOV_ID = (SELECT 'MOV'||to_char(nextval('Film_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$MOV_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER MOV_IDIncrement BEFORE INSERT ON FILM
FOR EACH ROW EXECUTE FUNCTION MOV_IDIncrement();

/*==============================================================*/
/* Table: JADWAL                                                */
/*==============================================================*/
CREATE OR REPLACE FUNCTION SCH_IDIncrement() RETURNS TRIGGER AS $SCH_IDIncrement$
    BEGIN
        NEW.SCH_ID = (SELECT 'SCH'||to_char(nextval('Jadwal_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$SCH_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER SCH_IDIncrement BEFORE INSERT ON JADWAL
FOR EACH ROW EXECUTE FUNCTION SCH_IDIncrement();

/*==============================================================*/
/* Table: KATEGORI_FILM                                         */
/*==============================================================*/
CREATE OR REPLACE FUNCTION CAT_IDIncrement() RETURNS TRIGGER AS $CAT_IDIncrement$
    BEGIN
        NEW.CAT_ID = (SELECT 'CAT'||to_char(nextval('Kategori_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$CAT_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER CAT_IDIncrement BEFORE INSERT ON KATEGORI_FILM
FOR EACH ROW EXECUTE FUNCTION CAT_IDIncrement();

/*==============================================================*/
/* Table: KURSI                                                 */
/*==============================================================*/
CREATE OR REPLACE FUNCTION CHR_IDIncrement() RETURNS TRIGGER AS $CHR_IDIncrement$
    BEGIN
        NEW.CHR_ID = (SELECT 'CHR'||to_char(nextval('Kursi_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$CHR_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER CHR_IDIncrement BEFORE INSERT ON KURSI
FOR EACH ROW EXECUTE FUNCTION CHR_IDIncrement();

/*==============================================================*/
/* Table: METODE_PEMBAYARAN                                     */
/*==============================================================*/
CREATE OR REPLACE FUNCTION MTD_IDIncrement() RETURNS TRIGGER AS $MTD_IDIncrement$
    BEGIN
        NEW.MTD_ID = (SELECT 'MTD'||to_char(nextval('Metode_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$MTD_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER MTD_IDIncrement BEFORE INSERT ON METODE_PEMBAYARAN
FOR EACH ROW EXECUTE FUNCTION MTD_IDIncrement();

/*==============================================================*/
/* Table: PELANGGAN                                             */
/*==============================================================*/
CREATE OR REPLACE FUNCTION PEL_IDIncrement() RETURNS TRIGGER AS $PEL_IDIncrement$
    BEGIN
        NEW.PEL_ID = (SELECT 'PEL'||to_char(nextval('Pelanggan_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$PEL_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER PEL_IDIncrement BEFORE INSERT ON PELANGGAN
FOR EACH ROW EXECUTE FUNCTION PEL_IDIncrement();

/*==============================================================*/
/* Table: STUDIO                                                */
/*==============================================================*/
CREATE OR REPLACE FUNCTION STD_IDIncrement() RETURNS TRIGGER AS $STD_IDIncrement$
    BEGIN
        NEW.STD_ID = (SELECT 'STD'||to_char(nextval('Studio_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$STD_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER STD_IDIncrement BEFORE INSERT ON STUDIO
FOR EACH ROW EXECUTE FUNCTION STD_IDIncrement();

/*==============================================================*/
/* Table: TIKET                                                 */
/*==============================================================*/
CREATE OR REPLACE FUNCTION TIK_IDIncrement() RETURNS TRIGGER AS $TIK_IDIncrement$
    BEGIN
        NEW.TIK_ID = (SELECT 'TIK'||to_char(nextval('Tiket_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$TIK_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER TIK_IDIncrement BEFORE INSERT ON TIKET
FOR EACH ROW EXECUTE FUNCTION TIK_IDIncrement();

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
CREATE OR REPLACE FUNCTION TRX_IDIncrement() RETURNS TRIGGER AS $TRX_IDIncrement$
    BEGIN
        NEW.TRX_ID = (SELECT 'TRX'||to_char(nextval('Transaksi_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$TRX_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER TRX_IDIncrement BEFORE INSERT ON TRANSAKSI
FOR EACH ROW EXECUTE FUNCTION TRX_IDIncrement();

/*==============================================================*/
/* Table: VOUCHER                                               */
/*==============================================================*/
CREATE OR REPLACE FUNCTION VOC_IDIncrement() RETURNS TRIGGER AS $VOC_IDIncrement$
    BEGIN
        NEW.VOC_ID = (SELECT 'VOC'||to_char(nextval('Voucher_Seq'), '000000FM')::VARCHAR(15));
        RETURN NEW;
    END;
$VOC_IDIncrement$ LANGUAGE plpgsql;

CREATE TRIGGER VOC_IDIncrement BEFORE INSERT ON VOUCHER
FOR EACH ROW EXECUTE FUNCTION VOC_IDIncrement();

-- TRIGGER UPDATED_AT

/*==============================================================*/
/* Table: BIOSKOP                                               */
/*==============================================================*/
CREATE OR REPLACE FUNCTION CIN_UpdatedAtAutomation() RETURNS TRIGGER AS $CIN_UpdatedAtAutomation$
    BEGIN
        NEW.CIN_Updated_At = NOW();
        RETURN NEW;
    END;
$CIN_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER CIN_UpdatedAtAutomation BEFORE UPDATE ON BIOSKOP
FOR EACH ROW EXECUTE FUNCTION CIN_UpdatedAtAutomation();

/*==============================================================*/
/* Table: FILM                                                  */
/*==============================================================*/
CREATE OR REPLACE FUNCTION MOV_UpdatedAtAutomation() RETURNS TRIGGER AS $MOV_UpdatedAtAutomation$
    BEGIN
        NEW.MOV_Updated_At = NOW();
        RETURN NEW;
    END;
$MOV_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER MOV_UpdatedAtAutomation BEFORE UPDATE ON FILM
FOR EACH ROW EXECUTE FUNCTION MOV_UpdatedAtAutomation();

/*==============================================================*/
/* Table: JADWAL                                                */
/*==============================================================*/
CREATE OR REPLACE FUNCTION SCH_UpdatedAtAutomation() RETURNS TRIGGER AS $SCH_UpdatedAtAutomation$
    BEGIN
        NEW.SCH_Updated_At = NOW();
        RETURN NEW;
    END;
$SCH_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER SCH_UpdatedAtAutomation BEFORE UPDATE ON JADWAL
FOR EACH ROW EXECUTE FUNCTION SCH_UpdatedAtAutomation();

/*==============================================================*/
/* Table: KATEGORI_FILM                                         */
/*==============================================================*/
CREATE OR REPLACE FUNCTION CAT_UpdatedAtAutomation() RETURNS TRIGGER AS $CAT_UpdatedAtAutomation$
    BEGIN
        NEW.CAT_Updated_At = NOW();
        RETURN NEW;
    END;
$CAT_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER CAT_UpdatedAtAutomation BEFORE UPDATE ON KATEGORI_FILM
FOR EACH ROW EXECUTE FUNCTION CAT_UpdatedAtAutomation();

/*==============================================================*/
/* Table: KURSI                                                 */
/*==============================================================*/
CREATE OR REPLACE FUNCTION CHR_UpdatedAtAutomation() RETURNS TRIGGER AS $CHR_UpdatedAtAutomation$
    BEGIN
        NEW.CHR_Updated_At = NOW();
        RETURN NEW;
    END;
$CHR_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER CHR_UpdatedAtAutomation BEFORE UPDATE ON KURSI
FOR EACH ROW EXECUTE FUNCTION CHR_UpdatedAtAutomation();

/*==============================================================*/
/* Table: METODE_PEMBAYARAN                                     */
/*==============================================================*/
CREATE OR REPLACE FUNCTION MTD_UpdatedAtAutomation() RETURNS TRIGGER AS $MTD_UpdatedAtAutomation$
    BEGIN
        NEW.MTD_Updated_At = NOW();
        RETURN NEW;
    END;
$MTD_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER MTD_UpdatedAtAutomation BEFORE UPDATE ON METODE_PEMBAYARAN
FOR EACH ROW EXECUTE FUNCTION MTD_UpdatedAtAutomation();

/*==============================================================*/
/* Table: PELANGGAN                                             */
/*==============================================================*/
CREATE OR REPLACE FUNCTION PEL_UpdatedAtAutomation() RETURNS TRIGGER AS $PEL_UpdatedAtAutomation$
    BEGIN
        NEW.PEL_Updated_At = NOW();
        RETURN NEW;
    END;
$PEL_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER PEL_UpdatedAtAutomation BEFORE UPDATE ON PELANGGAN
FOR EACH ROW EXECUTE FUNCTION PEL_UpdatedAtAutomation();

/*==============================================================*/
/* Table: DetailVoucher                                         */
/*==============================================================*/
CREATE OR REPLACE FUNCTION DV_UpdatedAtAutomation() RETURNS TRIGGER AS $DV_UpdatedAtAutomation$
    BEGIN
        NEW.DV_Updated_At = NOW();
        RETURN NEW;
    END;
$DV_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER DV_UpdatedAtAutomation BEFORE UPDATE ON DetailVoucher
FOR EACH ROW EXECUTE FUNCTION DV_UpdatedAtAutomation();

/*==============================================================*/
/* Table: STUDIO                                                */
/*==============================================================*/
CREATE OR REPLACE FUNCTION STD_UpdatedAtAutomation() RETURNS TRIGGER AS $STD_UpdatedAtAutomation$
    BEGIN
        NEW.STD_Updated_At = NOW();
        RETURN NEW;
    END;
$STD_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER STD_UpdatedAtAutomation BEFORE UPDATE ON STUDIO
FOR EACH ROW EXECUTE FUNCTION STD_UpdatedAtAutomation();

/*==============================================================*/
/* Table: TIKET                                                 */
/*==============================================================*/
CREATE OR REPLACE FUNCTION TIK_UpdatedAtAutomation() RETURNS TRIGGER AS $TIK_UpdatedAtAutomation$
    BEGIN
        NEW.TIK_Updated_At = NOW();
        RETURN NEW;
    END;
$TIK_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER TIK_UpdatedAtAutomation BEFORE UPDATE ON TIKET
FOR EACH ROW EXECUTE FUNCTION TIK_UpdatedAtAutomation();

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
CREATE OR REPLACE FUNCTION TRX_UpdatedAtAutomation() RETURNS TRIGGER AS $TRX_UpdatedAtAutomation$
    BEGIN
        NEW.TRX_Updated_At = NOW();
        RETURN NEW;
    END;
$TRX_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER TRX_UpdatedAtAutomation BEFORE UPDATE ON TRANSAKSI
FOR EACH ROW EXECUTE FUNCTION TRX_UpdatedAtAutomation();

/*==============================================================*/
/* Table: VOUCHER                                               */
/*==============================================================*/
CREATE OR REPLACE FUNCTION VOC_UpdatedAtAutomation() RETURNS TRIGGER AS $VOC_UpdatedAtAutomation$
    BEGIN
        NEW.VOC_Updated_At = NOW();
        RETURN NEW;
    END;
$VOC_UpdatedAtAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER VOC_UpdatedAtAutomation BEFORE UPDATE ON VOUCHER
FOR EACH ROW EXECUTE FUNCTION VOC_UpdatedAtAutomation();

-- TRIGGER
/*==============================================================*/
/* Automate Price (Weekdays and Weekends)                       */
/*==============================================================*/
CREATE OR REPLACE FUNCTION weekendPriceAutomation() RETURNS TRIGGER AS $weekendPriceAutomation$
    BEGIN
        -- Weekends
        IF(((SELECT to_char(NEW.SCH_WAKTU, 'DY')) = 'SAT') OR ((SELECT to_char(NEW.SCH_WAKTU, 'DY')) = 'SUN')) THEN
			NEW.SCH_HARGA = '50000';
        -- Weekdays
        ELSE
            NEW.SCH_HARGA = '35000';
		END IF;
		RETURN NEW;
    END;
$weekendPriceAutomation$ LANGUAGE plpgsql;

CREATE TRIGGER weekendPriceAutomation BEFORE INSERT ON JADWAL
FOR EACH ROW EXECUTE FUNCTION weekendPriceAutomation();

-- TRIGGER
/*==============================================================*/
/* Automate Price Calculation and Total Tickets                 */
/*==============================================================*/


-- TRIGGER
/*==============================================================*/
/* Check If Seats Are Available                 */
/*==============================================================*/
CREATE OR REPLACE FUNCTION checkSeatsAvailability() RETURNS TRIGGER AS $checkSeatsAvailability$
    BEGIN
        -- Weekends
        IF(SELECT EXISTS (SELECT FALSE FROM KURSI WHERE CHR_KODE = NEW.CHR_KODE)) THEN
			RAISE SQLSTATE '70005' USING MESSAGE = 'Kursi Tidak Tersedia!';
        -- Weekdays
        ELSEIF((SELECT COUNT(CHR_ID) FROM KURSI WHERE SCH_ID = NEW.SCH_ID) >= (SELECT STD_KAPASITAS FROM STUDIO WHERE STD_ID = (
                                                                               SELECT STD_ID FROM JADWAL WHERE SCH_ID = NEW.SCH_ID))) THEN
            RAISE SQLSTATE '70005' USING MESSAGE = 'Kursi Penuh Pada Jadwal Ini!';
        ELSE
            RETURN NEW;
		END IF;
    END;
$checkSeatsAvailability$ LANGUAGE plpgsql;

CREATE TRIGGER checkSeatsAvailability BEFORE INSERT ON KURSI
FOR EACH ROW EXECUTE FUNCTION checkSeatsAvailability();