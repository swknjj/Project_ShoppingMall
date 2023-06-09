<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/link.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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

        #search {
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
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
                    <a href="/product/productDetail?product_id=${DTOList.product_id}">
                        <c:if test="${!empty DTOList.image}">
                            <div style="width: 300px; height: 300px">
                                <img src="${pageContext.request.contextPath}/upload/${DTOList.storedFileName}" alt=""
                                     width="100%" height="100%"><br>
                            </div>
                        </c:if>
                        <c:if test="${empty DTOList.image}">
                            <div style="width: 300px; height: 300px">
                                <img src="/resources/img/다운로드.png" alt=""
                                     width="100%" height="100%"><br>
                            </div>
                        </c:if>
                        <div class="d-flex justify-content-between">
                            <div>
                                브랜드 : ${DTOList.brand}<br>
                            </div>
                            <div>
                                <a href="/product/delete?product_id=${DTOList.product_id}">상품삭제</a>
                            </div>
                        </div>
                        제품명 : ${DTOList.title}<br>
                        가격 : ${DTOList.price}
                        <c:if test="${DTOList.discount_rate != 0}">
                            <br>할인 ${DTOList.discount_rate}%해서 ${DTOList.special_price}원!
                        </c:if><br>
                    </a>
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
    <form action="/product/productListForm" method="get">
        <div class="row">
            <div class="col-5">
                <select id="search-select" class="form-control" name="type">
                    <option value="brand">브랜드</option>
                    <option value="title">제품명</option>
                </select>
            </div>
            <div class="col-5">
                <input type="text" id="search-box" class="form-control" name="q">
            </div>
            <div class="col-2">
                <input type="submit" class="form-control" value="검색">
            </div>
        </div>
    </form>
</div>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link"><i class="bi bi-caret-left-fill"></i></a>
                </li>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link"
                       href="/product/productListForm?page=${paging.page-1}&q=${q}&type=${type}"><i
                            class="bi bi-caret-left-fill"></i></a>
                </li>
            </c:otherwise>
        </c:choose>

        <%--  for(int i=startPage; i<=endPage; i++)      --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>

                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link"
                           href="/product/productListForm?page=${i}&q=${q}&type=${type}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link"><i class="bi bi-caret-right-fill"></i></a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link"
                       href="/product/productListForm?page=${paging.page+1}&q=${q}&type=${type}">
                        <i class="bi bi-caret-right-fill"></i></a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>

</script>
</html>
