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
    %>
    <jsp:useBean id="mbean" class="org.prj1223.MemberBean">
        <jsp:setProperty name="mbean" property="*"/>

    </jsp:useBean>

<%
    Connection con = DBConnectionDAO.get();
    MemberDAO mdao=new MemberDAO(con);
    MemberBean member = mdao.getMember(mbean.getId());
    String password = mdao.getMember(mbean.getId()).getPwd();

    if(password.equals(mbean.getPwd())) {
        response.sendRedirect("loginAccess.jsp");

        if (password != null && password.equals(mbean.getPwd())) {
            out.println("<script>");
            out.println("alert('로그인에 성공하였습니다.');");
            out.println("location.href='loginAccess.jsp';");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('비밀번호가 맞지 않습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
        }
    }
%>
</body>
</html>

</body>
</html>