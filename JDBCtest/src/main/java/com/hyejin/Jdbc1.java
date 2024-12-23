package com.hyejin;
import java.io.FileInputStream;
import java.sql.*;

public class Jdbc1 {
    public static void main(String [] args) throws SQLException {

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

            String sql="insert into boards(btitle, bcontent, bwriter, bdate, bfilename, bfiledata)"
                    +"values(?,?,?,now(),?,?)";

            PreparedStatement psmt=con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            //자동증가된 bno값을 가져옴

            psmt.setString(1,"화요일");
            psmt.setString(2,"화요일입니다");
            psmt.setString(3,"juli");
            psmt.setString(4,"곰돌이");
            psmt.setBlob(5,new FileInputStream("C://Users//kim51//Desktop//네이티브16기 김혜진//곰돌이.jpg"));

            int r=psmt.executeUpdate();
            System.out.println(r);

            if(r==1){
                ResultSet rs =psmt.getGeneratedKeys();
                if(rs.next()){
                    int bno=rs.getInt(1);
                    System.out.println(bno);
                }
                rs.close();
            }


            psmt.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        con.close(); //연결 끊기

    }
}