package kr.bit.bean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.Vector;

import static java.lang.Class.forName;

public class BoardDAO {
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;

    public void getCon() {

        try {
            Context initContext = new InitialContext(); //DataSource 검색
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/khj7");

            con = ds.getConnection(); //연결객체 가져온다
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    public void insertBoard(BoardBean boardbean) {
        getCon();

        int ref = 0;
        int re_step = 1;
        int re_level = 1;

        try {
            String sql1 = "select max(ref) from board";
            pstmt = con.prepareStatement(sql1);
            rs=pstmt.executeQuery();

            if(rs.next()){
                ref=rs.getInt(1)+1;
            }

             String sql = "insert into board values(num,?,?,?,?,now(),?,?,?,0,?)";

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, boardbean.getWriter());
            pstmt.setString(2, boardbean.getEmail());
            pstmt.setString(3, boardbean.getSubject());
            pstmt.setString(4, boardbean.getPassword());
            pstmt.setInt(5, ref);
            pstmt.setInt(6, re_step);
            pstmt.setInt(7, re_level);
            pstmt.setString(8, boardbean.getContent());

            pstmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Vector<BoardBean> allBoard(int startRow, int pageSize) {
        Vector<BoardBean> v = new Vector<>();

        getCon();

        try {
            String sql1 = "select * from board order by ref desc, re_step asc, re_level asc limit ?,?";

            pstmt = con.prepareStatement(sql1);
            pstmt.setInt(1, startRow-1);
            pstmt.setInt(2, pageSize);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardBean bean = new BoardBean();
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_date(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadcount(rs.getInt(10));
                bean.setContent(rs.getString(11));

                v.add(bean);
            }
            con.close();
        } catch (Exception e) {
        }
        return v;
    }

    public BoardBean oneBoard(int num) {
        BoardBean bean = new BoardBean();

        getCon();
        try {
            String sql2 = "update board set readcount=readcount+1 where num=?";
            pstmt = con.prepareStatement(sql2);
            pstmt.setInt(1, num);

            pstmt.executeUpdate();

            String sql = "select * from board where num=?";
            //db에 값을 가져와서 브라우저에 출력해야함
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_date(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadcount(rs.getInt(10));
                bean.setContent(rs.getString(11));
            }
            con.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return bean;
    }

    public BoardBean oneupdateBoard(int num) {
        BoardBean bean = new BoardBean();

        getCon();
        try {
            String sql = "select * from board where num=?";

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_date(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadcount(rs.getInt(10));
                bean.setContent(rs.getString(11));

            }con.close();

        }catch(Exception e){}
        return bean;
    }

    public String getPass(int num) {
        getCon();
        String pass="";

        try{
            String sql="select password from board where num=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1,num);

            rs=pstmt.executeQuery();

            if(rs.next()){
                pass=rs.getString(1);
            }
            con.close();
        }catch (Exception e){}
        return pass;
    }
    public void updateBoard(BoardBean bean) {
        getCon();

        try{
            String sql="update board set subject=?, content=? where num=?";
            pstmt=con.prepareStatement(sql);

            pstmt.setString(1, bean.getSubject());
            pstmt.setString(2, bean.getContent());
            pstmt.setInt(3, bean.getNum());

            pstmt.executeUpdate();
            con.close();
        }catch (Exception e){}
    }

    public void deleteBoard(int num) {
        getCon();

        try{
            String sql="delete from board where num=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1,num);
            pstmt.executeUpdate();
            con.close();

        }catch (Exception e){}
    }

    public void reWriteBoard(BoardBean bean) {

        int ref = bean.getRef();
        int re_step = bean.getRe_step();
        int re_level = bean.getRe_level();

        getCon();

        try{
            String sql1="update board set re_level=re_level+1 where ref=? and re_level>?";

            pstmt=con.prepareStatement(sql1);
            pstmt.setInt(1,ref);
            pstmt.setInt(2,re_level);

            pstmt.executeUpdate();

            //댓글을 디비에 삽입시킨다.
//            String sql2="insert board values("

            String sql2="insert into board values(num,?,?,?,?,now(),?,?,?,0,?)";
            pstmt=con.prepareStatement(sql2);

            pstmt.setString(1, bean.getWriter());
            pstmt.setString(2, bean.getEmail());
            pstmt.setString(3, bean.getSubject());
            pstmt.setString(4, bean.getPassword());
            pstmt.setInt(5, ref);
            pstmt.setInt(6, re_step+1);
            pstmt.setInt(7, re_level+1);
            pstmt.setString(8, bean.getContent());
            pstmt.executeUpdate();

            con.close();
        }catch (Exception e){}
    }

    public int getAllcount(){
        getCon();
        int count=0;
        try{
            String sql="select count(*) from board";
            pstmt=con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()){
                count=rs.getInt(1);
            }
            con.close();

        }catch (Exception e){}
        return count;
    }
}



