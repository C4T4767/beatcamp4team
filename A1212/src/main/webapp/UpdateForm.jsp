<%@ page import="kr.bit.bean.BoardDAO" %>
<%@ page import="kr.bit.bean.BoardBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <center>
        <h2>게시글 수정</h2>
        <%
            int num=Integer.parseInt(request.getParameter("num"));
            BoardDAO bdao = new BoardDAO();
            BoardBean bean = bdao.oneupdateBoard(num);

        %>
        <form action="UpdateProc.jsp">
            <table width="600" border="1">
                <tr height="40">
                    <td width="150"  align="center">번호</td>
                    <td  width="150"  align="center"><%=bean.getNum()%></td>
                    <td width="150"  align="center">조회수</td>
                    <td  width="150" align="center"><%=bean.getReadcount()%></td>

                </tr>

                <tr height="40">
                    <td width="150"  align="center">작성자</td>
                    <td  align="center"><%=bean.getWriter()%></td>
                    <td  align="center">작성날짜</td>
                    <td  align="center"><%=bean.getReg_date()%></td>

                </tr>

                <tr height="40">
                    <td width="150"  align="center">제목</td>
                    <td   align="center" colspan="3" >
                        <input type="text" name="subject" value="<%=bean.getSubject()%>">
                    </td>
                </tr>

                <tr height="40">
                    <td width="150"  align="center">비밀번호</td>
                    <td  align="center" colspan="3" >
                    <input type="password" name="password" value="<%=bean.getPassword()%>">
                    </td>
                </tr>

                <tr height="40">
                    <td width="150"  align="center">글내용</td>
                    <td  align="center" colspan="3" >
                        <textarea rows="10" cols="50" name="content"><%=bean.getContent()%></textarea>
                    </td>
                </tr>

                <tr height="40">
                    <td colspan="4" align="center" width="150">
                        <input type="hidden" name="num" value="<%=bean.getNum()%>">
                               <input type="submit" value="수정">
                        <input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기">
                    </td>
                </tr>
            </table>
            </form>
    </center>

</body>
</html>
