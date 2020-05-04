<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<c:url var="context" value="/img/"/>
<script type="text/javascript">
$(function(){
	//차감 버튼 누르면 남은 횟수 -1 해보쟈..
	$(".saku").click(saku)
})
function saku() {
	var mid = $(this).attr("data-nokori");
	$.ajax({
		type: "post"
		,url: "saku"
		,data: {"mid":mid}
		,success: function(resp){
			if(resp =="success"){
				alert("1회 차감하였습니다");
				location.href="memberCare";
				return;
			}
			if(resp == "nonokori"){
				alert("남은 횟수를 모두 소진하여 목록에서 제거합니다");
				location.href="memberCare";
				return;
			}
			
		}
		,error: function(){
			alert("오류발생");
		}
	})
}

</script>

</head>
<body>
<div class="container" >
<div class="card-columns" id="list">
<c:if test="${empty list}">
	<h1>아직 담당 회원이 없습니다</h1>
</c:if>
<c:forEach var="list" items="${list}" varStatus="stat">
		<div class="card" style="width:375px">
		<c:if test="${not empty list.originalfilename}">
					<c:if test="${list.originalfilename.endsWith('.jpg')||list.originalfilename.endsWith('.png')||list.originalfilename.endsWith('.gif')||list.originalfilename.endsWith('.jpeg')}">
						<img class="card-img-top" src="<c:url value='/img/${list.savedfilename}'/>" alt="Card image" style="height:375px">
					</c:if>
				</c:if>
		<c:if test="${empty list.originalfilename}">
			<img class="card-img-top" src="resources/img/img_avatar1.png" alt="Card image">
		</c:if>
		<div class="card-body">
		<h4 class="card-title">${list.mname} 님</h4>
		<p class="card-text">생년월일: ${list.seinen }</p>
		<p class="card-text">성별: ${list.msex}</p>
		<p class="card-text">남은 횟 수: ${list.nokori}</p>
		<button class="saku btn btn-primary" data-nokori="${list.mid }">횟 수 차감</button>
		</div>
	</div>
</c:forEach>
</div>
</div>

</body>
</html>