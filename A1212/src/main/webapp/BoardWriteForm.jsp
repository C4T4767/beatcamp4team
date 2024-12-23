<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.bit.bean.BoardDAO" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>

<%--    useBean 사용하여 BoardBean에 필드--%>
<jsp:useBean id="boardbean" class="kr.bit.bean.BoardBean">
    <jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>

<%
    BoardDAO bdao = new BoardDAO();
    bdao.insertBoard(boardbean);

    response.sendRedirect("BoardList.jsp");
%>

</body>
</html>
