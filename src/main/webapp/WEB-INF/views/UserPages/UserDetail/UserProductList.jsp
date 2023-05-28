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
    <div id="user-product-list" style="width: 80%; margin: 0 auto; height: auto; text-align: center;">
        <h2 style="margin-top: 100px">내 상품목록</h2><br>
        <ul class="nav" style="text-align: center; display: flex; justify-content: center;">
            <li class="nav-item" id="button">
                <button class="btn btn-primary" onclick="sellerInterface()">내 주문목록 확인하기</button>
            </li>
        </ul>
    </div>
    <div id="container" style="display: none; overflow-y: scroll" >
        <c:choose>
            <c:when test="${!empty productDTOList}">
                <table class="table table-dark table-striped">
                    <tr>
                        <th>상품번호</th>
                        <th>판매자번호</th>
                        <th>카테고리번호</th>
                        <th>브랜드</th>
                        <th>상품명</th>
                        <th>상품이미지</th>
                        <th>상품가격</th>
                        <th>상품할인율</th>
                        <th>상품특가</th>
                        <th>상품배송비</th>
                        <th>상품등록시간</th>
                        <th>상품별점합</th>
                        <th>상품별점개수</th>
                    </tr>
                    <c:forEach items="${productDTOList}" var="product">
                        <tr>
                            <td>
                                <a href="/product/productDetail?product_id=${product.product_id}">${product.product_id}</a>
                            </td>
                            <td>${product.seller_id}</td>
                            <td>${product.category_id}</td>
                            <td>${product.brand}</td>
                            <td>${product.title}</td>
                            <td><img src="${pageContext.request.contextPath}/upload/${product.storedFileName}" alt="이미지"
                                     width="100px" height="100px"></td>
                            <td>${product.price}</td>
                            <td>${product.discount_rate}</td>
                            <td>${product.special_price}</td>
                            <td>${product.delivery_fee}</td>
                            <td>${product.created_at}</td>
                            <td>${product.rating_sum}</td>
                            <td>${product.rating_cnt}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div>
                등록한 상품이 없습니다
                </div>
            </c:otherwise>
        </c:choose>

        <button class="btn btn-dark" onclick="closeData()">닫기</button>
    </div>
</div>
<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>
    const sellerInterface = () => {
        const container = document.getElementById("container");
        const button = document.getElementById("button");
        container.style.display = "block";
        button.style.display = "none";
    }
    const closeData = () => {
        const container = document.getElementById("container");
        const button = document.getElementById("button");
        container.style.display = "none";
        button.style.display = "block";
    }
</script>
</html>
