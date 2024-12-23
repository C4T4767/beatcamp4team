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
    <h2>로그인</h2>

    <form action="loginProc.jsp" method="post">
        <table width="300" >

            <tr height="50">

                <td width="100" align="center">아이디</td>
                <td width="200" align="center"><input type="text" name="id" size="20"></td>
            </tr>
            <tr height="50">
                <td width="100" align="center">비밀번호</td>
                <td width="200" align="center"><input type="password" name="pwd" size="20"></td>
            </tr>
            <tr height="50">
                <td align="center" colspan="2"><input type="submit" value="로그인">
                    <input type="button" value="회원가입"
                           onclick=location.href="index.jsp"></td>
            </tr>


        </table>
    </form>

</center>



</body>
</html>