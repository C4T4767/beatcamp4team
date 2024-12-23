package kr.bit.repository;

import kr.bit.entity.BookDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO { //Data Access Object (DB연결하는 클래스)

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public Connection getConnect() {
        String driverClassname="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/booktest";
        String id="root";
        String pw="qwe123";

        try{
            Class.forName(driverClassname);
            con = DriverManager.getConnection(url,id,pw);

        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }

    public List<BookDTO> li() {
        List<BookDTO> list = new ArrayList<>();
        String sql = "select * from book";
        con = getConnect();

        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            int num=rs.getInt("num");
            String title=rs.getString("title");
            int price = rs.getInt("price");
            String author = rs.getString("author");
            int page = rs.getInt("page");

                BookDTO dto= new BookDTO(title, price, author, page);
             list.add(dto);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


}

