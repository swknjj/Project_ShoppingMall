<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/link.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <title>Our lovely home</title>
    <style>
        #section {
            height: 80vh;
        }

        #section .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        #signIn {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>

<body>
<%@include file="/WEB-INF/views/component/nav.jsp" %>
<div id="section">
    <div class="container">
        <div id="user-update" style="width: 80%;">
            <div class="row">
                <div class="col-10">
                    <h2>회원정보 수정</h2>
                </div>
                <div class="col-2">
                    <button class="btn btn-danger" onclick="outing()">회원탈퇴</button>
                </div>
            </div>

            <form action="/user/update" method="post" onsubmit="return recheck()">
                <input type="text" name="user_id" value="${userDTO.user_id}" style="display: none"><br>
                <label for="user-nickname"><h4>별명 *필수항목</h4></label><br>
                <input type="text" class="form-control" id="user-nickname" name="nickname" onblur="nickname_check()"
                       value="${userDTO.nickname}"><br>
                <h4 id="nickname-bottom"></h4>
                <label for="birth"><h4>생년월일 *필수항목</h4></label><br>
                <input type="text" class="form-control" id="birth" name="birth" onblur="birth_check()"
                       value="${userDTO.birth}">
                <h4 id="birth-bottom"></h4>
                <input type="submit" class="btn btn-primary" value="수정하기">
            </form>
            <button class="btn btn-secondary" onclick="backto()">뒤로가기</button>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>
    const backto = () => {
        location.href = "/";
    }
    const nickname_check = () => {
        let typingNickname = document.getElementById("user-nickname").value;
        let nickname_bottom = document.getElementById("nickname-bottom");
        $.ajax({
            type: "post",
            url: "/nickname-check",
            data: {
                "nickname_check": typingNickname
            },
            success: function () {
                if (typingNickname.length == 0) {
                    nickname_bottom.style.color = "red";
                    nickname_bottom.innerText = "필수입력입니다";
                } else {
                    nickname_bottom.style.color = "green";
                    nickname_bottom.innerText = "좋은 닉네임이에요!";
                }
            },
            error: function () {
                nickname_bottom.style.color = "red";
                nickname_bottom.innerText = "중복된 닉네임이에요!";
            }
        })
    }
    const birth_check = () => {
        const birth = document.getElementById("birth");
        const birth_bottom = document.getElementById("birth-bottom");
        const exp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
        if (birth.value.length == 0) {
            birth_bottom.style.color = "red";
            birth_bottom.innerText = "필수입력입니다.";
        } else if (!(birth.value.match(exp))) {
            birth_bottom.style.color = "red";
            birth_bottom.innerText = "조건을 확인해주세요";
        } else {
            birth_bottom.style.color = "green";
            birth_bottom.innerText = "생년월일 확인";
        }
    }
    const recheck = () => {
        const typingNickname = document.getElementById("nickname")
        const birth = document.getElementById("birth");
        if(typingNickname.value.length==0){
            typingNickname.focus();
            return false;
        }else if(birth.value.length==0){
            birth.focus();
            return false;
        }else {
            alert("회원정보 수정 완료")
            return true;
        }
    }
    const outing = () => {
        if (confirm("탈퇴하시겠습니까?")) {
            alert("삭제완료")
            location.href = "/user/delete?user_id=${userDTO.user_id}"
        }
    }
</script>
</html>