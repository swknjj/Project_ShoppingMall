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
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/component/nav.jsp" %>
<div id="container1" class="container mt-3">
    <a href="/" style="text-decoration-line: none">Our lovely home</a>
</div>
<div class="container">
    <div class="row">
        <div class="col-8">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2>주문/결제</h2>
                <div>
                    <h3 class="me-auto">배송지</h3>
                    <a href="#">변경</a>
                </div>
            </div>
            <strong>${addressDTO.get(0).address_name}</strong><br>
            <p>
                우편번호: ${addressDTO.get(0).zipcode}<br>
                주소: ${addressDTO.get(0).address1}-${addressDTO.get(0).address2}-${addressDTO.get(0).reference}-${addressDTO.get(0).receiver}<br>
                전화번호: ${addressDTO.get(0).phone_number}<br>
            </p>
            <input type="hidden" name="address_id" value="${addressDTO.get(0).address_id}">
            <select name="memo" id="select-memo" class="form-select mb-3">
                <option value="" selected disabled hidden>배송시 요청사항을 선택해주세요</option>
                <option value="부재시 문앞에 놓아주세요">부재시 문앞에 놓아주세요</option>
                <option value="배송 전에 미리 연락주세요">배송 전에 미리 연락주세요</option>
                <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                <option value="부재 시 전화주시거나 문자주세요">부재 시 전화주시거나 문자주세요</option>
            </select>
            <h2>주문자</h2>
            <label for="user-email" class="form-label">이메일</label>
            <input type="text" id="user-email" class="form-control" value="${userDTO.email_full}">
            <label for="user-nickname" class="form-label">닉네임</label>
            <input type="text" id="user-nickname" class="form-control" value="${userDTO.nickname}">
        </div>
        <div class="col-4" style="border: 1px solid black; background-color: lavenderblush">
            <div class="mb-3">
                <h2>결제 금액</h2>
                <div class="d-flex justify-content-between">
                    <p class="mb-0">총 상품 금액</p>
                    <p class="mb-0">
                        <c:choose>
                            <c:when test="${productDTO.discount_rate!=0}">
                                ${productDTO.special_price * orderDTO.quantity}원
                            </c:when>
                            <c:otherwise>
                                ${productDTO.price * orderDTO.quantity}원
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </div>
            <div class="mb-3">
                <c:choose>
                    <c:when test="${product.delivery_fee!=0}">
                        <div class="d-flex justify-content-between">
                            <p class="mb-0">배송비</p>
                            <p class="mb-0">${productDTO.delivery_fee}원</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="d-flex justify-content-between">
                            <p class="mb-0">배송비</p>
                            <p class="mb-0">무료</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div>
                <strong class="mb-0">최종 결제 금액</strong>
                <strong id="result" class="mb-0">${orderDTO.totalPrice}원</strong>
            </div>
            <br>
            <br>
            <div>
                <input type="checkbox" id="check" class="form-check-input">
                <label for="check" class="form-check-label">개인정보 수집 이용 및 제 3자 제공 동의<strong>(필수)</strong></label>
            </div>
            <p>본인은 만 14세 이상이며, 주문 내용을 확인하였습니다</p>
            <input type="submit" class="btn btn-primary" value="${orderDTO.totalPrice}원 결제하기">
        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>

</script>
</html>
