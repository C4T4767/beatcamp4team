<%@ page import="org.prj1223.MemberDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.prj1223.DBConnectionDAO" %>
<%@ page import="org.prj1223.MemberBean" %>

<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mbean" class="org.prj1223.MemberBean">
    <jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>
<%
    Connection con = DBConnectionDAO.get();
    MemberDAO mdao=new MemberDAO(con);
    mdao.insertMember(mbean);
    response.sendRedirect("login.jsp");
%>