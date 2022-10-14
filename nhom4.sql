use master
go
if EXISTS (select * from sys.databases where name='nhom4')
drop database nhom4
go
create database nhom4
go
use nhom4
create table sanpham(
	maSp varchar(6) primary key not null,
	TenSp nvarchar(20) not null,
	loaiSp nvarchar(5),
	giaNiemYet money,
	gioithieusoluoc nvarchar(100),
	)
create table khachhang(
	maKH int primary key identity,
	hoVaTen nvarchar(20),
	phone int ,
	email varchar(30) check email like '%.com',
	diaChi varchar(20) not null
	)
create table cuahang(
	maCH int primary key identity,
	diaChiCH nvarchar(30),
	soDtlienhe int not null;
	)
create table nhanvien(
	maNv int primary key identity,
	tenNV nvarchar(20),
	soDt_NV char(10) check (soDt_NV not like '%[^0-9]%') not null,
	DiaChi nvarchar(100),
	maCH int,
	constraint fk_mach foreign key (maCH) references cuahang(maCH)
	)
create hoadon(
	maHD int ,
	maKh int ,
	maNV int,
	maSp int,
	giaBan money,
	soLuong int,
	ngayban date default getdate(),
	constraint fk_masp foreign key maSp references sanpham(maSp),
	constraint fk_hoadon_maNV foreign key maNV references nhanvien(maNV),
	constraint fk_masp foreign key maKH references khachhang(maKH)
	)