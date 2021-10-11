USE [master]
GO
/****** Object:  Database [QLThuVien]    Script Date: 11/10/2021 20:01:35 ******/
CREATE DATABASE [QLThuVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NV_PB', FILENAME = N'D:\TAI LIEU HOC TAP\LAP TRINH HUONG SU KIEN (C#)\BAI TAP LON\QLThuVien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLThuVien_log', FILENAME = N'D:\TAI LIEU HOC TAP\LAP TRINH HUONG SU KIEN (C#)\BAI TAP LON\QLThuVien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLThuVien] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLThuVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLThuVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLThuVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLThuVien] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLThuVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLThuVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLThuVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLThuVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLThuVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLThuVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLThuVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLThuVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLThuVien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLThuVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLThuVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLThuVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLThuVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLThuVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLThuVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLThuVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLThuVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLThuVien] SET  MULTI_USER 
GO
ALTER DATABASE [QLThuVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLThuVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLThuVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLThuVien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLThuVien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLThuVien] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLThuVien] SET QUERY_STORE = OFF
GO
USE [QLThuVien]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[sMaSV] [nvarchar](50) NOT NULL,
	[sTenSV] [nvarchar](50) NULL,
	[dNgaysinh] [datetime] NULL,
	[sGioitinh] [nvarchar](50) NULL,
	[sSDT] [nvarchar](50) NULL,
	[sEmail] [nvarchar](50) NULL,
	[sCMND] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sSDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sCMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwDSSV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDSSV]
AS
	SELECT sMaSV AS [Mã sinh viên],sTenSV AS [Tên sinh viên],dNgaysinh AS [Ngày sinh],sGioitinh AS [Giới tính],
	sSdt AS [Số điện thoại],sEmail AS [Địa chỉ Email],sCMND AS [Chứng minh nhân dân]
	FROM tblSinhVien
	
GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhanVien](
	[sMaNV] [nvarchar](50) NOT NULL,
	[sTenNV] [nvarchar](50) NULL,
	[dNgaysinh] [datetime] NULL,
	[sGioitinh] [nvarchar](50) NULL,
	[sSDT] [nvarchar](50) NULL,
	[dNgayvaolam] [datetime] NULL,
	[sCMND] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwDSNV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDSNV]
AS
	SELECT sMaNV AS [Mã nhân viên],sTenNV AS [Tên nhân viên],dNgaysinh AS [Ngày sinh],(YEAR(GETDATE()) - YEAR(dNgaysinh)) AS [Tuổi],sGioitinh AS [Giới tính], sSDT AS [Số điện thoại],
		dNgayvaolam AS [Ngày vào làm],sCMND AS [Chứng minh nhân dân]
	FROM tblNhanVien
GO
/****** Object:  Table [dbo].[tblNXB]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNXB](
	[sMaNXB] [nvarchar](50) NOT NULL,
	[sTenNXB] [nvarchar](50) NULL,
	[dDiachi] [nvarchar](50) NULL,
	[sEmail] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTacGia]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTacGia](
	[sMatacgia] [nvarchar](50) NOT NULL,
	[sTentacgia] [nvarchar](50) NULL,
	[dNgaysinh] [datetime] NULL,
	[sNoiCT] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMatacgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSach]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSach](
	[sMasach] [nvarchar](50) NOT NULL,
	[sTensach] [nvarchar](50) NULL,
	[sTacgia] [nvarchar](50) NULL,
	[sMaNXB] [nvarchar](50) NULL,
	[iNamXB] [int] NULL,
	[sTinhtrangsach] [nvarchar](50) NULL,
	[sMaloai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMasach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTheLoai]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTheLoai](
	[sMaloai] [nvarchar](50) NOT NULL,
	[sTenloai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwDSSach]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDSSach]
AS
	SELECT sMasach AS [Mã sách],sTensach AS [Tên sách],sMatacgia AS [Mã tác giả],sTentacgia AS [Tác giả],tblNXB.sMaNXB AS [Mã NXB],sTenNXB AS [Nhà xuất bản],iNamXB AS [Năm xuất bản],sTinhtrangsach AS [Tình trạng sách],tblTheLoai.sMaloai AS [Mã TL],sTenloai AS [Thể loại]
	FROM tblSach,tblTacGia,tblTheLoai,tblNXB
	WHERE tblSach.sMaNXB = tblNXB.sMaNXB AND tblSach.sTacgia = tblTacGia.sMatacgia AND tblSach.sMaloai = tblTheLoai.sMaloai
	
GO
/****** Object:  View [dbo].[vw_DSTheloai]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--View xem danh sach the loai
CREATE VIEW [dbo].[vw_DSTheloai]
AS
 SELECT sMaloai AS [Mã thể loại],sTenloai AS [Tên thể loại]
 FROM tblTheloai
 
GO
/****** Object:  View [dbo].[vwDSNXB]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDSNXB]
AS
	SELECT sMaNXB AS [Mã NXB],sTenNXB AS [Tên nhà xuất bản],dDiachi AS [Trụ sở],sEmail AS [Email]
	FROM tblNXB
GO
/****** Object:  View [dbo].[vwDSTacgia]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDSTacgia]
AS
	SELECT sMatacgia AS [Mã tác giả],sTentacgia AS [Tên tác giả],dNgaysinh AS [Ngày sinh],sNoiCT AS [Đơn vị công tác]
	FROM tblTacGia
	
GO
/****** Object:  Table [dbo].[tblMuonTra]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMuonTra](
	[sMaMT] [nvarchar](50) NOT NULL,
	[sMaSV] [nvarchar](50) NOT NULL,
	[sMaNV] [nvarchar](50) NOT NULL,
	[dNgaymuon] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaMT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwDSMuonTra]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDSMuonTra]
AS
	SELECT sMaMT AS [Mã mượn trả],tblSinhVien.sMaSV AS [Mã sinh viên],sTenSV AS [Tên sinh viên],tblNhanVien.sMaNV AS [Mã nhân viên],sTenNV AS [Tên nhân viên],dNgaymuon AS [Ngày mượn]
	FROM tblMuonTra,tblNhanVien,tblSinhVien
	WHERE tblMuonTra.sMaSV = tblSinhVien.sMaSV AND tblMuonTra.sMaNV = tblNhanVien.sMaNV
	
GO
/****** Object:  Table [dbo].[tblCTMuonTra]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTMuonTra](
	[sMaMT] [nvarchar](50) NOT NULL,
	[sMasach] [nvarchar](50) NOT NULL,
	[dNgaytra] [datetime] NULL,
 CONSTRAINT [FK_masach_mamt] PRIMARY KEY CLUSTERED 
(
	[sMasach] ASC,
	[sMaMT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwDSMT_SV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDSMT_SV]
AS
	SELECT tblMuonTra.sMaMT,tblSinhVien.sMaSV,dNgaymuon,tblSach.sMasach,dNgaytra,sTensach,sTacgia,sMaNXB,
	sTinhtrangsach,iNamXB,sMaloai,sTenSV,dNgaysinh,sGioitinh,sSDT,sEmail,sCMND
	FROM tblMuonTra,tblCTMuonTra,tblSach,tblSinhVien
	WHERE tblMuonTra.sMaMT = tblCTMuonTra.sMaMT AND tblSach.sMasach = tblCTMuonTra.sMasach
	AND tblSinhVien.sMaSV = tblMuonTra.sMaSV
	GROUP BY tblMuonTra.sMaMT,tblSinhVien.sMaSV,dNgaymuon,tblSach.sMasach,dNgaytra,sTensach,sTacgia,sMaNXB,
	sTinhtrangsach,iNamXB,sMaloai,sTenSV,dNgaysinh,sGioitinh,sSDT,sEmail,sCMND
	
	
GO
/****** Object:  View [dbo].[vwDSMuon_Chuatra]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDSMuon_Chuatra]
AS
	SELECT sTensach AS [Tên sách],sTentacgia AS [Tên tác giả],sTenNXB AS [Tên nhà xuất bản],sTenloai AS [Thể loại],dNgaytra AS [Ngày phải trả]
	FROM tblCTMuonTra,tblSach,tblTacGia,tblNXB,tblTheLoai
	WHERE tblSach.sMasach = tblCTMuonTra.sMasach AND tblSach.sTacgia = tblTacGia.sMatacgia AND tblSach.sMaNXB = tblNXB.sMaNXB
	AND tblSach.sMaloai = tblTheLoai.sMaloai AND dNgaytra > GETDATE()
	--GROUP BY sTensach,sTentacgia,sTenNXB,sTenloai,dNgaytra
GO
/****** Object:  Table [dbo].[tblCTSach]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTSach](
	[sMasach] [nvarchar](50) NOT NULL,
	[sMatacgia] [nvarchar](50) NOT NULL,
 CONSTRAINT [FK_sach_tacgia] PRIMARY KEY CLUSTERED 
(
	[sMasach] ASC,
	[sMatacgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDangNhap]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDangNhap](
	[sMaNV] [nvarchar](50) NOT NULL,
	[sMatkhau] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCTMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_mamt] FOREIGN KEY([sMaMT])
REFERENCES [dbo].[tblMuonTra] ([sMaMT])
GO
ALTER TABLE [dbo].[tblCTMuonTra] CHECK CONSTRAINT [FK_mamt]
GO
ALTER TABLE [dbo].[tblCTMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_mas] FOREIGN KEY([sMasach])
REFERENCES [dbo].[tblSach] ([sMasach])
GO
ALTER TABLE [dbo].[tblCTMuonTra] CHECK CONSTRAINT [FK_mas]
GO
ALTER TABLE [dbo].[tblCTSach]  WITH CHECK ADD  CONSTRAINT [FK_masachh] FOREIGN KEY([sMasach])
REFERENCES [dbo].[tblSach] ([sMasach])
GO
ALTER TABLE [dbo].[tblCTSach] CHECK CONSTRAINT [FK_masachh]
GO
ALTER TABLE [dbo].[tblCTSach]  WITH CHECK ADD  CONSTRAINT [FK_matacgiaa] FOREIGN KEY([sMatacgia])
REFERENCES [dbo].[tblTacGia] ([sMatacgia])
GO
ALTER TABLE [dbo].[tblCTSach] CHECK CONSTRAINT [FK_matacgiaa]
GO
ALTER TABLE [dbo].[tblDangNhap]  WITH CHECK ADD  CONSTRAINT [FK_manvv] FOREIGN KEY([sMaNV])
REFERENCES [dbo].[tblNhanVien] ([sMaNV])
GO
ALTER TABLE [dbo].[tblDangNhap] CHECK CONSTRAINT [FK_manvv]
GO
ALTER TABLE [dbo].[tblMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_manvvv] FOREIGN KEY([sMaNV])
REFERENCES [dbo].[tblNhanVien] ([sMaNV])
GO
ALTER TABLE [dbo].[tblMuonTra] CHECK CONSTRAINT [FK_manvvv]
GO
ALTER TABLE [dbo].[tblMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_masvv] FOREIGN KEY([sMaSV])
REFERENCES [dbo].[tblSinhVien] ([sMaSV])
GO
ALTER TABLE [dbo].[tblMuonTra] CHECK CONSTRAINT [FK_masvv]
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_maloai] FOREIGN KEY([sMaloai])
REFERENCES [dbo].[tblTheLoai] ([sMaloai])
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_maloai]
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_manxb] FOREIGN KEY([sMaNXB])
REFERENCES [dbo].[tblNXB] ([sMaNXB])
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_manxb]
GO
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_matacgia] FOREIGN KEY([sTacgia])
REFERENCES [dbo].[tblTacGia] ([sMatacgia])
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_matacgia]
GO
/****** Object:  StoredProcedure [dbo].[prDangKi]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prDangKi](@MaNV NVARCHAR(50),@TenNV NVARCHAR(50),@Ngaysinh DATETIME,@Gioitinh  NVARCHAR(50),@Sdt  NVARCHAR(50),@Ngayvaolam DATETIME
,@CMND NVARCHAR(50))
AS
BEGIN
	INSERT INTO tblNhanVien(sMaNV,sTenNV,dNgaysinh,sGioitinh,sSDT,dNgayvaolam,sCMND)
	VALUES(@MaNV,@TenNV,@Ngaysinh,@Gioitinh,@Sdt,@Ngayvaolam,@CMND)

	INSERT INTO tblDangNhap(sMaNV,sMatkhau)
	VALUES(@MaNV,@CMND)
END
GO
/****** Object:  StoredProcedure [dbo].[prDSMuonTra_TheoNV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prDSMuonTra_TheoNV](@MaNV NVARCHAR(50))
AS
BEGIN
	BEGIN
		DELETE FROM tblNhanVien
		WHERE sMaNV = @MaNV
	END
	BEGIN
		DELETE FROM tblMuonTra
		WHERE sMaNV = @MaNV
	END
END
GO
/****** Object:  StoredProcedure [dbo].[prDSMuonTra_TheoNV_]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prDSMuonTra_TheoNV_](@MaNV NVARCHAR(50))
AS
BEGIN
	BEGIN
		DELETE FROM tblMuonTra
		WHERE sMaNV = @MaNV
	END
	BEGIN
		DELETE FROM tblNhanVien
		WHERE sMaNV = @MaNV
	END
END
GO
/****** Object:  StoredProcedure [dbo].[prSuaCTMT]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSuaCTMT](@MaMT NVARCHAR(50),@Masach1 NVARCHAR(50),@Masach2 NVARCHAR(50),@Ngaytra DATETIME)
AS
BEGIN
	UPDATE tblCTMuonTra
	SET sMasach = @Masach2,dNgaytra = @Ngaytra
	WHERE sMaMT = @MaMT AND sMasach = @Masach1
END
GO
/****** Object:  StoredProcedure [dbo].[prSuaMuonTra]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSuaMuonTra](@MaMT NVARCHAR(50),@MaSV NVARCHAR(50),@MaNV NVARCHAR(50),@Ngaymuon DATETIME)
AS
BEGIN
	UPDATE tblMuonTra
	SET sMaSV = @MaSV,sMaNV = @MaNV,dNgaymuon = @Ngaymuon
	WHERE sMaMT = @MaMT
END
GO
/****** Object:  StoredProcedure [dbo].[prSuaNV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSuaNV](@MaNV NVARCHAR(50),@TenNV NVARCHAR(50),@Ngaysinh DATETIME,@Gioitinh NVARCHAR(50),@Sdt NVARCHAR(50),
@Ngayvaolam DATETIME,@CMND NVARCHAR(50))
AS
BEGIN
	BEGIN
	UPDATE tblNhanVien
	SET sTenNV = @TenNV,dNgaysinh = @Ngaysinh,sGioitinh = @Gioitinh,sSdt = @Sdt,dNgayvaolam = @Ngayvaolam,sCMND = @CMND
	WHERE sMaNV = @MaNV
	END
	
	BEGIN
	UPDATE tblDangNhap
	SET sMatkhau = @CMND
	WHERE sMaNV = @MaNV
	END
END
GO
/****** Object:  StoredProcedure [dbo].[prSuaNXB]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSuaNXB](@MaNXB NVARCHAR(50),@TenNXB NVARCHAR(50),@Diachi NVARCHAR(50),@Email NVARCHAR(50))
AS
BEGIN
	UPDATE tblNXB
	SET sTenNXB = @TenNXB,dDiachi = @Diachi,sEmail = @Email
	WHERE sMaNXB = @MaNXB
END
GO
/****** Object:  StoredProcedure [dbo].[prSuaSach]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSuaSach](@Masach NVARCHAR(50),@Tensach NVARCHAR(50),@Matacgia NVARCHAR(50),@MaNXB NVARCHAR(50),@NamXB INT,
@Tinhtrang NVARCHAR(50),@Maloai NVARCHAR(50))
AS
BEGIN
	UPDATE tblSach
	SET sTensach = @Tensach,sTacgia = @Matacgia,sMaNXB = @MaNXB,iNamXB = @NamXB,sTinhtrangsach = @Tinhtrang,sMaloai = @Maloai
	WHERE sMasach = @Masach
END
GO
/****** Object:  StoredProcedure [dbo].[prSuaSV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Proc sua sinh vien
CREATE PROC [dbo].[prSuaSV](@MaSV NVARCHAR(50),@TenSV NVARCHAR(50),@Ngaysinh DATETIME,@Gioitinh NVARCHAR(50),@Sdt NVARCHAR(50),
@Email NVARCHAR(50),@CMND NVARCHAR(50))
AS
BEGIN
	UPDATE tblSinhVien
	SET sTenSV = @TenSV,dNgaysinh = @Ngaysinh,sGioitinh = @Gioitinh,sSdt = @Sdt,sEmail = @Email,sCMND = @CMND
	WHERE sMaSV = @MaSV
END
GO
/****** Object:  StoredProcedure [dbo].[prSuaTG]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSuaTG](@MaTG NVARCHAR(50),@TenTG NVARCHAR(50),@Ngaysinh DATETIME,@NoiCT NVARCHAR(50))
AS
BEGIN
	UPDATE tblTacGia
	SET sTentacgia = @TenTG,dNgaysinh = @Ngaysinh,sNoiCT = @NoiCT
	WHERE sMatacgia = @MaTG
END
GO
/****** Object:  StoredProcedure [dbo].[prSuaTL]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSuaTL](@Matheloai NVARCHAR(50),@Tentheloai NVARCHAR(50))
AS
BEGIN
	UPDATE tblTheLoai
	SET sTenloai = @Tentheloai
	WHERE sMaloai = @Matheloai
END
GO
/****** Object:  StoredProcedure [dbo].[prThemCTMT]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prThemCTMT](@MaMT NVARCHAR(50),@Masach NVARCHAR(50),@Ngaytra DATETIME)
AS
BEGIN
	INSERT INTO tblCTMuonTra(sMaMT,sMasach,dNgaytra)
	VALUES(@MaMT,@Masach,@Ngaytra)
END
GO
/****** Object:  StoredProcedure [dbo].[prThemMuonTra]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prThemMuonTra](@MaMT NVARCHAR(50),@MaSV NVARCHAR(50),@MaNV NVARCHAR(50),@Ngaymuon DATETIME)
AS
BEGIN
	INSERT INTO tblMuonTra(sMaMT,sMaSV,sMaNV,dNgaymuon)
	VALUES(@MaMT,@MaSV,@MaNV,@Ngaymuon)
END
GO
/****** Object:  StoredProcedure [dbo].[prThemNV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prThemNV](@MaNV NVARCHAR(50),@TenNV NVARCHAR(50),@Ngaysinh DATETIME,@Gioitinh NVARCHAR(50),@Sdt NVARCHAR(50),
@Ngayvaolam DATETIME,@CMND NVARCHAR(50))
AS
BEGIN
	IF((GETDATE() - @Ngaysinh) > 18)
	BEGIN
		INSERT INTO tblNhanVien(sMaNV,sTenNV,dNgaysinh,sGioitinh,sSdt,dNgayvaolam,sCMND)
		VALUES(@MaNV,@TenNV,@Ngaysinh,@Gioitinh,@Sdt,@Ngayvaolam,@CMND)

		INSERT INTO tblDangNhap(sMaNV,sMatkhau)
		VALUES(@MaNV,@CMND)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[prThemNXB]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prThemNXB](@MaNXB NVARCHAR(50),@TenNXB NVARCHAR(50),@Diachi NVARCHAR(50),@Email NVARCHAR(50))
AS
BEGIN
	INSERT INTO tblNXB(sMaNXB,sTenNXB,dDiachi,sEmail)
	VALUES(@MaNXB,@TenNXB,@Diachi,@Email)
END
GO
/****** Object:  StoredProcedure [dbo].[prThemSach]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prThemSach](@Masach NVARCHAR(50),@Tensach NVARCHAR(50),@Matacgia NVARCHAR(50),@MaNXB NVARCHAR(50),@NamXB INT,
@Tinhtrang NVARCHAR(50),@Maloai NVARCHAR(50))
AS
BEGIN
	INSERT INTO tblSach(sMasach,sTensach,sTacgia,sMaNXB,iNamXB,sTinhtrangsach,sMaloai)
	VALUES(@Masach,@Tensach,@Matacgia,@MaNXB,@NamXB,@Tinhtrang,@Maloai)
END
GO
/****** Object:  StoredProcedure [dbo].[prThemSV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prThemSV](@MaSV NVARCHAR(50),@TenSV NVARCHAR(50),@Ngaysinh DATETIME,@Gioitinh NVARCHAR(50),@Sdt NVARCHAR(50),
@Email NVARCHAR(50),@CMND NVARCHAR(50))
AS
BEGIN
	INSERT INTO tblSinhVien(sMaSV,sTenSV,dNgaysinh,sGioitinh,sSdt,sEmail,sCMND)
	VALUES(@MaSV,@TenSV,@Ngaysinh,@Gioitinh,@Sdt,@Email,@CMND)
END
GO
/****** Object:  StoredProcedure [dbo].[prThemTG]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prThemTG](@MaTG NVARCHAR(50),@TenTG NVARCHAR(50),@Ngaysinh DATETIME,@NoiCT NVARCHAR(50))
AS
BEGIN
	INSERT INTO tblTacGia(sMatacgia,sTentacgia,dNgaysinh,sNoiCT)
	VALUES(@MaTG,@TenTG,@Ngaysinh,@NoiCT)
END
GO
/****** Object:  StoredProcedure [dbo].[prThemTL]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prThemTL](@Matheloai NVARCHAR(50),@Tentheloai NVARCHAR(50))
AS
BEGIN
	INSERT INTO tblTheLoai(sMaloai,sTenloai)
	VALUES(@Matheloai,@Tentheloai)
END
GO
/****** Object:  StoredProcedure [dbo].[prTimNV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTimNV](@MaNV NVARCHAR(50))
AS
BEGIN
	SELECT sMaNV AS [Mã nhân viên],sTenNV AS [Tên nhân viên],dNgaysinh AS [Ngày sinh],sGioitinh AS [Giới tính], sSDT AS [Số điện thoại],
		dNgayvaolam AS [Ngày vào làm],sCMND AS [Chứng minh nhân dân]
	FROM tblNhanVien
	WHERE sMaNV = @MaNV 
END
GO
/****** Object:  StoredProcedure [dbo].[prTimSV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTimSV](@MaSV NVARCHAR(50))
AS
BEGIN
	SELECT sMaSV AS [Mã sinh viên],sTenSV AS [Tên sinh viên],dNgaysinh AS [Ngày sinh],sGioitinh AS [Giới tính],
	sSdt AS [Số điện thoại],sEmail AS [Địa chỉ Email],sCMND AS [Chứng minh nhân dân]
	FROM tblSinhVien
	WHERE sMaSV = @MaSV 
END
GO
/****** Object:  StoredProcedure [dbo].[prXoaCTMT]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Proc xoa chi tiet muon tra
CREATE PROC [dbo].[prXoaCTMT](@MaMT NVARCHAR(50),@Masach NVARCHAR(50))
AS
BEGIN
	DELETE FROM tblCTMuonTra
	WHERE sMasach = @Masach AND sMaMT = @MaMT
END
GO
/****** Object:  StoredProcedure [dbo].[prXoaMuonTra]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Proc xoa muon tra
CREATE PROC [dbo].[prXoaMuonTra](@MaMT NVARCHAR(50))
AS
BEGIN
	DELETE FROM tblCTMuonTra
	WHERE sMaMT = @MaMT

	DELETE FROM tblMuonTra
	WHERE sMaMT = @MaMT
END
GO
/****** Object:  StoredProcedure [dbo].[prXoaNV]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prXoaNV](@MaNV NVARCHAR(50))
AS
BEGIN
	BEGIN
	DELETE FROM tblDangNhap
	WHERE sMaNV = @MaNV
	END
	
	BEGIN
	DELETE FROM tblNhanVien
	WHERE sMaNV = @MaNV
	END
END
GO
/****** Object:  StoredProcedure [dbo].[prXoaNXB]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prXoaNXB](@MaNXB NVARCHAR(50))
AS
BEGIN
	DELETE FROM tblSach
	WHERE sMaNXB = @MaNXB

	DELETE FROM tblNXB
	WHERE sMaNXB = @MaNXB
END
GO
/****** Object:  StoredProcedure [dbo].[prXoaSach]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prXoaSach](@Masach NVARCHAR(50))
AS
BEGIN
	DELETE FROM tblSach
	WHERE sMasach = @Masach
END
GO
/****** Object:  StoredProcedure [dbo].[prXoaTG]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prXoaTG](@MaTG NVARCHAR(50))
AS
BEGIN
	DELETE FROM tblSach
	WHERE sTacgia = @MaTG

	DELETE FROM tblTacGia
	WHERE sMatacgia = @MaTG
END
GO
/****** Object:  StoredProcedure [dbo].[prXoaTL]    Script Date: 11/10/2021 20:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prXoaTL](@Matheloai NVARCHAR(50))
AS
BEGIN
	DELETE FROM tblSach
	WHERE sMaloai = @Matheloai

	DELETE FROM tblTheLoai
	WHERE sMaloai = @Matheloai
END
GO
USE [master]
GO
ALTER DATABASE [QLThuVien] SET  READ_WRITE 
GO
