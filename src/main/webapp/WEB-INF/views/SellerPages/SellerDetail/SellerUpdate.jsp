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
<div id="section">
  <div class="container">
    <div id="user-update" style="width: 80%;">
      <div class="row">
        <div class="col-10">
          <h2>판매자 정보 수정</h2>
          <p>사업자등록번호는 수정불가</p>
        </div>
        <div class="col-2">
          <button class="btn btn-danger" onclick="outing()">판매자 등록 해제</button>
        </div>
      </div>

      <form action="/seller/update" method="post" onsubmit="return check()">
        <input type="text" name="seller_id" value="${sellerDTO.seller_id}" style="display: none"><br>
        <label for="seller-company-name"><h4>회사이름</h4></label><br>
        <input type="text" class="form-control" id="seller-company-name" name="company_name" value="${sellerDTO.company_name}">
        <h4 id="seller-company-name-bottom"></h4>
        <label for="seller-representative"><h4>대표자 이름</h4></label><br>
        <input type="text" class="form-control" id="seller-representative" name="representative" value="${sellerDTO.representative}">
        <h4 id="seller-representative-bottom"></h4>

        <label for="seller-address"><h4>사업장소재지</h4></label><br>
        <input type="text" class="form-control" id="seller-address" name="address" value="${sellerDTO.address}">
        <h4 id="seller-address-bottom"></h4>

        <label for="seller-customer-center"><h4>고객센터 전화번호</h4></label><br>
        <input type="text" class="form-control" id="seller-customer-center" name="customer_center" value="${sellerDTO.customer_center}">
        <h4 id="seller-customer-center-bottom"></h4>

        <label for="seller-email"><h4>이메일</h4></label><br>
        <input type="text" class="form-control" id="seller-email" name="email" value="${sellerDTO.email}">
        <h4 id="seller-email-bottom"></h4>

        <input type="submit" class="btn btn-primary" value="수정하기">

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
  const check = () => {
    const customer_center_check = /^\d{3}-\d{3,4}-\d{4}$/;
    if (document.getElementById("seller-company-name").value.length === 0) {
      document.getElementById("seller-company-name-bottom").style.color = "red";
      document.getElementById("seller-company-name-bottom").innerText = "필수입력";
      return false;
    } else {
      document.getElementById("seller-company-name-bottom").innerText = "";
    }
    if (document.getElementById("seller-representative").value.length === 0) {
      document.getElementById("seller-representative-bottom").style.color = "red";
      document.getElementById("seller-representative-bottom").innerText = "필수입력";
      return false;
    } else {
      document.getElementById("seller-representative-bottom").innerText = "";
    }
    if (document.getElementById("seller-address").value.length === 0) {
      document.getElementById("seller-address-bottom").style.color = "red";
      document.getElementById("seller-address-bottom").innerText = "필수입력";
      return false;
    } else {
      document.getElementById("seller-address-bottom").innerText = "";
    }
    if (document.getElementById("seller-customer-center").value.length === 0) {
      document.getElementById("seller-customer-center-bottom").style.color = "red";
      document.getElementById("seller-customer-center-bottom").innerText = "필수입력";
      return false;
    } else if (!customer_center_check.test(document.getElementById("seller-customer-center").value)) {
      document.getElementById("seller-customer-center-bottom").style.color = "red";
      document.getElementById("seller-customer-center-bottom").innerText = "전화번호 양식을 맞춰주세요";
      return false;
    } else {
      document.getElementById("seller-customer-center-bottom").innerText = "";
    }
    if (document.getElementById("seller-email").value.length === 0) {
      document.getElementById("seller-email-bottom").style.color = "red";
      document.getElementById("seller-email-bottom").innerText = "필수입력";
      return false;
    } else {
      document.getElementById("seller-email-bottom").innerText = "";
    }
    alert("수정완료");
    return true;
  }


  const outing = () => {
    if (confirm("등록 해제하시겠습니까?")) {
      alert("해제완료")
      location.href = "/seller/delete?seller_id=${sellerDTO.seller_id}"
    }
  }
</script>
</html>