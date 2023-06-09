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
    <div id="user-reviewlist" style="width: 80%; margin: 0 auto; height: auto; text-align: center;">
        <h2 style="margin-top: 100px">내 리뷰목록</h2><br>
        <ul class="nav" style="text-align: center; display: flex; justify-content: center;">
            <li class="nav-item" id="button">
                <button class="btn btn-primary" onclick="sellerInterface()">내 리뷰목록 확인하기</button>
            </li>
        </ul>
    </div>
    <div id="container" style="display: none; overflow-y: scroll" >
        <table class="table table-dark table-striped">
            <tr>
                <th>상품번호</th>
                <th>상품판매자번호</th>
                <th>별점</th>
                <th>리뷰이미지</th>
                <th>리뷰내용</th>
                <th>리뷰추천</th>
                <th>리뷰작성시간</th>
            </tr>
            <c:forEach items="${reviewDTOList}" var="review">
                <tr>
                    <td><a href="/product/productDetail?product_id=${review.product_id}">${review.product_id}</a></td>
                    <td>${review.seller_id}</td>
                    <td>${review.rating}</td>
                    <td><img src="${pageContext.request.contextPath}/upload/${review.storedFileName}" alt="이미지"
                             width="100px" height="100px"></td>
                    <td>${review.content}</td>
                    <td>${review.liked}</td>
                    <td>${review.created_at}</td>
                </tr>
            </c:forEach>
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
