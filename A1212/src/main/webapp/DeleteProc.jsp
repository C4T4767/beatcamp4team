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
  String pass=request.getParameter("password");

  BoardDAO bdao=new BoardDAO();
  String password = bdao.getPass(num);

  if(password.equals(pass)){
    bdao.deleteBoard(num);
    response.sendRedirect("BoardList.jsp");
  }
  else{
%>

  <script>
    alert("비밀번호 맞지 않습니다");
    history.go(-1);
  </script>

  <jsp:useBean id="boardbean" class="kr.bit.bean.BoardBean">
    <jsp:setProperty name="boardbean" property="*" />
  </jsp:useBean>

<%
  }
%>
</body>
</html>
