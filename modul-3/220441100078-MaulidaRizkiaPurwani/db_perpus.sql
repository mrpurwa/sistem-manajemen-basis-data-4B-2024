CREATE DATABASE IF NOT EXISTS db_perpus;
USE db_perpus;

-- Tabel Petugas
CREATE TABLE IF NOT EXISTS tbl_petugas (
    id_petugas VARCHAR(10) PRIMARY KEY,
    username VARCHAR(15),
    psw VARCHAR(15),
    nama VARCHAR(25)
);
INSERT INTO tbl_petugas (id_petugas, username, psw, nama) VALUES
('STF01', 'muntari01', 'mntr1977', 'Muntari'),
('STF02', 'nandar02', 'mnndr1989', 'Munandar'),
('STF03', 'marsono03', 'mrsn1987', 'Marsono'),
('STF04', 'suntoro04', 'sntr1988', 'Suntoro'),
('STF05', 'slamet05', 'slmt1949', 'Slamet'),
('STF06', 'matrawi06', 'mtrw1987', 'Matrawi'),
('STF07', 'tiwi07', 'prtw1988', 'Pratiwi'),
('STF08', 'endangs08', 'endngs85', 'Endang S.'),
('STF09', 'wurya09', 'wrynngsh9', 'Wuryaningsih'),
('STF10', 'parti10', 'sprt1988', 'Suparti');
SELECT * FROM tbl_petugas;

-- Tabel Buku
CREATE TABLE IF NOT EXISTS tbl_buku (
    kode_buku VARCHAR(10) PRIMARY KEY,
    judul VARCHAR(50),
    pengarang VARCHAR(50),
    penerbit VARCHAR(50),
    thn_terbit INT,
    stok INT,
    status_buku VARCHAR(15),
    klasifikasi VARCHAR(20)
);
INSERT INTO tbl_buku (kode_buku, judul, pengarang, penerbit, thn_terbit, stok, status_buku, klasifikasi) VALUES
('BK4567', 'Daun adalah Temanku', 'Fitriyah', 'PT Adhiaksa', 2017, 10, 'Available', 'Buku Anak'),
('BK1653', 'Bulan di Kekang Malam', 'Rossa', 'PT Mahakarya', 2018, 10, 'Available', 'Romance'),
('BK2765', 'Rindu Ibu', 'Aldi Dwi', 'PT Abdi Jaya', 2023, 10, 'Available', 'Non-Fiksi'),
('BK9183', 'Cahaya di Atas Cahaya', 'Aisyah N', 'PT Bersinar', 2022, 10, 'Available', 'Religi'),
('BK9071', 'Daunpun Mendengar', 'Ravelina Putri', 'PT Rainbow', 2020, 10, 'Available', 'Fiksi'),
('BK5241', 'Petualang Nobita di Neosantara', 'Fujiko Fujio', 'PT Neo Japan', 2023, 10, 'Available', 'Manga'),
('BK9172', 'Pulang', 'Tere Liye', 'PT Gramedia', 2018, 10, 'Available', 'Fiksi'),
('BK5571', 'Fi  Filasṭīn', 'Mrpurwa', 'PT Semangka', 2020, 10, 'Available', 'Sejarah'),
('BK1234', 'Belajar SQL Dengan Mudah', 'Budi Setiawan', 'PT Informatika', 2021, 10, 'Available', 'Pendidikan'),
('BK9182', 'Love Story', 'Anissa', 'PT Mahakarya', 2019, 10, 'Available', 'Romance');
SELECT * FROM tbl_buku;
DROP TABLE tbl_buku;

-- Tabel Anggota
CREATE TABLE IF NOT EXISTS tbl_anggota (
    id_anggota VARCHAR(10) PRIMARY KEY,
    nama_member VARCHAR(50),
    angkatan VARCHAR(4),
    tempat_lahir VARCHAR(50),
    tgl_lahir DATE,
    tlpn VARCHAR(15),
    jenis_kelamin VARCHAR(10),
    status_pinjam VARCHAR(15)
);
INSERT INTO tbl_anggota (id_anggota, nama_member, angkatan, tempat_lahir, tgl_lahir, tlpn, jenis_kelamin, status_pinjam) VALUES
('ID1234', 'Maulida Rizkia Purwani', '2020', 'Pekanbaru', '2002-06-03', '085707168180', 'Perempuan', 'Tidak Ada'),
('ID2345', 'Lisnaldi Dwi Saroni', '2020', 'Bojonegoro', '2002-03-29', '082131232105', 'Laki-Laki', 'Rindu Ibu'),
('ID4567', 'Muhammad Roiyan Ghozzi', '2023', 'Bojonegoro', '2003-06-24', '081511890608', 'Laki-Laki', 'Tidak Ada'),
('ID1098', 'Fitriyah Annisa', '2022', 'Jakarta', '2003-09-18', '081291970397', 'Perempuan', 'Tidak Ada'),
('ID1770', 'Ravelina Beyonda Putri', '2024', 'Kendari', '2002-06-03', '081232393955', 'Perempuan', 'Tidak Ada'),
('ID1001', 'Muhammad Al-Fatir', '2024', 'Bojonegoro', '2004-11-25', '085265567000', 'Laki-Laki', 'Tidak Ada'),
('ID1445', 'Ryan Beyonda Putra', '2024', 'Surabaya', '2005-01-05', '081230929950', 'Laki-Laki', 'Tidak Ada'),
('ID3049', 'Aurora Steviona', '2023', 'Gresik', '2003-04-03', '085233595977', 'Perempuan', 'Tidak Ada'),
('ID5557', 'Febri Dwi Prakoso', '2021', 'Pekanbaru', '2004-02-08', '088235977469', 'Laki-Laki', 'Tidak Ada'),
('ID6152', 'Muhammad Rizki Ramadhan', '2024', 'Yogyakarta', '2004-09-29', '081357674941', 'Laki-Laki', 'Tidak Ada');
SELECT * FROM tbl_anggota;

-- Tabel Peminjaman
CREATE TABLE IF NOT EXISTS tbl_peminjaman (
    kode_peminjaman VARCHAR(10) PRIMARY KEY,
    id_anggota VARCHAR(10),
    id_petugas VARCHAR(10),
    tgl_pinjam DATE,
    tgl_kembali DATE,
    kode_buku VARCHAR(10),
    FOREIGN KEY (id_anggota) REFERENCES tbl_anggota(id_anggota),
    FOREIGN KEY (id_petugas) REFERENCES tbl_petugas(id_petugas),
    FOREIGN KEY (kode_buku) REFERENCES tbl_buku(kode_buku)
);
INSERT INTO tbl_peminjaman (kode_peminjaman, id_anggota, id_petugas, tgl_pinjam, tgl_kembali, kode_buku) VALUES
('KP001', 'ID1234', 'STF01', '2024-03-01', '2024-03-10', 'BK4567'),
('KP002', 'ID1234', 'STF01', '2024-03-03', '2024-03-15', 'BK1653'),
('KP003', 'ID2345', 'STF02', '2024-03-05', '2024-03-12', 'BK2765'),
('KP004', 'ID2345', 'STF03', '2024-03-07', '2024-03-18', 'BK9183'),
('KP005', 'ID1234', 'STF03', '2024-03-09', '2024-03-20', 'BK9071'),
('KP006', 'ID1234', 'STF03', '2024-03-11', '2024-03-22', 'BK5241'),
('KP007', 'ID1234', 'STF03', '2024-03-13', '2024-03-25', 'BK9172'),
('KP008', 'ID2345', 'STF04', '2024-03-15', '2024-03-28', 'BK5571'),
('KP009', 'ID1234', 'STF05', '2024-03-17', '2024-03-30', 'BK1234'),
('KP010', 'ID2345', 'STF06', '2024-03-19', '2024-04-01', 'BK9182'),
('KP011', 'ID1770', 'STF07', '2024-03-21', '2024-04-01', 'BK2765'),
('KP012', 'ID1001', 'STF08', '2024-03-23', '2024-04-04', 'BK2765'),
('KP013', 'ID3049', 'STF09', '2024-03-25', '2024-04-06', 'BK2765'),
('KP014', 'ID5557', 'STF09', '2024-03-27', '2024-04-08', 'BK2765'),
('KP015', 'ID6152', 'STF10', '2024-03-29', '2024-04-10', 'BK2765');
SELECT * FROM tbl_peminjaman;
-- drop table tbl_peminjaman;

-- Tabel Pengembalian
CREATE TABLE IF NOT EXISTS tbl_pengembalian (
    kode_kembali VARCHAR(10) PRIMARY KEY,
    id_anggota VARCHAR(10),
    kode_buku VARCHAR(10),
    id_petugas VARCHAR(10),
    tgl_pinjam DATE,
    tgl_kembali DATE,
    denda INT,
    FOREIGN KEY (id_anggota) REFERENCES tbl_anggota(id_anggota),
    FOREIGN KEY (kode_buku) REFERENCES tbl_buku(kode_buku),
    FOREIGN KEY (id_petugas) REFERENCES tbl_petugas(id_petugas)
);
INSERT INTO tbl_pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda) VALUES
('KB001', 'ID1234', 'BK4567', 'STF01', '2024-03-01', '2024-03-10', 0),
('KB002', 'ID1234', 'BK1653', 'STF01', '2024-03-03', '2024-03-15', 20000),
('KB003', 'ID2345', 'BK2765', 'STF02', '2024-03-05', '2024-03-12', 0),
('KB004', 'ID2345', 'BK9183', 'STF03', '2024-03-07', '2024-03-18', 0),
('KB005', 'ID1234', 'BK9071', 'STF03', '2024-03-09', '2024-03-20', 15000),
('KB006', 'ID1234', 'BK5241', 'STF03', '2024-03-11', '2024-03-22', 50000),
('KB007', 'ID1234', 'BK9172', 'STF03', '2024-03-13', '2024-03-25', 0),
('KB008', 'ID2345', 'BK5571', 'STF04', '2024-03-15', '2024-03-28', 15000),
('KB009', 'ID1234', 'BK1234', 'STF05', '2024-03-17', '2024-03-30', 0),
('KB010', 'ID2345', 'BK9182', 'STF06', '2024-03-19', '2024-04-01', 0),
('KB011', 'ID1770', 'BK2765', 'STF07', '2024-03-21', '2024-04-01', 0),
('KB012', 'ID1001', 'BK2765', 'STF08', '2024-03-23', '2024-04-04', 0),
('KB013', 'ID3049', 'BK2765', 'STF09', '2024-03-25', '2024-04-06', 0),
('KB014', 'ID5557', 'BK2765', 'STF09', '2024-03-27', '2024-04-08', 0),
('KB015', 'ID6152', 'BK2765', 'STF10', '2024-03-29', '2024-04-10', 0);
SELECT * FROM tbl_pengembalian;

-- 1. procedure dengan parameter IN default
-- menampilkan data peminjaman buku yang dilakukan oleh petugas tertentu
DELIMITER //
CREATE PROCEDURE TampilBukuDipinjam(IN petugas_id VARCHAR(10))
BEGIN
    SELECT p.* FROM tbl_peminjaman AS p
    JOIN tbl_petugas AS pt ON p.id_petugas = pt.id_petugas
    WHERE pt.id_petugas = petugas_id;
END //
DELIMITER ;
CALL TampilBukuDipinjam('STF01');

-- 2.stored procedure untuk mengetahui data pada salah satu table berdasarkan satu atribut
DELIMITER //
CREATE PROCEDURE CariAnggotaByNama (IN input_nama VARCHAR(50))
BEGIN
    SELECT * FROM tbl_anggota WHERE nama_member = input_nama;
END //
DELIMITER ;
CALL CariAnggotaByNama('Lisnaldi Dwi Saroni');

-- 3. stored procedure untuk mengetahui data pada salah satu table dengan pada dua atribut
DELIMITER //
CREATE PROCEDURE GetPetugasByUsernamedanNama (
    IN input_username VARCHAR(15),
    IN input_nama VARCHAR(25)
)
BEGIN
    SELECT * FROM tbl_petugas WHERE username = input_username AND nama = input_nama;
END //
DELIMITER ;
CALL GetPetugasByUsernamedanNama('slamet05', 'Slamet');

-- 4. stored procedure untuk mengetahui data pada salah satu table dengan pada tiga atribut
DELIMITER //
CREATE PROCEDURE GetPeminjamanByAnggotaPetugasBuku (
    IN no_anggota VARCHAR(10),
    IN no_petugas VARCHAR(10),
    IN id_buku VARCHAR(10)
)
BEGIN
    SELECT * FROM tbl_peminjaman 
    WHERE id_anggota = no_anggota 
    AND id_petugas = no_petugas 
    AND kode_buku = id_buku;
END //
DELIMITER ;
CALL GetPeminjamanByAnggotaPetugasBuku('ID1234', 'STF01', 'BK4567');

-- 5.stored procedure untuk memasukkan data pada salah satu table
-- tambah anggota baru dengan parameter IN
DELIMITER //
CREATE PROCEDURE InsertAnggotaBaru (
    IN id_anggota VARCHAR(10),
    IN nama_member VARCHAR(50),
    IN angkatan VARCHAR(4),
    IN tempat_lahir VARCHAR(50),
    IN tgl_lahir DATE,
    IN tlpn VARCHAR(15),
    IN jenis_kelamin VARCHAR(10),
    IN status_pinjam VARCHAR(15)
)
BEGIN
    INSERT INTO tbl_anggota (id_anggota, nama_member, angkatan, tempat_lahir, tgl_lahir, tlpn, jenis_kelamin, status_pinjam)
    VALUES (id_anggota, nama_member, angkatan, tempat_lahir, tgl_lahir, tlpn, jenis_kelamin, status_pinjam);
END //
DELIMITER ;
CALL InsertAnggotaBaru('ID12345', 'Purwono Joko Prakoso', '2024', 'Tuban', '2000-02-17', '081234567890', 'Laki-Laki', 'Tidak Ada');
SELECT * FROM tbl_anggota;

-- 6.stored procedure untuk mengetahui data pada salah satu table menggunakan parameter OUT
-- mengetahui jumlah stok buku dengan parameter OUT
DELIMITER //
CREATE PROCEDURE StokBuku(OUT stok_buku INT)
BEGIN
    SELECT stok INTO stok_buku FROM tbl_buku WHERE judul = 'Rindu Ibu';
    IF stok_buku IS NULL THEN 
        SET stok_buku = 0;
    END IF;
END //
DELIMITER ;
CALL StokBuku(@stok);
SELECT @stok;

-- 7.stored procedure untuk mengetahui data pada salah satu table menggunakan parameter INOUT
-- mengetahui keseluruhan stok buku dari tabel buku dengan INOUT
DELIMITER //
CREATE PROCEDURE StokBukuByJudul(INOUT stok_buku INT)
BEGIN
    SELECT stok INTO stok_buku FROM tbl_buku WHERE judul = 'Rindu Ibu';
    IF stok_buku IS NULL THEN
        SET stok_buku = 0;
    END IF;
END //
DELIMITER ;
SET @stok = 0;
CALL StokBukuByJudul(@stok);
SELECT @stok;


























