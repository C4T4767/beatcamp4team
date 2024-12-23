package com.hyejin.test1;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC1210 {
    private static String id = "root";
    private static String pw = "qwe123";
    private static String url = "jdbc:mysql://localhost:3306/khj5";
    private static Connection con = null;


    public static void main(String[] args) {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, id, pw);

            //procedures
            insert_student("나길순", 170.1, 2);


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static void insert_student
            (String name, double height, int deptCode)
                                         throws SQLException {
        String sql = "{CALL insert_student(?,?,?)}";
        try (CallableStatement cstmt = con.prepareCall(sql)) {
            cstmt.setString(1,name);
            cstmt.setDouble(2, height);
            cstmt.setInt(3,deptCode);
            cstmt.executeUpdate();
            System.out.println("Procedure => insert_student");
        }

    }
}