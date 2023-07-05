
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





CREATE TABLE dbo.KHACHHANG
(
	MAKH INT PRIMARY KEY identity(1,1) NOT NULL,
	TENKH NVARCHAR(50),	
	DCKH NVARCHAR(1000),
	SDTKH NVARCHAR(50),
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
	IMG NVARCHAR(2000)
);

drop table dbo.DU_AN
drop table dbo.KHACHHANG



drop table dbo.PHANCONG
drop table dbo.CONGVIEC

drop table dbo.NHANVIEN
drop table dbo.PHONGBAN

CREATE TABLE dbo.PHONGBAN
(
    MAPB INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    TENPB NVARCHAR(30),
    DIADIEM NVARCHAR(30),
    MAQL INT
);

CREATE TABLE dbo.NHANVIEN
(
    MANV INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    HO_VA_TEN NVARCHAR(50),    
    PHAI BIT,
    NGAYSINH DATE,
    DIACHI NVARCHAR(100),
    SDT NVARCHAR(10),
    EMAIL NVARCHAR(100),
    VITRI NVARCHAR(100),
    MAPB INT,
    LUONG FLOAT NOT NULL,    
    
    FOREIGN KEY (MAPB) REFERENCES dbo.PHONGBAN(MAPB)
);


CREATE TABLE dbo.PHANCONG
(	
	ID INT PRIMARY KEY identity(1,1) NOT NULL,
	MADA INT NOT NULL,
	FOREIGN KEY (MADA) REFERENCES dbo.DU_AN(MADA),
	MAPB INT NOT NULL,
	FOREIGN KEY (MAPB) REFERENCES dbo.PHONGBAN(MAPB),
	TEN_HANG_MUC NVARCHAR(200),
	NGAYBATDAU DATE,
	NGAYKETTHUC DATE,
	TRANGTHAI INT
);

CREATE TABLE dbo.CONGVIEC
(
	ID INT PRIMARY KEY identity(1,1) NOT NULL,

	IDPC INT,
	FOREIGN KEY (IDPC) REFERENCES dbo.PHANCONG(ID),

	MANV INT,
	FOREIGN KEY (MANV) REFERENCES dbo.NHANVIEN(MANV),

	NGAYBATDAU DATE,
	NGAYKETTHUC DATE,

	TEN_CONG_VIEC NVARCHAR(200),
	TRANGTHAI INT
);



select * from dbo.NHANVIEN



CREATE TABLE dbo.THIETKE
(
	MA INT PRIMARY KEY identity(1,1) NOT NULL,
	TEN NVARCHAR(200),	
	
	ANH NVARCHAR(1000)
);

CREATE TABLE dbo.BANVE
(
	MA INT PRIMARY KEY identity(1,1) NOT NULL,
	TEN NVARCHAR(200),	

	ANH NVARCHAR(1000)
);

drop table dbo.THIETKE

drop table dbo.BANVE

--INSERT VALUE

select * from dbo.ACCOUNT where username = 'admin' and password ='123'
--drop table dbo.ACCOUNT
--INSERT INTO
--	dbo.ACCOUNT(username,password)
--VALUES
--	(N'admin',N'123');

INSERT INTO dbo.PHONGBAN (TENPB, MAQL,DIADIEM)
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
    (N'Lê Văn Phụng', N'Nhà 179 Trương Định', N'179 Đường Trương Định, Hai Bà Trưng, Hà Nội', 800, '2021-12-11', 1,N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIEHG8t4DOh3klrFRQrbBJZ4SXLbwVr_uo1A&usqp=CAU'),
    (N'Nguyễn Thị Thúy', N'Nhà 47 Hòa Bình 4/Minh Khai', N'Ngách 47, Ngõ Hòa Bình 4, Hai Bà Trưng, Hà Nội', 830, '2021-06-11', 1,N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCjCTAtul6dw2XZC1o4I-TOk4fMPUh93Cxzg&usqp=CAU'),
    (N'Võ Thái Bắc', N'Nhà 112/5 Nghĩa Tân', N'Ngách 5, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội', 840, '2022-08-11', 1,N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw71s7OjGSc5Q_0lMatZnTjOVif9ZETHnE-g&usqp=CAU'),
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
    (N'Hội đồng pháp thuật tối cao', N'Nhà ga 9 3/4', N'Hà Nội', 10000, '2010-10-23', 1,N'https://aztruyen.com/cover/images/030cf92dcd992b8ad3da89e60769f83bb196e241/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f657a316c71793938646f446142413d3d2d313232323334353438342e313665633361613139643339616638633836333737363432333231372e6a7067'),
    (N'Hội đồng pháp thuật tối cao', N'Trụ sở Hội đồng phép thuật tại Việt Nam', N'Hà Nội', 10000, '2009-12-12', 1,N'https://cdn.tcdulichtphcm.vn/upload/2-2021/images/2021-06-18/1624007850-scotland3_lq.jpg'),
    (N'Hội đồng pháp thuật tối cao', N'Đại Học Hogwarts Việt Nam (Vietnamese Hogwarts University)', N'Hà Nội', 9000, '2011-03-19', 1,N'https://cdn3.dhht.vn/wp-content/uploads/2022/11/kham-pha-hogwarts-tu-a-z-va-4-nha-trong-harry-potter-1.jpg');
	
INSERT INTO dbo.KHACHHANG(TENKH, DCKH, SDTKH, EMAILKH)
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
	( N'Hội đồng pháp thuật tối cao', N'tài liệu mật', N'tài liệu mật', N'tài liệu mật')	

INSERT INTO dbo.NHANVIEN(HO_VA_TEN,PHAI,NGAYSINH,DIACHI,SDT,EMAIL,VITRI,MAPB,LUONG)
VALUES
	( N'Đào Quý Nhân', 1, '1989-09-09', N'Đà Nẵng',N'4739439038',N'nhandq@gmail.com',N'Giám đốc dự án', 1, 20),
	( N'Nguyễn Minh Bách', 1, '1990-10-27',N'Hà Nội',N'3903859190',N'bachnm@gmail.com',N'Giám đốc thiết kế', 2, 20),
	( N'Đoàn Phan Thuận', 1, '1989-03-05',N'Hà Nội',N'5919064376',N'thuandp@gmail.com',N'Trưởng ban kỹ thuật', 3, 20),
	( N'Trần Phương Anh', 0, '1994-05-22', N'Hà Nội',N'6437679836', N'anhtp@gmail.com',N'Giám đốc tài chính', 4, 20),
	( N'Nguyễn Hương Lan', 0, '1992-06-20',N'Hà Nội', N'7983656243',N'lannh@gmail.com',N'Giám đốc kinh doanh',5, 20),
	( N'Nguyễn Anh Hỉa',1,'1991-05-17',N'Hà Nội',N'5624357963',N'hiana@gmail.com',N'Trưởng phòng hành chính',6, 20),
	( N'Phạm Hồng Thái', 1,'1989-04-29',N'Hưng Yên',N'5796311135', N'thaiph@gmail.com', N'Quản lý dự án', 1, 10),
	( N'Phạm Duy Phong',1, '1990-11-22',N'Vĩnh Phúc',N'1113576562', N'phongpd@gmail.com', N'Chuyên viên kỹ thuật', 1, 10),
	( N'Nguyễn Đình Dũng',1,'1994-03-25', N'Hà Tĩnh',N'7656243208', N'dungnd@gmail.com', N'Chuyên viên tài chính',1, 10),
	( N'Vũ Quỳnh Chi',0, '1994-02-07', N'Hà Nội',N'4320842877', N'chivq@gamil.com',N'Trưởng phòng thiết kế', 2, 20),
	( N'Nguyễn Tuấn Hưng',1, '1992-10-23', N'Hà Nội',N'4287731575', N'hungnt@gmail.com', N'Nhân viên thiết kế',2, 10),
	( N'Trần Phương Lam', 0, '1994-01-23', N'Hà Nội',N'3157532746', N'lamtt@gmail.com', N'Kỹ sư cầu nối', 2, 10),
	( N'Nguyễn Thanh Lam', 0, '1993-02-13', N'Nam Định',N'3274653682', N'lamnt@gmail.com', N'Kỹ sư chuyên môn', 2, 10),
	( N'Mai Thu Hương', 0, '1995-04-16', N'Hải Dương',N'5368274911', N'huongmt@gmail.com', N'Kiến trúc sư', 3, 15),
	( N'Nguyễn Anh Tuấn', 1, '1992-12-27', N'Hải Dương',N'7491171092', N'tuanna@gmail.com', N'Kỹ sư thiết kế', 3, 15),
	( N'Nguyễn Trọng Hữu', 1, '1993-05-08', N'Vĩnh Phúc',N'7109224925', N'huunt@gmail.com', N'Kỹ sư an toàn', 3, 10),
	( N'Trần Thị Phương Anh', 0, '1994-12-24', N'Hà Nội',N'3523140038', N'anhttp@gmail.com', N'Kỹ sư thiết kế', 3, 10),
	( N'Nguyễn Quang Trung', 1, '1990-06-08', N'Nam Định',N'4003841068', N'trungnq@gamil.com', N'Kiến trúc sư', 3, 10),
	( N'Nguyễn Quang Hưng', 1, '1991-07-19', N'Hà Tĩnh',N'4106866487', N'hungnq@gmail.com', N'Kỹ thuật viên', 3, 10),
	( N'Trần Đình Trọng', 1, '1993-02-22', N'Nam Định',N'6648745567', N'trongtd@gmail.com', N'Chuyên viên sản xuất', 3, 10),
	( N'Kiều Đức Mạnh', 1, '1990-03-09', N'Hà Nội',N'4556716072', N'manhkd@gmail.com', N'Quản lý kế toán', 4, 15),
	( N'Mai Thị Trà My', 0, '1994-12-23', N'Hà Nội',N'1607280383', N'mymtt@gmail.com', N'Kế Toán Trưởng', 4, 15),
	( N'Phan Vân Anh', 0, '1995-10-20', N'Hà Nội',N'8038361147', N'anhpv@gmail.com', N'Kế toán viên', 4, 10),
	( N'Ngô Minh Đức', 1, '1993-12-10', N'Hà Nội',N'6114770669', N'ducnm@gmail.com', N'Chuyên viên thuế', 4, 10),
	( N'Nguyễn Hải Anh', 1, '1990-02-28', N'Hải Dương',N'7066938908', N'anhnh@gmail.com', N'Chuyên viên tài chính', 4, 10),
	( N'Trần Thanh Tâm', 0, '1995-11-20', N'Vĩnh Phúc',N'3890886321', N'tamtt@gmail.com', N'Nhân viên hành chính kế toán', 4, 10),
	( N'Nguyễn Hồng Sơn', 1, '1992-12-30', N'Hưng Yên',N'8632177603', N'sonnh@gmail.com', N'Chuyên viên kiểm toán', 4, 10),
	( N'Nguyễn Hồng Thái', 1, '1991-08-16', N'Hà Nội',N'7760381560', N'thainh@gmail.com', N'Chuyên viên phân tích tài chính' , 4, 10),
	( N'Phạm Thanh Sơn', 1, '1993-04-25', N'Hà Nội',N'8156038113', N'sonpt@gmail.com', N'kế toán viên', 4, 10),
	( N'Mai Trà My', 0, '1995-03-12', N'Nam Định',N'3811379686', N'mymt@gmail.com', N'kế toán viên', 4, 10),
	( N'Nguyễn Gia Bảo', 1, '1993-02-20', N'Hà Nội',N'2061340802', N'baong@gmail.com', N'Trưởng phòng kinh doanh',5, 15),
	( N'Mai Nam Hải', 1, '1990-05-04', N'Hải Dương',N'4080290059', N'haimn@gmail.com', N'Nhân viên kinh doanh',5, 10),
	( N'Đinh Ngọc Hùng', 1, '1995-09-08', N'Hà Nội',N'9005924392', N'hungdn@gmail.com', N'Kế toán kinh doanh',5, 10),
	( N'Lưu Minh Anh', 0, '1995-11-29', N'Hà Nội',N'2439283538', N'anhlm@gmail.com', N'Chuyên viên khách hàng',5, 10),
	( N'Nguyễn Ngọc Huyền', 0, '1994-02-19', N'Hà Nội',N'8353855188', N'huyennn@gmail.com', N'Chuyên viên marketing',5, 15),
	( N'Nguyễn Thị Hồng Ngọc', 0, '1995-11-21', N'Hà Nội',N'5518848920', N'ngocnth@gmail.com', N'Chuyên viên quản lý dữ liệu kinh doanh',5, 15),
	( N'Vũ Thị Thanh Mai', 0, '1992-12-04', N'Hà Nội',N'4892065240', N'maivtt@gmail.com', N'Chuyên viên phân tích thị trường',5, 15),
	( N'Nguyễn Hoài Nam', 1, '1994-04-04', N'Hà Nội',N'6524064232', N'namnh@gmail.com', N'Trưởng phòng hành chính',6, 15),
	( N'Nguyễn Vũ Hồng Ngọc', 0, '1993-11-09', N'Hà Nội',N'6423223388', N'ngocnvh@gmail.com', N'Nhân viên hành chính',6, 10),
	( N'Trần Thị Thu Hương', 0, '1994-05-05', N'Hà Nội',N'2338838112', N'huongttt@gmail.com', N'Nhân viên hỗ trợ khách hàng',6, 10),
	( N'Lưu Đức Mạnh', 1, '1992-10-22', N'Hà Nội',N'3811238511', N'manhld@gmail.com', N'Chuyên viên tuyển dụng',6, 10),
	( N'Nguyễn Anh Tài', 1, '1990-11-26', N'Hà Nội',N'3851160647', N'taina@gmail.com', N'Chuyên viên tuyển dụng',6, 10),
	( N'Nguyễn Thu Phương', 0, '1995-03-17', N'Hải Dương',N'6064765684', N'phuongnt@gmail.com', N'Nhân viên hỗ trợ khách hàng',6, 10),
	( N'Nguyễn Thu Hằng',0, '1992-04-10', N'Hà Nội',N'6568421083', N'hangnt@gmail.com', N'Thư ký',6, 10),
	( N'Nguyễn Thị Vân', 0, '1995-07-10', N'Nam Định',N'2108313503', N'vannt@gmail.com', N'Nhân viên hỗ trợ khách hàng',6, 10);

Insert into dbo.THIETKE (TEN, ANH)
Values 
(N'Thiết kế phòng khách 1',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 2',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 3',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 4',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 5',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 6',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 7',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 8',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 9',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg'),
(N'Thiết kế phòng khách 10',  N'https://file.hstatic.net/200000044142/article/thiet-ke-noi-that-phong-khach_38d1bcb014b64e2aa3fa4bd5e9c3cba7.jpg');

Insert into dbo.BANVE (TEN,  ANH)

Values 
(N'Bản vẽ chi tiết thiết kế phòng khách 1',  N'https://kientrucdoorway.com.vn/wp-content/uploads/2019/03/Thiet-ke-noi-that-phong-khach-hien-dai-dep-2.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 2',  N'https://abig.vn/wp-content/uploads/2022/03/ban-ve-bai-tri-noi-that-can-ho-3-phong-ngu.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 3',  N'https://kientrucdoorway.com.vn/wp-content/uploads/2019/03/Thiet-ke-noi-that-phong-khach-hien-dai-dep-2.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 4',  N'https://abig.vn/wp-content/uploads/2022/03/ban-ve-bai-tri-noi-that-can-ho-3-phong-ngu.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 5',  N'https://abig.vn/wp-content/uploads/2022/03/ban-ve-bai-tri-noi-that-can-ho-3-phong-ngu.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 6', N'https://abig.vn/wp-content/uploads/2022/03/ban-ve-bai-tri-noi-that-can-ho-3-phong-ngu.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 7',  N'https://xaydungvietbac.com/wp-content/uploads/2021/01/mau-ho-so-thiet-ke-kien-truc5-scaled.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 8',  N'https://xaydungvietbac.com/wp-content/uploads/2021/01/mau-ho-so-thiet-ke-kien-truc5-scaled.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 9',  N'https://xaydungvietbac.com/wp-content/uploads/2021/01/mau-ho-so-thiet-ke-kien-truc5-scaled.jpg'),
(N'Bản vẽ chi tiết thiết kế phòng khách 10',  N'https://xaydungvietbac.com/wp-content/uploads/2021/01/mau-ho-so-thiet-ke-kien-truc5-scaled.jpg');


INSERT INTO dbo.NHANVIEN (HO_VA_TEN, TEN, PHAI, NGAYSINH, DIACHI, SDT, EMAIL, VITRI, PHONGBAN, MAPB, LUONG)
VALUES ('Nguyen Van A', 'A', 1, '1990-01-01', '123 Street, City', '0123456789', 'abc@example.com', 'Nhan vien', 'Phong A', 1, 1000.0);

DECLARE @NewMaNV INT;
SET @NewMaNV = SCOPE_IDENTITY();

UPDATE dbo.NHANVIEN
SET MAQL = @NewMaNV
WHERE MANV = @NewMaNV;

update dbo.NHANVIEN
set EMAIL='phongpd@gmail.com'
where MANV=8

SELECT PC.MADA,TENDA,PC.MAPB, TENPB, TEN_HANG_MUC
FROM dbo.PHANCONG AS PC
INNER JOIN dbo.DU_AN AS DA ON DA.MADA = PC.MADA
INNER JOIN dbo.PHONGBAN AS PB ON PB.MAPB = PC.MAPB;

delete from dbo.PHANCONG where MADA=1

select * from dbo.PHANCONG where ID=4


	
UPDATE dbo.PHANCONG SET MAPB = 3, TEN_HANG_MUC = N'abc' WHERE ID = 4
	
SELECT CV.ID,CV.IDPC, MADA, PC.MAPB, HO_VA_TEN, CV.MANV, TEN_CONG_VIEC
FROM dbo.PHANCONG AS PC
INNER JOIN dbo.CONGVIEC AS CV ON PC.ID = CV.IDPC
INNER JOIN dbo.NHANVIEN AS NV ON CV.MANV = NV.MANV
WHERE CV.IDPC=1 AND PC.MAPB=1

DELETE FROM dbo.CONGVIEC
WHERE IDPC=2
GO
DELETE FROM dbo.PHANCONG
WHERE ID=2


SELECT N.MANV
FROM PHONGBAN AS P
INNER JOIN NHANVIEN AS N ON P.MAPB = N.MAPB
WHERE P.MAPB = 1 AND N.MANV=7

