--DROP table NguoiDung;
--Tao bang NguoiDung
create table NguoiDung(
    ID_ND NUMBER(8,0),
    Email varchar2(50),
    Matkhau varchar2(20),
    VerifyCode varchar2(10)DEFAULT NULL,
    Trangthai varchar2(10) DEFAULT '',
    Vaitro varchar2(20)
);
---Them rang buoc
alter table NguoiDung
    add constraint ND_Email_NNULL check ('Email' is not null)
    add constraint ND_Matkhau_NNULL check ('Matkhau' is not null)
    add constraint ND_Vaitro_Ten check (Vaitro in ('Khach Hang','Nhan Vien','Nhan Vien Kho','Quan Ly'));

---Them khoa chinh
alter table NguoiDung
    add constraint NguoiDung_PK PRIMARY KEY (ID_ND);
    
--Them data cho Bang NguoiDung
--Nhan vien
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (100,'NVHoangViet@gmail.com','123','Verified','Quan Ly');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (101,'NVHoangPhuc@gmail.com','123','Verified','Nhan Vien');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (102,'NVAnhHong@gmail.com','123','Verified','Nhan Vien Kho');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (103,'NVQuangDinh@gmail.com','123','Verified','Nhan Vien');
--Khach Hang
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (104,'KHThaoDuong@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (105,'KHTanHieu@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (106,'KHQuocThinh@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (107,'KHNhuMai@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (108,'KHBichHao@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (109,'KHMaiQuynh@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (110,'KHMinhQuang@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (111,'KHThanhHang@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (112,'KHThanhNhan@gmail.com','123','Verified','Khach Hang');
INSERT INTO NguoiDung(ID_ND,Email,MatKhau,Trangthai,Vaitro) VALUES (113,'KHPhucNguyen@gmail.com','123','Verified','Khach Hang');


--Tao bang NhanVien
--drop table NhanVien;
create table NhanVien(
    ID_NV NUMBER(8,0),
    TenNV VARCHAR2(50),
    NgayVL DATE ,
    SDT VARCHAR2(50),
    Chucvu VARCHAR2(50),
    ID_ND NUMBER(8,0) DEFAULT NULL,
    ID_NQL NUMBER(8,0),
    Tinhtrang VARCHAR2(20)
);
--Them rang buoc cho bang NhanVien
--Them Check Constraint
alter table NhanVien
    add constraint NV_TenNV_NNULL check ('TenNV' is not null)
    add constraint NV_SDT_NNULL check ('SDT' is not null)
    add constraint NV_NgayVL_NNULL check ('NgayVL' is not null)
    add constraint NV_Chucvu_Thuoc check (Chucvu IN ('Phuc vu','Tiep tan','Thu ngan','Bep','Kho','Quan ly'))
    add constraint NV_Tinhtrang_Thuoc check (Tinhtrang IN ('Dang lam viec','Da nghi viec'));

--Them khoa chinh
alter table NhanVien
    add constraint NV_PK PRIMARY KEY (ID_NV);

--Them khoa ngoai
ALTER TABLE NhanVien
 ADD CONSTRAINT NV_fk_idND FOREIGN KEY 
 (ID_ND) REFERENCES NguoiDung(ID_ND)
 ADD CONSTRAINT NV_fk_idNQL FOREIGN KEY 
 (ID_NQL) REFERENCES NhanVien(ID_NV);
 

--Them data cho bang Nhan Vien
ALTER SESSION SET NLS_DATE_FORMAT = 'dd-MM-YYYY';
--Co tai khoan
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (100,'Nguyen Hoang Viet','10/05/2023','0848044725','Quan ly',100,100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (101,'Nguyen Hoang Phuc','20/05/2023','0838033334','Tiep tan',101,100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (102,'Le Thi Anh Hong','19/05/2023','0838033234','Kho',102,100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_ND,ID_NQL,Tinhtrang) VALUES (103,'Ho Quang Dinh','19/05/2023','0838033234','Tiep tan',103,100,'Dang lam viec');
--Khong co tai khoan
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (104,'Ha Thao Duong','10/05/2023','0838033232','Phuc vu',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (105,'Nguyen Quoc Thinh','11/05/2023','0838033734','Phuc vu',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (106,'Truong Tan Hieu','12/05/2023','0838033834','Phuc vu',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (107,'Nguyen Thai Bao','10/05/2023','0838093234','Phuc vu',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (108,'Tran Nhat Khang','11/05/2023','0838133234','Thu ngan',100,'Dang lam viec');
INSERT INTO NhanVien(ID_NV,TenNV,NgayVL,SDT,Chucvu,ID_NQL,Tinhtrang) VALUES (109,'Nguyen Ngoc Luong','12/05/2023','0834033234','Bep',100,'Dang lam viec');


--Tao bang KhachHang
--drop table KhachHang;
ALTER SESSION SET NLS_DATE_FORMAT = 'dd-MM-YYYY';
create table KhachHang(
    ID_KH NUMBER(8,0),
    TenKH varchar2(50), 
    Ngaythamgia date, 
    Doanhso number(10,0) DEFAULT 0, 
    Diemtichluy number(5,0) DEFAULT 0,
    ID_ND NUMBER(8,0)
);
--Them Check Constraint
alter table KhachHang
    add constraint KH_TenKH_NNULL check ('TenKH' is not null)
    add constraint KH_Ngaythamgia_NNULL check ('Ngaythamgia' is not null)
    add constraint KH_Doanhthu_NNULL check ('Doanhthu' is not null)
    add constraint KH_Diemtichluy_NNULL check ('Diemtichluy' is not null)
    add constraint KH_IDND_NNULL check ('ID_ND' is not null);

---Them khoa chinh
alter table KhachHang
    add constraint KhachHang_PK PRIMARY KEY (ID_KH);
    
---Them khoa ngoai
ALTER TABLE KhachHang
 ADD CONSTRAINT KH_fk_idND FOREIGN KEY 
 (ID_ND) REFERENCES NguoiDung(ID_ND);

--Them data cho bang KhachHang
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (100,'Ha Thao Duong','10/05/2023',104);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (101,'Truong Tan Hieu','10/05/2023',105);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (102,'Nguyen Quoc Thinh','10/05/2023',106);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (103,'Tran Nhu Mai','10/05/2023',107);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (104,'Nguyen Thi Bich Hao','10/05/2023',108);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (105,'Nguyen Mai Quynh','11/05/2023',109);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (106,'Hoang Minh Quang','11/05/2023',110);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (107,'Nguyen Thanh Hang','12/05/2023',111);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (108,'Nguyen Ngoc Thanh Nhan','11/05/2023',112);
INSERT INTO KhachHang(ID_KH,TenKH,Ngaythamgia,ID_ND) VALUES (109,'Hoang Thi Phuc Nguyen','12/05/2023',113);



--Tao bang MonAn
--drop table MonAn;
create table MonAn(
    ID_MonAn NUMBER(8,0),
    TenMon varchar2(50), 
    DonGia number(8,0),
    Loai varchar2(50),
    TrangThai varchar2(30)
);
--Them Check Constraint
alter table MonAn
    add constraint MA_TenMon_NNULL check ('TenMon' is not null)
    add constraint MA_DonGia_NNULL check ('Dongia' is not null)
    add constraint MA_Loai_Ten check (Loai in ('Aries','Taurus','Gemini','Cancer','Leo','Virgo'
                                                 ,'Libra','Scorpio','Sagittarius','Capricorn','Aquarius','Pisces'))
    add constraint MA_TrangThai_Thuoc check (TrangThai in('Dang kinh doanh','Ngung kinh doanh'));                                             

--Them khoa chinh
alter table MonAn
    add constraint MonAn_PK PRIMARY KEY (ID_MonAn);


--Them data
--Aries
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(1,'DUI CUU NUONG XE NHO', 250000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(2,'BE SUON CUU NUONG GIAY BAC MONG CO', 230000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(3,'DUI CUU NUONG TRUNG DONG', 350000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(4,'CUU XOC LA CA RI', 129000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(5,'CUU KUNGBAO', 250000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(6,'BAP CUU NUONG CAY', 250000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(7,'CUU VIEN HAM CAY', 19000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(8,'SUON CONG NUONG MONG CO', 250000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(9,'DUI CUU LON NUONG TAI BAN', 750000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(10,'SUONG CUU NUONG SOT NAM', 450000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(11,'DUI CUU NUONG TIEU XANH', 285000,'Aries','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(12,'SUON CUU SOT PHO MAI', 450000,'Aries','Dang kinh doanh');

--Taurus
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(13,'Bit tet bo My khoai tay', 179000,'Taurus','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(14,'Bo bit tet Uc',169000,'Taurus','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(15,'Bit tet bo My BASIC', 179000,'Taurus','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(16,'My Y bo bam', 169000,'Taurus','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(17,'Thit suon Wagyu', 1180000,'Taurus','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(18,'Steak Thit Vai Wagyu', 1290000,'Taurus','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(19,'Steak Thit Bung Bo', 550000,'Taurus','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(20,'Tomahawk', 2390000,'Taurus','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(21,'Salad Romaine Nuong', 180000,'Taurus','Dang kinh doanh');

--Gemini
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(22,'Combo Happy', 180000,'Gemini','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(23,'Combo Fantastic', 190000,'Gemini','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(24,'Combo Dreamer', 230000,'Gemini','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(25,'Combo Cupid', 180000,'Gemini','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(26,'Combo Poseidon', 190000,'Gemini','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(27,'Combo LUANG PRABANG', 490000,'Gemini','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(28,'Combo VIENTIANE', 620000,'Gemini','Dang kinh doanh');

--Cancer
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(29,'Cua KingCrab Duc sot', 3650000,'Cancer','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(30,'Mai Cua KingCrab Topping Pho Mai', 2650000,'Cancer','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(31,'Cua KingCrab sot Tu Xuyen', 2300000,'Cancer','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(32,'Cua KingCrab Nuong Tu Nhien', 2550000,'Cancer','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(33,'Cua KingCrab Nuong Bo Toi', 2650000,'Cancer','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(34,'Com Mai Cua KingCrab Chien', 1850000,'Cancer','Dang kinh doanh');

--Leo
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(35,'BOSSAM', 650000,'Leo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(36,'KIMCHI PANCAKE', 350000,'Leo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(37,'SPICY RICE CAKE', 250000,'Leo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(38,'SPICY SAUSAGE HOTPOT', 650000,'Leo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(39,'SPICY PORK', 350000,'Leo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(40,'MUSHROOM SPICY SILKY TOFU STEW', 350000,'Leo','Dang kinh doanh');
--Virgo
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(41,'Pavlova', 150000,'Virgo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(42,'Kesutera', 120000,'Virgo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(43,'Cremeschnitte', 250000,'Virgo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(44,'Sachertorte', 150000,'Virgo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(45,'Schwarzwalder Kirschtorte', 250000,'Virgo','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(46,'New York-Style Cheesecake', 250000,'Virgo','Dang kinh doanh');

--Libra
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(47,'Cobb Salad', 150000,'Libra','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(48,'Salad Israeli', 120000,'Libra','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(49,'Salad Dau den', 120000,'Libra','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(50,'Waldorf Salad', 160000,'Libra','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(51,'Salad Gado-Gado', 200000,'Libra','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(52,'Nicoise Salad', 250000,'Libra','Dang kinh doanh');

--Scorpio
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(53,'BULGOGI LUNCHBOX', 250000,'Scorpio','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(54,'CHICKEN TERIYAKI LUNCHBOX', 350000,'Scorpio','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(55,'SPICY PORK LUNCHBOX', 350000,'Scorpio','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(56,'TOFU TERIYAKI LUNCHBOX', 250000,'Scorpio','Dang kinh doanh');

--Sagittarius
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(57,'Thit ngua do tuoi', 250000,'Sagittarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(58,'Steak Thit ngua', 350000,'Sagittarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(59,'Thit ngua ban gang', 350000,'Sagittarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(60,'Long ngua xao dua', 150000,'Sagittarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(61,'Thit ngua xao sa ot', 250000,'Sagittarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(62,'Ngua tang', 350000,'Sagittarius','Dang kinh doanh');

--Capricorn
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(63,'Thit de xong hoi', 229000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(64,'Thit de xao rau ngo', 199000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(65,'Thit de nuong tang', 229000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(66,'Thit de chao', 199000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(67,'Thit de nuong xien', 199000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(68,'Nam de nuong/chao', 199000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(69,'Thit de xao lan', 19000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(70,'Dui de tan thuoc bac', 199000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(71,'Canh de ham duong quy', 199000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(72,'Chao de dau xanh', 50000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(73,'Thit de nhung me', 229000,'Capricorn','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(74,'Lau de nhu', 499000,'Capricorn','Dang kinh doanh');


--Aquarius
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(75,'SIGNATURE WINE', 3290000,'Aquarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(76,'CHILEAN WINE', 3990000,'Aquarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(77,'ARGENTINA WINE', 2890000,'Aquarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(78,'ITALIAN WINE', 5590000,'Aquarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(79,'AMERICAN WINE', 4990000,'Aquarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(80,'CLASSIC COCKTAIL', 200000,'Aquarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(81,'SIGNATURE COCKTAIL', 250000,'Aquarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(82,'MOCKTAIL', 160000,'Aquarius','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(83,'JAPANESE SAKE', 1490000,'Aquarius','Dang kinh doanh');

--Pisces
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(84,'Ca Hoi Ngam Tuong', 289000,'Pisces','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(85,'Ca Ngu Ngam Tuong', 289000,'Pisces','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(86,'IKURA:Trung ca hoi', 189000,'Pisces','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(87,'KARIN:Sashimi Ca Ngu', 149000,'Pisces','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(88,'KEIKO:Sashimi Ca Hoi', 199000,'Pisces','Dang kinh doanh');
insert into MonAn(ID_MonAn,TenMon,Dongia,Loai,TrangThai) values(89,'CHIYO:Sashimi Bung Ca Hoi', 219000,'Pisces','Dang kinh doanh');




--Tao bang Ban
--drop table Ban;
create table Ban(
    ID_Ban NUMBER(8,0) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    TenBan varchar2(50), 
    Vitri varchar2(50), 
    Trangthai varchar2(50)
);
--Them Check Constraint
alter table Ban
    add constraint Ban_TenBan_NNULL check ('TenBan' is not null)
    add constraint Ban_Vitri_NNULL check ('Vitri' is not null)
    add constraint Ban_Trangthai_Ten check (Trangthai in ('Con trong','Dang dung bua','Da dat truoc'));


--Them khoa chinh
alter table Ban
    add constraint Ban_PK PRIMARY KEY (ID_Ban);


--Them data cho Ban
--Tang 1
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.1','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.2','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.3','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.4','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.5','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.6','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.7','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.8','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.9','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.10','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.11','Tang 1','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T1.12','Tang 1','Con trong');
--Tang 2
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.1','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.2','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.3','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.4','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.5','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.6','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.7','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.8','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.9','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.10','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.11','Tang 2','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T2.12','Tang 2','Con trong');
--Tang 3
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');
insert into Ban(TenBan,Vitri,Trangthai) values('Ban T3.1','Tang 3','Con trong');


--Tao bang Voucher

--Tao bang Voucher
--drop table Voucher;

create table Voucher(
    Code_Voucher varchar2(10),
    Mota varchar2(50),
    Phantram number(3,0),
    LoaiMA varchar2(50),
    SoLuong number(3,0),
    Diem number(8,0)
);
--Them Check Constraint
alter table Voucher
    add constraint V_Code_NNULL check ('Code_Voucher' is not null)
    add constraint V_Mota_NNULL check ('Mota' is not null)
    add constraint V_Phantram_NNULL check (Phantram > 0 AND Phantram <= 100)
    add constraint V_LoaiMA_Thuoc check (LoaiMA in ('All','Aries','Taurus','Gemini','Cancer','Leo','Virgo'
                                                 ,'Libra','Scorpio','Sagittarius','Capricorn','Aquarius','Pisces'));

---Them khoa chinh
alter table Voucher
    add constraint Voucher_PK PRIMARY KEY (Code_Voucher);
    
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('loQy','20% off for Aries Menu',20,'Aries',10,200);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('pCfI','30% off for Taurus Menu',30,'Taurus',5,300);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('pApo','20% off for Gemini Menu',20,'Gemini',10,200);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('ugQx','100% off for Virgo Menu',100,'Virgo',3,500);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('nxVX','20% off for All Menu',20,'All',5,300);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('Pwyn','20% off for Cancer Menu',20,'Cancer',10,200);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('bjff','50% off for Leo Menu',50,'Leo',5,600);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('YPzJ','20% off for Aquarius Menu',20,'Aquarius',5,200);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('Y5g0','30% off for Pisces Menu',30,'Pisces',5,300);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('7hVO','60% off for Aries Menu',60,'Aries',0,1000);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('WHLm','20% off for Capricorn Menu',20,'Capricorn',0,200);
insert into Voucher(Code_Voucher, Phantram,LoaiMA,SoLuong,Diem) values ('GTsC','20% off for Leo Menu',20,'Leo',0,200);


--Tao bang HoaDon
--drop table HoaDon;

create table HoaDon(
    ID_HoaDon NUMBER(8,0) GENERATED ALWAYS as IDENTITY(START with 100 INCREMENT by 1),
    ID_KH number(8,0),
    ID_Ban number(8,0),
    NgayHD date,
    TienMonAn number(8,0),
    Code_Voucher varchar2(10),
    TienGiam number(8,0),
    Tongtien number(10,0),
    Trangthai varchar2(50)
);

--Them Check Constraint
alter table HoaDon
    add constraint HD_NgayHD_NNULL check ('TenMon' is not null)
    add constraint HD_TrangThai check (Trangthai in ('Chua thanh toan','Da thanh toan'));

--Them khoa chinh
alter table HoaDon
    add constraint HD_PK PRIMARY KEY (ID_HoaDon);

ALTER TABLE HoaDon
 ADD CONSTRAINT HD_fk_idKH FOREIGN KEY 
 (ID_KH) REFERENCES KhachHang(ID_KH)
 ADD CONSTRAINT HD_fk_idBan FOREIGN KEY 
 (ID_Ban) REFERENCES Ban(ID_Ban);
 
 
--Tao bang CTHD
--drop table CTHD;
create table CTHD(
    ID_HoaDon NUMBER(8,0),
    ID_MonAn number(8,0),
    SoLuong number(3,0),
    Thanhtien number(10,0)
);

--Them Check Constraint
alter table CTHD
    add constraint CTHD_SoLuong_NNULL check ('SoLuong' is not null);

--Them khoa chinh
alter table CTHD
    add constraint CTHD_PK PRIMARY KEY (ID_HoaDon,ID_MonAn);

ALTER TABLE CTHD
 ADD CONSTRAINT CTHD_fk_idHD FOREIGN KEY 
 (ID_HoaDon) REFERENCES HoaDon(ID_HoaDon)
 ADD CONSTRAINT CTHD_fk_idMonAn FOREIGN KEY 
 (ID_MonAn) REFERENCES MonAn(ID_MonAn);
 
 
--Tao bang Nguyenlieu
--drop table NguyenLieu;
create table NguyenLieu(
    ID_NL NUMBER(8,0),
    TenNL VARCHAR2(50), 
    Dongia NUMBER(8,0), 
    Donvitinh VARCHAR2(50)
);
--Them Check Constraint
alter table NguyenLieu
    add constraint NL_TenNL_NNULL check ('TenNL' is not null)
    add constraint NL_Dongia_NNULL check ('Dongia' is not null)
    add constraint NL_DVT_Thuoc check (Donvitinh in ('g','kg','ml','l'));

--Them khoa chinh
alter table NguyenLieu
    add constraint NL_PK PRIMARY KEY (ID_NL);

--Them data
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(100,'Thit ga',40000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(101,'Thit heo',50000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(102,'Thit bo',80000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(103,'Tom',100000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(104,'Ca hoi',500000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(105,'Gao',40000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(106,'Sua tuoi',40000,'l');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(107,'Bot mi',20000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(108,'Dau ca hoi',1000000,'l');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(109,'Dau dau nanh',150000,'l');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(110,'Muoi',20000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(111,'Duong',20000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(112,'Hanh tay',50000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(113,'Toi',30000,'kg');
INSERT INTO NguyenLieu(ID_NL,TenNL,Dongia,Donvitinh) VALUES(114,'Dam',50000,'l');

--Tao bang Kho
--drop table Kho;
create table Kho(
    ID_NL NUMBER(8,0),
    SLTon NUMBER(3,0) DEFAULT 0
);
--Them Check Constraint


--Them khoa chinh
ALTER TABLE Kho
    ADD CONSTRAINT Kho_pk PRIMARY KEY (ID_NL);

--Them khoa ngoai
ALTER TABLE Kho
 ADD CONSTRAINT Kho_fk_idNL FOREIGN KEY 
 (ID_NL) REFERENCES NguyenLieu(ID_NL);
 
--Khoi tao du lieu ban dau cho kho
BEGIN
    Kho_Khoitao();
END;

--Tao bang PhieuNK
--drop table PhieuNK;
create table PhieuNK(
    ID_NK NUMBER(8,0),
    ID_NV number(8,0),
    NgayNK date,
    Tongtien number(10,0) DEFAULT 0
);

--Them Check Constraint
alter table PhieuNK
    add constraint PNK_NgayNK_NNULL check ('NgayNK' is not null);

--Them khoa chinh
alter table PhieuNK
    add constraint PNK_PK PRIMARY KEY (ID_NK);

ALTER TABLE PhieuNK
 ADD CONSTRAINT PNK_fk_idNV FOREIGN KEY 
 (ID_NV) REFERENCES NhanVien(ID_NV);


--Them bang CTNK
--drop table CTNK;
create table CTNK(
    ID_NK NUMBER(8,0),
    ID_NL number(8,0),
    SoLuong number(3,0),
    Thanhtien number(10,0)
);

--Them Check Constraint
alter table CTNK
    add constraint CTNK_SL_NNULL check ('SoLuong' is not null);

--Them khoa chinh
alter table CTNK
    add constraint CTNK_PK PRIMARY KEY (ID_NK,ID_NL);
    
--Them khoa ngoai
ALTER TABLE CTNK
 ADD CONSTRAINT CTNK_fk_idNK FOREIGN KEY 
 (ID_NK) REFERENCES PhieuNK(ID_NK)
 ADD CONSTRAINT CTNK_fk_idNL FOREIGN KEY 
 (ID_NL) REFERENCES NguyenLieu(ID_NL);


--Tao bang PhieuXK
--drop table PhieuXK;
create table PhieuXK(
    ID_XK NUMBER(8,0),
    ID_NV number(8,0),
    NgayXK date
);

--Them Check Constraint
alter table PhieuXK
    add constraint PXK_NgayXK_NNULL check ('NgayXK' is not null);

--Them khoa chinh
alter table PhieuXK
    add constraint PXK_PK PRIMARY KEY (ID_XK);

ALTER TABLE PhieuXK
 ADD CONSTRAINT PXK_fk_idNV FOREIGN KEY 
 (ID_NV) REFERENCES NhanVien(ID_NV);


--Them bang CTXK
--drop table CTXK;
create table CTXK(
    ID_XK NUMBER(8,0),
    ID_NL number(8,0),
    SoLuong number(3,0)
);

--Them Check Constraint
alter table CTXK
    add constraint CTXK_SL_NNULL check ('SoLuong' is not null);

--Them khoa chinh
alter table CTXK
    add constraint CTXK_PK PRIMARY KEY (ID_XK,ID_NL);

--Them khoa ngoai
ALTER TABLE CTXK
 ADD CONSTRAINT CTNK_fk_idXK FOREIGN KEY 
 (ID_XK) REFERENCES PhieuXK(ID_XK)
 ADD CONSTRAINT CTXK_fk_idNL FOREIGN KEY 
 (ID_NL) REFERENCES NguyenLieu(ID_NL);


--- Tao Trigger

--  Trigger Thanh tien o CTHD bang SoLuong x Dongia cua mon an do

CREATE OR REPLACE TRIGGER CTHD_Thanhtien
BEFORE INSERT OR UPDATE OF SoLuong ON CTHD
FOR EACH ROW
DECLARE 
    gia MonAn.DonGia%TYPE;
BEGIN
    SELECT DonGia
    INTO gia
    FROM MonAn
    WHERE MonAn.ID_MonAn = :new.ID_MonAn;
    
    :new.ThanhTien := :new.SoLuong * gia;
END;

--- Trigger Tien mon an o Hoa Don bang tong thanh tien o CTHD
CREATE OR REPLACE TRIGGER HD_TienMonAn
AFTER INSERT OR UPDATE OR DELETE ON CTHD
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE HoaDon SET TienMonAn = TienMonAn + :new.ThanhTien WHERE HoaDon.ID_HoaDon=:new.ID_HoaDon;
    END IF;
    
    IF UPDATING THEN    
        UPDATE HoaDon SET TienMonAn = TienMonAn + :new.ThanhTien - :old.ThanhTien WHERE HoaDon.ID_HoaDon=:new.ID_HoaDon;
    END IF;
    
    IF DELETING THEN    
        UPDATE HoaDon SET TienMonAn = TienMonAn - :old.ThanhTien WHERE HoaDon.ID_HoaDon=:old.ID_HoaDon;
    END IF;
END;

--Trigger Tien giam o Hoa Don = tong thanh tien cua mon An duoc giam  x Phantram
CREATE OR REPLACE TRIGGER HD_TienGiam
AFTER INSERT OR UPDATE OR DELETE ON CTHD
FOR EACH ROW
DECLARE 
    v_code HoaDon.Code_Voucher%TYPE;
    v_loaiMA Voucher.LoaiMA%TYPE;
    MA_Loai MonAn.Loai%TYPE;
BEGIN
    v_code:=NULL;
--Tim Code Voucher, Loai mon an duoc Ap dung Voucher tu bang Voucher
    IF (INSERTING OR UPDATING) THEN
        SELECT HoaDon.Code_Voucher,Voucher.LoaiMA 
        INTO v_code,v_LoaiMA
        FROM HoaDon
        LEFT JOIN Voucher ON Voucher.Code_Voucher = HoaDon.Code_Voucher
        WHERE ID_HoaDon=:new.ID_HoaDon;
    --Tim loai mon an cua Mon an vua duoc them vao CTHD   
        SELECT Loai
        INTO MA_Loai
        FROM MonAn 
        WHERE ID_MonAn = :new.ID_MonAn;
    END IF;
    
    IF (DELETING) THEN
        SELECT HoaDon.Code_Voucher,Voucher.LoaiMA 
        INTO v_code,v_LoaiMA
        FROM HoaDon
        LEFT JOIN Voucher ON Voucher.Code_Voucher = HoaDon.Code_Voucher
        WHERE ID_HoaDon=:old.ID_HoaDon;
    --Tim loai mon an cua Mon an vua duoc them vao CTHD   
        SELECT Loai
        INTO MA_Loai
        FROM MonAn 
        WHERE ID_MonAn = :old.ID_MonAn;
    END IF;
    
    IF(v_code IS NOT NULL) THEN
        IF(v_LoaiMA='All' OR v_LoaiMA=MA_Loai) THEN 
            IF INSERTING THEN    
                UPDATE HoaDon SET TienGiam = TienGiam + Tinhtiengiam(:new.ThanhTien,v_code) WHERE HoaDon.ID_HoaDon=:new.ID_HoaDon;
            END IF;
            
            IF UPDATING THEN    
                UPDATE HoaDon SET TienGiam = TienGiam + Tinhtiengiam(:new.ThanhTien,v_code) - Tinhtiengiam(:old.ThanhTien,v_code) WHERE HoaDon.ID_HoaDon=:new.ID_HoaDon;
            END IF;
            
            IF DELETING THEN    
                UPDATE HoaDon SET TienGiam = TienGiam - Tinhtiengiam(:old.ThanhTien,v_code) WHERE HoaDon.ID_HoaDon=:old.ID_HoaDon;
            END IF;
        END IF;
    END IF;
END;


-- Tong tien o Hoa Don = Tien mon an - Tien giam
CREATE OR REPLACE TRIGGER HD_Tongtien
AFTER INSERT OR UPDATE OF TienMonAn,TienGiam ON HoaDon
BEGIN
    UPDATE HoaDon SET Tongtien= TienMonAn - TienGiam;
END;


-- Khi cap nhat Code_Voucher o HoaDon, Tinh tien giam theo thong tin cua Voucher do va giam Diem tich luy cua KH
CREATE OR REPLACE TRIGGER HD_DoiVoucher
BEFORE UPDATE OF Code_Voucher ON HoaDon
FOR EACH ROW
DECLARE 
    TongtienLoaiMonAnduocgiam number(8,0);
    v_Diemdoi number;
    v_Phantram number;
    v_LoaiMA Voucher.LoaiMA%TYPE;
    
BEGIN
    IF(:new.Code_Voucher is not null) THEN
        SELECT Diem,Phantram,LoaiMA
        INTO v_Diemdoi,v_Phantram,v_LoaiMA
        FROM Voucher
        WHERE Code_Voucher=:new.Code_Voucher;
        
        KH_TruDTL(:new.ID_KH,v_diemdoi);
        Voucher_GiamSL(:new.Code_Voucher);
        
        IF(v_LoaiMA='All') THEN
            TongtienLoaiMonAnduocgiam := :new.TienMonAn;
        ELSE 
            SELECT SUM(Thanhtien)
            INTO TongtienLoaiMonAnduocgiam
            FROM CTHD 
            JOIN MonAn ON MonAn.ID_MonAn = CTHD.ID_MonAn
            WHERE ID_HoaDon = :new.ID_HoaDon AND LOAI = v_LoaiMA;
        END IF;
        
        :new.Tiengiam := ROUND(TongtienLoaiMonAnduocgiam*v_Phantram/100);
    ELSE
        :new.Tiengiam := 0;
    END IF;
END;

--Trigger Doanh so cua Khach hang bang tong tien cua tat ca hoa don co trang thai 'Da thanh toan' 
--cua khach hang do
-- Diem tich luy cua Khach hang duoc tinh bang 0.005% Tong tien cua hoa don (1.000.000d tuong duong 50 diem)
CREATE OR REPLACE TRIGGER KH_DoanhsovaDTL
AFTER UPDATE OF Trangthai ON HoaDon
FOR EACH ROW
BEGIN
    UPDATE KhachHang SET Doanhso = Doanhso + :new.Tongtien WHERE ID_KH=:new.ID_KH;
    UPDATE KhachHang SET Diemtichluy = Diemtichluy + ROUND(:new.Tongtien*0.00005) WHERE ID_KH=:new.ID_KH;
END;

--Trigger khi khach hang them hoa don moi, trang thai ban chuyen tu 'Con trong' sang 'Dang dung bua'
-- Khi trang thai don hang tro thanh 'Da thanh toan' trang thai ban chuyen tu 'Dang dung bua' sang 'Con trong'

CREATE OR REPLACE TRIGGER Tg_TrangthaiBan
AFTER INSERT OR UPDATE OF Trangthai ON HoaDon
BEGIN
    FOR cur IN (
        SELECT ID_Ban,Trangthai  
        FROM HoaDon
    )    
    LOOP
        IF(cur.Trangthai='Chua thanh toan') THEN 
            UPDATE Ban SET Trangthai='Dang dung bua' WHERE ID_Ban=cur.ID_Ban;
        ELSE 
            UPDATE Ban SET Trangthai='Con trong' WHERE ID_Ban=cur.ID_Ban;
        END IF;
    END LOOP; 
END;

--  Trigger Thanh tien o CTNK bang SoLuong x Dongia cua nguyen lieu do

CREATE OR REPLACE TRIGGER CTNK_Thanhtien
BEFORE INSERT OR UPDATE OF SoLuong ON CTNK
FOR EACH ROW
DECLARE 
    gia NguyenLieu.DonGia%TYPE;
BEGIN
    SELECT DonGia
    INTO gia
    FROM NguyenLieu
    WHERE NguyenLieu.ID_NL = :new.ID_NL;
    
    :new.ThanhTien := :new.SoLuong * gia;
    
END;

--Trigger Tong tien o PhieuNK bang tong thanh tien cua CTNK
CREATE OR REPLACE TRIGGER PNK_Tongtien
AFTER INSERT OR UPDATE OR DELETE ON CTNK
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE PhieuNK SET Tongtien = Tongtien + :new.ThanhTien WHERE PhieuNK.ID_NK = :new.ID_NK;
    END IF;
    
    IF UPDATING THEN    
        UPDATE PhieuNK SET Tongtien = Tongtien + :new.ThanhTien - :old.ThanhTien WHERE PhieuNK.ID_NK = :new.ID_NK;
    END IF;
    
    IF DELETING THEN    
        UPDATE PhieuNK SET Tongtien = Tongtien - :old.ThanhTien WHERE PhieuNK.ID_NK = :old.ID_NK;
    END IF;
END;

--Trigger khi them CTNK tang So luong ton cua nguyen lieu trong kho
CREATE OR REPLACE TRIGGER Kho_ThemSLTon
AFTER INSERT OR DELETE OR UPDATE OF SoLuong ON CTNK
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE Kho SET SLTon = SLTon + :new.SoLuong WHERE Kho.ID_NL = :new.ID_NL;
    END IF;
    
    IF UPDATING THEN    
        UPDATE Kho SET SLTon = SLTon + :new.SoLuong - :old.SoLuong WHERE Kho.ID_NL = :new.ID_NL;
    END IF;
    
    IF DELETING THEN    
        UPDATE Kho SET SLTon = SLTon - :old.SoLuong WHERE Kho.ID_NL = :old.ID_NL;
    END IF;
END;

--Trigger khi them CTXK giam So luong ton cua nguyen lieu trong kho
CREATE OR REPLACE TRIGGER Kho_GiamSLTon
AFTER INSERT OR DELETE OR UPDATE OF SoLuong ON CTXK
FOR EACH ROW
BEGIN
    IF INSERTING THEN    
        UPDATE Kho SET SLTon = SLTon - :new.SoLuong WHERE Kho.ID_NL = :new.ID_NL;
    END IF;
    
    IF UPDATING THEN    
        UPDATE Kho SET SLTon = SLTon - :new.SoLuong + :old.SoLuong WHERE Kho.ID_NL = :new.ID_NL;
    END IF;
    
    IF DELETING THEN    
        UPDATE Kho SET SLTon = SLTon + :old.SoLuong WHERE Kho.ID_NL = :old.ID_NL;
    END IF;
END;

--Trigger khi them mot Nguyen Lieu moi, them NL do vao Kho
CREATE OR REPLACE TRIGGER Kho_ThemNL
AFTER INSERT ON NguyenLieu
FOR EACH ROW
BEGIN
    INSERT INTO Kho(ID_NL) VALUES(:new.ID_NL);
END;


--Procedure
-- Procedure giam Diem tich luy cua KH khi doi Voucher

CREATE OR REPLACE PROCEDURE KH_TruDTL(ID KHACHHANG.ID_KH%TYPE,diemdoi NUMBER)
IS 
BEGIN 
    UPDATE KHACHHANG SET Diemtichluy = Diemtichluy - diemdoi WHERE ID_KH=ID;
END;

-- Procedure giam So Luong cua Voucher di 1 khi KH doi Voucher

CREATE OR REPLACE PROCEDURE Voucher_GiamSL(code Voucher.Code_Voucher%TYPE)
IS 
BEGIN 
    UPDATE Voucher SET SoLuong = SoLuong - 1 WHERE Code_Voucher=code;
END;

--Procedure khoi tao du lieu ban dau cho Kho
CREATE OR REPLACE PROCEDURE Kho_Khoitao
IS 
BEGIN 
    FOR cur IN (
        SELECT ID_NL 
        FROM NguyenLieu
    )    
    LOOP
        INSERT INTO Kho(ID_NL) VALUES (cur.ID_NL);
    END LOOP;
END;

--Fuction 
--Fuction Tinh tien mon an duoc giam khi them mot CTHD moi
CREATE OR REPLACE FUNCTION Tinhtiengiam (Tongtien number,Code Voucher.Code_Voucher%TYPE)
RETURN NUMBER
IS 
    Tiengiam number;
    v_Phantram number;
BEGIN
    SELECT Phantram
    INTO v_Phantram
    FROM Voucher
    WHERE Code_Voucher=Code;
    Tiengiam := ROUND(Tongtien*v_Phantram/100);
    RETURN Tiengiam;
END;
 
 

--Them data cho PhieuNK
ALTER SESSION SET NLS_DATE_FORMAT = 'dd-MM-YYYY';
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (100,102,'10-05-2023');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (101,102,'11-05-2023');
INSERT INTO PhieuNK(ID_NK,ID_NV,NgayNK) VALUES (102,102,'12-05-2023');

--Them data cho CTNK
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,100,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,101,20);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (100,102,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,101,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,103,20);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,104,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,105,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,106,20);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,107,5);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (101,108,5);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,109,10);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,110,20);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,112,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,113,15);
INSERT INTO CTNK(ID_NK,ID_NL,SoLuong) VALUES (102,114,15);

--Them data cho PhieuXK
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (100,102,'10-05-2023');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (101,102,'11-05-2023');
INSERT INTO PhieuXK(ID_XK,ID_NV,NgayXK) VALUES (102,102,'12-05-2023');
 
--Them data cho CTXK
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,100,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,101,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (100,102,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,101,7);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,103,10);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,104,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,105,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (101,106,10);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,109,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,110,5);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,112,10);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,113,8);
INSERT INTO CTXK(ID_XK,ID_NL,SoLuong) VALUES (102,114,5);


 
 