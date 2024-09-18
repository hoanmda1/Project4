-- tạo cơ sở dữ liệu
CREATE DATABASE Quan_ly_toa_nha;  
USE Quan_ly_toa_nha;  

-- 1. Bảng công ty  
CREATE TABLE CongTy (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    ten_cty VARCHAR(100) NOT NULL,  
    ma_thue VARCHAR(50) NOT NULL,  
    von_dieu_le DECIMAL(15, 2) NOT NULL,  
    nganh_nghe_hoat_dong VARCHAR(100),  
    so_cong_nhan INT NOT NULL,  
    dia_chi VARCHAR(255),  
    dien_thoai VARCHAR(15),  
    dt_mat_bang DECIMAL(10, 2) NOT NULL  
);  

-- 2.Bảng nhân viên công ty 
CREATE TABLE NhanVienCongTy (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    ma_cty INT,  
    cmt VARCHAR(20) NOT NULL,  
    ten_nhan_vien VARCHAR(100) NOT NULL,  
    ngay_sinh DATE,  
    so_dien_thoai VARCHAR(15),  
    FOREIGN KEY (ma_cty) REFERENCES CongTy(id)  
);  

-- 3.Dịch vụ của tòa nhà  
CREATE TABLE DichVuToaNha (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    ten_dich_vu VARCHAR(100) NOT NULL,  
    loai_dich_vu VARCHAR(100),  
    don_gia DECIMAL(10, 2) NOT NULL  
);  

-- 4. Nhân viên của tòa nhà 
CREATE TABLE NhanVienToaNha (  
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_nhan_vien INT,
    ten_nhan_vien VARCHAR(100) NOT NULL, 
    ngay_sinh DATE,  
    dia_chi VARCHAR(255),  
    dien_thoai VARCHAR(15),  
    bac_luong VARCHAR(50),  
    chuc_vu VARCHAR(100),
    phu_cap_chuc_vu VARCHAR(50),
    thang_lam_viec DATE 
);  

-- 5.Công Ty sử dụng dịch vụ của tòa nhà  
CREATE TABLE CongTySuDungDichVu (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    ma_cty INT,  
    ma_dich_vu INT,  
    ngay_dang_ky_su_dung DATE,  
    FOREIGN KEY (ma_cty) REFERENCES CongTy(id),  
    FOREIGN KEY (ma_dich_vu) REFERENCES DichVuToaNha(id)  
);  

-- 6. Nhật ký ra vào tòa nhà của nhân viên công ty  
CREATE TABLE NhatKyRaVao (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    ma_nhan_vien INT,  
    thoi_gian_ra_vao DATETIME,  
    dia_diem_ra_vao VARCHAR(50),  
    FOREIGN KEY (ma_nhan_vien) REFERENCES NhanVienCongTy(id)  
);  


-- Nhập dữ liệu vào Bảng Công ty  
INSERT INTO congty (ten_cty,ma_thue, von_dieu_le, nganh_nghe_hoat_dong, so_cong_nhan, dia_chi, dien_thoai, dt_mat_bang)  
VALUES   
('FPT GROUP', '123456789', 1000000, 'Dịch vụ CNTT', 5, '123 Đường Chính', '0123456789', 80),  
('VIETTEL GROUP', '987654321', 2000000, 'Tư vấn', 15, '456 Đường Phụ', '0987654321', 150),  
('VINAPHONE GROUP', '111222333', 1500000, 'Tài chính', 20, '789 Đường Tàu', '0112233445', 200);  

-- Nhập dữ liệu vào Bảng Nhân viên Công ty  
INSERT INTO nhanviencongty (ma_cty, cmt, ten_nhan_vien, ngay_sinh, so_dien_thoai)  
VALUES   
(1, 'ID001', 'Hòa', '1990-01-01', '0123456789'),  
(1, 'ID002', 'Bình', '1985-02-02', '0123456788'),  
(2, 'ID003', 'Chiến', '1992-03-03', '0987654321'),  
(3, 'ID004', 'Thắng', '1980-04-04', '0112233445');  

-- Nhập dữ liệu vào Bảng Dịch vụ  
INSERT INTO dichvutoanha (ten_dich_vu, loai_dich_vu, don_gia)  
VALUES   
('Vệ sinh', 'Bảo trì', 100),  
('Ăn uống', 'Thực phẩm', 200),  
('Trông giữ xe', 'Giao thông', 50),  
('Bảo vệ', 'An ninh', 150),  
('Bảo trì thiết bị', 'Bảo trì', 120);  

-- Nhập dữ liệu vào Bảng Nhân viên Toà nhà  
INSERT INTO nhanvientoanha (ma_nhan_vien, ten_nhan_vien, ngay_sinh, dia_chi, dien_thoai, bac_luong, chuc_vu, phu_cap_chuc_vu, thang_lam_viec)  
VALUES   
(1,'Liên', '1990-05-05', '101 Đường Thông', '0112233446', '4.44', 'Quản lý','0.7','2024-09-01'),  
(2,'Hoan', '1988-06-06', '202 Đường Cúc', '0112233447', '2.34', 'Trợ lý','0.3','2024-09-01');  

-- Nhập dữ liệu vào Bảng Công ty sử dụng Dịch vụ  
INSERT INTO congtysudungdichvu (ma_cty, ma_dich_vu, ngay_dang_ky_su_dung)  
VALUES   
(1, 1, '2024-09-01'),  
(1, 4, '2024-09-01'),  
(2, 1, '2024-09-01'),  
(2, 2, '2024-09-01'),  
(3, 1, '2024-09-01'),  
(3, 3, '2024-09-01');  

-- Nhập dữ liệu vào Bảng Nhật ký ra/vào  
INSERT INTO nhatkyravao (ma_nhan_vien, thoi_gian_ra_vao, dia_diem_ra_vao)  
VALUES   
(1, '2024-09-01 08:00:00', 'Tầng 1'),  
(1, '2024-09-01 17:00:00', 'Tầng 1'),  
(2, '2024-09-01 08:30:00', 'Hầm B1'),  
(3, '2024-09-01 09:00:00', 'Tầng 1'),  
(4, '2024-09-01 10:00:00', 'Hầm B2');  
-- truy vấn yêu cầu thông tin của bài
-- 1.Liệt kê thông tin của các công ty cùng với tổng số tiền mỗi tháng mà các công ty phải trả.
SELECT c.id, c.ten_cty,   
       (c.dt_mat_bang * (CASE   
           WHEN c.so_cong_nhan < 10 AND c.dt_mat_bang < 100 THEN 100   
           ELSE 100 + (FLOOR((c.so_cong_nhan - 5) / 5) * 5) + (FLOOR((c.dt_mat_bang - 100) / 10) * 5)   
       END)) AS Tien_chi_mat_bang,  
       SUM(bs.don_gia) AS Tien_chi_dich_vu,  
       (c.dt_mat_bang * (CASE   
           WHEN c.so_cong_nhan < 10 AND c.dt_mat_bang < 100 THEN 100   
           ELSE 100 + (FLOOR((c.so_cong_nhan - 5) / 5) * 5) + (FLOOR((c.dt_mat_bang - 100) / 10) * 5)   
       END)) + SUM(bs.don_gia) AS Tong_tien_chi_hang_thang  
FROM congty c  
LEFT JOIN congtysudungdichvu csu ON c.id = csu.ma_cty  
LEFT JOIN dichvutoanha bs ON csu.ma_dich_vu = bs.id  
GROUP BY c.id, c.ten_cty  
ORDER BY Tong_tien_chi_hang_thang DESC;  
-- 2.Liệt kê thông tin của mỗi nhân viên của các công ty cùng với số lần và vị trí ravào toà nhà trong ngày của họ.
SELECT ce.id AS ma_nhan_vien, ce.ten_nhan_vien AS ten_nhan_vien, c.ten_cty AS ten_nhan_vien,   
       al.thoi_gian_ra_vao, al.dia_diem_ra_vao,count(al.id) AS entry_exit_count  
FROM nhanviencongty ce  
JOIN congty c ON ce.ma_cty = c.id  
LEFT JOIN nhatkyravao al ON ce.id = al.ma_nhan_vien  
GROUP BY ce.id, al.thoi_gian_ra_vao, al.dia_diem_ra_vao  
ORDER BY ce.id, al.thoi_gian_ra_vao;  
-- 3.	Liệt kê thông tin của các nhân viên toà nhà cùng lương tháng của họ.
SELECT bs.id, bs.ten_nhan_vien, bs.ma_nhan_vien, bs.ngay_sinh, bs.dia_chi, bs.dien_thoai, bs.bac_luong, bs.chuc_vu, bs.phu_cap_chuc_vu, bs.thang_lam_viec,
		(bs.bac_luong*2340000)as luong_bac,
		(bs.phu_cap_chuc_vu*2340000)as luong_vi_tri,
		(bs.bac_luong*2340000)+(bs.phu_cap_chuc_vu*2340000) AS luong
FROM nhanvientoanha bs  
WHERE bs.thang_lam_viec = '2024-09-01'; 
