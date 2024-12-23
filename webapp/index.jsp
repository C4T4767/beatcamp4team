<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        span {color: red;}
        label {display: inline-block; width: 180px;}
        #join {margin-left: 450px;}


    </style>
</head>

<body>

<h2>회원 가입</h2>
<form method="post" action="memberProc.jsp">


    <label>아이디</label> <!--필수-->
    <span>* </span><input type="text" id="user" name="user" required>
    <input type="button" value="ID중복확인" onclick="id_check()"><br>

    <label>비밀번호</label> <!--필수-->
    <span>* </span><input type="password" id="pwd" name="pwd" required><br>
    <label>비밀번호 확인</label> <!--필수-->
    <span>* </span><input type="password" id="pwdchk" name="pwdchk" required><br>

    <label>이름</label> <!--필수-->
    <span>* </span><input type="text" id="name" name="name" required><br>

    <label>성별</label><span>* </span> <!--필수-->
    <input type="radio" name="gender" id="gender1" value="man" checked>남
    <input type="radio" name="gender" id="gender2" value="woman">여<br>

    <label>생년월일</label>
    <span>* </span><input type="text" id="birth" name="birth" required> ex)900323<br>

    <label>Email</label>
    <span>* </span><input type="text" id="email" name="email" required><br>

    <label>우편번호</label>
    <input type="text" id="zip" name="zip">
    <input type="button" value="우편번호 찾기" onclick="find_zip()"><br>
    <label>주소</label>
    <input type="text" id="addr" name="addr"><br>
    <label>핸드폰번호</label>
    <input type="text" id="phone" name="phone"><br>

    <label>취미</label>
    <input type="checkbox" id="internet" name="hobby" value="internet">인터넷
    <input type="checkbox" id="travel" name="hobby" value="travel">여행
    <input type="checkbox" id="game" name="hobby" value="game">게임
    <input type="checkbox" id="movie" name="hobby" value="movie">영화
    <input type="checkbox" id="exercise" name="hobby" value="exercise">운동<br>

    <label>직업</label>
    <select name="job" id="job">
        <option>선택하세요</option>
        <option>학생</option>
        <option>의사</option>
        <option>변호사</option>
        <option>IT</option>
        <option>기타</option>
    </select><br>

    <input type="submit" id="join" value="회원가입">
    <input type="reset" id="cancle" value="다시쓰기">
</form>

<script>

    function id_check() {
        let win=window.open("idCheck.jsp","IDCHECK","width=2000 height=3000");
        win.document.close();
    }

    function find_zip() {
        let win=window.open("zip.jsp","FINDZIP","width=2000 height=3000");
        win.document.close();
    }

    function setZipData(zipcode) {
        document.getElementById("zip").value = zipcode;
    }

</script>

</body>
</html>
