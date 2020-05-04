<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".ptgo").click(pton);
})


function pton() {
	var tid = $(this).attr("data-id");
	var mid = '${sessionScope.loginId}'
	$.ajax({
		type: "post"
		,url : "pton"
		,data : {"tid":tid , "mid":mid}
		,success : function(resp){
			if(resp == "success"){
				alert("PT등록 완료");
			}else{
				alert("등록 실패 쿠폰 유무를 다시 한번 확인해 주세요");
			}
		}
		,error:function(resp){
			alert("오류");
		 	}
	})
}
</script>

</head>
<body>
<div class="container" >
<div class="card-columns">

<c:forEach var="trainer" items="${trainerList}" varStatus="stat">
	
		<div class="card" style="width:375px">
		<c:if test="${not empty trainer.originalfilename}">
					<c:if test="${trainer.originalfilename.endsWith('.jpg')||trainer.originalfilename.endsWith('.png')||trainer.originalfilename.endsWith('.gif')||trainer.originalfilename.endsWith('.jpeg')}">
						<img class="card-img-top" src="<c:url value='/img/${trainer.savedfilename}'/>" alt="Card image" height="375px">
					</c:if>
				</c:if>
		<c:if test="${empty trainer.originalfilename}">
			<img class="card-img-top" src="resources/img/img_avatar1.png" alt="Card image" style="height: 375px">
		</c:if>
		<div class="card-body">
		<h4 class="card-title">${trainer.tname} 선생님</h4>
		<pre style="height: 200px" class="pre-scrollable">${trainer.pr}</pre>
		<button  class="ptgo btn btn-primary" data-id="${trainer.tid }">등록하기</button>
		</div>
	</div>
	
</c:forEach>
</div>
</div>
</body>
</html>