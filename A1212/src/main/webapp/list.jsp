<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>


<c:forEach var="book" items="${list}">
<%--    ${book.num}<br>--%>
    <b>${book.title}<br></b>
    ${book.price}<br>
    ${book.author}<br>
    ${book.page}<br><hr>

</c:forEach>

</body>
</html>
