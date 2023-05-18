<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 2:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <script>
    if(confirm("판매자 등록이 되지 않았으므로 판매자 등록설정 페이지로 이동하시겠습니까?")){
      location.href="/seller/save";
    }else {
      location.href="/";
    }

  </script>
</head>
<body>

</body>
</html>
