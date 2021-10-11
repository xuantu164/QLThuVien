CREATE DATABASE BTL_SQLServer_Nhom_2 --COLLATE Vietnamese_CI_AS
ON(
	Name = BTL_SQLServer_Nhom_2,
	FileName = 'D:\TAI LIEU HOC TAP\HE QUAN TRI CSDL (SQL)\BAI TAP LON\BTL_SQLServer_Nhom_2.mdf'
  )

USE BTL_SQLServer_Nhom_2;

--Bang Chuc Vu
CREATE TABLE tblChucVu(
	sMaCV varchar(10) NOT NULL PRIMARY KEY,
	sTenCV nvarchar(25),
	fHSL float
)

--Bang Nhan Vien
CREATE TABLE tblNhanVien(
	sMaNV varchar(10) NOT NULL PRIMARY KEY,
	sTenNV nvarchar(25),
	dNS datetime,
	sGioitinh nvarchar(3) CHECK (sGioitinh=N'Nam' or sGioitinh=N'Nu'),
	sMaCV varchar(10),
	sSdt_NV nvarchar(10),
	CONSTRAINT FK_MaCV FOREIGN KEY(sMaCV) REFERENCES tblChucVu(sMaCV)
)

--Bang Khach Hang
CREATE TABLE tblKhachHang(
	sMaKH varchar(10) NOT NULL PRIMARY KEY,
	sCMND nvarchar(25),
	sTenKH nvarchar(25),
	sNgaysinh datetime,
	sGioitinh nvarchar(3) CHECK (sGioitinh=N'Nam' or sGioitinh=N'Nu'),
	sSdt_KH nvarchar(10)
)

--Bang Loai Phong
CREATE TABLE tblLoaiPhong(
	sMaLP varchar(10) NOT NULL PRIMARY KEY,
	sTenLP nvarchar(25),
	iSonguoimax int,
	fGiaphong float
)

--Bang Phong
CREATE TABLE tblPhong(
	sMaP varchar(10) NOT NULL PRIMARY KEY,
	sSdt_P nvarchar(25),
	sTinhtrang nvarchar(3) CHECK (sTinhtrang = N'Con' or sTinhtrang = N'Het'),
	sMaLP varchar(10),
	CONSTRAINT FK_MaLP FOREIGN KEY(sMaLP) REFERENCES tblLoaiPhong(sMaLP)
)

--Bang Dich Vu
CREATE TABLE tblDichVu(
	sMaDV varchar(10) NOT NULL PRIMARY KEY,
	sTenDV nvarchar(25),
	fGiaDV float
)

--Bang Hoa Don
CREATE TABLE tblHoaDon(
	sMaHD varchar(10) NOT NULL PRIMARY KEY,
	iSonguoi int,
	dNgayden datetime,
	dNgayDKDI datetime, --Ngày đăng kí đi
	dNgaylap datetime,
	fTiendatcoc float,
	sMaNV varchar(10) NOT NULL,
	sMaKH varchar(10) NOT NULL,
	CONSTRAINT FK_MaNV FOREIGN KEY(sMaNV) REFERENCES tblNhanVien(sMaNV),
	CONSTRAINT FK_MaKH FOREIGN KEY(sMaKH) REFERENCES tblKhachHang(sMaKH),
)

--Bang Dich Vu Su Dung
CREATE TABLE tblDichVuSuDung(
	sMaHD varchar(10) NOT NULL,
	sMaDV varchar(10) NOT NULL,
	iSoluong int,
	CONSTRAINT FK_MaHD FOREIGN KEY(sMaHD) REFERENCES tblHoaDon(sMaHD),
	CONSTRAINT FK_MaDV FOREIGN KEY(sMaDV) REFERENCES tblDichVu(sMaDV)
)

--Set sMaHD la khoa chinh la khoa chinh tu bang tblHoaDon
ALTER TABLE tblDichVuSuDung
ADD CONSTRAINT FK_MaHDPrimary PRIMARY KEY(sMaHD,sMaDV)

--Bang CTHD
CREATE TABLE tblCTHD(
	sMaHD varchar(10) NOT NULL,
	sMaP varchar(10) NOT NULL,
	CONSTRAINT FK_MaHD_CTHD FOREIGN KEY(sMaHD) REFERENCES tblHoaDon(sMaHD),
	CONSTRAINT FK_MaP FOREIGN KEY(sMaP) REFERENCES tblPhong(sMaP)
)
--Set sMaHD la khoa chinh tu bang tblHoaDon
ALTER TABLE tblCTHD
ADD CONSTRAINT FK_MaHDPrimary_CTHD PRIMARY KEY(sMaHD,sMaP)

--Them 10 ban ghi vao tblChucVu
INSERT INTO tblChucVu(sMaCV,sTenCV,fHSL)
VALUES('CV1','Thu Ngan',5),
	  ('CV2','Ke Toan',3),
	  ('CV3','Bao Ve',3.5),
	  ('CV4','CSKH',4.5),
	  ('CV5','Ki Thuat',4),
	  ('CV6','Giam Doc',9),
	  ('CV7','Thu Quy',5),
	  ('CV8','Quan Doc',6),
	  ('CV9','Pho Giam Doc',8),
	  ('CV10','Truong Phong',7)

SELECT * FROM [dbo].[tblChucVu]

--Them 10 ban ghi vao tblNhanVien
INSERT INTO tblNhanVien(sMaNV,sTenNV,dNS,sGioitinh,sMaCV,sSdt_NV)
VALUES('NV1','Nguyen Van Hoang','1999/04/16','Nam','CV2','0982860164'),
	  ('NV2','Nguyen Thuy Duong','2002/01/01','Nu','CV3','0901012002'),
	  ('NV3','Hoang Bao An','2000/08/11','Nu','CV5','0962091604'),
	  ('NV4','Pham Tien Dat','1995/01/01','Nam','CV6','0935465845'),
	  ('NV5','Bui Dinh Dat','1998/05/25','Nam','CV7','0984654851'),
	  ('NV6','Le Huong Lan','1996/08/11','Nu','CV1','0945156354'),
	  ('NV7','Luu Phuong Anh','1999/10/06','Nu','CV9','0962512032'),
	  ('NV8','Doan Hai Nam','1996/02/20','Nam','CV10','0984251203'),
	  ('NV9','Dinh Cong Hai','1997/11/11','Nam','CV8','0985654212'),
	  ('NV10','Hoang Thao Quyen','1989/08/25','Nu','CV6','0975654215')

SELECT * FROM [dbo].[tblNhanVien]

--Them 10 ban ghi vao tblKhachHang
INSERT INTO tblKhachHang(sMaKH,sCMND,sTenKH,sNgaysinh,sGioitinh,sSdt_KH)
VALUES('KH1','123456789','Hoang Tung Phong','1995/02/05','Nam','0985456985'),
	  ('KH2','987654321','Pham Van Tien','1999/05/04','Nam','0975654254'),
	  ('KH3','678954321','Nguyen Thi Hanh','2000/06/20','Nu','0964254265'),
	  ('KH4','654845321','Nguyen Thuy Hanh','1998/05/24','Nu','0965254152'),
	  ('KH5','521000213','Bui Hoang Oanh','2000/04/29','Nu','0984654215'),
	  ('KH6','589789987','Nguyen Thuy Linh','1990/12/31','Nu','0965485658'),
	  ('KH7','654456546','Pham Tien Dat','1997/09/15','Nam','0984654254'),
	  ('KH8','666688888','Pham Xuan Tu','1999/04/16','Nam','0988886666'),
	  ('KH9','987456085','Phan Phuong Linh','1996/10/20','Nu','0974652102'),
	  ('KH10','963258741','Hoang Thuy Dung','2001/01/20','Nu','0966668888')

SELECT * FROM [dbo].[tblKhachHang]

--Them 10 ban ghi vao tblLoaiPhong
INSERT INTO tblLoaiPhong(sMaLP,sTenLP,iSonguoimax,fGiaphong)
VALUES('VIP','Cao Cap',2,5000),
	  ('Thuong','Phong Thuong','2','1200'),
	  ('Doi','Phong Doi','2','2000'),
	  ('Don','Phong Don','1','750'),
	  ('SV','Phong Sinh Vien','3','2500'),
	  ('TK','Phong Tiep Khach','5','4000'),
	  ('PAR','Phong PARTY','10','15000'),
	  ('FAM','Phong FAMILY','6','5500'),
	  ('BUS','Phong Doanh Nghiep','6','8000'),
	  ('NOR','Phong NORMAL','4','3500')

SELECT * FROM [dbo].[tblLoaiPhong]

--Them 10 ban ghi vao tblPhong
INSERT INTO tblPhong(sMaP,sSdt_P,sTinhtrang,sMaLP)
VALUES('PAR1','1111','Het','PAR'),
	  ('VIP4','4444','Con','VIP'),
	  ('B1','2244','Het','BUS'),
	  ('SV9','3300','Con','SV'),
	  ('NOR3','5555','Con','NOR'),
	  ('Don2','7777','Con','Don'),
	  ('P2','9999','Con','Doi'),
	  ('TK5','6666','Het','TK'),
	  ('P3','8844','Het','FAM'),
	  ('P4','1010','Con','Thuong')

SELECT * FROM [dbo].[tblPhong]

--Them 10 ban ghi vao tblDichVu
INSERT INTO tblDichVu(sMaDV,sTenDV,fGiaDV)
VALUES('DV1','MASS','500'),
	  ('DV2','KARAOKE','400'),
	  ('DV3','SPA','350'),
	  ('DV4','Do Uong','100'),
	  ('DV5','Do An','250'),
	  ('DV6','Xong Hoi','200'),
	  ('DV7','Tam','150'),
	  ('DV8','Gui Xe','20'),
	  ('DV9','Phuc Vu Tan Noi','55'),
	  ('DV10','Nghi Duong','1000')

SELECT * FROM [dbo].[tblDichVu]

--Them 10 ban ghi vao tblHoaDon
INSERT INTO tblHoaDon(sMaHD,iSonguoi,dNgayden,dNgayDKDI,dNgaylap,fTiendatcoc,sMaNV,sMaKH)
VALUES('HD1','2','2019/03/24','2019/03/29','2019/03/24','5000','NV6','KH2'),
	  ('HD2','5','2019/01/04','2019/01/10','2019/01/04','2000','NV3','KH1'),
	  ('HD3','6','2018/04/04','2018/04/10','2018/04/04','1500','NV6','KH6'),
	  ('HD4','3','2017/11/11','2017/11/16','2017/11/11','2500','NV4','KH4'),
	  ('HD5','4','2017/05/15','2017/05/20','2017/05/15','1000','NV7','KH10'),
	  ('HD6','2','2016/06/02','2016/06/05','2016/06/02','3000','NV8','KH9'),
	  ('HD7','4','2019/04/24','2019/04/29','2019/04/24','4000','NV10','KH2'),
	  ('HD8','2','2019/04/04','2019/04/10','2019/04/04','4500','NV1','KH6'),
	  ('HD9','2','2015/05/25','2015/05/27','2015/05/25','1000','NV3','KH4'),
	  ('HD10','2','2018/09/09','2018/09/13','2018/09/09','2000','NV2','KH5')

SELECT * FROM [dbo].[tblHoaDon]

--Them 10 ban ghi vao tblDVSD
INSERT INTO tblDichVuSuDung(sMaHD,sMaDV,iSoluong)
VALUES('HD1','DV3',1),
	  ('HD1','DV2',2),
	  ('HD4','DV5',1),
	  ('HD10','DV4',3),
	  ('HD3','DV5',4),
	  ('HD2','DV8',2),
	  ('HD8','DV6',3),
	  ('HD3','DV7',1),
	  ('HD9','DV5',1),
	  ('HD1','DV4',1)

SELECT * FROM [dbo].[tblDichVuSuDung]

--Them 10 ban ghi vao tblCTHD
INSERT INTO tblCTHD(sMaHD,sMaP)
VALUES('HD1','B1'),
	  ('HD3','Don2'),
	  ('HD2','NOR3'),
	  ('HD4','P2'),
	  ('HD1','P4'),
	  ('HD5','SV9'),
	  ('HD7','VIP4'),
	  ('HD2','B1'),
	  ('HD9','VIP4'),
	  ('HD10','NOR3')

SELECT * FROM [dbo].[tblCTHD]

--------------------------------------------Tạo 10 View lấy thông tin từ 1 bảng hoặc nhiều bảng
--1. Tạo View lấy danh sách khách hàng nam
CREATE VIEW vwKHNam
AS
	SELECT *
	FROM tblKhachHang
	WHERE sGioitinh = 'Nam'

SELECT * FROM [dbo].[vwKHNam]

--2. Tạo View lấy danh sách nhân viên trên 18 tuổi
CREATE VIEW vwDSNVTren18Tuoi
AS
	SELECT * ,(Year(getdate()) - Year(dNS)) AS Tuoi
	FROM tblNhanVien
	WHERE Year(getdate()) - Year(dNS) > 18

SELECT * FROM [dbo].[vwDSNVTren18Tuoi]

--3. Tạo View lấy danh sách nhân viên có mã chức vụ là 'CV6'
CREATE VIEW vwDSNVMaCV
AS
	SELECT sMaNV,sTenNV,tblChucVu.sMaCV
	FROM tblNhanVien,tblChucVu
	WHERE tblNhanVien.sMaCV = tblChucVu.sMaCV AND tblChucVu.sMaCV = 'CV6'

SELECT * FROM [dbo].[vwDSNVMaCV]

--4. Tạo view lấy ra nhân viên lớn tuổi nhất
CREATE VIEW vwNVTuoiMax
AS
	SELECT TOP 1 sMaNV, sTenNV, MAX(Year(getdate()) - Year(dNS)) AS TuoiMax
	FROM tblNhanVien
	GROUP BY sMaNV, sTenNV
	ORDER BY TuoiMax DESC

SELECT * FROM [dbo].[vwNVTuoiMax]

--5. Tạo view cho biết tổng số khách hàng nữ và nam
CREATE VIEW vwTongKHNamNu
AS
	SELECT sGioitinh, count(sGioitinh) AS TongSo
	FROM tblKhachHang
	GROUP BY sGioitinh

SELECT * FROM [dbo].[vwTongKHNamNu]

--6. Tạo view cho biết danh sách khách hàng đã đặt phòng năm 2019
CREATE VIEW vwDSKH_DatPhong2019
AS
	SELECT tblKhachHang.sMaKH,sTenKH
	FROM tblKhachHang,tblHoaDon
	WHERE tblKhachHang.sMaKH = tblHoaDon.sMaKH AND YEAR(dNgayden) = '2019'

SELECT * FROM [dbo].[vwDSKH_DatPhong2019]

--7. Tạo view cho biết danh sách phòng chưa có khách thuê
CREATE VIEW vwDSPhong_Con
AS
	SELECT sMaP,tblLoaiPhong.sMaLP,sTenLP,sTinhtrang
	FROM tblPhong, tblLoaiPhong
	WHERE tblPhong.sMaLP = tblLoaiPhong.sMaLP AND sTinhtrang = 'Con'

SELECT * FROM [dbo].[vwDSPhong_Con]

--8. Tạo view cho biết danh sách khách hàng nam đã đặt phòng
CREATE VIEW vwDSKHNam_Datphong
AS
	SELECT tblKhachHang.sMaKH,sTenKH,sGioitinh,sMaHD
	FROM tblKhachHang,tblHoaDon
	WHERE tblKhachHang.sMaKH = tblHoaDon.sMaKH AND sGioitinh = 'Nam'

SELECT * FROM [dbo].[vwDSKHNam_Datphong]

--9. Tạo view cho biết danh sách nhân viên đã làm việc(thực hiện lập hóa đơn)
CREATE VIEW vwDSNV_LapHD
AS
	SELECT tblNhanVien.sMaNV,sTenNV,sMaHD
	FROM tblNhanVien,tblHoaDon
	WHERE tblNhanVien.sMaNV = tblHoaDon.sMaNV

SELECT * FROM [dbo].[vwDSNV_LapHD]

--10. Tạo view cho biết danh sách dịch vụ sử dụng của từng phòng
CREATE VIEW vwDSDV_Phong
AS
	SELECT tblPhong.sMaP,tblLoaiPhong.sMaLP,sTenLP,tblDichVu.sMaDV,sTenDV
	FROM tblPhong,tblCTHD,tblDichVuSuDung,tblLoaiPhong,tblDichVu
	WHERE tblPhong.sMaP = tblCTHD.sMaP AND tblDichVuSuDung.sMaHD = tblCTHD.sMaHD AND tblPhong.sMaLP = tblLoaiPhong.sMaLP
	AND tblDichVu.sMaDV = tblDichVuSuDung.sMaDV

SELECT * FROM [dbo].[vwDSDV_Phong]

--------------------------------------------Hết tạo 10 View lấy thông tin từ 1 bảng hoặc nhiều bảng


--------------------------------------------Tạo 5 View tính toán từ 1 bảng hoặc nhiều bảng
--1. Tạo view cho biết số tiền dịch vụ mà mỗi lần khách hàng sử dụng
CREATE VIEW vwTienDV_KH
AS 
	SELECT tblKhachHang.sMaKH,sTenKH,iSoluong*fGiaDV AS TONG
	FROM tblKhachHang,tblDichVuSuDung,tblDichVu,tblHoaDon
	WHERE tblDichVu.sMaDV = tblDichVuSuDung.sMaDV and tblKhachHang.sMaKH = tblHoaDon.sMaKH and tblHoaDon.sMaHD = tblDichVuSuDung.sMaHD

SELECT * FROM [dbo].[vwTienDV_KH]

--2. Tạp view cho biết số tiền thuê phòng mà khách hàng phải trả mỗi lần thuê phòng
CREATE VIEW vwTienThuePhong
AS
	SELECT tblKhachHang.sMaKH,sTenKH,tblPhong.sMaP,tblLoaiPhong.sMaLP, (DAY(dNgayDKDI) - DAY(dNgayden)) * fGiaphong AS TongTienPhong
	FROM tblHoaDon,tblLoaiPhong,tblPhong,tblCTHD,tblKhachHang
	WHERE tblCTHD.sMaP = tblPhong.sMaP AND tblHoaDon.sMaHD = tblCTHD.sMaHD AND tblLoaiPhong.sMaLP = tblPhong.sMaLP
	AND tblKhachHang.sMaKH = tblHoaDon.sMaKH

SELECT * FROM [dbo].[vwTienThuePhong]

--3. Tạo view cho biết tổng tiền phòng của từng khách hàng Nam
CREATE VIEW vwTienThuePhong_KHNam
AS
	SELECT tblKhachHang.sMaKH,sTenKH,sGioitinh,tblPhong.sMaP,tblLoaiPhong.sMaLP, (DAY(dNgayDKDI) - DAY(dNgayden)) * fGiaphong AS TongTienPhong
	FROM tblHoaDon,tblLoaiPhong,tblPhong,tblCTHD,tblKhachHang
	WHERE tblCTHD.sMaP = tblPhong.sMaP AND tblHoaDon.sMaHD = tblCTHD.sMaHD AND tblLoaiPhong.sMaLP = tblPhong.sMaLP
	AND tblKhachHang.sMaKH = tblHoaDon.sMaKH AND sGioitinh = 'Nam'

SELECT * FROM [dbo].[vwTienThuePhong_KHNam]

--4. Tạo view cho biết tổng tiền phòng của từng khách hàng Nữ
CREATE VIEW vwTienThuePhong_KHNu
AS
	SELECT tblKhachHang.sMaKH,sTenKH,sGioitinh,tblPhong.sMaP,tblLoaiPhong.sMaLP, (DAY(dNgayDKDI) - DAY(dNgayden)) * fGiaphong AS TongTienPhong
	FROM tblHoaDon,tblLoaiPhong,tblPhong,tblCTHD,tblKhachHang
	WHERE tblCTHD.sMaP = tblPhong.sMaP AND tblHoaDon.sMaHD = tblCTHD.sMaHD AND tblLoaiPhong.sMaLP = tblPhong.sMaLP
	AND tblKhachHang.sMaKH = tblHoaDon.sMaKH AND sGioitinh = 'Nu'

SELECT * FROM [dbo].[vwTienThuePhong_KHNu]

--5. Tạo view cho biết số tiền dịch vụ mà mỗi lần khách hàng Nam sử dụng
CREATE VIEW vwTienDV_KHNam
AS 
	SELECT tblKhachHang.sMaKH,sTenKH,sGioitinh,iSoluong*fGiaDV AS TONG
	FROM tblKhachHang,tblDichVuSuDung,tblDichVu,tblHoaDon
	WHERE tblDichVu.sMaDV = tblDichVuSuDung.sMaDV and tblKhachHang.sMaKH = tblHoaDon.sMaKH and tblHoaDon.sMaHD = tblDichVuSuDung.sMaHD
	AND sGioitinh = 'Nam'

SELECT * FROM [dbo].[vwTienDV_KHNam]
--------------------------------------------Hết tạo 5 View tính toán từ 1 bảng hoặc nhiều bảng


--------------------------------------------Tạo 8 Procedure lấy thông tin từ 1 bảng hoặc nhiều bảng
--1. Tạo procedure tham số truyền vào là tháng và năm cho biết danh sách khách hàng thuê phòng trong tháng đó
CREATE PROC prDSKH_ThuePhong_TheoThangNam(@Thang int, @Nam int)
AS
BEGIN
	SELECT tblKhachHang.sMaKH,sTenKH,tblPhong.sMaP,dNgaylap
	FROM tblKhachHang,tblPhong,tblCTHD,tblHoaDon
	WHERE tblPhong.sMaP = tblCTHD.sMaP AND tblHoaDon.sMaKH = tblKhachHang.sMaKH AND  tblCTHD.sMaHD = tblHoaDon.sMaHD
	AND MONTH(dNgaylap) = @Thang AND YEAR(dNgaylap) = @Nam
	GROUP BY tblKhachHang.sMaKH,sTenKH,tblPhong.sMaP,dNgaylap
END

EXEC prDSKH_ThuePhong_TheoThangNam '3', '2019'

--2. Tạo procedure tham số truyền vào là ngày, giới tính, cho biết danh sách khách hàng thuê phòng trong ngày và theo giới tính đó
CREATE PROC prDSKH_ThuePhong_TheoThang_TheoGT(@Ngay int, @Gioitinh nvarchar(3))
AS
BEGIN
	SELECT tblKhachHang.sMaKH,sTenKH,sGioitinh,tblPhong.sMaP,dNgaylap
	FROM tblKhachHang,tblPhong,tblCTHD,tblHoaDon
	WHERE tblPhong.sMaP = tblCTHD.sMaP AND tblHoaDon.sMaKH = tblKhachHang.sMaKH AND tblCTHD.sMaHD = tblHoaDon.sMaHD
	AND DAY(dNgaylap) = @Ngay AND sGioitinh = @Gioitinh
	GROUP BY tblKhachHang.sMaKH,sTenKH,sGioitinh,tblPhong.sMaP,dNgaylap
END

EXEC prDSKH_ThuePhong_TheoThang_TheoGT '04','Nam'

--3. Tạo procedure tham số truyền vào là mã khách hàng, hiện ra tổng tiền phòng mà khách hàng đó phải trả
CREATE PROC prKH_TienPhong(@MaKH varchar(10))
AS
BEGIN
	SELECT tblKhachHang.sMaKH,tblKhachHang.sTenKH,TongTienPhong
	FROM tblKhachHang,vwTienThuePhong,vwTienDV_KH
	WHERE tblKhachHang.sMaKH = vwTienThuePhong.sMaKH AND vwTienDV_KH.sMaKH = tblKhachHang.sMaKH AND tblKhachHang.sMaKH = @MaKH
	GROUP BY tblKhachHang.sMaKH,tblKhachHang.sTenKH,TongTienPhong
END 

EXEC prKH_TienPhong 'KH1'

--4. Tạo procedure tham số truyền vào là giới tính, hiện ra danh sách khách hàng đã thuê phòng theo giới tính này
CREATE PROC prKH_ThuePhong_GT(@Gioitinh nvarchar(3))
AS
BEGIN
	SELECT tblKhachHang.sMaKH,sTenKH,sGioitinh,tblPhong.sMaP
	FROM tblCTHD,tblHoaDon,tblKhachHang,tblPhong
	WHERE tblKhachHang.sMaKH = tblHoaDon.sMaKH AND tblPhong.sMaP = tblCTHD.sMaP AND tblHoaDon.sMaHD = tblCTHD.sMaHD
	AND sGioitinh = @Gioitinh
END

EXEC prKH_ThuePhong_GT 'Nam'

--5. Tạo procedure tham số truyền vào là số bất kì, hiện ra danh sách khách hàng có tuổi lớn hơn số này
CREATE PROC prDSKH_Tuoi(@Tuoi int)
AS
BEGIN
	SELECT *,YEAR(GETDATE()) - YEAR(sNgaysinh) AS Tuoi
	FROM tblKhachHang
	WHERE @Tuoi < YEAR(GETDATE()) - YEAR(sNgaysinh)
END

EXEC prDSKH_Tuoi '22'

--6. Tạo procudure tham số truyền vào là năm sinh, hiện ra danh sách khách hàng Nam có năm sinh lớn hơn năm sinh truyền vào
CREATE PROC prDSKH_NamSinh(@Nam int,@Gioitinh nvarchar(3))
AS
BEGIN
	SELECT *
	FROM tblKhachHang
	WHERE @Nam < YEAR(sNgaysinh) AND sGioitinh = @Gioitinh
END

EXEC prDSKH_NamSinh '1998', 'Nam'

--7. Tạo procedure tham số truyền vào là năm, hiện ra danh sách khách hàng không đặt phòng trong năm đó
CREATE PROC prDSKH_KhongDatPhong_Nam(@Nam int)
AS
BEGIN
SELECT tblKhachHang.sMaKH,sTenKH,dNgaylap
FROM tblKhachHang,tblHoaDon
WHERE tblKhachHang.sMaKH = tblHoaDon.sMaKH
AND tblKhachHang.sMaKH NOT IN (SELECT tblKhachHang.sMaKH
							   FROM tblPhong,tblKhachHang,tblHoaDon,tblCTHD
							   WHERE tblPhong.sMaP = tblCTHD.sMaP AND tblCTHD.sMaHD = tblHoaDon.sMaHD
							   AND tblKhachHang.sMaKH = tblHoaDon.sMaKH AND YEAR(dNgaylap) = @Nam)
END

EXEC prDSKH_KhongDatPhong_Nam '2019'

--8. Tạo procedure tham số truyền vào là năm, hiện ra danh sách khách hàng đặt phòng trong năm đó
CREATE PROC prDSKH_DatPhong_Nam(@Nam int)
AS
BEGIN
	SELECT tblKhachHang.sMaKH,sTenKH,dNgaylap
	FROM tblPhong,tblKhachHang,tblHoaDon,tblCTHD
	WHERE tblPhong.sMaP = tblCTHD.sMaP AND tblCTHD.sMaHD = tblHoaDon.sMaHD
	AND tblKhachHang.sMaKH = tblHoaDon.sMaKH AND YEAR(dNgaylap) = @Nam
END

EXEC prDSKH_DatPhong_Nam '2019'
--------------------------------------------Hết tạo 8 Procedure lấy thông tin từ 1 bảng hoặc nhiều bảng


--------------------------------------------Tạo 6 Procedure tính toán từ 1 bảng hoặc nhiều bảng
--1. Tạo procedure tham số truyền vào là mã loại phòng, thực hiện tăng giá phòng tương ứng lên thêm 2000
CREATE PROC prTangGiaPhong_MaLP(@MaLP varchar(10))
AS
BEGIN
	UPDATE tblLoaiPhong
	SET fGiaphong = fGiaphong + 2000
	WHERE sMaLP = @MaLP
END

EXEC prTangGiaPhong_MaLP 'BUS'

--2. Tạo procedure tham số truyền vào là mã khách hàng, cho biết trung bình cộng số tiền phòng mà khách hàng đó phải trả 
CREATE PROC prTBC_TienPhong(@MaKH varchar(10))
AS
BEGIN
	SELECT tblKhachHang.sMaKH,sTenKH, AVG((DAY(dNgayDKDI) - DAY(dNgayden)) * fGiaphong) AS TBCTienPhong
	FROM tblHoaDon,tblLoaiPhong,tblPhong,tblCTHD,tblKhachHang
	WHERE tblCTHD.sMaP = tblPhong.sMaP AND tblHoaDon.sMaHD = tblCTHD.sMaHD AND tblLoaiPhong.sMaLP = tblPhong.sMaLP
	AND tblKhachHang.sMaKH = tblHoaDon.sMaKH AND tblKhachHang.sMaKH = @MaKH
	GROUP BY tblKhachHang.sMaKH,sTenKH
END

EXEC prTBC_TienPhong 'KH1'

--3. Tạo procedure tham số truyền vào là mã khách hàng, cho biết trung bình cộng số tiền dịch vụ mà mỗi khách hàng sử dụng
CREATE PROC prTBC_TienDV(@MaKH varchar(10))
AS
BEGIN
	SELECT tblKhachHang.sMaKH,sTenKH,AVG(iSoluong*fGiaDV) AS TBCTienDv
	FROM tblKhachHang,tblDichVuSuDung,tblDichVu,tblHoaDon
	WHERE tblDichVu.sMaDV = tblDichVuSuDung.sMaDV and tblKhachHang.sMaKH = tblHoaDon.sMaKH and tblHoaDon.sMaHD = tblDichVuSuDung.sMaHD
	AND tblKhachHang.sMaKH = @MaKH
	GROUP BY tblKhachHang.sMaKH,sTenKH
END

EXEC prTBC_TienDV 'KH1'

--4. Tạo procedure tham số truyền vào giới tính, cho biết trung bình cộng số tiền phòng mà khách hàng theo giới tính đó phải trả
CREATE PROC prTBC_TienPhong_GT(@Gioitinh nvarchar(3))
AS
BEGIN
	SELECT tblKhachHang.sMaKH,sTenKH,sGioitinh, AVG((DAY(dNgayDKDI) - DAY(dNgayden)) * fGiaphong) AS TBCTienPhong
	FROM tblHoaDon,tblLoaiPhong,tblPhong,tblCTHD,tblKhachHang
	WHERE tblCTHD.sMaP = tblPhong.sMaP AND tblHoaDon.sMaHD = tblCTHD.sMaHD AND tblLoaiPhong.sMaLP = tblPhong.sMaLP
	AND tblKhachHang.sMaKH = tblHoaDon.sMaKH AND sGioitinh = @Gioitinh
	GROUP BY tblKhachHang.sMaKH,sTenKH,sGioitinh
END

EXEC prTBC_TienPhong_GT 'Nu'

--5. Tạo procedure tham số truyền vào là tên dịch vụ, thống kê số phòng sử dụng dịch vụ đó
CREATE PROC prDemPhong_SDDV(@TenDV nvarchar(25))
AS
BEGIN
	SELECT tblDichVu.sMaDV,sTenDV, COUNT(sMaP) AS SoPhongSuDung
	FROM tblDichVu,tblCTHD,tblDichVuSuDung
	WHERE tblCTHD.sMaHD = tblDichVuSuDung.sMaHD AND tblDichVu.sMaDV = tblDichVuSuDung.sMaDV AND sTenDV = @TenDV
	GROUP BY tblDichVu.sMaDV,sTenDV
END

EXEC prDemPhong_SDDV 'Do Uong'

--6. Tạo procedure tham số truyền vào mà mã dịch vụ, thực hiện giảm giá 10% cho khách hàng nào sử dụng dịch vụ đó
CREATE PROC prGiamgiaDV(@TenDV nvarchar(25))
AS
BEGIN
	UPDATE tblDichVu
	SET fGiaDV = fGiaDV - ((fGiaDV*10)/100)
	FROM tblDichVu
	WHERE sTenDV = @TenDV
END

EXEC prGiamgiaDV 'Nghi Duong'

SELECT * FROM [dbo].[tblCTHD]
SELECT * FROM [dbo].[tblDichVu]
SELECT * FROM [dbo].[tblDichVuSuDung]
--------------------------------------------Hết tạo 6 Procedure tính toán từ 1 bảng hoặc nhiều bảng


--------------------------------------------Tạo 5 Trigger cơ bản từ 1 bảng hoặc nhiều bảng
--1. Tạo trigger kiểm tra tuổi của nhân viên
CREATE TRIGGER trTuoiNV
ON tblNhanVien
FOR INSERT,UPDATE
AS
BEGIN
	DECLARE @Tuoi int
	SELECT @Tuoi = YEAR(GETDATE())-YEAR(dNS) FROM INSERTED
	IF (@Tuoi < 18)
		BEGIN
			RAISERROR('Nhân viên chưa đủ tuổi đi làm',16,10)
			ROLLBACK TRAN
		END
	ELSE
		PRINT N'Nhân viên đã đủ tuổi đi làm'
END

INSERT INTO tblNhanVien(sMaNV,sTenNV,dNS,sGioitinh,sMaCV,sSdt_NV)
VALUES('NV11','NEW1','2019/06/28','Nam','CV3','0990')

DELETE FROM tblNhanVien
WHERE sMaNV = 'NV11'

SELECT * FROM [dbo].[tblNhanVien]

--2.Tạo trigger kiểm soát giới tính của nhân viên chỉ là nam hoặc nữ
CREATE TRIGGER trGT
ON tblNhanVien
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @GT nvarchar(3)
	SELECT @GT = sGioitinh FROM INSERTED
	IF (@GT NOT IN (N'Nam',N'Nu'))
		BEGIN
			RAISERROR('Giới tính phải là Nam hoặc Nữ',16,10)
			ROLLBACK TRAN
		END
	ELSE
		PRINT(N'Thêm nhân viên thành công')
END

INSERT INTO tblNhanVien(sMaNV,sTenNV,dNS,sGioitinh,sMaCV,sSdt_NV)
VALUES('NV12','NEW2','1999/06/28','Na','CV3','0990')

SELECT * FROM [dbo].[tblNhanVien]

--3. Tạo trigger kiểm tra sự chính xác của số điện thoại
CREATE TRIGGER trKiemTraSDT
ON tblNhanVien
FOR INSERT,UPDATE
AS
BEGIN
	DECLARE @SDT varchar(11)
	SELECT @SDT = sSdt_NV FROM INSERTED
	IF(LEN(@SDT) > 11 OR LEN(@SDT) < 10 or left(@SDT,1) != 0)
		BEGIN
			PRINT LEN(@SDT)
			PRINT N'Số điện thoại phải bắt đầu bằng 0, độ dài 9 - 11 và chỉ chứa các số 0 - 9'
			ROLLBACK TRAN
		END
	ELSE
		PRINT N'Nhập thành công'
END

INSERT INTO tblNhanVien(sMaNV,sTenNV,dNS,sGioitinh,sMaCV,sSdt_NV)
VALUES('NV13','NEW3','1999/06/28','Nam','CV3','0990')

SELECT * FROM [dbo].[tblNhanVien]

DELETE FROM tblNhanVien
WHERE sMaNV = 'NV11'

--4. Tạo trigger kiểm soát ngày DKDi phải lớn hơn ngày đến
CREATE TRIGGER trKiemSoatNgay
ON tblHoaDon
FOR UPDATE,INSERT
AS
BEGIN
	IF UPDATE (dNgayden) OR UPDATE (dNgayDKDI)
		BEGIN
			DECLARE @NgayDen DATE, @NgayDi DATE
			SELECT @NgayDen = dNgayden FROM INSERTED
			SELECT @NgayDi = dNgayDKDI FROM INSERTED
			IF (@NgayDen > @NgayDi)
				BEGIN
					PRINT N'Ngày dự kiến đi phải lớn hơn ngày đến'
					ROLLBACK TRAN
				END
			ELSE
				PRINT N'Nhập thành công'
		END
END

INSERT INTO tblHoaDon(sMaHD,iSonguoi,dNgayden,dNgayDKDI,dNgaylap,fTiendatcoc,sMaNV,sMaKH)
VALUES('HD11','11','2019/06/20','2019/06/19','2019/06/18','11000','NV1','KH1')

SELECT * FROM [dbo].[tblHoaDon]

--5. Tạo trigger kiếm soát lập phòng
CREATE TRIGGER trLapPhong
ON tblPhong
INSTEAD OF INSERT, UPDATE
AS
BEGIN
	IF UPDATE (sMaLP)
		DECLARE @MaLP VARCHAR(10)
		SELECT @MaLP = sMaLP FROM INSERTED
		IF NOT EXISTS (SELECT sTenLP FROM tblPhong 
			INNER JOIN tblLoaiPhong ON tblLoaiPhong.sMaLP = tblPhong.sMaLP
			WHERE tblLoaiPhong.sMaLP = @MaLP )
				BEGIN
					PRINT N'Không có loại phòng này'
					ROLLBACK TRAN
				END
		ELSE
			PRINT N'Nhập thành công!!!'
END

INSERT INTO tblPhong
VALUES('P1','1234','Het','TEST')
--------------------------------------------Hết tạo 5 Trigger cơ bản từ 1 bảng hoặc nhiều bảng


--------------------------------------------Tạo 3 Trigger tổng hợp từ 1 bảng hoặc nhiều bảng
--1. Tạo trigger không cho phép thay đổi giá dịch vụ
CREATE TRIGGER trDonGiaDV
ON tblDichVu
FOR UPDATE
AS
BEGIN
	IF UPDATE(fGiaDV)
	BEGIN
		PRINT N'Không thể thay đổi giá dịch vụ !'
	    ROLLBACK TRANSACTION
	END
END

UPDATE tblDichVu SET fGiaDV = 250000 WHERE sMaDV = 'DV1'

--2. Tạo trigger không cho phép thay đổi giá phòng
CREATE TRIGGER trGiaPhong
ON tblLoaiPhong
FOR UPDATE
AS
BEGIN
	IF UPDATE(fGiaphong)
	BEGIN
		PRINT N'Không thể thay đổi giá phòng !'
	    ROLLBACK TRANSACTION
	END
END

UPDATE tblLoaiPhong SET fGiaphong = 250000 WHERE sMaLP = 'BUS'

--3. Tạo trigger không cho phép thay đổi số người tối đa của 1 phòng nào đó:
CREATE TRIGGER trSoNguoiMax
ON tblLoaiPhong
FOR UPDATE
AS
BEGIN
	IF UPDATE(iSonguoimax)
	BEGIN
		PRINT N'Không thể thay đổi số người tối đa cho các loại phòng !'
	    ROLLBACK TRAN
	END
END

UPDATE tblLoaiPhong SET iSonguoimax = 250000 WHERE sMaLP = 'FAM'
--------------------------------------------Hết tạo 3 Trigger tổng hợp từ 1 bảng hoặc nhiều bảng


--------------------------------------------Tạo người dùng tương ứng cho các thành viên trong nhóm
--1. Tạo người dùng cho Phạm Xuân Tú
CREATE LOGIN xuantu WITH PASSWORD = '123456'

	--Tạo user
	CREATE USER pxt FOR LOGIN xuantu
	--Cấp quyền INSERT, UPDATE, DELETE cho user pxt
	GRANT INSERT, UPDATE, DELETE
	TO pxt

--2. Tạo người dùng cho Đoàn Ngô Hiếu
CREATE LOGIN ngohieu WITH PASSWORD = '123456'

	--Tạo user
	CREATE USER dnh FOR LOGIN ngohieu
	--Cấp quyền INSERT vào bảng tblKhachHang, tblNhanVien cho user dnh
	GRANT INSERT
	ON tblKhachHang
	TO dnh

	GRANT INSERT
	ON tblNhanVien
	TO dnh

--3. Tạo người dùng cho Nguyễn Thị Hương
CREATE LOGIN nguyenhuong WITH PASSWORD = '123456'

	--Tạo user
	CREATE USER nth FOR LOGIN nguyenhuong
	--Cấp quyền exec thủ tục cho user nth
	GRANT EXECUTE ON prDemPhong_SDDV TO nth
	GRANT EXECUTE ON prDSKH_NamSinh TO nth
	GRANT EXECUTE ON dbo.prGiamgiaDV TO nth

--4. Tạo người dùng cho Vi Thị Khánh Huyền
CREATE LOGIN khanhhuyen WITH PASSWORD = '123456'

	--Tạo user
	CREATE USER vtkh FOR LOGIN khanhhuyen
	--Cấp quyền chỉ xem cho cho user vtkh
	GRANT SELECT
	TO vtkh
--------------------------------------------Hết tạo người dùng tương ứng cho các thành viên trong nhóm


----------------------------------------------------------Phân tán CSDL
--Tạo 1 linkserver kết nối từ máy chủ sang máy ảo có tên 'MAY1'
EXEC sp_addlinkedserver
@server = 'MAY1',
@srvproduct = 'SQLServer',
@provider= N'SQLOLEDB',
@datasrc = '192.168.72.132';

-- Kiểm tra kết nối 
exec sp_linkedservers

-- Đăng nhập kết nối
EXEC master.dbo.sp_addlinkedsrvlogin
@rmtsrvname= 'MAY1',
@useself=N'False',
@locallogin=NULL,
@rmtuser=N'sa', 
@rmtpassword='xuantu164'

--Tạo 1 linkserver kết nối từ máy chủ sang máy ảo có tên 'MAY2'
EXEC sp_addlinkedserver
@server = 'MAY2',
@srvproduct = 'SQLServer',
@provider= N'SQLOLEDB',
@datasrc = '192.168.52.129';

-- Kiểm tra kết nối 
exec sp_linkedservers

-- Đăng nhập kết nối
EXEC master.dbo.sp_addlinkedsrvlogin
@rmtsrvname= 'MAY2',
@useself=N'False',
@locallogin=NULL,
@rmtuser=N'sa', 
@rmtpassword='xuantu164'

--Thủ tục thêm mới dịch vụ, phân tán ngang bảng tblDichVu
CREATE PROC prInsertDV(@MaDV varchar(10), @TenDV nvarchar(25), @GiaDV float)
AS
BEGIN
	IF EXISTS (SELECT * FROM tblDichVu WHERE sMaDV = @MaDV)
		BEGIN
			PRINT N'Tồn tại mã dịch vụ: ' + @MaDV
		END
	ELSE
		IF(@GiaDV > 1000)
			BEGIN
				/*INSERT INTO tblDichVu(sMaDV,sTenDV,fGiaDV)
				VALUES(@MaDV, @TenDV, @GiaDV)*/
				
				INSERT INTO MAY1.BTL_SQLServer_Nhom_2.dbo.tblDichVu(sMaDV,sTenDV,fGiaDV)
				VALUES(@MaDV, @TenDV, @GiaDV)
				PRINT N'Đã thêm vào máy 1 thành công dịch vụ mã: ' +@MaDV
			END
		ELSE
			BEGIN
				INSERT INTO tblDichVu(sMaDV,sTenDV,fGiaDV)
				VALUES(@MaDV, @TenDV, @GiaDV)
				
				/*INSERT INTO MAY2.BTL_SQLServer_Nhom_2.dbo.tblDichVu(sMaDV,sTenDV,fGiaDV)
				VALUES(@MaDV, @TenDV, @GiaDV)
				PRINT N'Đã thêm vào máy 2 thành công dịch vụ mã: ' +@MaDV*/
			END
END

SELECT *
FROM [MAY1].[BTL_SQLServer_Nhom_2].[dbo].[tblDichVu]

EXEC prInsertDV 'DV11',N'Hí','1500'
EXEC prInsertDV 'DV12','Ca Nhac','500'
EXEC prInsertDV 'DV13','Do An','200'
EXEC prInsertDV 'DV14','Do Uong','1100'


DELETE FROM tblDichVu
WHERE sMaDV = 'DV11'
SELECT * FROM dbo.tblDichVu

--Thủ tục thêm mới khách hàng, phân tán dọc bảng tblKhachHang
CREATE PROC prInsertKH(@MaKH varchar(10), @CMND nvarchar(25), @TenKH nvarchar(25), @Ngaysinh datetime,
@Gioitinh varchar(3),@Sdt_KH nvarchar(10))
AS
BEGIN
	IF EXISTS (SELECT * FROM tblKhachHang WHERE sMaKH = @MaKH)
		BEGIN
			PRINT N'Tồn tại mã khách hàng: ' + @MaKH
		END
	ELSE
		BEGIN
			INSERT INTO tblKhachHang(sMaKH,sTenKH,sCMND,sNgaysinh,sGioitinh,sSdt_KH)
			VALUES(@MaKH,@TenKH, @CMND, @Ngaysinh, @Gioitinh, @Sdt_KH)
		
			INSERT INTO MAY1.BTL_SQLServer_Nhom_2.dbo.tblKhachHang(sMaKH,sTenKH)
			VALUES(@MaKH, @TenKH)
			
			/*INSERT INTO MAY2.BTL_SQLServer_Nhom_2.dbo.tblKhachHang(sMaKH,sCMND,sNgaysinh,sGioitinh,sSdt_KH)
			VALUES(@MaKH, @CMND, @Ngaysinh, @Gioitinh, @Sdt_KH)
			PRINT N'Thêm thành công khách hàng mã: ' + @MaKH*/
		END
END

EXEC prInsertKH 'VIP2','954658120','ABC','1971/04/26','Nu','0944600763'

DELETE FROM tblKhachHang
WHERE sMaKH = 'VIP2'

SELECT * FROM dbo.tblKhachHang
----------------------------------------------------------Hết phân tán CSDL

-----------------------------------------THI
--1. Tạo view cho thông tin tất cả các dịch vụ đang có của cửa hàng(ở cả 2 máy)
CREATE SYNONYM MAY1
FOR MAY1.BTL_SQLServer_Nhom_2.dbo.tblDichVu

CREATE SYNONYM MAY2
FOR MAY2.BTL_SQLServer_Nhom_2.dbo.tblDichVu

CREATE VIEW vwDSDV
AS
	SELECT * FROM MAY1
	UNION
	SELECT * FROM MAY2
GO
	
SELECT * FROM dbo.vwDSDV

--2. Cho danh sách tên khách hàng đã đến thuê trong 1 ngày nào đó
CREATE PROC prDSKHThueTheoNgay(@Ngay int)
AS
BEGIN
	SELECT tblKhachHang.sMaKH,sTenKH,dNgaylap
	FROM tblKhachHang,tblHoaDon
	WHERE DAY(dNgaylap) = @Ngay and tblKhachHang.sMaKH = tblHoaDon.sMaKH
END

Exec prDSKHThueTheoNgay '04'

--3. Tạo user: thi20 pass: 123456 phân quyền thực thi Proc
CREATE LOGIN thi20 WITH PASSWORD = '123456'

	--Tạo user
	CREATE USER thi FOR LOGIN thi20
	--Cấp quyền exec thủ tục cho user thi
	GRANT EXECUTE ON prDSKHThueTheoNgay TO thi
