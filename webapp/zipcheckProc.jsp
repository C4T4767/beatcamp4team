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
    Vector<ZipBean> vec = mdao.getZip(request.getParameter("address"));
%>
<body>
<center>
    <h1>검색된 내용</h1>
    <table border="1">
        <thead>
        <tr height="30">
            <td width="50" align="center">우편번호</td>
            <td width="500" align="center">시/도</td>
            <td width="100" align="center">구</td>
            <td width="150" align="center">도로명</td>
            <td width="50" align="center">선택</td>
        </tr>
        </thead>
        <%
            for(ZipBean zip : vec){
                out.print("<form method='POST' action='index.jsp'>");
                out.print("<tr height=\"30\">");
                out.print("</tr>");
                out.print("<input type='submit' value='선택'");
                out.print("</form>");
            }
        %>
        <tr height="30">
            <td colspan="5" align="center">
                <input type="button" value="글작성" onClick="window.location.href='./'"></input>
            </td>
        </tr>
    </table>
    <%
        for(int i=1;i<=pageCount;i++){
            if(pages==i){
                out.print("["+i+"]");
            }
            else {
                out.print("<a style='text-decoration:none;' href='BoardList.jsp?page=" + i + "'>[" + i + "]</a>");
            }
        }
    %>
</center>
</body>