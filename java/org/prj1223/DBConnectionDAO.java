package org.prj1223;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionDAO {
    public static Connection get(){
        Connection con = null;

        try{
            String id="root";
            String pw="pass";
            String url="jdbc:mysql://localhost:3306/team1223";

            Class.forName("com.mysql.cj.jdbc.Driver");

            con= DriverManager.getConnection(url,id,pw);
            System.out.println("연결됨");
        }catch (Exception e){
            System.out.println("연결실패");
            throw new RuntimeException(e);
        }
        return con;
    }
}