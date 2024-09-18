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
class Q2 {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/quan_ly_toa_nha","root","30111984");
            //2. Liệt kê thông tin của mỗi nhân viên của các công ty cùng với số lần và vị trí ra vào toà nhà trong ngày của họ
            String sql = "SELECT ce.id AS ma_nhan_vien, ce.ten_nhan_vien AS ten_nhan_vien, c.ten_cty AS ten_cong_ty, " +
                         "al.thoi_gian_ra_vao, al.dia_diem_ra_vao, count(al.id) AS entry_exit_count " +
                         "FROM nhanviencongty ce " +
                         "JOIN congty c ON ce.ma_cty = c.id " +
                         "LEFT JOIN nhatkyravao al ON ce.id = al.ma_nhan_vien " +
                         "GROUP BY ce.id, al.thoi_gian_ra_vao, al.dia_diem_ra_vao " +
                         "ORDER BY ce.id, al.thoi_gian_ra_vao";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                System.out.println("Ma nhan vien: " + rs.getString("ma_nhan_vien"));
                System.out.println("Ten nhan vien: " + rs.getString("ten_nhan_vien"));
                System.out.println("Ten cong ty: " + rs.getString("ten_cong_ty"));
                System.out.println("Thoi gian ra vao: " + rs.getString("thoi_gian_ra_vao"));
                System.out.println("Dia diem ra vao: " + rs.getString("dia_diem_ra_vao"));
                System.out.println("So lan ra vao: " + rs.getString("entry_exit_count"));
                System.out.println("-----");
            }
            
        } catch(ClassNotFoundException |SQLException ex){
            Logger.getLogger(Q1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
