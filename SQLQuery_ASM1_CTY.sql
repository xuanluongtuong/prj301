
--CREATE TABLE
CREATE TABLE dbo.PHONGBAN
(
	MAPH INT PRIMARY KEY NOT NULL,
	TENPH NVARCHAR(30),
	QUANLY NVARCHAR(30),
	DIADIEM NVARCHAR(30)
);

CREATE TABLE dbo.KHACHHANG
(
	MAKH NVARCHAR(10) PRIMARY KEY NOT NULL,
	TENKH NVARCHAR(50),
	NGAYSINH DATE,
	PHAI NVARCHAR(3),
	DCKH NVARCHAR(50),
	SDTKH NVARCHAR(11),
	EMAILKH NVARCHAR(30)	
);

CREATE TABLE dbo.DU_AN
(
	MADA NVARCHAR(10) PRIMARY KEY NOT NULL,
	TENDA NVARCHAR(50),
	DIADIEM NVARCHAR(80),
	NGANSACH FLOAT,
	NGAYTHICONG DATE,
	MAKH NVARCHAR(10),
	FOREIGN KEY (MAKH) REFERENCES dbo.KHACHHANG(MAKH)
);


--CREATE TABLE dbo.PHANCONG
--(	
--	MADA NVARCHAR(10) NOT NULL,
--	FOREIGN KEY (MADA) REFERENCES dbo.DU_AN(MADA),
--	MAPH INT NOT NULL,
--	FOREIGN KEY (MAPH) REFERENCES dbo.PHONGBAN(MAPH),
--	NGAY_PHU_TRACH DATE
--);


CREATE TABLE dbo.NHANVIEN
(
	MANV NVARCHAR(10) NOT NULL PRIMARY KEY,
	HO_VA_TEN NVARCHAR(30),
	TEN NVARCHAR(10),
	PHAI NVARCHAR(3),
	NGAYSINH DATE,
	DIACHI NVARCHAR(30),
	--SDT NVARCHAR(10),
	EMAIL NVARCHAR(30),
	VITRI NVARCHAR(50),
	MAQL NVARCHAR(10),
	PHONGBAN NVARCHAR(30),
	MAPH INT,
	LUONG FLOAT NOT NULL,	
	FOREIGN KEY (MAQL) REFERENCES dbo.NHANVIEN(MANV),
	FOREIGN KEY (MAPH) REFERENCES dbo.PHONGBAN(MAPH)
);


CREATE TABLE dbo.CONGVIEC
(
	MANV NVARCHAR(10),
	FOREIGN KEY (MANV) REFERENCES dbo.NHANVIEN(MANV),
	MADA NVARCHAR(10) NOT NULL,
	FOREIGN KEY (MADA) REFERENCES dbo.DU_AN(MADA),
	NGAYBDLAM DATE,
	GIOLAM FLOAT
);

--CREATE TABLE dbo.HOPDONG_LD
--(
--	MAHD NVARCHAR(10) PRIMARY KEY NOT NULL,
--	NGAYKY DATE,
--	THOIHAN_NEUCO DATE,
--	GIATRI FLOAT,
--	LAODONG NVARCHAR(30)
--);

--CREATE TABLE dbo.BAOCAO
--(
--	MABC NVARCHAR(10) PRIMARY KEY NOT NULL,
--	TENBC NVARCHAR(30),
--	NGAYTAO DATE,
--	NGUOIBC NVARCHAR(10),
--	NGUOIDUYET NVARCHAR(10)
--	FOREIGN KEY (NGUOIBC) REFERENCES dbo.NHANVIEN(MANV),
--	FOREIGN KEY (NGUOIDUYET) REFERENCES dbo.NHANVIEN(MANV)
--);

--CREATE TABLE dbo.HOPDONG_DA
--(
--	MAHD NVARCHAR(10) PRIMARY KEY NOT NULL,
--	TENHD NVARCHAR(50),
--	NGAYKY DATE,
--	THOIHAN_NEUCO DATE,
--	GIATRI FLOAT,
--	KHACHHANG NVARCHAR(50),
--	MAKH NVARCHAR(10),
--	FOREIGN KEY (MAKH) REFERENCES dbo.KHACHHANG(MAKH)
--);

CREATE TABLE dbo.NCC
(
	MANCC NVARCHAR(10) PRIMARY KEY NOT NULL,
	TENNCC NVARCHAR(50),
	DCNCC NVARCHAR(50),
	SDTNCC NVARCHAR(11),
	EMAILNCC NVARCHAR(30),
	NGUOILH NVARCHAR(30)
);

CREATE TABLE dbo.VATLIEU
(
MAVL NVARCHAR(10) PRIMARY KEY NOT NULL,
TENVL NVARCHAR(30),
SL_DABAN INT,
SL_TONKHO INT,
DONVI INT,
GIATHANH FLOAT,
MANCC NVARCHAR(10),
FOREIGN KEY (MANCC) REFERENCES dbo.NCC(MANCC)
);

CREATE TABLE dbo.THIETKE
(
	MATK NVARCHAR(10) PRIMARY KEY NOT NULL,
	TENTK NVARCHAR(30),
	KICHTHUOC NVARCHAR(20),
	NGUOITHIETKE NVARCHAR(30)
);

CREATE TABLE dbo.TK_DA
(
	MATK NVARCHAR(10),
	FOREIGN KEY (MATK) REFERENCES dbo.THIETKE(MATK),
	MADA NVARCHAR(10),
	FOREIGN KEY (MADA) REFERENCES dbo.DU_AN(MADA)
);

CREATE TABLE dbo.TL_VL
(
MATK NVARCHAR(10),
FOREIGN KEY (MATK) REFERENCES dbo.THIETKE(MATK),
MAVL NVARCHAR(10),
FOREIGN KEY (MAVL) REFERENCES dbo.VATLIEU(MAVL),
SL_SD INT
);

--CREATE TABLE dbo.HOPDONG_NCC
--(
--	MAHD NVARCHAR(10) PRIMARY KEY NOT NULL,
--	NGAYKY DATE,
--	THOIHAN_NEUCO DATE,
--	GIATRI FLOAT,
--	NCC NVARCHAR(50)
--);


--INSERT VALUE

INSERT INTO 
	dbo.PHONGBAN (MAPH, TENPH, QUANLY, DIADIEM)
VALUES
	(1, N'Phòng quản lý dự án', N'NV0001', N'Hà Nội'),
	(2, N'Phòng thiết kế', N'NV0002', N'Hà Nội'),
	(3, N'Phòng kỹ thuật', N'NV0003', N'Hà Nội'),
	(4, N'Phòng tài chính', N'NV0004', N'Hà Nội'),	
	(5, N'Phòng kinh doanh', N'NV0005', N'Hà Nội'),
	(6, N'Phòng hành chính', N'NV0006', N'Hà Nội');

INSERT INTO 
	dbo.DU_AN(MADA, TENDA, DIADIEM, NGANSACH,NGAYTHICONG, MAKH)
VALUES
	(N'DA0001', N'Nhà 167 Trương Định', N'167 Trương Định, Hai Bà Trưng, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0002', N'Nhà 179 Trương Định', N'179 Đường Trương Định, Hai Bà Trưng, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0003', N'Nhà 47 Hòa Bình 4/Minh Khai', N'Ngách 47, Ngõ Hòa Bình 4, Hai Bà Trưng, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0004', N'Nhà 112/5 Nghĩa Tân', N'Ngách 5, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0005', N'Nhà 112/7 Nghĩa Tân', N'Ngách 7, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0006', N'Nhà 29/7 Phố Trạm', N'Ngách 7, Ngõ 29 Phố Trạm, Long Biên, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0007', N'Nhà 189 Nguyễn Văn Cừ', N'Ngõ 189, Đường Nguyễn Văn Cừ,  Long Biên, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0008', N'Nhà 65P.Bằng Liệt', N'Ngõ 65 Phố Bằng Liệt, Hoàng Mai, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0009', N'Nhà 90 Cầu Bươu',N'90 Ngõ 2 Cầu Bươu, Thanh Trì, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0010', N'Nhà 425 Phan Trọng Tuệ', N'425 Đường Phan Trọng Tuệ, Thị trấn Văn Điển, Thanh Trì, Hà Nội', 700,N'2022-06-11', N'KH001'),
	(N'DA0011', N'Văn phòng Misa', N'Tầng 1 + 2, Sàn thương mại N03 - T2 Khu Đoàn Ngoại Giao, Phường Xuân Tảo,Bắc Từ Liêm, Hà Nội',
	(N'DA0012', N'Văn phòng Tofu', N'Số 12 Nguyễn Thị Định, Phường Trung Hòa, Quận Cầu Giấy, Hà Nội'
	(N'DA0013', N'Văn phòng VNG', N'165 Phố Thái Hà, Láng Hạ, Đống Đa, Hà Nội', 
	(N'DA0014', N'Văn phòng Beeketing', N'Tầng 01 và Tầng 03 tòa NO CT2 – E4 Khu Đô Thị Mới Yên Hòa, Phường Yên Hòa, Cầu Giấy, Hà Nội',
	(N'DA0015', N'Văn phòng Gameloft', N'Tầng 2 khối văn phòng, Toà nhà Tây Hà, 19 phố Tố Hữu, Phường Trung Văn, Nam Từ Liêm, Hà Nội',
	(N'DA0016', N'Căn hộ chung cư IEC Complex', N'Đường Trần Thủ Độ, Tứ Hiệp, Thanh Trì, Hà Nội',
	(N'DA0017', N'Căn hộ chung cư Thanh Hà', N'Thanh Hà Cự khê Thanh oai, Hà Đông, Hà Nội',
	(N'DA0018', N'Căn hộ chung cư Vinhomes Smart City', N'TTTM Vincom Mega Mall Smart City, Tây Mỗ, Nam Từ Liêm, Hà Nội',
	(N'DA0019', N'Căn hộ chung cư Thăng Long Victory', N'Lô đất HH1, Khu đô thị Nam An Khánh, Hoài Đức, Hà Nội',
	(N'DA0020', N'Căn hộ chung cư The Golden An Khánh 18T1', N'Lô HH6, An Khánh, Hoài Đức, Hà Nội',
	(N'DA0021', N'Tòa nhà Lotte Center Hà Nội', N'54 Liễu Giai, Ba Đình, Hà Nội',
	(N'DA0022', N'Tòa nhà Techno Park Tower', N'Vinhomes Ocean Park, Gia Lâm, Hà Nội',
	(N'DA0023', N'Tòa chung cư Landmark 51', N'48 Vạn Phúc, Hà Đông, Hà Nội',
	(N'DA0024', N'
	--(N'DA0025', N'Nhà ga 9 3/4', N'Hà Nội'),
	--(N'DA0026', N'Thiết kế thi công Trụ sở Hội đồng phép thuật tại Việt Nam', N'TP.HCM'),
	--(N'DA0027', N'Thiết kế thi công Đại Học Hogwarts Việt Nam (Vietnamese Hogwarts University)', N'Hà Nội');
	--(N'DA0028', N'Thiết kế thi công nhà xe đại học FPT', N'Hà Nội');

INSERT INTO
	dbo.KHACHHANG(MAKH, TENKH, NGAYSINH, PHAI, DCKH, SDTKH,EMAILKH)
VALUES
	(N'KH0001', N'Bùi Đức Thịnh', N'167 Trương Định, Quận Hai Bà Trưng, Hà Nội', )

INSERT INTO 
	dbo.NHANVIEN(MANV,HO_VA_TEN,TEN,PHAI,NGAYSINH,DIACHI,EMAIL,VITRI,MAQL,PHONGBAN,MAPH)
VALUES
	(N'NV0001', N'Đào Quý Nhân', N'Nhân', N'Nam', '1989-09-09', N'Đà Nẵng',N'nhandq@gmail.com',N'Giám đốc dự án',N'NV0001', N'Phòng quản lý dự án', 1, 30),
	(N'NV0002', N'Nguyễn Minh Bách', N'Bách', N'Nam', '1990-10-27',N'Hà Nội',N'bachnm@gmail.com',N'Giám đốc thiết kế',N'NV0002',N'Phòng thiết kế', 2, 30),
	(N'NV0003', N'Đoàn Phan Thuận', N'Thuận', N'Nam', '1989-03-05',N'Hà Nội',N'thuandp@gmail.com',N'Trưởng ban kỹ thuật',N'NV0003',N'Phòng kỹ thuật', 3, 30),
	(N'NV0004', N'Trần Phương Anh', N'Anh', N'Nữ', '1994-05-22', N'Hà Nội', N'anhtp@gmail.com',N'Giám đốc tài chính',N'NV0004',N'Phòng tài chính', 4, 30),
	(N'NV0005', N'Nguyễn Hương Lan',N'Lan', N'Nữ', '1992-06-20',N'Hà Nội', N'lannh@gmail.com',N'Giám đốc kinh doanh',N'NV0005', N'Phòng kinh doanh',5, 30),
	(N'NV0006', N'Nguyễn Anh Hỉa',N'Hỉa',N'Nam','1991-05-17',N'Hà Nội',N'hiana@gmail.com',N'Trưởng phòng hành chính',N'NV0006', N'Phòng hành chính',6, 25),
	(N'NV0007', N'Phạm Hồng Thái',N'Thái', N'Nam','1989-04-29',N'Hưng Yên', N'thaiph@gmail.com', N'Quản lý dự án', N'NV0001', N'Phòng quản lý dự án', 1, 10),
	(N'NV0008', N'Nguyễn Duy Phong', N'Phong',N'Nam', '1990-11-22',N'Vĩnh Phúc', N'phongnd@gmail.com', N'Chuyên viên kỹ thuật', N'NV0001', N'Phòng quản lý dự án', 1, 10),
	(N'NV0009', N'Nguyễn Đình Dũng', N'Dũng',N'Nam','1994-03-25', N'Hà Tĩnh', N'dungnd@gmail.com', N'Chuyên viên tài chính', N'NV0001', N'Phòng quản lý dự án',1, 10),
	(N'NV0010', N'Vũ Quỳnh Chi', N'Chi',N'Nữ', '1994-02-07', N'Hà Nội', N'chivq@gamil.com',N'Trưởng phòng thiết kế', N'NV0002', N'Phòng thiết kế', 2, 20),
	(N'NV0011', N'Nguyễn Tuấn Hưng', N'Hưng',N'Nam', '1992-10-23', N'Hà Nội', N'hungnt@gmail.com', N'Nhân viên thiết kế', N'NV0002',N'Phòng thiết kế',2, 10),
	(N'NV0012', N'Trần Phương Lam', N'Lam', N'Nữ', '1994-01-23', N'Hà Nội', N'lamtt@gmail.com', N'Kỹ sư cầu nối', N'NV0002', N'Phòng thiết kế', 2, 10),
	(N'NV0013', N'Nguyễn Thanh Lam', N'Lam', N'Nữ', '1993-02-13', N'Nam Định', N'lamnt@gmail.com', N'Kỹ sư chuyên môn', N'NV0002', N'Phòng thiết kế', 2, 10),
	(N'NV0014', N'Mai Thu Hương', N'Hương', N'Nữ', '1995-04-16', N'Hải Dương', N'huongmt@gmail.com', N'Kiến trúc sư', N'NV0003', N'Phòng kỹ thuật', 3, 15),
	(N'NV0015', N'Nguyễn Anh Tuấn', N'Tuấn', N'Nam', '1992-12-27', N'Hải Dương', N'tuanna@gmail.com', N'Kỹ sư thiết kế', N'NV0003', N'Phòng kỹ thuật', 3, 15),
	(N'NV0016', N'Nguyễn Trọng Hữu', N'Hữu', N'Nam', '1993-05-08', N'Vĩnh Phúc', N'huunt@gmail.com', N'Kỹ sư an toàn', N'NV0003', N'Phòng kỹ thuật', 3, 10),
	(N'NV0017', N'Trần Thị Phương Anh', N'Anh', N'Nữ', '1994-12-24', N'Hà Nội', N'anhttp@gmail.com', N'Kỹ sư thiết kế', N'NV0003', N'Phòng kỹ thuật', 3, 10),
	(N'NV0018', N'Nguyễn Quang Trung', N'Trung', N'Nam', '1990-06-08', N'Nam Định', N'trungnq@gamil.com', N'Kiến trúc sư', N'NV0003', N'Phòng kỹ thuật', 3, 10),
	(N'NV0019', N'Nguyễn Quang Hưng', N'Hưng', N'Nam', '1991-07-19', N'Hà Tĩnh', N'hungnq@gmail.com', N'Kỹ thuật viên', N'NV0003', N'Phòng kỹ thuật', 3, 10),
	(N'NV0020', N'Trần Đình Trọng', N'Trọng', N'Nam', '1993-02-22', N'Nam Định', N'trongtd@gmail.com', N'Chuyên viên sản xuất', N'NV0003', N'Phòng kỹ thuật', 3, 10),
	(N'NV0021', N'Kiều Đức Mạnh', N'Mạnh', N'Nam', '1990-03-09', N'Hà Nội', N'manhkd@gmail.com', N'Quản lý kế toán', N'NV0004', N'Phòng tài chính', 4, 15),
	(N'NV0022', N'Mai Thị Trà My', N'My', N'Nữ', '1994-12-23', N'Hà Nội', N'mymtt@gmail.com', N'Kế Toán Trưởng', N'NV0004', N'Phòng tài chính', 4, 15),
	(N'NV0023', N'Phan Vân Anh', N'Anh', N'Nữ', '1995-10-20', N'Hà Nội', N'anhpv@gmail.com', N'Kế toán viên', N'NV0004', N'Phòng tài chính', 4, 10),
	(N'NV0024', N'Ngô Minh Đức', N'Đức', N'Nam', '1993-12-10', N'Hà Nội', N'ducnm@gmail.com', N'Chuyên viên thuế', N'NV0004', N'Phòng tài chính', 4, 10),
	(N'NV0025', N'Nguyễn Hải Anh', N'Anh', N'Nam', '1990-02-28', N'Hải Dương', N'anhnh@gmail.com', N'Chuyên viên tài chính', N'NV0004', N'Phòng tài chính', 4, 10),
	(N'NV0026', N'Trần Thanh Tâm', N'Tâm', N'Nữ', '1995-11-20', N'Vĩnh Phúc', N'tamtt@gmail.com', N'Nhân viên hành chính kế toán', N'NV0004', N'Phòng tài chính', 4, 10),
	(N'NV0027', N'Nguyễn Hồng Sơn', N'Sơn', N'Nam', '1992-12-30', N'Hưng Yên', N'sonnh@gmail.com', N'Chuyên viên kiểm toán', N'NV0004', N'Phòng tài chính', 4, 10),
	(N'NV0028', N'Nguyễn Hồng Thái', N'Thái', N'Nam', '1991-08-16', N'Hà Nội', N'thainh@gmail.com', N'Chuyên viên phân tích tài chính', N'NV0004', N'Phòng tài chính', 4, 10),
	(N'NV0029', N'Phạm Thanh Sơn', N'Sơn', N'Nam', '1993-04-25', N'Hà Nội', N'sonpt@gmail.com', N'kế toán viên', N'NV0004', N'Phòng tài chính', 4, 10),
	(N'NV0030', N'Mai Trà My', N'My', N'Nữ', '1995-03-12', N'Nam Định', N'mymt@gmail.com', N'kế toán viên', N'NV0004', N'Phòng tài chính', 4, 10),
	(N'NV0031', N'Nguyễn Gia Bảo',N'Bảo', N'Nam', '1993-02-20', N'Hà Nội', N'baong@gmail.com', N'Trưởng phòng kinh doanh',N'NV0005', N'Phòng kinh doanh',5, 20),
	(N'NV0032', N'Mai Nam Hải', N'Hải', N'Nam', '1990-05-04', N'Hải Dương', N'haimn@gmail.com', N'Nhân viên kinh doanh',N'NV0005', N'Phòng kinh doanh',5, 10),
	(N'NV0033', N'Đinh Ngọc Hùng',N'Hùng', N'Nam', '1995-09-08', N'Hà Nội', N'hungdn@gmail.com', N'Kế toán kinh doanh',N'NV0005', N'Phòng kinh doanh',5, 10),
	(N'NV0034', N'Lưu Minh Anh', N'Anh', N'Nữ', '1995-11-29', N'Hà Nội', N'anhlm@gmail.com', N'Chuyên viên khách hàng',N'NV0005', N'Phòng kinh doanh',5, 10),
	(N'NV0035', N'Nguyễn Ngọc Huyền',N'Huyền', N'Nữ', '1994-02-19', N'Hà Nội', N'huyennn@gmail.com', N'Chuyên viên marketing',N'NV0005', N'Phòng kinh doanh',5, 15),
	(N'NV0036', N'Nguyễn Thị Hồng Ngọc', N'Ngọc', N'Nữ', '1995-11-21', N'Hà Nội', N'ngocnth@gmail.com', N'Chuyên viên quản lý dữ liệu kinh doanh',N'NV0005', N'Phòng kinh doanh',5, 15),
	(N'NV0037', N'Vũ Thị Thanh Mai', N'Mai', N'Nữ', '1992-12-04', N'Hà Nội', N'maivtt@gmail.com', N'Chuyên viên phân tích thị trường',N'NV0005', N'Phòng kinh doanh',5, 15),
	(N'NV0038', N'Nguyễn Hoài Nam', N'Nam', N'Nam', '1994-04-04', N'Hà Nội', N'namnh@gmail.com', N'Trưởng phòng hành chính',N'NV0006', N'Phòng hành chính',6, 15),
	(N'NV0039', N'Nguyễn Vũ Hồng Ngọc', N'Ngọc', N'Nữ', '1993-11-09', N'Hà Nội', N'ngocnvh@gmail.com', N'Nhân viên hành chính',N'NV0006', N'Phòng hành chính',6, 10),
	(N'NV0040', N'Trần Thị Thu Hương', N'Hương', N'Nữ', '1994-05-05', N'Hà Nội', N'huongttt@gmail.com', N'Nhân viên hỗ trợ khách hàng',N'NV0006', N'Phòng hành chính',6, 10),
	(N'NV0041', N'Lưu Đức Mạnh', N'Mạnh', N'Nam', '1992-10-22', N'Hà Nội', N'manhld@gmail.com', N'Chuyên viên tuyển dụng',N'NV0006', N'Phòng hành chính',6, 10),
	(N'NV0042', N'Nguyễn Anh Tài', N'Tài', N'Nam', '1990-11-26', N'Hà Nội', N'taina@gmail.com', N'Chuyên viên tuyển dụng',N'NV0006', N'Phòng hành chính',6, 10),
	(N'NV0043', N'Nguyễn Thu Phương', N'Phương', N'Nữ', '1995-03-17', N'Hải Dương', N'phuongnt@gmail.com', N'Nhân viên hỗ trợ khách hàng',N'NV0006', N'Phòng hành chính',6, 10),
	(N'NV0044', N'Nguyễn Thu Hằng', N'Hằng',N'Nữ', '1992-04-10', N'Hà Nội', N'hangnt@gmail.com', N'Thư ký',N'NV0006', N'Phòng hành chính',6, 10),
	(N'NV0045', N'Nguyễn Thị Vân', N'Vân', N'Nữ', '1995-07-10', N'Nam Định', N'vannt@gmail.com', N'Nhân viên hỗ trợ khách hàng',N'NV0006', N'Phòng hành chính',6, 10);
	

