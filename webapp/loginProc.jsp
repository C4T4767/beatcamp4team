<%@ page import="org.prj1223.MemberDAO"%>
<%@ page import="org.prj1223.MemberBean"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.prj1223.DBConnectionDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String userId = request.getParameter("id");
    String userPwd = request.getParameter("pwd");

    // DB 연결 및 DAO 객체 생성
    Connection con = null;
    try {
        con = DBConnectionDAO.get();
        MemberDAO mdao = new MemberDAO(con);

        // 사용자 정보 조회
        MemberBean member = mdao.getMember(userId);

        if (member != null && member.getPwd().equals(userPwd)) {
            // 로그인 성공
            session.setAttribute("user", member);
            out.println("<script>");
            out.println("alert('로그인에 성공하였습니다.');");
            out.println("location.href='logout.jsp?id="+userId+"'");
            out.println("</script>");
        } else {
            // 로그인 실패
            out.println("<script>");
            out.println("alert('아이디 또는 비밀번호가 잘못되었습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>");
        out.println("alert('시스템 오류가 발생했습니다. 관리자에게 문의하세요.');");
        out.println("history.go(-1);");
        out.println("</script>");
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>