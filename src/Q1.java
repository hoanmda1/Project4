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
class Q1 {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/quan_ly_toa_nha","root","30111984");
            //1. Liệt kê thông tin của các công ty cùng với tổng số tiền mỗi tháng mà các công ty phải trả
            String sql = "SELECT c.id, c.ten_cty, " +
                         "(c.dt_mat_bang * (CASE WHEN c.so_cong_nhan < 10 AND c.dt_mat_bang < 100 THEN 100 ELSE 100 + " +
                         "(FLOOR((c.so_cong_nhan - 5) / 5) * 5) + (FLOOR((c.dt_mat_bang - 100) / 10) * 5) END)) AS Tien_chi_mat_bang, " +
                         "SUM(bs.don_gia) AS Tien_chi_dich_vu, " +
                         "(c.dt_mat_bang * (CASE WHEN c.so_cong_nhan < 10 AND c.dt_mat_bang < 100 THEN 100 ELSE 100 + " +
                         "(FLOOR((c.so_cong_nhan - 5) / 5) * 5) + (FLOOR((c.dt_mat_bang - 100) / 10) * 5) END)) + SUM(bs.don_gia) AS Tong_tien_chi_hang_thang " +
                         "FROM congty c " +
                         "LEFT JOIN congtysudungdichvu csu ON c.id = csu.ma_cty " +
                         "LEFT JOIN dichvutoanha bs ON csu.ma_dich_vu = bs.id " +
                         "GROUP BY c.id, c.ten_cty " +
                         "ORDER BY Tong_tien_chi_hang_thang DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                System.out.println("Ma cong ty: " + rs.getString("id"));
                System.out.println("Ten Cong Ty: " + rs.getString("ten_cty"));
                System.out.println("Tien chi mat bang: " + rs.getString("Tien_chi_mat_bang"));
                System.out.println("Tien_chi_dich_vu: " + rs.getString("Tien_chi_dich_vu"));
                System.out.println("Tong_tien_chi_hang_thang: " + rs.getString("Tong_tien_chi_hang_thang"));
                System.out.println("-----");
            }
            
        } catch(ClassNotFoundException |SQLException ex){
            Logger.getLogger(Q1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
