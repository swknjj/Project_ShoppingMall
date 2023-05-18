<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<%--    <link rel="stylesheet" href="/resources/css/main.css">--%>
    <link rel="stylesheet" href="/resources/css/link.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <title>Our lovely home</title>
</head>
<style>
    body {
        padding: 0;
    }
</style>
<body>
<%@include file="/WEB-INF/views/component/nav.jsp" %>
<div id="section">
    <div class="container">
        <div id="seller-save">
            <form action="/seller/save" method="post" onsubmit=""></form>
            <h2>판매자 등록</h2>
            <input type="hidden" name="user_id" value="${userDTO.user_id}"><br>
            <label for="seller-company-name">회사 이름</label>
            <input type="text" class="form-control" id="seller-company-name" name="company_name" onblur=""
                   placeholder="등록할 회사 이름 입력"><br>
            <h4 id="company-name-bottom"></h4>

            <label for="seller-representative">대표자 이름</label><br>
            <input type="text" class="form-control" id="seller-representative" name="representative"
                   placeholder="대표자 이름 입력"><br>
            <h4 id="representative-bottom"></h4>

            <label for="seller-address">사업장 소재지</label><br>
            <input type="text" class="form-control" id="seller-address" name="address" placeholder="사업장 소재지 입력"><br>
            <h4 id="address-bottom"></h4>

            <label for="seller-customer-center">고객센터</label><br>
            <input type="text" class="form-control" id="seller-customer-center" name="customer_center"
                   placeholder="고객센터 전화번호 입력"><br>
            <h4 id="customer-center-bottom"></h4>

            <label for="seller-email">이메일</label><br>
            <input type="text" class="form-control" id="seller-email" name="email" placeholder="이메일 입력"><br>
            <h4 id="email-bottom"></h4>

            <label for="seller-registration-num">사업자등록번호</label><br>
            <input type="text" class="form-control" id="seller-registration-num" name="registration_num"><br>
            <h4 id="registration-num-bottom"></h4>
            <div class="container" style="text-align: center;">
                <input type="submit" class="btn btn-primary" value="등록">
                <button class="btn btn-secondary" onclick="back()">뒤로가기</button>
            </div>
            </form>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>
    const back = () => {
        location.href = "/";
    }

</script>
</html>