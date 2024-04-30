CREATE DATABASE coba;
USE coba;
SHOW DATABASES;

CREATE TABLE mahasiswa (
    nama VARCHAR(20),
    alamat VARCHAR(15)
);
SHOW TABLES;
DESCRIBE mahasiswa;

-- Tambahkan kolom nim(int 11) di awal
ALTER TABLE mahasiswa
ADD COLUMN nim INT(11) FIRST;
DESCRIBE mahasiswa;

-- Sisipkan kolom phone (varchar 15) setelah kolom alamat
ALTER TABLE mahasiswa
ADD COLUMN phone VARCHAR(15) AFTER alamat;
SHOW COLUMNS FROM mahasiswa;

-- Ubah atribut kolom nim menjadi char(11)
ALTER TABLE mahasiswa
MODIFY COLUMN nim CHAR(11);
SHOW COLUMNS FROM mahasiswa;

-- Ubah nama kolom phone menjadi telepon
ALTER TABLE mahasiswa
CHANGE COLUMN phone telepon VARCHAR(20);
SHOW COLUMNS FROM mahasiswa;

-- Tambahkan kolom keterangan(varchar 15), sebagai kolom terakhir
ALTER TABLE mahasiswa
ADD COLUMN keterangan VARCHAR(15) AFTER telepon;
DESCRIBE mahasiswa;

-- Hapus kolom keterangan
ALTER TABLE mahasiswa DROP COLUMN keterangan;
DESCRIBE mahasiswa;

-- Ganti nama tabel menjadi student
RENAME TABLE mahasiswa TO student;
SHOW TABLES;

-- Jadikan nim sebagai PK
ALTER TABLE student MODIFY COLUMN nim CHAR(11),
ADD PRIMARY KEY (nim);
DESCRIBE student;

-- DROP DATABASE coba;

iner JOIN, LEFT JOIN dan RIGHT JOIN