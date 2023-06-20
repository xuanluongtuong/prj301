
--CREATE TABLE

CREATE TABLE dbo.ACCOUNT(
	accountID INT PRIMARY KEY identity(1,1) NOT NULL,
	email NVARCHAR(50) NOT NULL,
	[password] NVARCHAR(30) NOT NULL,
	username NVARCHAR(30) NOT NULL,	
	phone NVARCHAR(10) NOT NULL,
	[role] INT NOT NULL
);


insert into dbo.ACCOUNT values(N'admin@gmail.com', N'111', N'Administrator',N'1111111111',1)

drop table dbo.ACCOUNT

select * from dbo.ACCOUNT 

CREATE TABLE dbo.PHONGBAN
(
	MAPB INT PRIMARY KEY identity(1,1) NOT NULL,
	TENPB NVARCHAR(30),
	MAQL INT NOT NULL,
	DIADIEM NVARCHAR(30)
);

drop table dbo.PHONGBAN

CREATE TABLE dbo.KHACHHANG
(
	MAKH INT PRIMARY KEY identity(1,1) NOT NULL,
	TENKH NVARCHAR(50),	
	DCKH NVARCHAR(1000),
	SDTKH NVARCHAR(11),
	EMAILKH NVARCHAR(30)	
);

select * from dbo.KHACHHANG

CREATE TABLE dbo.DU_AN
(
	TENKH NVARCHAR(50),
	MADA INT PRIMARY KEY identity(1,1) NOT NULL,
	TENDA NVARCHAR(100),
	DIADIEM NVARCHAR(1000),
	NGANSACH FLOAT,
	NGAYTHICONG DATE,		
	TRANGTHAI INT,	
	IMG NVARCHAR(1000)
);

drop table dbo.DU_AN
drop table dbo.KHACHHANG

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
	MANV INT PRIMARY KEY identity(1,1) NOT NULL,
	HO_VA_TEN NVARCHAR(50),
	TEN NVARCHAR(10),
	PHAI BIT,
	NGAYSINH DATE,
	DIACHI NVARCHAR(100),
	SDT NVARCHAR(10),
	EMAIL NVARCHAR(100),
	VITRI NVARCHAR(100),
	MAQL INT,
	PHONGBAN NVARCHAR(100),
	MAPB INT,
	LUONG FLOAT NOT NULL,	
	
	FOREIGN KEY (MAPB) REFERENCES dbo.PHONGBAN(MAPB)
);

drop table dbo.NHANVIEN
select * from dbo.NHANVIEN

CREATE TABLE dbo.CONGVIEC
(
	MANV INT,
	FOREIGN KEY (MANV) REFERENCES dbo.NHANVIEN(MANV),
	MADA INT NOT NULL,
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
	MANCC INT PRIMARY KEY identity(1,1) NOT NULL,
	TENNCC NVARCHAR(50),
	DCNCC NVARCHAR(50),
	SDTNCC NVARCHAR(11),
	EMAILNCC NVARCHAR(30),
	NGUOILH NVARCHAR(30)
);

CREATE TABLE dbo.VATLIEU
(
MAVL INT PRIMARY KEY identity(1,1) NOT NULL,
TENVL NVARCHAR(30),
SL_DABAN INT,
SL_TONKHO INT,
DONVI INT,
GIATHANH FLOAT,
MANCC INT,
FOREIGN KEY (MANCC) REFERENCES dbo.NCC(MANCC)
);

CREATE TABLE dbo.THIETKE
(
	MATK INT PRIMARY KEY identity(1,1) NOT NULL,
	TENTK NVARCHAR(30),
	KICHTHUOC NVARCHAR(20),
	NGUOITHIETKE NVARCHAR(30)
);

CREATE TABLE dbo.TK_DA
(
	MATK INT,
	FOREIGN KEY (MATK) REFERENCES dbo.THIETKE(MATK),
	MADA INT,
	FOREIGN KEY (MADA) REFERENCES dbo.DU_AN(MADA)
);

CREATE TABLE dbo.TL_VL
(
MATK INT,
FOREIGN KEY (MATK) REFERENCES dbo.THIETKE(MATK),
MAVL INT,
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

select * from dbo.ACCOUNT where username = 'admin' and password ='123'
--drop table dbo.ACCOUNT
--INSERT INTO
--	dbo.ACCOUNT(username,password)
--VALUES
--	(N'admin',N'123');

INSERT INTO 
	dbo.PHONGBAN (TENPB, MAQL,DIADIEM)
VALUES
	( N'Phòng quản lý dự án',1, N'Tầng 3, Tòa nhà A'),
	( N'Phòng thiết kế',2,  N'Tầng 3, Tòa nhà A'),
	( N'Phòng kỹ thuật', 3, N'Tầng 3, Tòa nhà A'),
	( N'Phòng tài chính',4, N'Tầng 3, Tòa nhà A'),	
	( N'Phòng kinh doanh', 5, N'Tầng 3, Tòa nhà A'),
	( N'Phòng hành chính', 6, N'Tầng 3, Tòa nhà A');

INSERT INTO dbo.DU_AN(TENKH, TENDA, DIADIEM, NGANSACH, NGAYTHICONG, TRANGTHAI,IMG)
VALUES
    (N'Bùi Đức Thịnh', N'Nhà 167 Trương Định', N'167 Trương Định, Hai Bà Trưng, Hà Nội', 870, '2022-06-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Lê Văn Phụng', N'Nhà 179 Trương Định', N'179 Đường Trương Định, Hai Bà Trưng, Hà Nội', 800, '2021-12-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Nguyễn Thị Thúy', N'Nhà 47 Hòa Bình 4/Minh Khai', N'Ngách 47, Ngõ Hòa Bình 4, Hai Bà Trưng, Hà Nội', 830, '2021-06-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Võ Thái Bắc', N'Nhà 112/5 Nghĩa Tân', N'Ngách 5, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội', 840, '2022-08-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Đặng Đức Hoàng', N'Nhà 112/7 Nghĩa Tân', N'Ngách 7, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội', 820, '2021-12-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Nguyễn Trung Kiên', N'Nhà 29/7 Phố Trạm', N'Ngách 7, Ngõ 29 Phố Trạm, Long Biên, Hà Nội', 850, '2021-03-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Trịnh Quốc Toàn', N'Nhà 189 Nguyễn Văn Cừ', N'Ngõ 189, Đường Nguyễn Văn Cừ, Long Biên, Hà Nội', 890, '2022-02-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Nguyễn Xuân Huy', N'Nhà 65P.Bằng Liệt', N'Ngõ 65 Phố Bằng Liệt, Hoàng Mai, Hà Nội', 950, '2022-01-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Võ Văn Hoàng', N'Nhà 90 Cầu Bươu', N'90 Ngõ 2 Cầu Bươu, Thanh Trì, Hà Nội', 830, '2020-09-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Hoàng Đình Sơn', N'Nhà 425 Phan Trọng Tuệ', N'425 Đường Phan Trọng Tuệ, Thị trấn Văn Điển, Thanh Trì, Hà Nội', 810, '2020-09-10', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Công ty Misa', N'Văn phòng Misa', N'Tầng 1 + 2, Sàn thương mại N03 - T2 Khu Đoàn Ngoại Giao, Phường Xuân Tảo, Bắc Từ Liêm, Hà Nội', 890, '2020-11-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Công ty Tofu', N'Văn phòng Tofu', N'Số 12 Nguyễn Thị Định, Phường Trung Hòa, Quận Cầu Giấy, Hà Nội', 900, '2022-03-14', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Công ty VNG', N'Văn phòng VNG', N'165 Phố Thái Hà, Láng Hạ, Đống Đa, Hà Nội', 1000, '2020-01-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Công ty Beeketing', N'Văn phòng Beeketing', N'Tầng 01 và Tầng 03 tòa NO CT2 – E4 Khu Đô Thị Mới Yên Hòa, Phường Yên Hòa, Cầu Giấy, Hà Nội', 920, '2021-11-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Công ty Gameloft', N'Văn phòng Gameloft', N'Tầng 2 khối văn phòng, Toà nhà Tây Hà, 19 phố Tố Hữu, Phường Trung Văn, Nam Từ Liêm, Hà Nội', 950, '2020-06-03', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Công ty CP Đầu tư xây dựng và Cơ điện IEC', N'Căn hộ chung cư IEC Complex', N'Đường Trần Thủ Độ, Tứ Hiệp, Thanh Trì, Hà Nội', 945, '2021-06-28', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Tập đoàn Mường Thanh', N'Căn hộ chung cư Thanh Hà', N'Thanh Hà Cự khê Thanh oai, Hà Đông, Hà Nội', 990, '2022-02-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Tập đoàn Vingroup', N'Căn hộ chung cư Vinhomes Smart City', N'TTTM Vincom Mega Mall Smart City, Tây Mỗ, Nam Từ Liêm, Hà Nội', 1000, '2020-11-30', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Tập đoàn Phúc Hà', N'Căn hộ chung cư Thăng Long Victory', N'Lô đất HH1, Khu đô thị Nam An Khánh, Hoài Đức, Hà Nội', 960, '2020-01-10', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Công ty cổ phần Sông Đà – Hoàng Long', N'Căn hộ chung cư The Golden An Khánh 18T1', N'Lô HH6, An Khánh, Hoài Đức, Hà Nội', 995, '2022-10-01', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Công ty TNHH Lotte Center', N'Tòa nhà Lotte Center Hà Nội', N'54 Liễu Giai, Ba Đình, Hà Nội', 15000, '2020-08-21', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Tập đoàn Vingroup', N'Tòa nhà Techno Park Tower', N'Vinhomes Ocean Park, Gia Lâm, Hà Nội', 17000, '2021-10-10', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Tổng công ty Lâm nghiệp Việt Nam', N'Tòa chung cư Landmark 51', N'48 Vạn Phúc, Hà Đông, Hà Nội', 12000, '2020-02-17', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Xí nghiệp Xây dựng Tư nhân số 1 Lai Châu', N'Khu Đô Thị Xala Hà Nội', N'Đường Lê Trọng Tấn, Phường Phúc La, Hà Đông, Hà Nội', 20000, '2017-01-01', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Phan Thanh Tùng', N'Nhà Hàng Lẩu Phan Hà Nội', N'Ngách 3, 131 Phố Thái Hà, Đống Đa, Hà Nội', 10000, '2014-01-03', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Phòng khám da liễu S-Beauty', N'Spa thẩm mĩ S Beauty Hà Nội', N'81 P. Trung Kính, P, Cầu Giấy, Hà Nội', 1000, '2013-01-20', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (N'Hội đồng pháp thuật tối cao', N'Nhà ga 9 3/4', N'Hà Nội', 10000, '2010-10-23', 1,N'data:image/jpeg;base64,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'),
    (N'Hội đồng pháp thuật tối cao', N'Trụ sở Hội đồng phép thuật tại Việt Nam', N'Hà Nội', 10000, '2009-12-12', 1,N'https://cdn.tcdulichtphcm.vn/upload/2-2021/images/2021-06-18/1624007850-scotland3_lq.jpg'),
    (N'Hội đồng pháp thuật tối cao', N'Đại Học Hogwarts Việt Nam (Vietnamese Hogwarts University)', N'Hà Nội', 9000, '2011-03-19', 1,N'https://cdn3.dhht.vn/wp-content/uploads/2022/11/kham-pha-hogwarts-tu-a-z-va-4-nha-trong-harry-potter-1.jpg');
	
INSERT INTO 
	dbo.KHACHHANG(TENKH, DCKH, SDTKH, EMAILKH)
VALUES 
	( N'Bùi Đức Thịnh', N'167 Trương Định, Hai Bà Trưng, Hà Nội.', N'5844051785', N'b6bbx4icb9y@gmail.com'),
	( N'Lê Văn Phụng', N'179 Đường Trương Định, Hai Bà Trưng, Hà Nội.', N'5178547384', N'5esb4@hotmail.com'),
	( N'Nguyễn Thị Thúy',  N'Ngách 47, Ngõ Hòa Bình 4, Hai Bà Trưng, Hà Nội.', N'4738489619', N'0gg6yrzygn@outlook.com'),
	( N'Võ Thái Bắc', N'Ngách 5, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội.', N'8961956166', N's20b4u@outlook.com'),
	( N'Đặng Đức Hoàng', N'Ngách 7, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội.',N'5616657436', N'eqj6z@yahoo.com'),
	( N'Nguyễn Trung Kiên', N'Ngách 7, Ngõ 29 Phố Trạm, Long Biên, Hà Nội.',N'5743695486', N'2lsy7s18v@gmail.com'),
	( N'Trịnh Quốc Toàn', N'Ngõ 189, Đường Nguyễn Văn Cừ,  Long Biên, Hà Nội.',N'9548647960', N'wweiai@hotmail.com'),
	( N'Nguyễn Xuân Huy', N'Ngõ 65 Phố Bằng Liệt, Hoàng Mai, Hà Nội.',N'4796020478', N'pk9k9viic@hotmail.com'),
	( N'Võ Văn Hoàng', N'90 Ngõ 2 Cầu Bươu, Thanh Trì, Hà Nội.', N'2047850148',N'zynmgzvj0@hotmail.com'),
	( N'Hoàng Đình Sơn', N'425 Đường Phan Trọng Tuệ, Thị trấn Văn Điển, Thanh Trì, Hà Nội.',N'5014846115', N'fh1hpx@hotmail.com'),
	( N'Công ty Misa', N'N03-T1, Xuân Đỉnh, Từ Liêm, Hà Nội.',N'4399012218', N'j0hr1l@yahoo.com'),
	( N'Công ty Tofu', N'Số 39/7 phố An Hòa, Phường Mộ Lao, Hà Đông, Hà Nội.',N'1221827259', N'2t7ct@gmail.com'),
	( N'Công ty VNG', N'Z06 Đường số 13, Phường Tân Thuận Đông, Quận 7, TP Hồ Chí Minh.',N'2725940917', N'ctr4r@outlook.com'),
	( N'Công ty Beeketing', N'360 P. Xã Đàn, Phương Liên, Đống Đa, Hà Nội.',N'4091760631', N'i8mj3ay@gmail.com'),
	( N'Công ty Gameloft', N'68 P. Tố Hữu, Trung Văn, Nam Từ Liêm, Hà Nội.',N'6063125878', N'au16ks@yahoo.com'),
	( N'Công ty CP Đầu tư xây dựng và Cơ điện IEC', N'Tứ Hiệp, Thanh Trì, Hà Nội.',N'2587811085', N'adj18sa@hotmail.com'),
	( N'Tập đoàn Mường Thanh', N'Số nhà 25, tổ dân phố 21, phường Him Lam, thành phố Điện Biên Phủ, tỉnh Điện Biên.',N'1108553666', N'p68p2wh9ih@yahoo.com'),
	( N'Tập đoàn Vingroup', N'2WX8+RM5, Đối diện TTTM Vincom, Khu đô thị Vinhomes Riverside, Long Biên, Hà Nội',N'5366693185', N'otq4nwum52j@gmail.com'),
	( N'Tập đoàn Phúc Hà', N'Tầng 6, Tòa nhà Bắc Hà C14, P. Tố Hữu, Trung Văn, Nam Từ Liêm, Hà Nội 12011',N'9318535640', N'pz2zsl@outlook.com'),
	( N'Công ty cổ phần Sông Đà – Hoàng Long', N'Bản Pá Công, Xã Huổi Một, Huyện Sông Mã, Tỉnh Sơn La, Việt Nam',N'3564016962', N'17as2@gmail.com'),
	( N'Công ty TNHH Lotte Center', N'Phòng 12B03, Tầng 12B, Toà Đông, Toà nhà Lotte Center, 54 Liễu Giai, Phường Cống Vị, Quận Ba Đình, Hà Nội',N'1696235147', N'pejaygn0@hotmail.com'),
	( N'Tập đoàn Vingroup', N'2WX8+RM5, Đối diện TTTM Vincom, Khu đô thị Vinhomes Riverside, Long Biên, Hà Nội',N'3514713516', N'yof9nr@hotmail.com'),
	( N'Tổng công ty Lâm nghiệp Việt Nam', N'1+13 + 14 Số 127, Tầng, P. Lò Đúc, Hai Bà Trưng, Hà Nội',N'1351622731', N'i3nwq@gmail.com'),
	( N'Xí nghiệp Xây dựng Tư nhân số 1 Lai Châu', N'Khu CC2, Bắc Linh Đàm, Đại Kim, Hoàng Mai, Hà Nội ',N'2684045079', N'5l8np8odn0w@gmail.com'),
	( N'Phan Thanh Tùng', N'Ngách 3 Ng. 131 P. Thái Hà, Trung Liệt, Đống Đa, Hà Nội',N'4507968960', N'gjx3n0q@hotmail.com'),
	( N'Phòng khám da liễu S-Beauty', N'81 P. Trung Kính, P, Cầu Giấy, Hà Nội',N'6896036867', N'xdvmv8l@gmail.com'),
	( N'Hội đồng pháp thuật tối cao', N'tài liệu mật', N'tài liệu mật', N'tài liệu mật'),
	

INSERT INTO 
	dbo.NHANVIEN(HO_VA_TEN,TEN,PHAI,NGAYSINH,DIACHI,SDT,EMAIL,VITRI,MAQL,PHONGBAN,MAPB,LUONG)
VALUES
	( N'Đào Quý Nhân', N'Nhân', 1, '1989-09-09', N'Đà Nẵng',N'4739439038',N'nhandq@gmail.com',N'Giám đốc dự án',1, N'Phòng quản lý dự án', 1, 20),
	( N'Nguyễn Minh Bách', N'Bách', 1, '1990-10-27',N'Hà Nội',N'3903859190',N'bachnm@gmail.com',N'Giám đốc thiết kế',2,N'Phòng thiết kế', 2, 20),
	( N'Đoàn Phan Thuận', N'Thuận', 1, '1989-03-05',N'Hà Nội',N'5919064376',N'thuandp@gmail.com',N'Trưởng ban kỹ thuật',3,N'Phòng kỹ thuật', 3, 20),
	( N'Trần Phương Anh', N'Anh', 0, '1994-05-22', N'Hà Nội',N'6437679836', N'anhtp@gmail.com',N'Giám đốc tài chính',4,N'Phòng tài chính', 4, 20),
	( N'Nguyễn Hương Lan',N'Lan', 0, '1992-06-20',N'Hà Nội', N'7983656243',N'lannh@gmail.com',N'Giám đốc kinh doanh',5, N'Phòng kinh doanh',5, 20),
	( N'Nguyễn Anh Hỉa',N'Hỉa',1,'1991-05-17',N'Hà Nội',N'5624357963',N'hiana@gmail.com',N'Trưởng phòng hành chính',6, N'Phòng hành chính',6, 20),
	( N'Phạm Hồng Thái',N'Thái', 1,'1989-04-29',N'Hưng Yên',N'5796311135', N'thaiph@gmail.com', N'Quản lý dự án', 1, N'Phòng quản lý dự án', 1, 10),
	( N'Nguyễn Duy Phong', N'Phong',1, '1990-11-22',N'Vĩnh Phúc',N'1113576562', N'phongnd@gmail.com', N'Chuyên viên kỹ thuật', 1, N'Phòng quản lý dự án', 1, 10),
	( N'Nguyễn Đình Dũng', N'Dũng',1,'1994-03-25', N'Hà Tĩnh',N'7656243208', N'dungnd@gmail.com', N'Chuyên viên tài chính', 1, N'Phòng quản lý dự án',1, 10),
	( N'Vũ Quỳnh Chi', N'Chi',0, '1994-02-07', N'Hà Nội',N'4320842877', N'chivq@gamil.com',N'Trưởng phòng thiết kế', 2, N'Phòng thiết kế', 2, 20),
	( N'Nguyễn Tuấn Hưng', N'Hưng',1, '1992-10-23', N'Hà Nội',N'4287731575', N'hungnt@gmail.com', N'Nhân viên thiết kế', 2,N'Phòng thiết kế',2, 10),
	( N'Trần Phương Lam', N'Lam', 0, '1994-01-23', N'Hà Nội',N'3157532746', N'lamtt@gmail.com', N'Kỹ sư cầu nối', 2, N'Phòng thiết kế', 2, 10),
	( N'Nguyễn Thanh Lam', N'Lam', 0, '1993-02-13', N'Nam Định',N'3274653682', N'lamnt@gmail.com', N'Kỹ sư chuyên môn', 2, N'Phòng thiết kế', 2, 10),
	( N'Mai Thu Hương', N'Hương', 0, '1995-04-16', N'Hải Dương',N'5368274911', N'huongmt@gmail.com', N'Kiến trúc sư', 3, N'Phòng kỹ thuật', 3, 15),
	( N'Nguyễn Anh Tuấn', N'Tuấn', 1, '1992-12-27', N'Hải Dương',N'7491171092', N'tuanna@gmail.com', N'Kỹ sư thiết kế', 3, N'Phòng kỹ thuật', 3, 15),
	( N'Nguyễn Trọng Hữu', N'Hữu', 1, '1993-05-08', N'Vĩnh Phúc',N'7109224925', N'huunt@gmail.com', N'Kỹ sư an toàn', 3, N'Phòng kỹ thuật', 3, 10),
	( N'Trần Thị Phương Anh', N'Anh', 0, '1994-12-24', N'Hà Nội',N'3523140038', N'anhttp@gmail.com', N'Kỹ sư thiết kế', 3, N'Phòng kỹ thuật', 3, 10),
	( N'Nguyễn Quang Trung', N'Trung', 1, '1990-06-08', N'Nam Định',N'4003841068', N'trungnq@gamil.com', N'Kiến trúc sư', 3, N'Phòng kỹ thuật', 3, 10),
	( N'Nguyễn Quang Hưng', N'Hưng', 1, '1991-07-19', N'Hà Tĩnh',N'4106866487', N'hungnq@gmail.com', N'Kỹ thuật viên', 3, N'Phòng kỹ thuật', 3, 10),
	( N'Trần Đình Trọng', N'Trọng', 1, '1993-02-22', N'Nam Định',N'6648745567', N'trongtd@gmail.com', N'Chuyên viên sản xuất', 3, N'Phòng kỹ thuật', 3, 10),
	( N'Kiều Đức Mạnh', N'Mạnh', 1, '1990-03-09', N'Hà Nội',N'4556716072', N'manhkd@gmail.com', N'Quản lý kế toán', 4, N'Phòng tài chính', 4, 15),
	( N'Mai Thị Trà My', N'My', 0, '1994-12-23', N'Hà Nội',N'1607280383', N'mymtt@gmail.com', N'Kế Toán Trưởng', 4, N'Phòng tài chính', 4, 15),
	( N'Phan Vân Anh', N'Anh', 0, '1995-10-20', N'Hà Nội',N'8038361147', N'anhpv@gmail.com', N'Kế toán viên', 4, N'Phòng tài chính', 4, 10),
	( N'Ngô Minh Đức', N'Đức', 1, '1993-12-10', N'Hà Nội',N'6114770669', N'ducnm@gmail.com', N'Chuyên viên thuế', 4, N'Phòng tài chính', 4, 10),
	( N'Nguyễn Hải Anh', N'Anh', 1, '1990-02-28', N'Hải Dương',N'7066938908', N'anhnh@gmail.com', N'Chuyên viên tài chính', 4, N'Phòng tài chính', 4, 10),
	( N'Trần Thanh Tâm', N'Tâm', 0, '1995-11-20', N'Vĩnh Phúc',N'3890886321', N'tamtt@gmail.com', N'Nhân viên hành chính kế toán', 4, N'Phòng tài chính', 4, 10),
	( N'Nguyễn Hồng Sơn', N'Sơn', 1, '1992-12-30', N'Hưng Yên',N'8632177603', N'sonnh@gmail.com', N'Chuyên viên kiểm toán', 4, N'Phòng tài chính', 4, 10),
	( N'Nguyễn Hồng Thái', N'Thái', 1, '1991-08-16', N'Hà Nội',N'7760381560', N'thainh@gmail.com', N'Chuyên viên phân tích tài chính', 4, N'Phòng tài chính', 4, 10),
	( N'Phạm Thanh Sơn', N'Sơn', 1, '1993-04-25', N'Hà Nội',N'8156038113', N'sonpt@gmail.com', N'kế toán viên', 4, N'Phòng tài chính', 4, 10),
	( N'Mai Trà My', N'My', 0, '1995-03-12', N'Nam Định',N'3811379686', N'mymt@gmail.com', N'kế toán viên', 4, N'Phòng tài chính', 4, 10),
	( N'Nguyễn Gia Bảo',N'Bảo', 1, '1993-02-20', N'Hà Nội',N'2061340802', N'baong@gmail.com', N'Trưởng phòng kinh doanh',5, N'Phòng kinh doanh',5, 15),
	( N'Mai Nam Hải', N'Hải', 1, '1990-05-04', N'Hải Dương',N'4080290059', N'haimn@gmail.com', N'Nhân viên kinh doanh',5, N'Phòng kinh doanh',5, 10),
	( N'Đinh Ngọc Hùng',N'Hùng', 1, '1995-09-08', N'Hà Nội',N'9005924392', N'hungdn@gmail.com', N'Kế toán kinh doanh',5, N'Phòng kinh doanh',5, 10),
	( N'Lưu Minh Anh', N'Anh', 0, '1995-11-29', N'Hà Nội',N'2439283538', N'anhlm@gmail.com', N'Chuyên viên khách hàng',5, N'Phòng kinh doanh',5, 10),
	( N'Nguyễn Ngọc Huyền',N'Huyền', 0, '1994-02-19', N'Hà Nội',N'8353855188', N'huyennn@gmail.com', N'Chuyên viên marketing',5, N'Phòng kinh doanh',5, 15),
	( N'Nguyễn Thị Hồng Ngọc', N'Ngọc', 0, '1995-11-21', N'Hà Nội',N'5518848920', N'ngocnth@gmail.com', N'Chuyên viên quản lý dữ liệu kinh doanh',5, N'Phòng kinh doanh',5, 15),
	( N'Vũ Thị Thanh Mai', N'Mai', 0, '1992-12-04', N'Hà Nội',N'4892065240', N'maivtt@gmail.com', N'Chuyên viên phân tích thị trường',5, N'Phòng kinh doanh',5, 15),
	( N'Nguyễn Hoài Nam',N'Nam', 1, '1994-04-04', N'Hà Nội',N'6524064232', N'namnh@gmail.com', N'Trưởng phòng hành chính',6, N'Phòng hành chính',6, 15),
	( N'Nguyễn Vũ Hồng Ngọc', N'Ngọc', 0, '1993-11-09', N'Hà Nội',N'6423223388', N'ngocnvh@gmail.com', N'Nhân viên hành chính',6, N'Phòng hành chính',6, 10),
	( N'Trần Thị Thu Hương', N'Hương', 0, '1994-05-05', N'Hà Nội',N'2338838112', N'huongttt@gmail.com', N'Nhân viên hỗ trợ khách hàng',6, N'Phòng hành chính',6, 10),
	( N'Lưu Đức Mạnh', N'Mạnh', 1, '1992-10-22', N'Hà Nội',N'3811238511', N'manhld@gmail.com', N'Chuyên viên tuyển dụng',6, N'Phòng hành chính',6, 10),
	( N'Nguyễn Anh Tài', N'Tài', 1, '1990-11-26', N'Hà Nội',N'3851160647', N'taina@gmail.com', N'Chuyên viên tuyển dụng',6, N'Phòng hành chính',6, 10),
	( N'Nguyễn Thu Phương', N'Phương', 0, '1995-03-17', N'Hải Dương',N'6064765684', N'phuongnt@gmail.com', N'Nhân viên hỗ trợ khách hàng',6, N'Phòng hành chính',6, 10),
	( N'Nguyễn Thu Hằng', N'Hằng',0, '1992-04-10', N'Hà Nội',N'6568421083', N'hangnt@gmail.com', N'Thư ký',6, N'Phòng hành chính',6, 10),
	( N'Nguyễn Thị Vân', N'Vân', 0, '1995-07-10', N'Nam Định',N'2108313503', N'vannt@gmail.com', N'Nhân viên hỗ trợ khách hàng',6, N'Phòng hành chính',6, 10);




	

	
	


