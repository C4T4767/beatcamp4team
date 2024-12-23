<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int num=Integer.parseInt(request.getParameter("num"));
    int ref=Integer.parseInt(request.getParameter("ref"));
    int re_step=Integer.parseInt(request.getParameter("re_step"));

    int re_level=Integer.parseInt(request.getParameter("re_level"));
%>
<center>
    <form action="ReWriteProc.jsp" method="post">
        <table border="1">
            <tr height="40">
                <td align="center" width="150">
                    작성자
                </td>
                <td width="450">
                    <input type="text" name="writer" id="writer" size=55">
                </td>

            </tr>
            <tr height="40">
                <td align="center" width="150">
                    제목
                </td>
                <td>
                    <input type="text" name="subject" id="subject" size=55">
                </td>

            </tr>
            <tr height="40">
                <td align="center" width="150">
                    이메일
                </td>
                <td>
                    <input type="email" name="email" id="email" size=55">
                </td>

            </tr>
            <tr height="40">
                <td align="center" width="150">
                    비밀번호
                </td>
                <td>
                    <input type="password" name="password" id="password" size=55">
                </td>

            </tr>
            <tr height="40">
                <td align="center" width="150">
                    글내용
                </td>
                <td >
                    <textarea rows="10" cols="60" name="content" id="content" ></textarea>
                </td>

            </tr>
            <tr height="40">
                <td colspan="2" align="center" width="150">
                    <input type="hidden" name="ref" value="<%=ref%>">
                    <input type="hidden" name="re_step" value="<%=re_step%>">
                    <input type="hidden" name="re_level" value="<%=re_level%>">


                    <input type="submit" value="답글완료">
                    <input type="reset" value="취소">
                    <input type="button" value="전체글보기" onclick=location.href="BoardList.jsp">

                </td>
            </tr>

        </table>
    </form>
</center>

</body>
</html>
