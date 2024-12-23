
function validateAll() {
    if (!idCheck()) return false;             // ID 체크
    if (!userPostalCodeCheck()) return false; // 우편번호 체크
    if (!userPasswordCheck()) return false;   // 비밀번호 체크

    // 모든 조건을 통과한 경우
    return true;
}


function idCheck(){
    let userId=document.getElementById("user-id").value;

    if(userId==null || userId.length<4){
        alert("네글자 이상 입력해주세요.");
        return false;
    }
    return true;
}


function userPostalCodeCheck(){
    let userPostalCode=document.getElementById("user-postal-code").value;
    if(userPostalCode != ""){
        if(!userPostalCode.includes("-")){
            alert("우편번호는 -를 포함해 입력해주세요.");
            
        } return false;
    }
    return true;
}

function userPasswordCheck(){
    let userPassword=document.getElementById("user-password").value.trim();;
    let userPasswordCheck=document.getElementById("user-password-check").value.trim();;


    if (!userPassword || !userPasswordCheck) {
        alert("비밀번호를 입력해 주세요.");
        return false; // 실패
    }
    if(userPassword !== userPasswordCheck){
        alert("비밀번호를 확인해 주세요.")
        console.log("비밀번호 확인 필요")
        return false;
    }
    return true;
}