<%@ page import="java.util.Vector" %>
<%@ page import="org.prj1223.MemberDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.prj1223.DBConnectionDAO" %>
<%@ page import="org.prj1223.ZipBean" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
%>

<%
    request.setCharacterEncoding("utf-8");
    Connection con = DBConnectionDAO.get();
    MemberDAO mdao = new MemberDAO(con);
    String address = request.getParameter("writer");
    System.out.println(address);
    Vector<ZipBean> vec = mdao.getZip(address);
%>
<head>
    <style>
        table, tr, td{
            border:1px solid #6495ed;
        }
    </style>
</head>
<body>
<center>
    <h1>검색된 내용</h1>
    <table border="1">
        <thead>
        <tr height="30">
            <td width="100" align="center">우편번호</td>
            <td width="100" align="center">시/도</td>
            <td width="100" align="center">구</td>
            <td width="200" align="center">도로명</td>
            <td width="60" align="center">선택</td>
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
                <td><input type="button" value="선택" onclick="sendDataToParent()"></td>
            <input type="hidden" name="zipcode" value="<%= zip.getZipcode() %>">
            </tr>
        </form>
        <%
            }
        %>
    </table>
</center>
<script>
    function sendDataToParent() {
        let zipcode = document.getElementsByName("zipcode")[0].value;
        window.opener.setZipData(zipcode)
        window.close();
    }
</script>
</body>