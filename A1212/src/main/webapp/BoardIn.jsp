<%@ page import="kr.bit.bean.BoardDAO" %>
<%@ page import="kr.bit.bean.BoardBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int num=Integer.parseInt(request.getParameter("num"));
    BoardDAO bdao = new BoardDAO();

    BoardBean bean = bdao.oneBoard(num);
%>

<center>
    <h2>하나의 게시글</h2>

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
                <td width="150"  align="center">이메일</td>
                <td colspan="3" align="center"><%=bean.getEmail()%></td>

            </tr>

            <tr height="40">
                <td width="150"  align="center">제목</td>
                <td  align="center" colspan="3" ><%=bean.getSubject()%></td>


            </tr>

            <tr height="40">
                <td width="150"  align="center">글내용</td>
                <td  align="center" colspan="3" ><%=bean.getContent()%></td>
            </tr>

            <tr height="40">
                <td colspan="4" align="center" width="150">
                    <input type="button" value="댓글쓰기"
                           onclick="location.href='ReWriteForm.jsp?num=<%=bean.getNum() %>&ref=<%=bean.getRef() %>&re_step=<%=bean.getRe_step() %>&re_level=<%=bean.getRe_level()%>'">
                    <input type="button" value="수정" onclick=location.href="UpdateForm.jsp?num=<%=bean.getNum()%>">
                    <input type="button" value="삭제" onclick=location.href="DeleteForm.jsp?num=<%=bean.getNum()%>">
                    <input type="button" value="목록" onclick=location.href="BoardList.jsp">
                </td>
            </tr>
        </table>
</center>

</body>
</html>
