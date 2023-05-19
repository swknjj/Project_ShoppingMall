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
            <form action="/seller/save" method="post" onsubmit="return finalCheck()">
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
                <input type="text" class="form-control" id="seller-registration-num" name="registration_num"
                       onblur="registration_num_check()"><br>
                <p id="registration-num-bottom"></p>
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
    const registration_num_check = () => {
        const registration_num = document.getElementById("seller-registration-num");
        const registration_num_bottom = document.getElementById("registration-num-bottom");
        const num = "^[0-9]+$";
        if (registration_num.value.length == 0) {
            registration_num_bottom.innerText = "필수입력입니다";
            registration_num_bottom.style.color = "red";
        } else if (!(registration_num.value.match(num))) {
            registration_num_bottom.innerText = "숫자만 입력해주세요";
            registration_num_bottom.style.color = "red";
        } else {
            registration_num_bottom.innerText = "사용가능";
            $.ajax({
                type: "post",
                url: "/seller/num_check",
                data: {
                    "registration_num": registration_num.value
                },
                success: function () {
                    registration_num_bottom.innerText = "";
                },
                error: function () {
                    registration_num_bottom.innerText = "사업자등록번호를 확인해주세요";
                    registration_num_bottom.style.color = "red";
                }
            })
        }

    }
    const finalCheck = () => {
        const company = document.getElementById("seller-company-name");
        const company_bottom = document.getElementById("company-name-bottom");
        const representative = document.getElementById("seller-representative");
        const representative_bottom = document.getElementById("representative-bottom");
        const address = document.getElementById("seller-address");
        const address_bottom = document.getElementById("address-bottom");
        const customer_center = document.getElementById("seller-customer-center");
        const customer_center_check = /^\d{3}-\d{3,4}-\d{4}$/;
        const customer_center_bottom = document.getElementById("customer-center-bottom");
        const email = document.getElementById("seller-email");
        const email_bottom = document.getElementById("email-bottom");
        const registration_num = document.getElementById("seller-registration-num");
        const registration_num_bottom = document.getElementById("registration-num-bottom");

        if (company.value.length === 0) {
            company.focus();
            company_bottom.style.color = "red";
            company_bottom.innerText = "필수입력입니다";
            return false;
        } else {
            company_bottom.innerText = "";
        }

        if (representative.value.length === 0) {
            representative.focus();
            representative_bottom.style.color = "red";
            representative_bottom.innerText = "필수입력입니다";
            return false;
        } else {
            representative_bottom.innerText = "";
        }

        if (address.value.length === 0) {
            address.focus();
            address_bottom.style.color = "red";
            address_bottom.innerText = "필수입력입니다";
            return false;
        } else {
            address_bottom.innerText = "";
        }

        if (customer_center.value.length === 0) {
            customer_center.focus();
            customer_center_bottom.style.color = "red";
            customer_center_bottom.innerText = "필수입력입니다";
            return false;
        } else if (!customer_center.value.match(customer_center_check)) {
            customer_center.focus();
            customer_center_bottom.style.color = "red";
            customer_center_bottom.innerText = "전화번호 양식에 맞춰주세요";
            return false;
        } else {
            customer_center_bottom.innerText = "";
        }

        if (email.value.length === 0) {
            email.focus();
            email_bottom.style.color = "red";
            email_bottom.innerText = "필수입력입니다";
            return false;
        } else {
            email_bottom.innerText = "";
        }
        if(registration_num.value.length==0){
            registration_num.focus();
            return false;
        }
        if (registration_num_bottom.innerText != "") {
            registration_num.focus();
            return false;
        }else {
        alert("등록완료");
        return true;
        }
    };

</script>
</html>