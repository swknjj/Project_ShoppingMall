<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Our lovely home</title>
    <style>
        .carousel-item {
            transition: transform 0.6s ease;
        }

        .carousel-item.active {
            transform: scale(1);
        }

        .carousel-item-next.carousel-item-left,
        .carousel-item-prev.carousel-item-right {
            transform: scale(0.8);
        }

        .carousel-item-next,
        .carousel-item-prev {
            transform: scale(0.8);
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/component/nav.jsp" %>
<div id="section" style="overflow-y: scroll">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/resources/img/img1.jpg" class="d-block w-100" width="100%" height="80%" alt="Slide 1">
                <div class="carousel-caption d-none d-md-block">
                    <strong style="color:black;">의류</strong>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/resources/img/img2.jpg" class="d-block w-100" width="100%" height="80%" alt="Slide 2">
                <div class="carousel-caption d-none d-md-block">
                    <strong style="color:black;">화장품</strong>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/resources/img/img3.jpg" class="d-block w-100" width="100%" height="80%" alt="Slide 3">
                <div class="carousel-caption d-none d-md-block">
                    <strong style="color:black;">가구</strong>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/resources/img/img4.jpg" class="d-block w-100" width="100%" height="80%" alt="Slide 3">
                <div class="carousel-caption d-none d-md-block">
                    <strong style="color:black;">도서</strong>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</div>
<%@include file="/WEB-INF/views/component/footer.jsp" %>
</body>
<script>

</script>
</html>
