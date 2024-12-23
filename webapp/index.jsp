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
        .box{
            border:1px solid blue;
            background: #F0F8FF;
            width: 630px;
            padding-bottom: 5px;
            padding-left:10px;
            margin:auto;
        }
        input[type=text], input[type=password], input[type=email] {
            width: 300px;
        }
        input[id=birth]{
            width: 200px;
        }
        input[id=zip]{
            width: 170px;
        }
        input[type=submit]{
            margin-right: 10px;
        }
        select{
            width: 140px;
        }
        .checked{
            background: green;
            color:white;
        }
    </style>
</head>

<body>
    <div class="box">
<h2 style="text-align:center;">회원 가입</h2>
<form method="post" action="memberProc.jsp">


    <label>
        아이디 <span>*</span>
    </label>
    <input type="text" id="user" name="id" required>
    <input type="button" value="ID중복확인" id="idCheckButton" onclick="id_check()"><br>
    <input type="checkbox" name="isDuplicate" id="isDuplicate" hidden>


    <label>
        비밀번호 <span>*</span>
    </label> <input type="password" id="pwd" name="pwd" required><br>
    <label>비밀번호 확인
        <span>*</span></label>
    <input type="password" id="pwdchk" name="pwdchk" required><br>

    <label>
        이름 <span>*</span>
    </label>
    <input type="text" id="name" name="name" required><br>

    <label>
        성별 <span>*</span></label>
    <input type="radio" name="gender" id="gender1" value="man" checked>남
    <input type="radio" name="gender" id="gender2" value="woman">여<br>

    <label>
        생년월일 <span>*</span></label>
    <input type="text" id="birth" name="birth" required> ex)900323<br>

    <label>
        Email <span>*</span>
    </label>
    <input type="email" id="email" name="email" required><br>

    <label>우편번호</label>
    <input type="text" id="zip" name="zipcode">
    <input type="button" value="우편번호 찾기" onclick="find_zip()"><br>
    <label>주소</label>
    <input type="text" id="addr" name="address"><br>
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

    <input type="submit" id="join" onclick="return check(event)" value="회원가입">
    <input type="reset" id="cancle" value="다시쓰기">
</form>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        let idbox = document.querySelector('#user');
        let checkbox = document.querySelector('#isDuplicate');
        let testbox = document.querySelector('#idCheckButton');
        idbox.addEventListener('input', function() {
            testbox.classList.remove('checked');
            checkbox.checked = false;
        })

        function id_check() {
            if(idbox.value==""){
                alert("아이디를 입력해 주세요!!")
            }
            else {
                window.open("idCheck.jsp?user=" + idbox.value,
                    "IDCHECK",
                    "width=700,height=500"
                );
            }
        }

        function setCheck() {
            testbox.classList.add('checked');
            checkbox.checked=true;
        }

        function find_zip() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("zip").value = data.zonecode;
                    document.getElementById("addr").value = data.address;
                }
            }).open();
        }

        function check(e) {
            let isChecked = document.querySelector('#isDuplicate').checked;
            let pwd1 = document.querySelector('#pwd').value;
            let pwd2 = document.querySelector('#pwdchk').value;
            if(pwd1 != pwd2){
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            if(!isChecked){
                e.preventDefault();
                alert("중복체크를 해주세요!")
                return false;
            }
            return true;
    }

</script>

</body>
</html>
