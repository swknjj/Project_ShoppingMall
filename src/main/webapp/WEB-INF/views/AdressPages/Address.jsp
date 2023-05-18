<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/link.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>Our lovely home</title>
    <style>
        #section {
            height: 80vh;
        }

        #section .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        #signIn {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>

<body>
<%@include file="/WEB-INF/views/component/nav.jsp" %>

<c:if test="${addressDTOList != null}">
<p>
    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        배송지 목록 보기
    </a>
</p>
<div class="collapse" id="collapseExample">
    <div class="card card-body">
        <table class="table-warning">
            <thead>
            <tr>
                <th scope="col">배송지명</th>
                <th scope="col">받는사람</th>
                <th scope="col">연락처</th>
                <th scope="col">주소</th>
            </tr>
            </thead>
            <c:forEach items="${addressDTOList}" var="list">
                <tr>
                <td>${list.address_name}</td>
                <td>${list.receiver}</td>
                <td>${list.phone_number}</td>
                <td>${list.zipcode}-${list.address1}-${list.address2}-${list.reference}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</c:if>
<div id="section">
    <div class="container">
        <div id="user-address" style="width: 80%;">
            <h2>기본 배송지 설정</h2>
            <form action="/user/userAddress" method="post" onsubmit="return check()">
                <input type="text" name="user_id" value="${userDTO.user_id}" style="display: none"><br>
                <label for="address-name"><h4>배송지명</h4></label><br>
                <input type="text" class="form-control" id="address-name" name="address_name" placeholder="배송지명 ex)집 , 회사 등"><br>

                <label for="receiver-name"><h4>받는사람</h4></label><br>
                <input type="text" class="form-control" id="receiver-name" name="receiver" placeholder="받는사람"><br>

                <label for="phone-number"><h4>연락처</h4></label><br>
                <input type="text" class="form-control" id="phone-number" name="phone_number" placeholder="연락처"><br>

                <div id="api">
                    <div class="row">
                        <div class="col-10">
                            <input type="text" id="sample6_postcode" class="form-control" name="zipcode" placeholder="우편번호"/>
                        </div>
                        <div class="col-2">
                            <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()"
                                   value="우편번호 찾기"/><br/>
                        </div>
                    </div>
                </div>
                <div>
                    <input type="text" id="sample6_address" class="form-control" name="address1" placeholder="주소"/><br/>
                    <input type="text" id="sample6_detailAddress" class="form-control" name="address2" placeholder="상세주소"/>
                    <input type="text" id="sample6_extraAddress" class="form-control" name="reference" placeholder="참고항목"/>
                    <label for="defaultAddress">기본 배송지 설정</label>
                    <input type="checkbox" class="form-check-input" id="defaultAddress" name="isdefault">
                </div>
                <input type="submit" class="btn btn-primary" value="기본 배송지 등록">
                <button class="btn btn-secondary" onclick="back()">뒤로가기</button>
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

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') {
                    // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else {
                    // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += extraAddr !== '' ? ', ' + data.buildingName : data.buildingName;
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById('sample6_extraAddress').value = extraAddr;
                } else {
                    document.getElementById('sample6_extraAddress').value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById('sample6_address').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_detailAddress').focus();
            },
        }).open();
    }

    const check = () => {
        const address = document.getElementById("address-name");
        const receiver = document.getElementById("receiver-name");
        const phone_number = document.getElementById("phone-number");
        const phone_number_check = /^\d{2,3}-\d{3,4}-\d{4}$/;
        const zipcode = document.getElementById("sample6_postcode");
        const address1 = document.getElementById("sample6_address");
        const address2 = document.getElementById("sample6_detailAddress");
        if(address.value.length==0) {
            address.focus();
            return false;
        }else if(receiver.value.length==0) {
            receiver.focus();
            return false;
        }else if(phone_number.value.length==0) {
            phone_number.focus();
            return false;
        }else if(!(phone_number.value.match(phone_number_check))){
            phone_number.focus();
            return false;
        }else if(zipcode.value.length==0){
            zipcode.focus();
            return false;
        }else if(address1.value.length==0) {
            address1.focus();
            return false;
        }else if(address2.value.length==0) {
            address2.focus();
            return false;
        }else {
            alert("배송지 설정 완료");
            return true;
        }
    }
</script>
</html>