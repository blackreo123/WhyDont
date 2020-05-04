<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ginfoDetail</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var replyno=0;

$(function(){
	init();
	$("#replybtn").click(replySend);
})
//ajax로 전체 댓글을 요청하는 코드
function init() {
	var infono=${ginfo.infono};
	$.ajax({
		method: "get"
		,url: "replyAll"
		,data: {"infono":infono}
		,success: output
		,error: function (resp) {
			$("#replyResult").text("다시 시도해주세요");
		}
	})
}
//댓글을 화면에 출력
function output(resp) {
	var loginId;
	var tid="${sessionScope.tloginId}";
	var mid="${sessionScope.loginId}";
	
	if(tid != ""){
		loginId = tid;
	}
	if(mid != ""){
		loginId = mid;
	}
	
	var data='<table class="table table-dark table-striped">'
	$.each(resp, function(index, item){
		
		data+='<tr>'
		data+='<td>'+item.replyno+'</td>'
		data+='<td>'+item.replytext+'</td>'		
		data+='<td>'+item.regdate+'</td>'
		data+='<td>'+item.writer+'</td>'
		data+='<td>'
		if(loginId == item.mid || loginId == item.tid){
			data+='<input class="replyDelete btn btn-danger" type="button"  value="댓글 삭제"  data-num="'+item.replyno+'" >'
			data+='<input class="replyUpdate btn btn-success" type="button"  value="댓글 수정" data-num="'+item.replyno+'" data-text="'+item.replytext+'">'
		}else{
			
			data+='<input class="replyDelete btn btn-danger" type="button"  value="댓글 삭제"  data-num="'+item.replyno+'" disabled >'
			data+='<input class="replyUpdate btn btn-success" type="button"  value="댓글 수정" data-num="'+item.replyno+'" data-text="'+item.replytext+'" disabled>'
		}
		
		data+='</td>'
		data+='</tr>'
	})
	data+='</table>'
	$("#replyResult").html(data);			
	$(".replyDelete").click(replyDelete);
	$(".replyUpdate").click(replyUpdate);	
	
}
function replyUpdate() {
	replyno=$(this).attr("data-num");
	var replytext=$(this).attr("data-text");
	
	$("#replytext").val(replytext);
	$("#replybtn").val("댓글수정");
	
	
};

//수정, 입력 두가지 처리 동시에
function replySend() {
	var status = ($("#replybtn").val()=="댓글수정")?"replyUpdate":"replyWrite";
	var replytext = $("#replytext").val();
	
	if(status == "replyUpdate"){
		var sendData= {"replyno":replyno ,"replytext":replytext }
		$.ajax({
			method: "post"
			,url: status
			,data: sendData
			,success: function (resp) {
				if(resp=="success"){
					alert("댓글 수정 완료");
					init();
					$("#replybtn").val("댓글달기");
				}else{
					alert("댓글 수정 실패");
				}
			}
		,error:function(resp){
			alert("오류");
			}
		})
	}else if(status == "replyWrite"){
		var replytext = $("#replytext").val();
		var infono=${ginfo.infono}
		var sendData= { "replytext":replytext, "infono":infono}
		$.ajax({
			method: "post"
			,url: status
			,data: sendData
			,success: function (resp) {
				if(resp=="success"){
					alert("댓글 달기 완료");
					$("#replybtn").val("댓글달기");
					init();
				}else{
					alert("댓글 달기 실패");
				}
			}
		 	,error: function(resp){
				alert("오류");
			}
		})
	}
};
function replyDelete() {
	//ajax 기능을 이용해서 삭제하고자 하는 데이터를 보냄
	//replyno(삭제 버튼이 클릭된 바로 그 replyno가 필요!!!)-사용자 정의 어트리뷰트
	var replyno=$(this).attr("data-num");
	
	
	$.ajax({
		method: "get"
		 ,url: "replyDelete"
		 ,data: {"replyno":replyno}
		 ,success: function(resp){
			 if(resp=="success"){
			 	alert("success");
			 	init();
			 }
			 else{
				 alert("삭제 실패");
			 }
				 
		 }
		,error: function(){
			alert("fuck");
		}
	})
};


</script>
<script>
function deleteGinfo(infono) {

	location.href = "deleteGinfo?infono="+infono;
}
function updateGinfo(infono) {
	location.href = "updateGinfo?infono="+infono;
}
</script>

<style>
	#wrapper {
		width : 800px;
		margin : 0 auto;
		font-family: "가비아 솔미체";
	}
	#wrapper pre{
		font-family: "가비아 솔미체";
		color: white;
	}
	#wrapper h2 {
		text-align : center;
	}
	
	.header {
		width : 150px;
	}
	.inputdata {
		width : 350px;
	}
	
	pre{
		width : 400px;
		height : 300px;
	}
</style>

</head>
<body>
<div id="wrapper" class="container">
	<h2> ${ginfo.writer}님의 글 </h2>
	<a href="ginfo?searchItem=${searchItem}&searchWord=${searchWord}&currentPage=${currentPage}">목록으로</a>
	
	
	<table  class="table table-dark table-striped">
		<tr>
			<th>작성자</th>
			<td>${ginfo.writer}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${ginfo.regdate}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				${ginfo.title}
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
			<c:if test="${not empty ginfo.originalfilename}">
			<a href="download?infono=${ginfo.infono }">${ginfo.originalfilename}</a>
			<c:if test="${sessionScope.tloginId == ginfo.tid }">
			&nbsp;<a href="deleteFile?infono=${ginfo.infono }"><img alt="삭제" src="resources/img/x.png"></a>
			</c:if>
			</c:if>
			</td>
				
				
			
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<!-- 첨부파일이 사진이나 움짤이면 바로 표시해버리기 내용에 -->
				<c:if test="${not empty ginfo.originalfilename}">
					<c:if test="${ginfo.originalfilename.endsWith('.jpg')||ginfo.originalfilename.endsWith('.png')||ginfo.originalfilename.endsWith('.gif')||ginfo.originalfilename.endsWith('.jpeg')}">
						<img src="<c:url value='/img/${ginfo.savedfilename}'/>"width="500px" height="300px"><br>
					</c:if>
				</c:if>
				<pre>${ginfo.content}</pre>
			</td>
		</tr>
		<!-- 로그인 + 자신이 쓴글  -->
		<c:if test="${sessionScope.tloginId != null and sessionScope.tloginId == ginfo.tid }">
		<tr>
			<th colspan="2">
				<input type="button" class="btn btn-success" value="수정" onclick="updateGinfo(${ginfo.infono})">
				<input type="button" class="btn btn-danger" value="삭제"  onclick="deleteGinfo(${ginfo.infono})">
			</th>
		</tr>
		</c:if>
	</table>
	<br>
	
	<!-- 댓글 목록 영역 -->
	<hr>
	<div id="replyResult"></div>	
	<!-- 댓글을 달아보자 -->
	<div>
	<c:if test="${not empty sessionScope}">
		
		<input type="hidden" name="infono" value="${ginfo.infono}">
		<input id="replytext" class="form-control" type="text" name="replytext" style="width: 89.3%;display: inline;">
		<input class="btn btn-primary " type="button" value="댓글달기" id="replybtn">
		
	</c:if>
	</div>
	<p></p>
</div>
</body>
</html>



