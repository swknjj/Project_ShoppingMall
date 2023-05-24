<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Our lovely home</title>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/link.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
                    <a href="#" onclick="openAddressSelectionModal()">변경</a>
                </div>
            </div>

            <div class="modal fade" id="addressModal" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addressModalLabel">배송지 선택</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <c:forEach items="${addressDTO}" var="address">
                                <div>
                                    <label>
                                        <input type="radio" id="select-address-id" name="selectedAddress"
                                               value="${address.address_id}">
                                            ${address.address_name}<br>
                                        우편번호: ${address.zipcode}<br>
                                        주소: ${address.address1}-${address.address2}-${address.reference}-${address.receiver}<br>
                                        전화번호: ${address.phone_number}<br>
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" onclick="ajaxSelect()">선택</button>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <strong id="address-name">${addressDTO.get(0).address_name}</strong><br>
                <input type="text" id="address_id" value="${addressDTO.get(0).address_id}">
                <div class="form-floating mb-3">
                    받는사람
                    <input type="text" id="address-receiver" class="form-control" readonly value="${addressDTO.get(0).receiver}">
                </div>
                <div class="form-floating mb-3">
                    우편번호
                    <input type="text" id="address-zipcode" class="form-control" readonly value="${addressDTO.get(0).zipcode}">
                </div>
                <div class="form-floating mb-3">
                    주소
                    <input type="text" id="address-user" class="form-control" readonly value="${addressDTO.get(0).address1}-${addressDTO.get(0).address2}-${addressDTO.get(0).reference}-${addressDTO.get(0).receiver}">
                </div>
                <div class="form-floating mb-3">
                    전화번호
                    <input type="text" id="address-mobile" class="form-control" readonly value="${addressDTO.get(0).phone_number}">
                </div>
            </div>

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
            <input type="button" value="결제하기" class="btn btn-primary">
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function openAddressSelectionModal() {
        $('#addressModal').modal('show');
    }

    const ajaxSelect = () => {
        $('#addressModal').modal('hide');
        const address_id = $("input[name='selectedAddress']:checked").val();
        const address_receiver = document.getElementById("address-receiver");
        const address_typing = document.getElementById("address_id");
        const address_name = document.getElementById("address-name");
        const address_zipcode = document.getElementById("address-zipcode");
        const address_user = document.getElementById("address-user");
        const address_phoneNumber = document.getElementById("address-mobile");
        $.ajax({
            type: "post",
            url: "/address-changer",
            data: {
                "address_id": address_id
            },
            success: function (res) {
                address_receiver.value = res.receiver;
                address_typing.value = res.address_id;
                address_name.value = res.address_name;
                address_zipcode.value = res.zipcode;
                address_user.value = res.address1 + res.address2 + res.reference;
                address_phoneNumber.value = res.phone_number;
            },
            error: function () {
                alert("에러!")
            }
        })

    }
</script>
</body>
</html>
