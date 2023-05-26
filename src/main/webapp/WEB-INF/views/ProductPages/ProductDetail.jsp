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

        .nav-pills .nav-link {
            color: #fff;
            background-color: #007bff;
            border-radius: 0;
        }

        .nav-pills .nav-link.active {
            background-color: #fff;
            color: #007bff;
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
            <c:if test="${!empty productDTO.image}">
                <div style="width: 300px; height: 300px">
                    <img src="${pageContext.request.contextPath}/upload/${productDTO.storedFileName}" alt=""
                         width="100%" height="100%"><br>
                </div>
            </c:if>
            <c:if test="${empty productDTO.image}">
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
                            <c:if test="${productDTO.delivery_fee != 0}">
                                배송비 : ${productDTO.delivery_fee}
                            </c:if>
                        </c:if>
                        <input type="submit" id="sell" class="btn btn-primary mb-3" disabled="disabled" value="구매하기">
                    </form>
                </c:when>
                <c:otherwise>
                    <h2 style="color: red">매진입니다</h2>
                </c:otherwise>
            </c:choose>
            <div class="row">
                <div class="col-8">
                    <strong>주문금액</strong>
                </div>
                <div class="col-4">
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
    <ul class="nav nav-pills justify-content-center">
        <li class="nav-item">
            <a class="nav-link" aria-current="page" href="#product-info">상품정보</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#product-review">리뷰<span id="nav_count" style="color: violet">${reviewCount}</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#product-inquiry">문의</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#product-shipping">배송</a>
        </li>
    </ul>
</div>


<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addressModalLabel">리뷰 쓰기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <strong>별점(1~5)</strong>
                    <div class="d-flex align-items-center">
                        <button class="btn btn-link btn-rating" onclick="decrease_rating()"><i
                                class="bi bi-arrow-down"></i></button>
                        <span id="rating-cnt" class="mx-2">1</span>
                        <button class="btn btn-link btn-rating" onclick="increase_rating()"><i
                                class="bi bi-arrow-up"></i></button>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="review-image" class="form-label">사진 첨부하기(최대 1장)(선택)</label>
                    <input type="file" id="review-image" class="form-control" accept="image/*">
                </div>
                <div class="mb-3">
                    <label for="review-content" class="form-label">리뷰 내용 작성</label>
                    <textarea class="form-control" id="review-content"
                              placeholder="자세하고 솔직한 리뷰는 다른 고객에게 큰 도움이 됩니다"></textarea>
                </div>
                <ul>
                    <li>상품을 직접 사용한 경우에만 리뷰 작성해주세요.</li>
                    <li>사진 첨부 시 <span style="color: red">캡쳐, 도용, 유사상품 촬영, 동일상품 여부 식별이 불가한 경우</span>에는 경고 없이 삭제될 수 있습니다.
                    </li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="ajaxSelect()">작성하기</button>
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
    <div id="product-review">
        <div class="d-flex justify-content-between">
            <div><strong>리뷰</strong>&nbsp;<span id="review-count" style="color:violet;">${reviewCount}</span></div>
            <div><a href="#" onclick="openAddressSelectionModal()">리뷰 쓰기</a></div>
        </div>
        <div id="result-area">
            <c:choose>
                <c:when test="${reviewDTOList.size()==0}">
                    <p>리뷰가 없습니다</p>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${reviewDTOList}" var="review">
                        <div class="container" style="border: 1px solid black">
                            <div class='mb-2'>별점 : ${review.rating}</div>
                            <div class='mb-2'>
                                <img src="${pageContext.request.contextPath}/upload/${review.storedFileName}" alt="이미지" width="100px" height="100px"></div>
                            <div class="mb-2">${review.content}</div>
                            <div class="mb-2">작성시간 : ${review.created_at}</div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

        </div>
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
    let count_rating = document.getElementById("rating-cnt").innerText;
    let count_rating_text = document.getElementById("rating-cnt");
    const typechange = () => {
        product.style.display = "block";
        document.getElementById("count").value = 1;
        product_price.innerText = parseInt(count) * parseInt(price); // 추가된 부분
        const sell = document.getElementById("sell");
        sell.disabled = false;
    }
    const del = () => {
        product.style.display = "none";
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
        if (parseInt(count) >=${option1.stock}) {
            alert("최대 수량입니다");
        } else {
            count = parseInt(count) + 1;
            count_text.innerText = count;
            product_price.innerText = parseInt(count) * ${option1.price};
            document.getElementById("count").value = count;
        }
    };
    const decrease_rating = () => {
        count_rating = count_rating - 1;
        if (count_rating < 1) {
            alert("1~5까지 가능합니다");
            count_rating = 1;
        }
        count_rating_text.innerText = count_rating;
    };

    const increase_rating = () => {
        if (count_rating > 4) {
            alert("1~5까지 가능합니다");
        } else {
            count_rating = parseInt(count_rating) + 1;
            count_rating_text.innerText = count_rating;
        }
    };

    function openAddressSelectionModal() {
        $('#reviewModal').modal('show');
    }

    const fileInput = document.getElementById("review-image");
    let selectedFile;

    fileInput.addEventListener("change", function (event) {
        selectedFile = event.target.files[0];
    });
    const ajaxSelect = () => {
        $('#reviewModal').modal('hide');
        const review_cnt = document.getElementById("rating-cnt").innerText;
        const review_content = document.getElementById("review-content").value;
        const result_area = document.getElementById("result-area");
        const contextPath = '<%= request.getContextPath() %>';
        const formData = new FormData();
        if(selectedFile!=null){
        formData.append("file", selectedFile);
        }
        formData.append("rating", review_cnt);
        formData.append("content", review_content);
        formData.append("product_id", `${productDTO.product_id}`);
        formData.append("seller_id", `${sellerDTO.seller_id}`);

        $.ajax({
            type: "post",
            enctype: "multipart/form-data",
            url: "/review-save",
            data: formData,
            contentType: false,
            processData: false,
            success: function (res) {
                let count = res.count;
                let reviewDTOList = res.reviewDTOList;
                let result = "";
                for (let i in reviewDTOList) {
                    result += "<div class='container' style='border: 1px solid black'>";
                    result += "<div class='mb-2'>" + "별점: " + reviewDTOList[i].rating + "</div>";
                    result += "<div class='mb-2'>";
                    if (reviewDTOList[i].review_image != null) {
                        result += "<img src='" + contextPath + "/upload/" + reviewDTOList[i].storedFileName + "' alt='이미지' width='100px' height='100px'>";
                    }
                    result += "</div>";
                    result += "<div class='mb-2'>" + reviewDTOList[i].content + "</div>";
                    result += "<div class='mb-2'>작성시간: " + reviewDTOList[i].created_at + "</div>";
                    result += "</div>";
                }
                result_area.innerHTML = result;
                document.getElementById("nav_count").innerHTML = count;
                document.getElementById("review-count").innerHTML = count;
            },
            error: function (res) {
                alert("댓글 오류");
            }
        });
    }


</script>
</html>