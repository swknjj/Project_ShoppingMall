<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/link.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
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
                <p>별점 : ${productDTO.rating_sum}</p>
            </c:if>
            <c:if test="${productDTO.rating_cnt}">
                <p>별점 개수 : ${productDTO.rating_cnt}</p>
            </c:if>
            <c:choose>
                <c:when test="${productDTO.discount_rate!=0}">
                    <p style="color: violet">${productDTO.discount_rate}%
                        <del><span style="color: gray;">${productDTO.price}원</span></del>
                    </p>
                    <strong>${productDTO.special_price}원</strong>
                </c:when>
                <c:otherwise>
                    ${productDTO.price}원
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${option1.stock > 0}">
            <form action="/order/save" method="get">
                <input type="hidden" name="product_id" value="${productDTO.product_id}">
                <input type="hidden" name="seller_id" value="${productDTO.seller_id}">
                <input type="hidden" id="count" name="quantity">
                <c:if test="${option1!=null}">
                    <select name="#" id="typeSelect" class="form-select" onchange="typechange()">
                        <option value="" selected disabled hidden>선택해주세요</option>
                        <option value="${option1.option_id}">${option1.content}&nbsp;
                                ${option1.price}원&nbsp;
                                ${option1.stock}개 남음
                        </option>
                    </select>
                </c:if>
                <input type="submit" id="sell" class="btn btn-primary mb-3" disabled="disabled" value="구매하기">
            </form>
                </c:when>
                <c:otherwise>
                    <h2 style="color: red">매진입니다</h2>
                </c:otherwise>
            </c:choose>
            <div class="row">
                <div class="col-10">
                    <strong>주문금액</strong>
                </div>
                <div class="col-2">
                    <strong id="price">0</strong><strong>원</strong>
                </div>
            </div>
            <div id="product" style="display: none">
                <div class="row">
                    <div class="col-8">
                        <button onclick="decrease()"><i class="bi bi-arrow-down"></i></button>
                        <span id="cnt">1</span>
                        <button onclick="increase()"><i class="bi bi-arrow-up"></i></button>
                    </div>
                    <div class="col-2">
                        <button onclick="del()">
                            <i class="bi bi-x"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div id="info">
        ${productDTO.product_detail}
    </div>
    <div id="image-container">
        <c:if test="${imageDTO!=null}">
            <c:forEach items="${imageDTO}" var="imageDTO">
                <img src="${pageContext.request.contextPath}/upload/${imageDTO.storedFileName}" alt="이미지"
                     width="100%"
                     height="100%"><br>
            </c:forEach>
        </c:if>
    </div>
</div>

<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>
    const typeSelect = document.getElementById("typeSelect");
    const product = document.getElementById("product");
    let count = document.getElementById("cnt").innerText;
    let count_text = document.getElementById("cnt");
    let product_price = document.getElementById("price");
    let price = ${option1.price};
    const typechange = () => {
        product.style.display = "block";
        document.getElementById("count").value = 1;
        product_price.innerText = parseInt(count) * parseInt(price); // 추가된 부분
        const sell = document.getElementById("sell");
        sell.disabled = false;
    }
    const del = () => {
        product.style.display="none";
    }
    const decrease = () => {
        count = count - 1;
        if (count < 1) {
            count = 1;
        }
        count_text.innerText = count;
        product_price.innerText = parseInt(count) * parseInt(price)
        document.getElementById("count").value = count;
    };

    const increase = () => {
        if(parseInt(count)>=${option1.stock}) {
            alert("최대 수량입니다");
        }else {
        count = parseInt(count) + 1;
        count_text.innerText = count;
        product_price.innerText = parseInt(count) * ${option1.price};
            document.getElementById("count").value = count;
        }
    };

</script>
</html>