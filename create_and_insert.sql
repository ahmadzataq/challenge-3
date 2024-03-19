--create
create database db_bank;
	--\c db_bank
create table nasabah(
nasabah_id serial primary key,
nama varchar(255) not null,
nik varchar(16) not null unique,
alamat text);

create table akun(
akun_id serial primary key,
jenis varchar(50) not null,
saldo integer not null,
nasabah_id integer not null);

create table transaksi(
transaksi_id serial primary key,
tanggal timestamp not null,
nominal integer not null,
akun_id integer not null);

INSERT INTO nasabah (nama, nik, alamat) VALUES 
('Bagus', '3256031234560001', 'Jalan Merdeka No.1'),
('Bagas', '3256031234560002', 'Gang Nangka No.12'),
('Indah', '3256031234560003', 'Jalan Kecapi No.123');

INSERT INTO akun (jenis, saldo, nasabah_id) VALUES 
('Tabungan', 1500000, 1),
('Simpanan Pelajar', 500000, 2),
('Deposito', 2000000, 3);

INSERT INTO transaksi (tanggal, nominal, akun_id) VALUES 
('2024-03-19 10:00:00', 500000, 1),
('2024-03-18 09:12:12', 100000, 2),
('2023-03-17 06:31:36', 750000, 3);

--read
select * from nasabah;
select * from akun;
select * from transaksi;

SELECT saldo FROM akun WHERE akun_id = 2;

SELECT alamat FROM nasabah WHERE nama = 'Bagus';

SELECT
    nasabah.nama,
    nasabah.nik,
    akun.jenis as jenis_akun,
    akun.saldo
FROM
    nasabah
INNER JOIN akun ON nasabah.nasabah_id = akun.nasabah_id
INNER JOIN transaksi ON akun.akun_id = transaksi.akun_id
ORDER BY transaksi.tanggal;

--update
UPDATE nasabah SET alamat = 'Jalan Kemerdekaan No.69' WHERE nasabah_id = 1;

--delete
DELETE FROM transaksi WHERE transaksi_id = 1;



