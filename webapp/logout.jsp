<%@ page import="org.prj1223.MemberDAO" %>
<%@ page import="org.prj1223.MemberBean" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.prj1223.DBConnectionDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        table{
            border:1px solid #6495ed;
            background-color: #f0f8ff;
        }

    </style>


</head>
<body>

<center>
    <h2>사용자 정보</h2>
        <%

        Connection con = DBConnectionDAO.get();
        MemberDAO mdao= new MemberDAO(con);
        MemberBean bean= mdao.getMember("id");
        %>

        <form action="login.jsp">
            <table width="600">
                <tr height="40">
                    <td width="150"  align="center">아이디</td>
                    <td  width="150"  align="center"><%=bean.getId()%></td>
                    <td width="150"  align="center">이름</td>
                    <td  width="150" align="center"><%=bean.getName()%></td>


                </tr>
                <tr height="40">
                    <td width="150"  align="center">성별</td>
                    <td  width="150"  align="center"><%=bean.getGender()%></td>
                    <td width="150"  align="center">생년월일</td>
                    <td  width="150" align="center"><%=bean.getBirth()%></td>


                </tr>

                <tr height="40">
                    <td width="150"  align="center">이메일</td>
                    <td  width="150"  align="center"><%=bean.getEmail()%></td>
                </tr>
                <tr height="40">
                    <td width="150"  align="center">우편번호</td>
                    <td  width="150" align="center"><%=bean.getBirth()%></td>
                    <td width="150"  align="center">주소</td>
                    <td  width="150" align="center"><%=bean.getAddress()%></td>
                </tr>
                <tr height="40">
                    <td width="150"  align="center">취미</td>
                    <td  width="150" align="center"><%=bean.getHobby()%></td>
                    <td width="150"  align="center">직업</td>
                    <td  width="150" align="center"><%=bean.getJob()%></td>
                </tr>

                <tr height="40">
                    <td colspan="4" align="center" width="150">
                        <input type="button" onclick="location.href='login.jsp'" value="로그아웃">
                    </td>
                </tr>
            </table>
        </form>
</center>
</body>
</html>