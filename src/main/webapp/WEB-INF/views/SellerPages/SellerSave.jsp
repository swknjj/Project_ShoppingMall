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
        <div id="signIn" style="width: 80%;">
            <h2>아이디 찾기</h2>
            <input type="text" class="form-control" id="user-nickname" name="nickname" onblur="nickname_check()" placeholder="가입한 닉네임 입력"><br>
            <h4 id="nickname-bottom"></h4>
            <button class="btn btn-secondary" onclick="back()">뒤로가기</button>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>
    const back = () => {
        location.href = "/";
    }

</script>
</html>