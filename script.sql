CREATE DATABASE QuanLySieuThi
GO

USE QuanLySieuThi
GO

CREATE TABLE NhaCungCap (
	MaNCC nchar(10) PRIMARY KEY,
	TenNCC nvarchar(50) NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	SDT varchar(10) NOT NULL,
	Email nvarchar(50) NULL,
) 
GO

CREATE TABLE KhachHang (
	MaKH varchar(20) PRIMARY KEY,
	TenKH nvarchar(50) NOT NULL,
	GioiTinh nvarchar(10) NULL,
	DiaChi nvarchar(50) NULL,
	SDT varchar(10) NOT NULL,
	Email nvarchar(50) NULL,
) 
GO

CREATE TABLE CaLamViec (
    MaCLV nvarchar(20)  PRIMARY KEY,
	Ca nvarchar(10) NOT NULL,
)
GO

CREATE TABLE NhanVien (
    MaNV nvarchar(20) PRIMARY KEY,
	TenHienThi nvarchar(50) NULL,
	GioiTinh nvarchar(10) NULL,
	DiaChi nvarchar(50) NULL,
	SDT nvarchar(10) NOT NULL,
	Quyen nvarchar(20) NULL,
	TenDangNhap varchar(50) NOT NULL,
	MatKhau varchar(50) NOT NULL,
) 
GO

CREATE TABLE DonViTinh (
	MaDVT varchar(10) PRIMARY KEY,
	TenDVT nvarchar (20) NOT NULL,
)
GO

CREATE TABLE QuayHang (
	MaQH varchar(20) PRIMARY KEY,
	TenQH nvarchar(50) NOT NULL,
) 
GO

CREATE TABLE MatHang (
	MaMH nvarchar(50) PRIMARY KEY,
	TenMH nvarchar(50) NOT NULL,
	DonVi varchar(10) NOT NULL,
	GiaBan int  NULL,
	SoLuong int NULL,
	FOREIGN KEY(DonVi) REFERENCES DonViTinh(MaDVT),
) 
GO

CREATE TABLE HoaDon (
	MaHD nvarchar(50) PRIMARY KEY,
	MaKH varchar(20) NOT NULL,
	NgayTao date NOT NULL,
	MaNV nvarchar(20) NOT NULL,
	TongTien int NOT NULL,
	FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH),
	FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV)

) 
GO

CREATE TABLE PhieuNhap (
	MaPN nchar(10) PRIMARY KEY,
	MaNCC nchar(10) NOT NULL,
	NgayNhap date NOT NULL,
	MaNV nvarchar(20) NOT NULL,
	FOREIGN KEY(MaNCC) REFERENCES NhaCungCap(MaNCC),
	FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV)
) 
GO

CREATE TABLE ChiTietHD (
	MaHD nvarchar(50) NOT NULL,
	MaMH nvarchar(50) NOT NULL,
	SoLuong int NOT NULL,
	DonGia float NOT NULL,
    FOREIGN KEY(MaMH) REFERENCES MatHang(MaMH),
	FOREIGN KEY(MaHD) REFERENCES HoaDon(MaHD)
) 
GO

CREATE TABLE ChiTietPN (
	MaPN nchar(10),
	MaMH nvarchar(50) NOT NULL,
	SoLuong int NULL,
	DonGia float NULL,
    FOREIGN KEY(MaMH) REFERENCES MatHang(MaMH),
	FOREIGN KEY(MaPN) REFERENCES PhieuNhap(MaPN)
) 
GO

CREATE TABLE ChiTietCLV (
	MaCLV nvarchar(20) NOT NULL,
	MaNV nvarchar(20) NOT NULL,
	NgayLam date NOT NULL,
	PRIMARY KEY (MaCLV, MaNV),
	FOREIGN KEY(MaCLV) REFERENCES CaLamViec(MaCLV),
    FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV),
) 
GO

INSERT CaLamViec (MaCLV, Ca )VALUES (N'CLV01', N'Sáng')
INSERT CaLamViec (MaCLV, Ca )VALUES (N'CLV02', N'Chiều')
INSERT CaLamViec (MaCLV, Ca )VALUES (N'CLV03', N'Tối')
GO

INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC001  ', N'Bốn Phương', N'Quận 1, Hồ Chí Minh', N'0935847521', N'bonphuong@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC002  ', N'Phú Sơn', N'Quận 3, Hồ Chí Minh', N'0935847543', N'phuson@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC003  ', N'Hưng Thịnh', N'Quận 8, Hồ Chí Minh', N'0935847590', N'hungthinh@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC004  ', N'Hồng Kông', N'Quận 9, Hồ Chí Minh', N'0935847555', N'khanhan@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC005  ', N'Kinh Đô', N'Bắc Giang', N'0935847577', N'kinhdo@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC006  ', N'Phương Nam', N'Đà Nẵng', N'0935847500', N'phuongnam@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC007  ', N'Cao Thắng', N'Quảng Ninh', N'032568596', N'caothang@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC008  ', N'Thịnh Phát', N'Quận 2, Hồ Chí Minh', N'032698485', N'thinhphat@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC009  ', N'Mai Thảo', N'Ba Đình, Hà Nội', N'0325698489', N'maithao@gmail.com')
INSERT NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email) VALUES (N'NCC010  ', N'Thương Tín', N'Ba Vì, Hà Nội', N'0925998485', N'thuongtin@gmail.com')
GO

INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH01', N'Phan khách Duy', N'Nam', N'Quận 9 , Hồ Chí Minh', N'0235958952', N'duyphan@gmail.com')
INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH02', N'Đặng đình Duy', N'Nam', N'Ba Đình, Hà Nội', N'0365895744', N'duydang@gmail.com')
INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH03', N'Nguyễn tường Vy', N'Nữ', N'Quận 4, Hồ Chí Minh', N'0325895852', N'luutran@gmail.com')
INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH04', N'Lê gia Minh', N'Nam', N'Quận 8, Hồ Chí Minh', N'0365895532', N'minhle@gmail.com')
INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH05', N'Võ đoàn hoàng Long', N'Nam', N'Quận 2, Hồ Chí Minh', N'0365895748', N'longvo@gmail.com')
INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH06', N'Lê âu Hải', N'Nam', N'Quận 8, Hồ Chí Minh', N'0365895858', N'haile@gmail.com')
INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH07', N'Đoàn phước Nhật', N'Nam', N'Quận 5, Hồ Chí Minh', N'0321515648', N'nhatdoan@gmail.com')
INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH08', N'Phan tấn Hoàng', N'Nam', N'Quận 8, Hồ Chí Minh', N'0321515338', N'hoangphan@gmail.com')
INSERT KhachHang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email) VALUES (N'KH09', N'Trần thị thanh Thảo', N'Nữ', N'An Chấn, Tuy An, Phú Yên', N'0328644258', N'trungcobia@gmail.com')
GO

INSERT NhanVien(MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau)
VALUES (N'AD', N'Văn Tân', 'Nam', N'Hồ Chí Minh', N'0382753698', N'Quản Lý', N'tan', N'123')
INSERT NhanVien(MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau)
VALUES (N'NV01', N'Văn Trí', 'Nam', N'Quảng Nam', N'0965698485', N'Thủ Kho', N'tri', N'123')
INSERT NhanVien(MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau )
VALUES (N'NV02', N'Công Chí', 'Nam', N'Quảng Bình', N'0925698485', N'Bán Hàng', N'chi', N'123')
INSERT NhanVien(MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau)
VALUES (N'NV03', N'Trương Như', N'Nữ', N'Hà Nôi', N'0985698485', N'Bán Hàng', N'nhu', N'123')
INSERT NhanVien(MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau )
VALUES (N'NV04', N'Hoàng Hải', N'Nam', N'Hải Dương', N'0925698485', N'Bán Hàng', N'hai', N'123')
INSERT NhanVien(MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau)
VALUES (N'NV05', N'Hoài Thương', N'Nữ', N'Bình Thuận', N'0925698485', N'Bán Hàng', N'thuong', N'123')
INSERT NhanVien(MaNV, TenHienThi, GioiTinh, DiaChi, SDT, Quyen, TenDangNhap, MatKhau)
VALUES (N'NV06', N'Tường Vy', N'Nữ', N'Hà Nam', N'0325698485', N'Thủ Kho', N'vy', N'123')
GO

INSERT DonViTinh (MaDVT, TenDVT) VALUES (N'DVT01', N'Thùng')
INSERT DonViTinh (MaDVT, TenDVT) VALUES (N'DVT02', N'Lon')
INSERT DonViTinh (MaDVT, TenDVT) VALUES (N'DVT03', N'Chai')
INSERT DonViTinh (MaDVT, TenDVT) VALUES (N'DVT04', N'Bịch')
INSERT DonViTinh (MaDVT, TenDVT) VALUES (N'DVT05', N'Hộp')
INSERT DonViTinh (MaDVT, TenDVT) VALUES (N'DVT06', N'Dây')
INSERT DonViTinh (MaDVT, TenDVT) VALUES (N'DVT07', N'KG')
GO

INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP001', N'Dầu ăn',  N'DVT03', 26000, 210)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP002', N'Xà phòng',  N'DVT05', 20000, 300)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP003', N'Nước nắm',  N'DVT03', 15000, 133)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP004', N'Mì tôm',  N'DVT01', 15000, 82)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP005', N'Bánh ngọt',  N'DVT01', 200000, 3)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP006', N'Bia tiger',  N'DVT01', 25000, 84)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP007', N'Bia sài gòn',  N'DVT01', 20000, 28)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP008', N'Nước suối',  N'DVT01', 20000, 93)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP009', N'Dầu gội',  N'DVT06', 12000, 389)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP010', N'Trà sữa',  N'DVT03', 3000, 297)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP011', N'Sting',  N'DVT03', 10000, 68)
INSERT MatHang (MaMH, TenMH, DonVi, GiaBan, SoLuong) VALUES (N'SP012', N'Sữa ông thọ',  N'DVT02', 30000, 1097)
GO

INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD001', N'KH01     ', CAST(N'2020-02-01' AS Date), N'NV02', 98000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD002', N'KH02     ', CAST(N'2020-03-01' AS Date), N'NV02', 135000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD003', N'KH03     ', CAST(N'2020-04-01' AS Date), N'NV02', 15000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD004', N'KH05     ', CAST(N'2020-09-01' AS Date), N'NV02', 20000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD005', N'KH05     ', CAST(N'2020-10-01' AS Date), N'NV02', 26000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD006', N'KH01     ', CAST(N'2020-11-01' AS Date), N'NV02', 20000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD007', N'KH01     ', CAST(N'2020-11-01' AS Date), N'NV02', 20000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD008', N'KH05     ', CAST(N'2020-01-01' AS Date), N'NV02', 25000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD009', N'KH06     ', CAST(N'2020-01-01' AS Date), N'NV02', 10000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD010', N'KH01     ', CAST(N'2020-05-01' AS Date), N'NV02', 26000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD011', N'KH04     ', CAST(N'2020-02-01' AS Date), N'NV02', 200000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD012', N'KH06     ', CAST(N'2020-02-01' AS Date), N'NV02', 12000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD013', N'KH04     ', CAST(N'2021-01-01' AS Date), N'NV02', 26000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD014', N'KH01     ', CAST(N'2021-01-01' AS Date), N'NV02', 15000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD015', N'KH06     ', CAST(N'2021-01-01' AS Date), N'NV02', 20000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD016', N'KH05     ', CAST(N'2021-01-02' AS Date), N'NV04', 10000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD017', N'KH04     ', CAST(N'2020-12-20' AS Date), N'NV04', 20000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD018', N'KH08     ', CAST(N'2020-12-21' AS Date), N'NV04', 26000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD019', N'KH08     ', CAST(N'2020-12-22' AS Date), N'NV04', 15000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD020', N'KH01     ', CAST(N'2020-12-23' AS Date), N'NV04', 32000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD021', N'KH02     ', CAST(N'2020-12-23' AS Date), N'NV04', 20000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD022', N'KH02     ', CAST(N'2020-12-10' AS Date), N'NV04', 91000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD023', N'KH03     ', CAST(N'2020-12-01' AS Date), N'NV02', 62000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD024', N'KH02     ', CAST(N'2020-12-24' AS Date), N'NV04', 233000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD025', N'KH01', CAST(N'2021-11-18' AS Date), N'AD', 75000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD026', N'KH07', CAST(N'2021-11-19' AS Date), N'AD', 600000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD027', N'KH04', CAST(N'2021-11-19' AS Date), N'AD', 75000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD028', N'KH07', CAST(N'2021-11-19' AS Date), N'AD', 225000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD029', N'KH07', CAST(N'2021-11-19' AS Date), N'AD', 1000000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD030', N'KH03', CAST(N'2021-11-20' AS Date), N'NV02', 114000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD031', N'KH02', CAST(N'2021-11-20' AS Date), N'NV02', 110000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD032', N'KH05', CAST(N'2021-11-20' AS Date), N'AD', 90000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD033', N'KH03', CAST(N'2021-11-20' AS Date), N'NV02', 115000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD034', N'KH07', CAST(N'2021-11-20' AS Date), N'NV02', 466000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD035', N'KH07', CAST(N'2021-11-20' AS Date), N'NV02', 48000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD036', N'KH09', CAST(N'2021-11-20' AS Date), N'NV02', 800000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD037', N'KH09', CAST(N'2021-11-20' AS Date), N'AD', 30000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD038', N'KH03', CAST(N'2021-11-20' AS Date), N'NV02', 40000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD039', N'KH08', CAST(N'2021-11-20' AS Date), N'NV02', 1000000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD040', N'KH08', CAST(N'2021-11-20' AS Date), N'NV02', 15000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD041', N'KH08', CAST(N'2021-11-20' AS Date), N'NV02', 30000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD042', N'KH07', CAST(N'2021-11-20' AS Date), N'NV02', 24000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD043', N'KH08', CAST(N'2021-11-20' AS Date), N'NV02', 24000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD044', N'KH03', CAST(N'2021-11-20' AS Date), N'NV02', 30000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD045', N'KH07', CAST(N'2021-11-20' AS Date), N'AD', 126000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD046', N'KH09', CAST(N'2021-11-20' AS Date), N'NV02', 345000)
INSERT HoaDon (MaHD, MaKH, NgayTao, MaNV, TongTien) VALUES (N'HD047', N'KH09', CAST(N'2021-11-20' AS Date), N'NV02', 368000)
GO






INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD001', N'SP012', 1, 3000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD001', N'SP002', 4, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD001', N'SP004', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD002', N'SP002', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD002', N'SP007', 4, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD002', N'SP007', 1, 15000)

INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD002', N'SP006', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD003', N'SP003', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD004', N'SP006', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD005', N'SP001', 1, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD006', N'SP007', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD007', N'SP002', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD008', N'SP006', 1, 25000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD009', N'SP007', 1, 10000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD010', N'SP001', 1, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD011', N'SP005', 1, 200000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD012', N'SP007', 1, 12000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD013', N'SP001', 1, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD014', N'SP003', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD015', N'SP007', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD016', N'SP007', 1, 10000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD017', N'SP002', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD018', N'SP001', 1, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD019', N'SP004', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD020', N'SP007', 1, 12000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD021', N'SP002', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD022', N'SP004', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD022', N'SP006', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD022', N'SP007', 1, 10000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD022', N'SP002', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD022', N'SP001', 1, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD023', N'SP003', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD023', N'SP004', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD023', N'SP007', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD023', N'SP007', 1, 10000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD023', N'SP002', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD024', N'SP003', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD024', N'SP004', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD024', N'SP005', 1, 200000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD024', N'SP006', 1, 3000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD025', N'SP004', 5, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD026', N'SP005', 3, 200000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD027', N'SP003', 5, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD028', N'SP006', 9, 25000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD029', N'SP005', 5, 200000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD030', N'SP004', 3, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD030', N'SP003', 3, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD030', N'SP007', 2, 12000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD031', N'SP006', 2, 25000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD031', N'SP012', 2, 30000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD033', N'SP006', 2, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD033', N'SP007', 2, 10000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD033', N'SP012', 1, 30000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD033', N'SP006', 1, 25000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD034', N'SP005', 2, 200000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD034', N'SP007', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD034', N'SP007', 2, 10000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD034', N'SP001', 1, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD035', N'SP006', 1, 25000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD035', N'SP007', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD035', N'SP006', 1, 3000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD040', N'SP004', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD041', N'SP003', 2, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD042', N'SP007', 2, 12000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD045', N'SP004', 2, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD045', N'SP006', 2, 40000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD045', N'SP007', 1, 10000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD045', N'SP007', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD045', N'SP001', 1, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD032', N'SP006', 2, 25000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD032', N'SP007', 2, 10000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD032', N'SP007', 1, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD036', N'SP007', 40, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD037', N'SP003', 2, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD038', N'SP002', 2, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD039', N'SP005', 5, 200000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD043', N'SP007', 2, 12000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD044', N'SP004', 2, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD046', N'SP003', 1, 15000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD046', N'SP007', 10, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD046', N'SP001', 5, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD047', N'SP007', 10, 20000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD047', N'SP001', 6, 26000)
INSERT ChiTietHD (MaHD, MaMH, SoLuong, DonGia) VALUES (N'HD047', N'SP007', 1, 12000)
GO


INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN001     ', N'NCC001    ', CAST(N'2020-12-31' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN002     ', N'NCC002    ', CAST(N'2020-12-31' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN003     ', N'NCC003    ', CAST(N'2020-12-31' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN004     ', N'NCC004    ', CAST(N'2021-01-01' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN005     ', N'NCC005    ', CAST(N'2021-01-01' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN006     ', N'NCC006    ', CAST(N'2021-01-01' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN007     ', N'NCC007    ', CAST(N'2021-01-01' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN008     ', N'NCC008    ', CAST(N'2021-01-01' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN009     ', N'NCC009    ', CAST(N'2021-01-01' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN010     ', N'NCC010    ', CAST(N'2021-01-01' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN011     ', N'NCC003    ', CAST(N'2021-11-23' AS Date), N'NV01')
INSERT PhieuNhap (MaPN, MaNCC, NgayNhap, MaNV) VALUES (N'PN012     ', N'NCC002    ', CAST(N'2021-11-23' AS Date), N'AD')
GO


INSERT ChiTietCLV (MaCLV, MaNV, NgayLam)VALUES (N'CLV01', N'NV02', N'2020-05-01')
INSERT ChiTietCLV (MaCLV, MaNV, NgayLam)VALUES (N'CLV02', N'NV02', N'2020-12-01')
INSERT ChiTietCLV (MaCLV, MaNV, NgayLam)VALUES (N'CLV01', N'NV01', N'2020-12-11')
INSERT ChiTietCLV (MaCLV, MaNV, NgayLam)VALUES (N'CLV03', N'NV03', N'2020-02-01')
INSERT ChiTietCLV (MaCLV, MaNV, NgayLam)VALUES (N'CLV03', N'NV02', N'2020-02-01')
INSERT ChiTietCLV (MaCLV, MaNV, NgayLam)VALUES (N'CLV02', N'NV01', N'2019-02-01')
INSERT ChiTietCLV (MaCLV, MaNV, NgayLam)VALUES (N'CLV01', N'NV03', N'2020-10-01')
INSERT ChiTietCLV (MaCLV, MaNV, NgayLam)VALUES (N'CLV03', N'NV01', N'2020-03-01')
GO


INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN001     ', N'SP001', 20, 23000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN002     ', N'SP003', 50, 22500)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN002     ', N'SP005', 20, 180000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN002     ', N'SP004', 100, 7000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN003     ', N'SP007', 100, 15000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN003     ', N'SP006', 100, 2000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN003     ', N'SP002', 100, 15000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN004     ', N'SP012', 1000, 20000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN004     ', N'SP003', 100, 22500)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN004     ', N'SP002', 100, 15000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN004     ', N'SP006', 100, 2000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN004     ', N'SP001', 100, 21500)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN005     ', N'SP006', 100, 16000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN006     ', N'SP012', 100, 20000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN007     ', N'SP001', 100, 21500)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN008     ', N'SP002', 100, 15000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN009     ', N'SP006', 100, 15000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN010     ', N'SP007', 398, 9000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN010     ', N'SP007', 79, 7000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN011     ', N'SP001', 8, 21500)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN012     ', N'SP002', 12, 15000)
INSERT ChiTietPN (MaPN, MaMH, SoLuong, DonGia) VALUES (N'PN004     ', N'SP006', 100, 2000)
GO

/*

CREATE FUNCTION fn_Get_MaDonHang_Next(@MaHD NVARCHAR(50))
RETURNS NVARCHAR(50) 
AS
BEGIN
	SET @MaHD+='%'; 
    DECLARE @MaHD_Next VARCHAR(15)
    SELECT @MaHD_Next = (
        SELECT TOP 1 MaHD
        FROM HoaDon    
        WHERE MaHD like @MaHD
		ORDER BY MaHD DESC
    )    
	DECLARE  @n INT
	SET @n = CONVERT(INT, RIGHT(@MaHD_Next,3)) +1
	SET @MaHD_Next = LEFT(@MaHD,10) + RIGHT('000'+CONVERT(varchar(3),@n),3)
    RETURN @MaHD_Next
END
GO


CREATE FUNCTION GetUnsignString(@strInput NVARCHAR(4000)) 
RETURNS NVARCHAR(4000)
AS
BEGIN     
    IF @strInput IS NULL RETURN @strInput
    IF @strInput = '' RETURN @strInput
    DECLARE @RT NVARCHAR(4000)
    DECLARE @SIGN_CHARS NCHAR(136)
    DECLARE @UNSIGN_CHARS NCHAR (136)

    SET @SIGN_CHARS       = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ'+NCHAR(272)+ NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'

    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
    SET @COUNTER = 1
 
    WHILE (@COUNTER <=LEN(@strInput))
    BEGIN   
      SET @COUNTER1 = 1
      --Tim trong chuoi mau
       WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1)
       BEGIN
     IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
     BEGIN           
          IF @COUNTER=1
              SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)                   
          ELSE
              SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER)    
              BREAK         
               END
             SET @COUNTER1 = @COUNTER1 +1
       END
      --Tim tiep
       SET @COUNTER = @COUNTER +1
    END
    RETURN @strInput
END
GO
*/


CREATE PROCEDURE USP_GetHoaDon
@MaHD nvarchar(50)
AS
BEGIN
	select *
from MatHang, ChiTietHD, HoaDon
where MatHang.MaMH = ChiTietHD.MaMH and ChiTietHD.MaHD = HoaDon.MaHD and HoaDon.MaHD = @MaHD
END
GO


CREATE PROCEDURE USP_GetSLTon
AS
BEGIN
select ChiTietHD.MaMH AS N'Mã Hàng',MatHang.TenMH AS N'Tên Hàng',MatHang.GiaBan AS N'Giá',SUM(ChiTietHD.SoLuong) AS N'Số Lượng Đã Bán', MatHang.SoLuong AS N'Số Lượng Tồn' 
from ChiTietHD, MatHang where ChiTietHD.MaMH = MatHang.MaMH 
group by ChiTietHD.MaMH, MatHang.TenMH, MatHang.SoLuong, MatHang.GiaBan
order by N'Số Lượng Đã Bán' desc
END
GO


create proc USP_SelectMaHD
@MaHD nvarchar(20)
as
begin
	select * from HoaDon where HoaDon.MaHD = MaHD;
end
GO


CREATE PROCEDURE USP_ThongKe7Ngay
@ngaybd date, @ngaykt date
AS
BEGIN
	select DAY(NgayTao) AS 'Ngay', sum(HoaDon.TongTien) AS 'TongTien'
	from HoaDon
	where @ngaybd <= HoaDon.NgayTao and @ngaykt >= HoaDon.NgayTao
	group by NgayTao 
END
GO




CREATE PROCEDURE USP_TKHD
@ngaybd date, @ngaykt date
AS
BEGIN
	select HoaDon.MaHD AS 'Mã HĐ', HoaDon.NgayTao AS 'Ngày Tạo', KhachHang.TenKH AS 'Tên Khách Hàng', HoaDon.TongTien AS 'Tổng Tiền', HoaDon.MaNV AS 'Người Tạo'
from HoaDon, KhachHang
where @ngaybd <= HoaDon.NgayTao and @ngaykt >= HoaDon.NgayTao and KhachHang.MaKH = HoaDon.MaKH
order by HoaDon.TongTien desc
END
GO


CREATE PROCEDURE USP_TKKH
AS
BEGIN
select KhachHang.MaKH as N'Mã khách hàng', KhachHang.TenKH as N'Tên khách hàng', KhachHang.SDT as N'Số điện thoại',SUM(HoaDon.TongTien) AS N'Tổng Tiền', COUNT(HoaDon.MaHD) AS N'Số lần mua hàng'
from HoaDon, KhachHang
where KhachHang.MaKH = HoaDon.MaKH
group by KhachHang.TenKH, KhachHang.MaKH, KhachHang.SDT, KhachHang.DiaChi, KhachHang.Email
order by SUM(HoaDon.TongTien) desc
END
GO




CREATE PROCEDURE USP_TKPN
@ngaybd date, @ngaykt date
AS
BEGIN
select PhieuNhap.MaPN, PhieuNhap.NgayNhap,NhaCungCap.TenNCC, ChiTietPN.MaMH, ChiTietPN.SoLuong, 
ChiTietPN.DonGia,ChiTietPN.SoLuong * ChiTietPN.DonGia AS 'Tổng Tiền', PhieuNhap.MaNV
from PhieuNhap, ChiTietPN, NhaCungCap
where PhieuNhap.MaPN = ChiTietPN.MaPN and PhieuNhap.MaNCC = NhaCungCap.MaNCC
and @ngaybd <= PhieuNhap.NgayNhap and @ngaykt >= PhieuNhap.NgayNhap
END
GO





















---- CHÍ 

--- THỐNG KÊ PHIẾU NHẬP ----
create proc USP_tkPhieunhap
as
select MaPN as N'Mã phiểu nhập', NgayNhap as N'Ngày nhập hàng',TenNCC as N'Nhà cung cấp',TenHienThi as N'Nhân viên nhập'
from PhieuNhap inner join NhaCungCap on PhieuNhap.MaNCC = NhaCungCap.MaNCC inner join NhanVien on PhieuNhap.MaNV = NhanVien.MaNV


USP_tkPhieunhap


--- XEM CHI TIẾT PHIẾU NHẬP ----
create proc USP_Chitietpn(
   @mapn nchar (10)
)
as
select ChiTietPN.MaPN,ChiTietPN.MaMH,MatHang.TenMH,ChiTietPN.SoLuong,ChiTietPN.DonGia,PhieuNhap.MaNV,NhanVien.TenHienThi,NhanVien.Quyen,PhieuNhap.MaNCC,NhaCungCap.TenNCC,PhieuNhap.NgayNhap
from  ChiTietPN inner join MatHang on ChiTietPN.MaMH = MatHang.MaMH inner join PhieuNhap on 
ChiTietPN.MaPN = PhieuNhap.MaPN inner join NhanVien on NhanVien.MaNV = PhieuNhap.MaNV inner join NhaCungCap on PhieuNhap.MaNCC = NhaCungCap.MaNCC
where ChiTietPN.MaPN = @mapn






---- THỐNG KÊ HÀNG HÓA -----
create proc USP_TKMatHang
as
select MatHang.MaMH as N'Mã hàng hóa',MatHang.TenMH as N'Tên hàng hóa',DonViTinh.TenDVT as N'Đơn vị tính',sum(ChitietPN.Soluong) as N'Số lượng nhập',MatHang.SoLuong as N'Số lượng tồn', (sum(ChitietPN.Soluong) - MatHang.SoLuong) as N'Số lượng bán',MatHang.GiaBan as N'Giá bán'
from MatHang inner join ChiTietPN on MatHang.MaMH = ChiTietPN.MaMH inner join DonViTinh on DonViTinh.MaDVT = MatHang.DonVi
group by MatHang.MaMH,MatHang.SoLuong,MatHang.TenMH,MatHang.DonVi,DonViTinh.TenDVT,MatHang.GiaBan


USP_TKMatHang








CREATE PROCEDURE InsertImage
@filename nvarchar(250),
@blobdata image
AS
insert into HinhAnh values(
@filename, @blobdata
)
GO

create proc USP_Inhoadon(
  @mahd nvarchar (50)
)
as
select HoaDon.MaHD,TenKH,KhachHang.SDT,KhachHang.DiaChi,Email,HoaDon.NgayTao,NhanVien.MaNV,NhanVien.TenHienThi,MatHang.TenMH,ChiTietHD.SoLuong,ChiTietHD.DonGia
from HoaDon inner join KhachHang on HoaDon.MaKH = KhachHang.MaKH inner join NhanVien on NhanVien.MaNV = HoaDon.MaNV inner join ChiTietHD on ChiTietHD.MaHD = HoaDon.MaHD inner join MatHang on MatHang.MaMH = ChiTietHD.MaMH
where HoaDon.MaHD = @mahd





