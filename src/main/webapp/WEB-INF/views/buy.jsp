<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrapper{
	width : 700px;
}
.card{
	margin-top: 50px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>


					


<div class="container" id="wrapper">
<!-- 로고 클릭하면 메인화면으로 -->
					<c:url var="root" value="/" />
					<a href="${root}"><img src="resources/img/icons8-home-page-100.png"
						alt="home" style="width: 50px"></a>
  <div class="card" style="width:400px">
    <img class="card-img-top" src="resources/img/sport-2260736_640.jpg" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">PT 10회 회원권</h4>
      <p class="card-text">구매하신 PT권으로 PT를 신청하실수 있습니다.</p>
      <a href="pay" class="btn btn-primary" id="buy">구매</a>
    </div>
  </div>
 </div>
</body>
</html>