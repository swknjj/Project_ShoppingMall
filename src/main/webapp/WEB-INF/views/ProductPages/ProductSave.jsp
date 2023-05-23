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
        input {
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
<div class="container2" style="margin: 0 auto; width: 100%; height: 70%; overflow-y: scroll">
    <div id="product-save" style="width: 50%; margin: 0 auto; height: auto; text-align: center;">
        <h2 style="margin-top: 100px">상품 등록</h2><br>
        <form action="/product/productSave" method="post" enctype="multipart/form-data" onsubmit="return finalCheck()">
            <input type="hidden" name="seller_id" value="${sellerDTO}">
            <input type="hidden" name="user_id" value="${userDTO}">
            <c:if test="${list.size() != 0}">
                <label for="category">카테고리 선택</label>
                <select name="category_id" id="category" class="form-control">
                    <c:forEach items="${list}" var="category">
                        <option value=${category.category_id}>${category.name}</option>
                    </c:forEach>
                </select>
            </c:if>

            <label for="product-brand">등록할 상품 브랜드</label>
            <input type="text" class="form-control" id="product-brand" name="brand" placeholder="등록할 브랜드 입력">

            <label for="product-title">등록할 상품명 </label>
            <input type="text" class="form-control" id="product-title" name="title" placeholder="등록할 상품명 입력">

            <label for="product-image">등록할 대표 이미지</label>
            <input type="file" accept="image/*" class="form-control" id="product-image" name="img" placeholder="등록할 브랜드 입력">

            <label for="product-image">등록할 상세정보 이미지</label>
            <input type="file" accept="image/*" class="form-control" id="product-image-detail" multiple name="productProfile" placeholder="상세정보 이미지 입력">

            <label for="product-price">등록할 상품 가격</label>
            <input type="text" class="form-control" id="product-price" name="price" placeholder="등록할 상품 가격 입력">

            <label for="product-discount-rate">등록할 상품 가격 할인율</label>
            <input type="text" class="form-control" id="product-discount-rate" name="discount_rate" placeholder="등록할 상품 할인율 예)50%면 50 입력">

            <label for="product-delivery-fee">등록할 상품 배송비</label>
            <input type="text" class="form-control" id="product-delivery-fee" name="delivery_fee" placeholder="등록할 상품 배송비 입력">

            <label for="product-detail">등록할 상품 설명 입력</label>
            <input type="text" class="form-control" id="product-detail" name="product_detail" placeholder="등록할 상품 설명 입력" size="50">

            <p>
                <a class="btn btn-primary" data-bs-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">옵션 1 추가</a>
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">옵션 2 추가</button>
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">전체 옵션 열기</button>
            </p>
                <div class="col">
                    <div class="collapse multi-collapse" id="multiCollapseExample1">
                        <div class="card card-body">
                            <label for="option1-contents">내용</label>
                            <input type="text" id="option1-contents" name="content1" class="form-control" placeholder="내용 입력">
                            <label for="option1-price">금액</label>
                            <input type="text" id="option1-price" name="price1" class="form-control" placeholder="금액 입력">
                            <label for="option1-stock">재고</label>
                            <input type="text" id="option1-stock" name="stock1" class="form-control" placeholder="재고 입력">
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="collapse multi-collapse" id="multiCollapseExample2">
                        <div class="card card-body">
                            <label for="option2-contents">내용</label>
                            <input type="text" id="option2-contents" name="content2" class="form-control" placeholder="옵션2는 옵션1이 작성되어야 가능">
                            <label for="option2-price">금액</label>
                            <input type="text" id="option2-price" name="price2" class="form-control" placeholder="옵션2는 옵션1이 작성되어야 가능">
                            <label for="option2-stock">재고</label>
                            <input type="text" id="option2-stock" name="stock2" class="form-control" placeholder="옵션2는 옵션1이 작성되어야 가능">
                        </div>
                    </div>
                </div>

            <input type="submit" class="btn btn-primary" value="상품등록">
        </form>
        <button class="btn btn-danger" onclick="back()">취소</button>
    </div>
</div>
<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>
    const back = () => {
        location.href = "/";
    }
    const finalCheck = () => {
        const brand = document.getElementById("product-brand");
        const title = document.getElementById("product-title");
        const price = document.getElementById("product-price");
        const price_check = /^[0-9]+$/;
        if(brand.value.length==0){
            brand.focus();
            return false;
        }else if(title.value.length==0){
            title.focus();
            return false;
        }else if(price.value.length==0){
            price.focus();
            return false;
        }else if(!(price.value.match(price_check))){
            alert("가격에는 숫자만 입력");
            return false;
        }else {
            alert("상품등록 완료");
            return true;
        }
    }
</script>
</html>
