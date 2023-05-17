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
<%@include file="/WEB-INF/views/component/nav.jsp" %>
<div id="container1" style="margin-top: 20px; margin-left: 20px">
    <a href="/" style="text-decoration-line: none">Our lovely home</a>
</div>
<div class="container2" style="margin: 0 auto; width: 40%">
    <div id="mypage" style="width: 80%; margin: 0 auto; height: auto; text-align: center;">
        <h2 style="margin-top: 100px">My Page</h2><br>
        <ul class="nav" style="text-align: center">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">프로필</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/order/orderList">장바구니</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/review/reviewList">나의 리뷰</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user/update">설정</a>
            </li>
        </ul>
    </div>
</div>

</body>
<script>

</script>
</html>
