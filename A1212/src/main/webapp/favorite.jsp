<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="fbean" class="kr.bit.bean.favoBean">
    <jsp:setProperty name="fbean" property="*"/>
</jsp:useBean>

좋아하는 색: <jsp:getProperty name="fbean" property="color"/><br>
좋아하는 음악: <jsp:getProperty name="fbean" property="music"/>


</body>
</html>
