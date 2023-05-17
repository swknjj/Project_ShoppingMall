<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Our lovely home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">상품 목록</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/user/save" id="navbarDropdown" role="button"
                            <c:choose>
                                <c:when test="${sessionScope.nickname eq null}">
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    비회원 메뉴
                                </c:when>
                                <c:otherwise>
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    회원 메뉴
                                </c:otherwise>
                            </c:choose>
                    </a>
                    <c:choose>
                    <c:when test="${sessionScope.nickname eq null}">
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/user/save">회원가입</a></li>
                        <li><a class="dropdown-item" href="/user/login">로그인</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/user/findById">아이디 찾기</a></li>
                        <li><a class="dropdown-item" href="/user/findByPassword">비밀번호 재설정</a></li>
                    </ul>
                </li>
                </c:when>
                <c:otherwise>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">본인 정보 수정</a></li>
                        <li><a class="dropdown-item" href="#">본인 배송지 설정</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">판매자 설정</a></li>
                        <li><a class="dropdown-item" href="#">상품 등록</a></li>
                    </ul>
                    </li>
                </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>
            </ul>
            <c:if test="${sessionScope.nickname!=null}">
                <ul class="navbar-nav ml-auto">
                        ${sessionScope.nickname}님 환영해요!　
                </ul>
            </c:if>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="통합검색" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>