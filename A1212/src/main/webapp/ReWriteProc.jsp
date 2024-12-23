<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.bit.bean.BoardDAO" %>
<%@ page import="kr.bit.bean.BoardBean" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="boardbean" class="kr.bit.bean.BoardBean" scope="request">
    <jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>


<%
    BoardDAO bdao=new BoardDAO();
    bdao.reWriteBoard(boardbean);

    response.sendRedirect("BoardList.jsp");
%>
</body>
</html>
