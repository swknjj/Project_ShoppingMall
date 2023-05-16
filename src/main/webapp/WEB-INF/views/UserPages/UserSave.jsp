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
        .container {
            margin-top: 30px;
            margin-bottom: 30px;
        }
    </style>
</head>

<body>
<div id="container1" style="margin-top: 20px; margin-left: 20px">
    <a href="/" style="text-decoration-line: none">Our lovely home</a>
</div>
<div id="container2" style="margin: 0 auto">
    <div id="signUp" style="width: 60%; margin: 0 auto; height: auto; text-align: center;">
        <h2 style="margin-top: 100px">회원가입</h2><br>
        <form action="#" method="post" id="name-usersave">
            <div class="container">
                <label for="email" id="email-label"><h5>이메일</h5></label>
                <div class="row">
                    <div class="col">
                        <input type="text" id="email" class="form-control" name="email" onblur="email_check()" placeholder="이메일">
                        <h4 id="email-bottom"></h4>
                    </div>
                    @
                    <div class="col">
                        <input type="text" id="domain" class="form-control" id="email-form" onblur="email_check()" name="domain">
                    </div>
                    <div class="col">
                        <select id="search-select" class="form-select" name="searchType" onblur="email_check()" onchange="input_email()">
                            <option value="" selected disabled hidden>선택해주세요</option>
                            <option value="daum.net">daum.net</option>
                            <option value="naver.com">naver.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="">직접 입력</option>
                        </select>
                    </div>
                </div>
            </div>
    </div>
    <div class="container">
        <label for="password"><h4>비밀번호</h4></label><br>
        영문 , 숫자를 포함한 8자 이상 , 16자 이하의 비밀번호를 입력해주세요.<br>
        <input type="text" class="form-control" id="password" name="password" onblur="password_check()" placeholder="비밀번호">
        <h4 id="password-bottom"></h4>

    </div>
    <div class="container">
        <label for="password-check"><h4>비밀번호 확인</h4></label><br>
        <input type="text" class="form-control" id="password-check" name="passwordCheck" onblur="password_check_check()" placeholder="비밀번호 확인">
        <h4 id="password-check-bottom"></h4>
    </div>
    <div class="container">
        <label for="nickname"><h4>닉네임</h4></label><br>
        다른 유저와 겹치지 않도록 입력해주세요.(2~15자)<br>
        <input type="text" class="form-control" id="nickname" name="nickname" onblur="nickname_check()" placeholder="별명 (2~15자)">
        <h4 id="nickname-bottom"></h4>
    </div>
    </form>
</div>

</div>
</body>
<script>
    const input_email = () => {
        document.getElementById("domain").value = document.getElementById("search-select").value;
    }
    const email_check = () => {
        const email_label = document.getElementById("email-label");
        const email_form = document.getElementById("email");
        const email_domain = document.getElementById("search-select");
        if(email_form.value.length==0) {
            document.getElementById("email-bottom").innerText = "필수입력입니다.";
            document.getElementById("email-bottom").style.color = "red";
            email_label.style.color = "red";
        }else if(email_domain.value.length==0){
            document.getElementById("email-bottom").innerText = "도메인을 선택해주세요.";
            document.getElementById("email-bottom").style.color = "red";
            email_label.style.color = "red";
        }else {
            document.getElementById("email-bottom").innerText = "좋은 이메일이네요!";
            document.getElementById("email-bottom").style.color="green";
            email_label.style.color="green";
        }
    }
    const password_check = () => {
        const password = document.getElementById("password");
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{8,16}$/;
        if(password.value.length==0){
            document.getElementById("password-bottom").style.color="red";
            document.getElementById("password-bottom").innerText="필수입력입니다.";
        }else if(!(password.value.match(exp))){
            document.getElementById("password-bottom").style.color="red";
            document.getElementById("password-bottom").innerText="조건을 확인해주세요";
        }else {
            document.getElementById("password-bottom").style.color="green";
            document.getElementById("password-bottom").innerText="좋은 비밀번호네요!";
        }
    }
    const password_check_check = () => {
        const password = document.getElementById("password");
        const password_check = document.getElementById("password-check");
        const password_bottom = document.getElementById("password-check-bottom");
        if(password_check.value.length==0) {
            password_bottom.innerText = "확인을 위해 비밀번호를 한번 더 입력해주세요";
            password_bottom.style.color = "red";
        }else if(password.value==password_check.value) {
            password_bottom.innerText = "비밀번호 확인";
            password_bottom.style.color = "green";
        }else {
            password_bottom.innerText = "비밀번호와 같게 입력해주세요";
            password_bottom.style.color = "red";
        }
    }
    const nickname_check = () => {
        let typingNickname = document.getElementById("nickname").value;
        const nickname_bottom = document.getElementById("nickname-bottom");
        $.ajax({
            type: "post",
            url: "nickname-check",
            data: {
                "nickname_check": typingNickname
            },
            success: function () {
                if(typingNickname.length==0){
                    nickname_bottom.style.color = "red";
                    nickname_bottom.innerText = "필수입력입니다";
                }else {
                    nickname_bottom.style.color = "green";
                    nickname_bottom.innerText = "좋은 닉네임이에요!";
                }
            },
            error: function () {
                nickname_bottom.style.color="red";
                nickname_bottom.innerText="중복된 닉네임이에요!";
            }
        })
    }
</script>
</html>
