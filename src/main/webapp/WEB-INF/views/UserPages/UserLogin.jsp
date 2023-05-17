<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/link.css">
    <title>Our lovely home</title>
    <style>
        #section {
            height: 80vh;
            display: flex;
            flex-direction: column;
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
        #footer {
            width: 100%;
            text-align: center;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>

<body>
<%@include file="/WEB-INF/views/component/nav.jsp" %>
<div id="section">
    <div class="container">
        <div id="signIn" style="width: 80%;">
            <h2>로그인</h2>
            <form action="/user/login" method="post" onsubmit="return loginCheck()">
                <input type="text" class="form-control" id="email-full" name="email_full" placeholder="이메일"><br>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호"><br>
                <div class="row">
                    <div class="col">
                        <a href="/user/findByPassword">비밀번호 재설정</a>
                    </div>
                    <div class="col">
                        <a href="/user/save">회원가입</a>
                    </div>
                </div>
                <a href="/">로그인에 문제가 있으신가요?</a><br>
                <input type="submit" class="btn btn-primary" value="로그인">
                <button class="btn btn-secondary" onclick="back()">뒤로가기</button>
            </form>
        </div>
    </div>
    <%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>
    const back = () => {
        location.href = "/";
    }
    const loginCheck = () => {
        email = document.getElementById("email-full");
        password = document.getElementById("password");
        if(email.value.length==0){
            email.focus();
            return false;
        }else if(password.value.length==0){
            password.focus();
            return false;
        }else {
            return true;
        }
    }
</script>
</html>