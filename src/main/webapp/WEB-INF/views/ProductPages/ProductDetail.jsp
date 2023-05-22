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
<div class="container">
    <div class="row">
        <div class="col" style="height: 500px;">
            <c:if test="${!empty productDTO.storedFileName}">
                <div style="width: 300px; height: 300px">
                    <img src="${pageContext.request.contextPath}/upload/${productDTO.storedFileName}" alt=""
                         width="100%" height="100%"><br>
                </div>
            </c:if>
            <c:if test="${empty productDTO.storedFileName}">
                <div style="width: 300px; height: 300px">
                    <img src="/resources/img/다운로드.png" alt=""
                         width="100%" height="100%"><br>
                </div>
            </c:if>
        </div>
        <div class="col">
            <p><a href="#">${productDTO.brand}</a></p>
            <h2>${productDTO.title}</h2>
            <c:if test="${productDTO.rating_sum!=null}">
                <p>별점 : ${productDTO.rationg_sum}</p>
            </c:if>
            <c:if test="${productDTO.rating_cnt}">
                <p>별점 개수 : ${productDTO.rating_cnt}</p>
            </c:if>
            <c:if test="${productDTO.discount_rate!=0}">
                <p style="color: violet">${productDTO.discount_rate}% <span style="color: gray;">${productDTO.price}원</span></p>
                <strong>${productDTO.special_price}원</strong>
            </c:if>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>

</script>
</html>