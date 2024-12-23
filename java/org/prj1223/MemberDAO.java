package org.prj1223;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MemberDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public MemberDAO(Connection con) {
        this.con=con;
    }
    public void insertMember(MemberBean member) throws SQLException {
        StringBuilder hobbys = new StringBuilder();
        if(member.getHobby() !=null){
            for(String hb : member.getHobby()) {
                switch (hb) {
                    case "game":
                        hobbys.append("게임");
                        break;
                    case "travel":
                        hobbys.append("여행");
                        break;
                    case "internet":
                        hobbys.append("인터넷");
                        break;
                    case "movie":
                        hobbys.append("영화");
                        break;
                    case "exercise":
                        hobbys.append("운동");
                        break;
                    default:
                        break;
                }
                hobbys.append(" ");
            }
        }
        String sql ="insert into member values(?,?,?,?,?,?,?,?,?,?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, member.getId());
        ps.setString(2, member.getPwd());
        ps.setString(3, member.getName());
        ps.setString(4, String.valueOf(member.getGender()));
        ps.setString(5,member.getEmail());
        ps.setString(6,member.getBirth());
        ps.setString(7,member.getZipcode());
        ps.setString(8,member.getAddress());
        ps.setString(9,hobbys.toString().trim());
        ps.setString(10,member.getJob());
        ps.executeUpdate();
    }

    public MemberBean getMember(String id) throws SQLException {
        MemberBean member = new MemberBean();
        String sql = "select * from member where id=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, id);
        rs = ps.executeQuery();
        if(rs.next()) {
            member.setId(rs.getString("id"));
            member.setPwd(rs.getString("pwd"));
            member.setName(rs.getString("name"));
            member.setGender(rs.getString("gender").charAt(0));
            member.setEmail(rs.getString("email"));
            member.setBirth(rs.getString("birth"));
            member.setZipcode(rs.getString("zipcode"));
            member.setHobby(rs.getString("hobby").split(" "));
            member.setAddress(rs.getString("address"));
            member.setJob(rs.getString("job"));
        }
        return member;
    }

    public Vector<ZipBean> getZip(String address) throws SQLException {
        String sql = "SELECT * FROM zip WHERE area1 LIKE ? OR area2 LIKE ? or area3 LIKE ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, "%" + address + "%");
        ps.setString(2, "%" + address + "%");
        ps.setString(3, "%" + address + "%");
        rs = ps.executeQuery();
        Vector<ZipBean> vec = new Vector<>();
        while(rs.next()) {
            ZipBean zip = new ZipBean();
            zip.setZipcode(rs.getString("zipcode"));
            zip.setArea1(rs.getString("area1"));
            zip.setArea2(rs.getString("area2"));
            zip.setArea3(rs.getString("area3"));
            vec.add(zip);
        }
        return vec;
    }
}
