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
        <h2 style="margin-top: 100px">상품 목록</h2><br>

        <c:if test="${list.size() != 0}">
            <ul class="nav" style="text-align: center">
                <c:forEach items="${list}" var="category">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page"
                           href="/product/productList?category_id=${category.category_id}">${category.name}</a>
                    </li>
                </c:forEach>
            </ul>
            </select>
        </c:if>
    </div>

</div>


<c:choose>
    <c:when test="${productDTOList != null}">
        <div class="row">
            <c:forEach items="${productDTOList}" var="DTOList">
                <div class="col-4" style="width: 30%; height: 30%">
                    <c:choose>
                        <c:when test="${DTOList.image != null}">
                            <div style="width: 300px; height: 300px">
                                <img src="${pageContext.request.contextPath}/upload/${DTOList.image}" alt=""
                                     width="100%" height="100%"><br>
                            </div>
                            브랜드 : ${DTOList.brand}<br>
                            제품명 : ${DTOList.title}<br>
                            가격 : ${DTOList.price}
                            <c:if test="${DTOList.discount_rate != null}"><br>
                            할인 ${DTOList.discount_rate}%해서 ${DTOList.special_price}원!</c:if><br>
                        </c:when>
                        <c:otherwise>
                            <div style="width: 100px; height: 100px">대표 사진이 없습니다</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </div>
    </c:when>
    <c:otherwise>
        <div style="text-align: center; justify-content: center; align-items: center">
            <img src="http://www.ruv.co.kr/talent/pdata/kr/save/imgs/shop_body/image_nogoods.gif" alt="">
        </div>
    </c:otherwise>
</c:choose>
</body>
<script>

</script>
</html>
