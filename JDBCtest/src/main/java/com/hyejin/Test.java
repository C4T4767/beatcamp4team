package com.hyejin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Test {
    public static void main(String[] args) {
//mysql, 자바간 연결 설정
        Connection con = null;

        try {
            //mysql에 로그인할 때 사용하는 사용자 이름, 비번 선언
            String id = "root";
            String pw = "qwe123";
            String url = "jdbc:mysql://localhost:3306/khj";

            //mysql jdbc드라이버 로드한다.
            //로드가 되면 DriverManager에 자동으로 등록되어 연결할 준비를 한다.
            Class.forName("com.mysql.cj.jdbc.Driver");

            //데이터베이스와 연결 설정 ->
            //연결에 성공하면 connection객체 con은 연결다리 역할 하게된다
            con = DriverManager.getConnection(url, id, pw);

            System.out.println("데이터베이스에 연결됐다");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (con != null) {
                try {
                    con.close();
                    System.out.println("연결끊기");
                } catch (SQLException e) {
                }
            }
        }
    }
}