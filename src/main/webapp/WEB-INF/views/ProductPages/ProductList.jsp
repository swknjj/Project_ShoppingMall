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
    <c:when test="${productDTOList.size()!=0}">
        <div class="row" style="width: 80%; margin: 0 auto">
            <c:forEach items="${productDTOList}" var="DTOList">
                <div class="col-4" style="width: 30%; height: 30%">
                    <c:if test="${!empty DTOList.image}">
                        <div style="width: 300px; height: 300px">
                            <img src="${pageContext.request.contextPath}/upload/${DTOList.image}" alt=""
                                 width="100%" height="100%"><br>
                        </div>
                    </c:if>
                    <c:if test="${empty DTOList.image}">
                        <div style="width: 300px; height: 300px">
                            <img src="/resources/img/다운로드.png" alt=""
                                 width="100%" height="100%"><br>
                        </div>
                    </c:if>
                    브랜드 : ${DTOList.brand}<br>
                    제품명 : ${DTOList.title}<br>
                    가격 : ${DTOList.price}
                    <c:if test="${DTOList.discount_rate != 0}">
                        <br>할인 ${DTOList.discount_rate}%해서 ${DTOList.special_price}원!
                    </c:if><br>
                </div>
            </c:forEach>
        </div>
    </c:when>
    <c:otherwise>
        <div style="text-align: center; justify-content: center; align-items: center">
            <img src="/resources/img/다운로드.png" alt="">
        </div>
    </c:otherwise>
</c:choose>
<div id="search">
    <form action="#" method="get">
        <label for="search-box">검색할 키워드 입력</label><br>
        <select id="search-select" name="searchType">
            <option value="brand">브랜드</option>
            <option value="title">제품명</option>
        </select>
        <input type="text" id="search-box" name="searchBox" value="">
        <input type="submit" value="검색">
    </form>
</div>
<div id="page" style="text-align: center; margin: 10px">
    <ul class="pagination justify-content-center">
        <c:if test="${page.prev}">
            <li class="page-item">
                <a class="page-link" href='<c:url value="?page=${page.startPage-1}"/>'>
                    <i class="bi bi-caret-left-fill"></i></a>
            </li>
        </c:if>
        <c:forEach begin="${page.startPage}" end="${page.endPage}" var="pageNum" step="1">
            <c:choose>
                <c:when test="${pageNum eq page.pageDTO.page}">
                    <li class="page-item active">
                        <a class="page-link">${pageNum}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href='<c:url value="?page=${pageNum}"/>'><i class="fa">${pageNum}</i></a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${page.next && page.endPage>0}">
            <li class="page-item">
                <a class="page-link" href='<c:url value="?page=${page.endPage+1}"/>'><i
                        class="bi bi-caret-right-fill"></i></a>
            </li>
        </c:if>
    </ul>
</div>
</div>
<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>

</script>
</html>
