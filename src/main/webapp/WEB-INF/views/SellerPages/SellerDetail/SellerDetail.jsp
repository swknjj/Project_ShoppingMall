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
<div class="container2" style="margin: 0 auto; width: 100%; height: 70%">
    <div id="MySellerPage" style="width: 80%; margin: 0 auto; height: auto; text-align: center;">
        <h2 style="margin-top: 100px">My Seller Page</h2><br>
        <ul class="nav" style="text-align: center; display: flex; justify-content: center;">
            <li class="nav-item" id="button">
                <button class="btn btn-primary" onclick="sellerInterface()">내 판매자 정보보기</button>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/seller/update">판매자 정보 수정</a>
            </li>
        </ul>
    </div>
    <div id="container" style="display: none">
        <table class="table table-dark table-striped">
            <tr>
            <th>회사 이름</th>
            <th>대표자 이름</th>
            <th>사업장소재지</th>
            <th>고객센터</th>
            <th>이메일</th>
            <th>사업자 등록번호</th>
            </tr>
            <tr>
            <td>${sellerDTO.company_name}</td>
            <td>${sellerDTO.representative}</td>
            <td>${sellerDTO.address}</td>
            <td>${sellerDTO.customer_center}</td>
            <td>${sellerDTO.email}</td>
            <td>${sellerDTO.registration_num}</td>
            </tr>
        </table>
        <button class="btn btn-dark" onclick="closeData()">닫기</button>
    </div>
</div>
<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>
    const sellerInterface = () => {
        const container = document.getElementById("container");
        const button = document.getElementById("button");
        container.style.display="block";
        button.style.display="none";
    }
    const closeData = () => {
        const container = document.getElementById("container");
        const button = document.getElementById("button");
        container.style.display="none";
        button.style.display="block";
    }
</script>
</html>
