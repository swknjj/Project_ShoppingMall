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
        .container {
            margin-top: 30px;
            margin-bottom: 30px;
        }

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
<div class="container2" style="margin: 0 auto; width: 40%">
    <div id="signUp" style="width: 80%; margin: 0 auto; height: auto; text-align: center;">
        <h2 style="margin-top: 100px">회원가입</h2><br>
        <form action="/user/save" method="post" id="name-usersave" onsubmit="return finalCheck()">
            <div class="container">
                <label for="email" id="email-label"><h5>이메일</h5></label>
                <div class="row">
                    <div class="col">
                        <input type="text" id="email" class="form-control" name="email" onblur="email_check()"
                               placeholder="이메일">
                    </div>
                    @
                    <div class="col">
                        <input type="text" id="domain" class="form-control" id="email-form" readonly onblur="email_check()">
                    </div>
                    <div class="col">
                        <select id="search-select" class="form-select" name="domain" onblur="email_check()"
                                onchange="input_email()">
                            <option value="" selected disabled hidden>선택해주세요</option>
                            <option value="daum.net">daum.net</option>
                            <option value="naver.com">naver.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                    </div>
                </div>
            </div>
            <h4 id="email-bottom"></h4>

            <div class="container">
                <label for="password"><h4>비밀번호</h4></label><br>
                영문 , 숫자를 포함한 8자 이상 , 16자 이하의 비밀번호를 입력해주세요.<br>
                <input type="password" class="form-control" id="password" name="password" onblur="password_check()"
                       placeholder="비밀번호">
            </div>
            <h4 id="password-bottom"></h4>

            <div class="container">
                <label for="password-check"><h4>비밀번호 확인</h4></label><br>
                <input type="password" class="form-control" id="password-check" name="passwordCheck"
                       onblur="password_check_check()" placeholder="비밀번호 확인">
            </div>
            <h4 id="password-check-bottom"></h4>

            <div class="container">
                <label for="nickname"><h4>닉네임</h4></label><br>
                다른 유저와 겹치지 않도록 입력해주세요.(2~15자)<br>
                <input type="text" class="form-control" id="nickname" name="nickname" onblur="nickname_check()"
                       placeholder="별명 (2~15자)">
            </div>
            <h4 id="nickname-bottom"></h4>

            <div class="container">
                <label for="birth"><h4>생년월일</h4></label><br>
                생년월일을 입력해주세요(XXXX-XX-XX) <br>
                <input type="text" class="form-control" id="birth" name="birth" onblur="birth_check()"
                       placeholder="- 제외">
            </div>
            <h4 id="birth-bottom"></h4>

            <div class="container">
                <h4>약관동의</h4>
                <label for="agree-all">
                    <input type="checkbox" id="agree-all" name="agreeAll"><span> 모두 동의합니다</span>
                </label><br>
                <label for="TOS">
                    <input type="checkbox" id="TOS" name="agree_TOS"><span> TOS 동의 <strong>(필수)</strong></span>
                </label><br>
                <label for="PICU">
                    <input type="checkbox" id="PICU" name="agree_PICU"><span> PICU 동의 <strong>(필수)</strong></span>
                </label><br>
                <label for="promotion">
                    <input type="checkbox" id="promotion"
                           name="agree_promotion"><span> promotion 동의 <strong>(필수)</strong></span>
                </label><br>
            </div>
            <div class="container">

            </div>
            <div class="container">
                <input type="submit" class="btn btn-primary" value="회원가입">
                <button class="btn btn-secondary" onclick="back()">뒤로가기</button>
            </div>
        </form>
        <div class="container">
            이미 아이디가 있으신가요? <a href="/user/login">로그인</a><br>
        </div>
    </div>

</div>
</body>
<script>
    const back = () => {
        location.href = "/";
    }
    const input_email = () => {
        document.getElementById("domain").value = document.getElementById("search-select").value;
    }
    const email_check = () => {
        const email_label = document.getElementById("email-label");
        const email = document.getElementById("email");
        const domain = document.getElementById("domain");
        const email_domain = document.getElementById("search-select");
        const typingEmail = document.getElementById("email").value;
        $.ajax({
            type: "post",
            url: "/email-check",
            data: {
                "email_check": typingEmail
            },
            success: function () {
                if (domain.value.length == 0 || email.value.length==0) {
                    document.getElementById("email-bottom").innerText = "필수입력입니다.";
                    document.getElementById("email-bottom").style.color = "red";
                    email_label.style.color = "red";
                } else if (email_domain.value.length == 0) {
                    document.getElementById("email-bottom").innerText = "도메인을 선택해주세요.";
                    document.getElementById("email-bottom").style.color = "red";
                    email_label.style.color = "red";
                } else {
                    document.getElementById("email-bottom").innerText = "좋은 이메일이네요!";
                    document.getElementById("email-bottom").style.color = "green";
                    email_label.style.color = "green";
                }
            },
            error: function () {
                document.getElementById("email-bottom").style.color = "red";
                document.getElementById("email-bottom").innerText = "중복된 닉네임이에요!";
            }
        })
    }

    const password_check = () => {
        const password = document.getElementById("password");
        const exp = /^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
        if (password.value.length == 0) {
            document.getElementById("password-bottom").style.color = "red";
            document.getElementById("password-bottom").innerText = "필수입력입니다.";
        } else if (!(password.value.match(exp))) {
            document.getElementById("password-bottom").style.color = "red";
            document.getElementById("password-bottom").innerText = "조건을 확인해주세요";
        } else {
            document.getElementById("password-bottom").style.color = "green";
            document.getElementById("password-bottom").innerText = "좋은 비밀번호네요!";
        }
    }
    const password_check_check = () => {
        const password = document.getElementById("password");
        const password_check = document.getElementById("password-check");
        const password_bottom = document.getElementById("password-check-bottom");
        if (password_check.value.length == 0) {
            password_bottom.innerText = "확인을 위해 비밀번호를 한번 더 입력해주세요";
            password_bottom.style.color = "red";
        } else if (password.value == password_check.value) {
            password_bottom.innerText = "비밀번호 확인";
            password_bottom.style.color = "green";
        } else {
            password_bottom.innerText = "비밀번호와 같게 입력해주세요";
            password_bottom.style.color = "red";
        }
    }
    const nickname_check = () => {
        let typingNickname = document.getElementById("nickname").value;
        let nickname_bottom = document.getElementById("nickname-bottom");
        $.ajax({
            type: "post",
            url: "/nickname-check",
            data: {
                "nickname_check": typingNickname
            },
            success: function () {
                if (typingNickname.length == 0) {
                    nickname_bottom.style.color = "red";
                    nickname_bottom.innerText = "필수입력입니다";
                } else {
                    nickname_bottom.style.color = "green";
                    nickname_bottom.innerText = "좋은 닉네임이에요!";
                }
            },
            error: function () {
                nickname_bottom.style.color = "red";
                nickname_bottom.innerText = "중복된 닉네임이에요!";
            }
        })
    }
    const birth_check = () => {
        const birth = document.getElementById("birth");
        const birth_bottom = document.getElementById("birth-bottom");
        const exp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
        if (birth.value.length == 0) {
            birth_bottom.style.color = "red";
            birth_bottom.innerText = "필수입력입니다.";
        } else if (!(birth.value.match(exp))) {
            birth_bottom.style.color = "red";
            birth_bottom.innerText = "조건을 확인해주세요";
        } else {
            birth_bottom.style.color = "green";
            birth_bottom.innerText = "생년월일 확인";
        }
    }

    const agreeChkAll = document.getElementById("agree-all");
    agreeChkAll.addEventListener('change', (e) => {
        const TOS = document.getElementById("TOS");
        const PICU = document.getElementById("PICU");
        const promotion = document.getElementById("promotion");
        TOS.checked = e.target.checked;
        PICU.checked = e.target.checked;
        promotion.checked = e.target.checked;
    });
    const finalCheck = () => {
        const email_bottom = document.getElementById("email-bottom");
        const password_bottom = document.getElementById("password-bottom");
        const password_check_bottom = document.getElementById("password-check-bottom");
        const nickname_bottom = document.getElementById("nickname-bottom");
        const birth_bottom = document.getElementById("birth-bottom");
        const TOS = document.getElementById("TOS");
        const PICU = document.getElementById("PICU");
        const promotion = document.getElementById("promotion");

        if (email_bottom.style.color !== "green") {
            alert("이메일을 확인하세요");
            return false;
        } else if (password_bottom.style.color !== "green") {
            alert("비밀번호를 확인하세요");
            return false;
        } else if (password_check_bottom.style.color !== "green") {
            alert("비밀번호 확인칸을 확인해주세요");
            return false;
        } else if (nickname_bottom.style.color !== "green") {
            alert("닉네임 중복여부를 확인해주세요");
            return false;
        } else if (birth_bottom.style.color !== "green") {
            alert("생년월일을 확인해주세요");
            return false;
        } else if (!TOS.checked) {
            alert("TOS에 동의해주세요");
            return false;
        } else if (!PICU.checked) {
            alert("PICU에 동의해주세요");
            return false;
        } else if (!promotion.checked) {
            alert("Promotion에 동의해주세요");
            return false;
        } else {
            alert("회원가입을 환영합니다");
            return true;
        }
    }
</script>
</html>
