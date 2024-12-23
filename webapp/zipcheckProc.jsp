<%@ page import="java.util.Vector" %>
<%@ page import="org.prj1223.MemberDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.prj1223.DBConnectionDAO" %>
<%@ page import="org.prj1223.ZipBean" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
%>

<%
    Connection con = DBConnectionDAO.get();
    MemberDAO mdao = new MemberDAO(con);
    String address = "강남";
    Vector<ZipBean> vec = mdao.getZip(address);
%>
<body>
<center>
    <h1>검색된 내용</h1>
    <table border="1">
        <thead>
        <tr height="30">
            <td width="100" align="center">우편번호</td>
            <td width="500" align="center">시/도</td>
            <td width="100" align="center">구</td>
            <td width="150" align="center">도로명</td>
            <td width="50" align="center">선택</td>
        </tr>
        </thead>
        <%
            for (ZipBean zip : vec) {
        %>
        <form method="POST" action="index.jsp">
            <tr height="30">
                <td><%= zip.getZipcode() %></td>
                <td><%= zip.getArea1() %></td>
                <td><%= zip.getArea2() %></td>
                <td><%= zip.getArea3() %></td>
            </tr>
            <input type="hidden" name="zipcode" value="<%= zip.getZipcode() %>">
            <input type="hidden" name="area1" value="<%= zip.getArea1() %>">
            <input type="hidden" name="area2" value="<%= zip.getArea2() %>">
            <input type="hidden" name="area3" value="<%= zip.getArea3() %>">
            <input type="submit" value="선택">
        </form>
        <%
            }
        %>
    </table>
</center>
</body>