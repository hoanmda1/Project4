/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
/**
     * kết nối cơ sở dữ liệu
*/
class Q3 {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/quan_ly_toa_nha","root","30111984");
            //3. Liệt kê thông tin của các nhân viên toà nhà cùng lương tháng của họ
            String sql = "SELECT bs.id, bs.ten_nhan_vien, bs.ma_nhan_vien, bs.ngay_sinh, bs.dia_chi, bs.dien_thoai, bs.bac_luong, bs.chuc_vu, bs.phu_cap_chuc_vu, bs.thang_lam_viec, " +
                         "(bs.bac_luong*2340000) AS luong_bac, " +
                         "(bs.phu_cap_chuc_vu*2340000) AS luong_vi_tri, " +
                         "(bs.bac_luong*2340000)+(bs.phu_cap_chuc_vu*2340000) AS luong " +
                         "FROM nhanvientoanha bs " +
                         "WHERE bs.thang_lam_viec = '2024-09-01'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id"));
                System.out.println("Ten nhan vien: " + rs.getString("ten_nhan_vien"));
                System.out.println("Ma nhan vien: " + rs.getString("ma_nhan_vien"));
                System.out.println("ngay sinh: " + rs.getString("ngay_sinh"));
                System.out.println("Dịa chi: " + rs.getString("dia_chi"));
                System.out.println("Dien thoai: " + rs.getString("dien_thoai"));
                System.out.println("Bac luong: " + rs.getString("bac_luong"));
                System.out.println("Chuc vu: " + rs.getString("chuc_vu"));
                System.out.println("Phu cap: " + rs.getString("phu_cap_chuc_vu"));
                System.out.println("Thang lam viec: " + rs.getString("thang_lam_viec"));
                System.out.println("Luong bac: " + rs.getString("luong_bac"));
                System.out.println("Luong vi tri: " + rs.getString("luong_vi_tri"));
                System.out.println("Tong luong: " + rs.getString("luong"));
                System.out.println("-----");
            }
            
        } catch(ClassNotFoundException |SQLException ex){
            Logger.getLogger(Q1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
