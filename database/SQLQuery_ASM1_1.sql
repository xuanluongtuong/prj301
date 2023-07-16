
--CREATE TABLE


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
	
	
	MADA INT PRIMARY KEY identity(1,1) NOT NULL,
	TENDA NVARCHAR(100),
	MAKH INT,
	FOREIGN KEY (MAKH) REFERENCES dbo.KHACHHANG(MAKH),	
	DIADIEM NVARCHAR(1000),
	NGANSACH FLOAT,
	NGAYTHICONG DATE,		
	TRANGTHAI INT,	
	IMG NVARCHAR(2000)

);

CREATE TABLE dbo.PHONGBAN
(
    MAPB INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    TENPB NVARCHAR(30),
    DIADIEM NVARCHAR(30),
    MAQL INT
);

CREATE TABLE dbo.ACCOUNT(
	accountID INT PRIMARY KEY identity(1,1) NOT NULL,
	email NVARCHAR(50) NOT NULL,
	[password] NVARCHAR(30) NOT NULL,
	username NVARCHAR(30) NOT NULL,	
	phone NVARCHAR(10) NOT NULL,
	[role] INT NOT NULL
);

CREATE TABLE dbo.NHANVIEN
(
    MANV INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	FOREIGN KEY (MANV) REFERENCES dbo.ACCOUNT(accountID),
    HO_VA_TEN NVARCHAR(100),    
    PHAI BIT,
    NGAYSINH DATE,
    DIACHI NVARCHAR(100),
    VITRI NVARCHAR(100),
    MAPB INT,
    LUONG FLOAT,    
    
    FOREIGN KEY (MAPB) REFERENCES dbo.PHONGBAN(MAPB)
);

CREATE TABLE dbo.PHANCONG
(	
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	MADA INT NOT NULL,
	FOREIGN KEY (MADA) REFERENCES dbo.DU_AN(MADA) ON DELETE CASCADE,
	MAPB INT NOT NULL,
	FOREIGN KEY (MAPB) REFERENCES dbo.PHONGBAN(MAPB) ,
	TEN_HANG_MUC NVARCHAR(200),
	NGAYBATDAU DATE,
	NGAYKETTHUC DATE,
	TRANGTHAI INT
);

CREATE TABLE dbo.CONGVIEC
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IDPC INT,
	FOREIGN KEY (IDPC) REFERENCES dbo.PHANCONG(ID) ON DELETE CASCADE,
	MANV INT,
	FOREIGN KEY (MANV) REFERENCES dbo.NHANVIEN(MANV),
	NGAYBATDAU DATE,
	NGAYKETTHUC DATE,
	TEN_CONG_VIEC NVARCHAR(200),
	TRANGTHAI INT,
	PHEDUYET INT
);

CREATE TABLE dbo.BAOCAO
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IDCV INT,
	FOREIGN KEY (IDCV) REFERENCES dbo.CONGVIEC(ID),	

	TEN NVARCHAR(200),
	NGAYNOP DATE,
	NOIDUNG NVARCHAR(250),
	CHITIET NVARCHAR(750),
	IMG NVARCHAR(3000),
	EDIT INT,
);

--drop table dbo.CONGVIEC
--drop table dbo.PHANCONG
--drop table dbo.BAOCAO
--drop table dbo.DU_AN
--drop table dbo.PHONGBAN
--drop table dbo.NHANVIEN
--drop table dbo.ACCOUNT

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



INSERT INTO dbo.PHONGBAN (TENPB, MAQL,DIADIEM)
VALUES
	( N'Phòng quản lý dự án',2, N'Tầng 3, Tòa nhà A'),
	( N'Phòng thiết kế',3,  N'Tầng 3, Tòa nhà A'),
	( N'Phòng kỹ thuật', 4, N'Tầng 3, Tòa nhà A'),
	( N'Phòng tài chính',5, N'Tầng 3, Tòa nhà A'),	
	( N'Phòng kinh doanh', 6, N'Tầng 3, Tòa nhà A'),
	( N'Phòng hành chính', 7, N'Tầng 3, Tòa nhà A');

INSERT INTO dbo.DU_AN(MAKH, TENDA, DIADIEM, NGANSACH, NGAYTHICONG, TRANGTHAI,IMG)
VALUES
    (1, N'Nhà 167 Trương Định', N'167 Trương Định, Hai Bà Trưng, Hà Nội', 870, '2022-06-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (2, N'Nhà 179 Trương Định', N'179 Đường Trương Định, Hai Bà Trưng, Hà Nội', 800, '2021-12-11', 1,N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIEHG8t4DOh3klrFRQrbBJZ4SXLbwVr_uo1A&usqp=CAU'),
    (3, N'Nhà 47 Hòa Bình 4/Minh Khai', N'Ngách 47, Ngõ Hòa Bình 4, Hai Bà Trưng, Hà Nội', 830, '2021-06-11', 1,N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCjCTAtul6dw2XZC1o4I-TOk4fMPUh93Cxzg&usqp=CAU'),
    (4, N'Nhà 112/5 Nghĩa Tân', N'Ngách 5, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội', 840, '2022-08-11', 1,N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw71s7OjGSc5Q_0lMatZnTjOVif9ZETHnE-g&usqp=CAU'),
    (5, N'Nhà 112/7 Nghĩa Tân', N'Ngách 7, Ngõ 112, Đường Hoàng Quốc Việt, Phường Nghĩa Tân, Cầu Giấy, Hà Nội', 820, '2021-12-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (6, N'Nhà 29/7 Phố Trạm', N'Ngách 7, Ngõ 29 Phố Trạm, Long Biên, Hà Nội', 850, '2021-03-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (7, N'Nhà 189 Nguyễn Văn Cừ', N'Ngõ 189, Đường Nguyễn Văn Cừ, Long Biên, Hà Nội', 890, '2022-02-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (8, N'Nhà 65P.Bằng Liệt', N'Ngõ 65 Phố Bằng Liệt, Hoàng Mai, Hà Nội', 950, '2022-01-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (9, N'Nhà 90 Cầu Bươu', N'90 Ngõ 2 Cầu Bươu, Thanh Trì, Hà Nội', 830, '2020-09-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (10, N'Nhà 425 Phan Trọng Tuệ', N'425 Đường Phan Trọng Tuệ, Thị trấn Văn Điển, Thanh Trì, Hà Nội', 810, '2020-09-10', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (11, N'Văn phòng Misa', N'Tầng 1 + 2, Sàn thương mại N03 - T2 Khu Đoàn Ngoại Giao, Phường Xuân Tảo, Bắc Từ Liêm, Hà Nội', 890, '2020-11-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (12, N'Văn phòng Tofu', N'Số 12 Nguyễn Thị Định, Phường Trung Hòa, Quận Cầu Giấy, Hà Nội', 900, '2022-03-14', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (13, N'Văn phòng VNG', N'165 Phố Thái Hà, Láng Hạ, Đống Đa, Hà Nội', 1000, '2020-01-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (14, N'Văn phòng Beeketing', N'Tầng 01 và Tầng 03 tòa NO CT2 – E4 Khu Đô Thị Mới Yên Hòa, Phường Yên Hòa, Cầu Giấy, Hà Nội', 920, '2021-11-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (15, N'Văn phòng Gameloft', N'Tầng 2 khối văn phòng, Toà nhà Tây Hà, 19 phố Tố Hữu, Phường Trung Văn, Nam Từ Liêm, Hà Nội', 950, '2020-06-03', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (16, N'Căn hộ chung cư IEC Complex', N'Đường Trần Thủ Độ, Tứ Hiệp, Thanh Trì, Hà Nội', 945, '2021-06-28', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (17, N'Căn hộ chung cư Thanh Hà', N'Thanh Hà Cự khê Thanh oai, Hà Đông, Hà Nội', 990, '2022-02-11', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (18, N'Căn hộ chung cư Vinhomes Smart City', N'TTTM Vincom Mega Mall Smart City, Tây Mỗ, Nam Từ Liêm, Hà Nội', 1000, '2020-11-30', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (19, N'Căn hộ chung cư Thăng Long Victory', N'Lô đất HH1, Khu đô thị Nam An Khánh, Hoài Đức, Hà Nội', 960, '2020-01-10', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (20, N'Căn hộ chung cư The Golden An Khánh 18T1', N'Lô HH6, An Khánh, Hoài Đức, Hà Nội', 995, '2022-10-01', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (21, N'Tòa nhà Lotte Center Hà Nội', N'54 Liễu Giai, Ba Đình, Hà Nội', 15000, '2020-08-21', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (22, N'Tòa nhà Techno Park Tower', N'Vinhomes Ocean Park, Gia Lâm, Hà Nội', 17000, '2021-10-10', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (23, N'Tòa chung cư Landmark 51', N'48 Vạn Phúc, Hà Đông, Hà Nội', 12000, '2020-02-17', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (24, N'Khu Đô Thị Xala Hà Nội', N'Đường Lê Trọng Tấn, Phường Phúc La, Hà Đông, Hà Nội', 20000, '2017-01-01', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (25, N'Nhà Hàng Lẩu Phan Hà Nội', N'Ngách 3, 131 Phố Thái Hà, Đống Đa, Hà Nội', 10000, '2014-01-03', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (26, N'Spa thẩm mĩ S Beauty Hà Nội', N'81 P. Trung Kính, P, Cầu Giấy, Hà Nội', 1000, '2013-01-20', 1,N'https://vtkong.com/wp-content/uploads/2022/08/thiet-ke-biet-thu-2-tang-mai-thai.jpg'),
    (27, N'Nhà ga 9 3/4', N'Hà Nội', 10000, '2010-10-23', 1,N'https://aztruyen.com/cover/images/030cf92dcd992b8ad3da89e60769f83bb196e241/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f657a316c71793938646f446142413d3d2d313232323334353438342e313665633361613139643339616638633836333737363432333231372e6a7067'),
    (27, N'Trụ sở Hội đồng phép thuật tại Việt Nam', N'Hà Nội', 10000, '2009-12-12', 1,N'https://cdn.tcdulichtphcm.vn/upload/2-2021/images/2021-06-18/1624007850-scotland3_lq.jpg'),
    (27, N'Đại Học Hogwarts Việt Nam (Vietnamese Hogwarts University)', N'Hà Nội', 9000, '2011-03-19', 1,N'https://cdn3.dhht.vn/wp-content/uploads/2022/11/kham-pha-hogwarts-tu-a-z-va-4-nha-trong-harry-potter-1.jpg');
	
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

INSERT INTO dbo.ACCOUNT (email, [password], username, phone, [role])
VALUES 
(N'admin@gmail.com', N'111', N'Administrator',N'1111111111',1),
(N'nhandq@gmail.com', N'111', N'Đào Quý Nhân', '4739439038', 2),
(N'bachnm@gmail.com', N'111', N'Nguyễn Minh Bách', '3903859190', 2),
(N'thuandp@gmail.com', N'111', N'Đoàn Phan Thuận', '5919064376', 2),
(N'anhtp@gmail.com', N'111', N'Trần Phương Anh', '6437679836', 2),
(N'lannh@gmail.com', N'111', N'Nguyễn Hương Lan', '7983656243', 2),
(N'hiana@gmail.com', N'111', N'Nguyễn Anh Hỉa', '5624357963', 2),
(N'thaiph@gmail.com', N'111', N'Phạm Hồng Thái', '5796311135', 3),
(N'phongpd@gmail.com', N'111', N'Phạm Duy Phong', '1113576562', 3),
(N'dungnd@gmail.com', N'111', N'Nguyễn Đình Dũng', '7656243208', 3),
(N'chivq@gamil.com', N'111', N'Vũ Quỳnh Chi', '4320842877', 3),
(N'hungnt@gmail.com', N'111', N'Nguyễn Tuấn Hưng', '4287731575', 3),
(N'lamtp@gmail.com', N'111', N'Trần Phương Lam', '3157532746', 3),
(N'lamnt@gmail.com', N'111', N'Nguyễn Thanh Lam', '3274653682', 3),
(N'huongmt@gmail.com', N'111', N'Mai Thu Hương', '5368274911', 3),
(N'tuanna@gmail.com', N'111', N'Nguyễn Anh Tuấn', '7491171092', 3),
(N'huutt@gmail.com', N'111', N'Trần Trọng Hữu', '7109224925', 3),
(N'anhttp@gmail.com', N'111', N'Trần Thị Phương Anh', '3523140038', 3),
(N'trungnq@gamil.com', N'111', N'Nguyễn Quang Trung', '4003841068', 3),
(N'hungnq@gmail.com', N'111', N'Nguyễn Quang Hưng', '4106866487', 3),
(N'trongtd@gmail.com', N'111', N'Trần Đình Trọng', '6648745567', 3),
(N'manhkd@gmail.com', N'111', N'Kiều Đức Mạnh', '4556716072', 3),
(N'mymtt@gmail.com', N'111', N'Mai Thị Trà My', '1607280383', 3),
(N'anhpv@gmail.com', N'111', N'Phan Vân Anh', '8038361147', 3),
(N'ducnm@gmail.com', N'111', N'Ngô Minh Đức', '6114770669', 3),
(N'anhnh@gmail.com', N'111', N'Nguyễn Hải Anh', '7066938908', 3),
(N'tamtt@gmail.com', N'111', N'Trần Thanh Tâm', '3890886321', 3),
(N'sonnh@gmail.com', N'111', N'Nguyễn Hồng Sơn', '8632177603', 3),
(N'thainh@gmail.com', N'111', N'Nguyễn Hồng Thái', '7760381560', 3),
(N'sonpt@gmail.com', N'111', N'Phạm Thanh Sơn', '8156038113', 3),
(N'mymt@gmail.com', N'111', N'Mai Trà My', '3811379686', 3),
(N'baong@gmail.com', N'111', N'Nguyễn Gia Bảo', '2061340802', 3),
(N'haimn@gmail.com', N'111', N'Mai Nam Hải', '4080290059', 3),
(N'hungdn@gmail.com', N'111', N'Đinh Ngọc Hùng', '9005924392', 3),
(N'anhlm@gmail.com', N'111', N'Lưu Minh Anh', '2439283538', 3),
(N'huyennn@gmail.com', N'111', N'Nguyễn Ngọc Huyền', '8353855188', 3),
(N'ngocnth@gmail.com', N'111', N'Nguyễn Thị Hồng Ngọc', '5518848920', 3),
(N'maivtt@gmail.com', N'111', N'Vũ Thị Thanh Mai', '4892065240', 3),
(N'namnh@gmail.com', N'111', N'Nguyễn Hoài Nam', '6524064232', 3),
(N'ngocnvh@gmail.com', N'111', N'Nguyễn Vũ Hồng Ngọc', '6423223388', 3),
(N'huongttt@gmail.com', N'111', N'Trần Thị Thu Hương', '2338838112', 3),
(N'manhld@gmail.com', N'111', N'Lưu Đức Mạnh', '3811238511', 3),
(N'taina@gmail.com', N'111', N'Nguyễn Anh Tài', '3851160647', 3),
(N'phuongnt@gmail.com', N'111', N'Nguyễn Thu Phương', '6064765684', 3),
(N'hangnt@gmail.com', N'111', N'Nguyễn Thu Hằng', '6568421083', 3),
(N'vannt@gmail.com', N'111', N'Nguyễn Thị Vân', '2108313503', 3);

INSERT INTO dbo.NHANVIEN(HO_VA_TEN,PHAI,NGAYSINH,DIACHI,VITRI,MAPB,LUONG)
VALUES
	( N'Admin', 1, NULL, N'', N'', NULL, NULL),
	( N'Đào Quý Nhân', 1, '1989-09-09', N'Đà Nẵng',N'Giám đốc dự án', 1, 20),
	( N'Nguyễn Minh Bách', 1, '1990-10-27',N'Hà Nội',N'Giám đốc thiết kế', 2, 20),
	( N'Đoàn Phan Thuận', 1, '1989-03-05',N'Hà Nội',N'Trưởng ban kỹ thuật', 3, 20),
	( N'Trần Phương Anh', 0, '1994-05-22', N'Hà Nội',N'Giám đốc tài chính', 4, 20),
	( N'Nguyễn Hương Lan', 0, '1992-06-20',N'Hà Nội', N'Giám đốc kinh doanh',5, 20),
	( N'Nguyễn Anh Hỉa',1,'1991-05-17',N'Hà Nội',N'Trưởng phòng hành chính',6, 20),
	( N'Phạm Hồng Thái', 1,'1989-04-29',N'Hưng Yên', N'Quản lý dự án', 1, 10),
	( N'Phạm Duy Phong',1, '1990-11-22',N'Vĩnh Phúc', N'Chuyên viên kỹ thuật', 1, 10),
	( N'Nguyễn Đình Dũng',1,'1994-03-25', N'Hà Tĩnh', N'Chuyên viên tài chính',1, 10),
	( N'Vũ Quỳnh Chi',0, '1994-02-07', N'Hà Nội',N'Trưởng phòng thiết kế', 2, 20),
	( N'Nguyễn Tuấn Hưng',1, '1992-10-23', N'Hà Nội', N'Nhân viên thiết kế',2, 10),
	( N'Trần Phương Lam', 0, '1994-01-23', N'Hà Nội', N'Kỹ sư cầu nối', 2, 10),
	( N'Nguyễn Thanh Lam', 0, '1993-02-13', N'Nam Định',N'Kỹ sư chuyên môn', 2, 10),
	( N'Mai Thu Hương', 0, '1995-04-16', N'Hải Dương', N'Kiến trúc sư', 3, 15),
	( N'Nguyễn Anh Tuấn', 1, '1992-12-27', N'Hải Dương', N'Kỹ sư thiết kế', 3, 15),
	( N'Trần Trọng Hữu', 1, '1993-05-08', N'Vĩnh Phúc', N'Kỹ sư an toàn', 3, 10),
	( N'Trần Thị Phương Anh', 0, '1994-12-24', N'Hà Nội', N'Kỹ sư thiết kế', 3, 10),
	( N'Nguyễn Quang Trung', 1, '1990-06-08', N'Nam Định', N'Kiến trúc sư', 3, 10),
	( N'Nguyễn Quang Hưng', 1, '1991-07-19', N'Hà Tĩnh', N'Kỹ thuật viên', 3, 10),
	( N'Trần Đình Trọng', 1, '1993-02-22', N'Nam Định', N'Chuyên viên sản xuất', 3, 10),
	( N'Kiều Đức Mạnh', 1, '1990-03-09', N'Hà Nội', N'Quản lý kế toán', 4, 15),
	( N'Mai Thị Trà My', 0, '1994-12-23', N'Hà Nội',N'Kế Toán Trưởng', 4, 15),
	( N'Phan Vân Anh', 0, '1995-10-20', N'Hà Nội',N'Kế toán viên', 4, 10),
	( N'Ngô Minh Đức', 1, '1993-12-10', N'Hà Nội', N'Chuyên viên thuế', 4, 10),
	( N'Nguyễn Hải Anh', 1, '1990-02-28', N'Hải Dương', N'Chuyên viên tài chính', 4, 10),
	( N'Trần Thanh Tâm', 0, '1995-11-20', N'Vĩnh Phúc', N'Nhân viên hành chính kế toán', 4, 10),
	( N'Nguyễn Hồng Sơn', 1, '1992-12-30', N'Hưng Yên', N'Chuyên viên kiểm toán', 4, 10),
	( N'Nguyễn Hồng Thái', 1, '1991-08-16', N'Hà Nội', N'Chuyên viên phân tích tài chính' , 4, 10),
	( N'Phạm Thanh Sơn', 1, '1993-04-25', N'Hà Nội', N'kế toán viên', 4, 10),
	( N'Mai Trà My', 0, '1995-03-12', N'Nam Định', N'kế toán viên', 4, 10),
	( N'Nguyễn Gia Bảo', 1, '1993-02-20', N'Hà Nội', N'Trưởng phòng kinh doanh',5, 15),
	( N'Mai Nam Hải', 1, '1990-05-04', N'Hải Dương', N'Nhân viên kinh doanh',5, 10),
	( N'Đinh Ngọc Hùng', 1, '1995-09-08', N'Hà Nội', N'Kế toán kinh doanh',5, 10),
	( N'Lưu Minh Anh', 0, '1995-11-29', N'Hà Nội', N'Chuyên viên khách hàng',5, 10),
	( N'Nguyễn Ngọc Huyền', 0, '1994-02-19', N'Hà Nội',N'Chuyên viên marketing',5, 15),
	( N'Nguyễn Thị Hồng Ngọc', 0, '1995-11-21', N'Hà Nội', N'Chuyên viên quản lý dữ liệu kinh doanh',5, 15),
	( N'Vũ Thị Thanh Mai', 0, '1992-12-04', N'Hà Nội', N'Chuyên viên phân tích thị trường',5, 15),
	( N'Nguyễn Hoài Nam', 1, '1994-04-04', N'Hà Nội', N'Trưởng phòng hành chính',6, 15),
	( N'Nguyễn Vũ Hồng Ngọc', 0, '1993-11-09', N'Hà Nội', N'Nhân viên hành chính',6, 10),
	( N'Trần Thị Thu Hương', 0, '1994-05-05', N'Hà Nội', N'Nhân viên hỗ trợ khách hàng',6, 10),
	( N'Lưu Đức Mạnh', 1, '1992-10-22', N'Hà Nội',  N'Chuyên viên tuyển dụng',6, 10),
	( N'Nguyễn Anh Tài', 1, '1990-11-26', N'Hà Nội',N'Chuyên viên tuyển dụng',6, 10),
	( N'Nguyễn Thu Phương', 0, '1995-03-17', N'Hải Dương', N'Nhân viên hỗ trợ khách hàng',6, 10),
	( N'Nguyễn Thu Hằng',0, '1992-04-10', N'Hà Nội', N'Thư ký',6, 10),
	( N'Nguyễn Thị Vân', 0, '1995-07-10', N'Nam Định', N'Nhân viên hỗ trợ khách hàng',6, 10);

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

SELECT *
FROM dbo.KHACHHANG
INNER JOIN dbo.DU_AN ON dbo.KHACHHANG.MAKH = dbo.DU_AN.MAKH;

SELECT dbo.DU_AN.MAKH, TENKH, MADA, TENDA, DIADIEM,NGANSACH, NGAYTHICONG, TRANGTHAI, IMG
FROM dbo.KHACHHANG
INNER JOIN dbo.DU_AN ON dbo.KHACHHANG.MAKH = dbo.DU_AN.MAKH

SELECT MANV, HO_VA_TEN, PHAI, NGAYSINH, DIACHI, phone, email, VITRI, TENPB, LUONG, MAQL
FROM dbo.ACCOUNT
INNER JOIN dbo.NHANVIEN ON dbo.ACCOUNT.accountID = dbo.NHANVIEN.MANV
INNER JOIN dbo.PHONGBAN ON dbo.NHANVIEN.MAPB = dbo.PHONGBAN.MAPB 
where dbo.PHONGBAN.MAPB =1

select MAQL from dbo.PHONGBAN where MAPB=1

select * from dbo.PHONGBAN where MAPB=1