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

        label {
            display: block;
        }

        .container2 {
            background-color: lightgray;
        }
    </style>
</head>

<body>
<body>
<%@include file="/WEB-INF/views/component/nav.jsp" %>
<div id="container1" style="margin-top: 20px; margin-left: 20px">
    <a href="/" style="text-decoration-line: none">Our lovely home</a>
</div>
<div class="custom-container" style="margin: 0 auto; width: 40%">
    <div id="find-password" style="width: 80%; margin: 0 auto; height: auto; text-align: center;">
        <h5 style="margin-top: 100px">가입한 이메일 주소를 입력해주세요.</h5><br>
        <div class="container">
            <div class="input-with-button" id="email" >
                <input type="text" class="form-control" id="email-full" placeholder="이메일">
                <button id="confirm" class="btn btn-primary" onclick="email_check()">확인</button><br>
                <h4 id="container-bottom"></h4>
            </div>
            <div id="result" class="container" style="display: none">
                <form action="/user/userPasswordChange" method="post" onsubmit="return check()">
                    <input type="text" id="user-id" name="user_id" style="display:none">
                    <input type="password" id="password" class="form-control" name="password" placeholder="수정할 비밀번호 입력"><br>
                    <input type="password" id="password-check" class="form-control" placeholder="비밀번호 확인"><br>
                    <input type='submit' class="btn btn-primary" value='수정하기'>
                </form>
                <button class="btn btn-danger" onclick='back()'>뒤로가기</button>
            </div>
        </div>
    </div>
</div>
<script>
    const back = () => {
        location.href = "/";
    }
    const email_check = () => {
        const typingEmail = document.getElementById("email-full").value;
        const result = document.getElementById("result");
        let bottom = document.getElementById("container-bottom");
        $.ajax({
            type: "post",
            url: "/user/findByPassword",
            data: {
                "email_full": typingEmail
            },
            success: function (res) {
                bottom.style.display = "none";
                result.style.display = "block";
                document.getElementById("user-id").value = res.user_id;
            },
            error: function () {
                bottom.innerText = "찾으시는 정보가 없습니다";
            }
        })
    }
    const check = () => {
        const result = document.getElementById("password");
        const result_check = document.getElementById("password-check");
        const exp = /^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
        if(result.value != result_check.value) {
            result.focus();
            return false;
        }else if(!(result.value.match(exp))){
            alert("영문 , 숫자를 포함한 8자 이상 , 16자 이하의 비밀번호를 입력해주세요.")
            return false;
        }else {
            alert("비밀번호 수정 완료 !")
            return true;
        }
    }
</script>
</html>
