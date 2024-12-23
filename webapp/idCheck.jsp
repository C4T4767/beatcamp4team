
<%@ page import="java.util.Vector" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.prj1223.DBConnectionDAO" %>
<%@ page import="org.prj1223.MemberDAO" %>
<%@ page import="org.prj1223.MemberBean" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <style>

    </style>
    <title></title>
</head>
<body>

<%
    Connection con = DBConnectionDAO.get();
    MemberDAO mdao = new MemberDAO(con);
    String user=request.getParameter("user");

    MemberBean check_mdao= mdao.getMember(user);

    if(check_mdao.getId()!=null) {
        out.print("아이디 중복입니다.");
%>
<script>
    alert("아이디 중복입니다.");
    window.close();
</script>
<%
}
else {
    out.print("사용가능한 아이디입니다.");
%>
<script>
    alert("사용가능한 아이디입니다.");
    window.opener.setCheck();
    window.close();
</script>
<%
    }
%>


</body>
</html>