<%@ page import="kr.bit.bean.BoardDAO" %>
<%@ page import="kr.bit.bean.BoardBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="boardbean" class="kr.bit.bean.BoardBean">
    <jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>


 <%
     BoardDAO bdao = new BoardDAO();
    String password=bdao.getPass(boardbean.getNum());

    if(password.equals(boardbean.getPassword())){
        bdao.updateBoard(boardbean);
        response.sendRedirect("BoardList.jsp");
    }
    else{
 %>
<script>
    alert("비밀번호 맞지 않습니다");
    history.go(-1);
</script>
<%
    }
%>
</body>
</html>
