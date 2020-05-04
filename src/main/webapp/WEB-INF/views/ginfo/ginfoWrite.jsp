<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ginfoWrite</title>
<script type="text/javascript">
function sendGinfo() {
	var title=document.getElementById("title");
	var content=document.getElementById("content");
	
	if(title.value.trim().length < 1){
		alert("제목을 입력하세요");
		title.focus();
		return ;
	}
	if(content.value.trim().length < 1){
			alert("내용을 입력하세요");
			content.focus();
			return ;	
	}
	document.getElementById("ginfoForm").submit();
}
</script>
<style>
	#wrapper {
		width : 510px;
		margin : 0 auto;
		font-family: "가비아 솔미체";
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
	input[type="text"],
	input[type="password"] {
		width : 200px;
	}
	/* img {
		width : 20px;
	} */
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 글자수 카운팅 -->
<script type="text/javascript">
 function countword() {
	document.getElementById("contentcount").innerHTML = document.getElementById("content").value.length;
}
</script>
<style type="text/css">
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #007bff;
  cursor: pointer;
 
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #28a745;
}

.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
</style>
</head>
<body>
<div id="wrapper" class="container">
	<h2>공지사항 등록</h2>
	<!-- 리셋아이콘 -->
	<a href="" style="float: right;" data-toggle="tooltip" title="모두 지우기"><img alt="" src="resources/images/reset.png" width="40px"/></a>
	
	<form id="ginfoForm" action="ginfoWrite" method="POST" enctype="multipart/form-data">
	<table class="table table-dark table-striped">
		<tr>
			<th>작성자</th>
			<td>${trainer.tname}
			<input type="hidden" value="${trainer.tname}" name="writer">
			</td>
			
		</tr>
		
		<tr>
			<th>제목</th>
			<td>
				<input class="form-control" type="text" name="title" id="title"/>
				<input type="hidden" value="${trainer.tid }" name="tid">
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<div class="filebox">
				<label for="upload">파일첨부</label>
				<input id="upload" type="file" value="파일첨부" name="upload"/>
				</div>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea class="form-control" id="content" rows="10" cols="30" name="content" id="content" onkeyup="countword()"></textarea>
				<span id="contentcount">0</span>&nbsp;글자
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="btn btn-primary btn-block" type="button" value="글등록" onclick="sendGinfo()"/>
				
			</th>
		</tr>
	</table>
	</form>
</div>
</body>
</html>



