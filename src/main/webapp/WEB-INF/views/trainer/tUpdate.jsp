<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrapper {
		width : 700px;
		margin-top: 100px;
		margin-bottom: 50px;
		font-family: "가비아 솔미체";
	}
	#wrapper h2 {
		text-align : center;
	}
	
	.header {
		width : 150px;
	}
</style>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	/* var pwCheck = prompt("비밀번호를 입력해주세요");
	if(pwCheck != ${sessionScope.tloginPwd}){
		alert("비밀번호가 일치하지 않습니다");
		location.href="/whydont/";
	} */
	$("#modal_button").hide();
	$("#modal_button").trigger('click');
	

	
	$("#footer").click(function(){
		var pwd= $("#pwd").val();
		if(pwd != '${sessionScope.tloginPwd}'){
			alert("비밀번호가 일치하지 않습니다");
			location.href="/whydont/";
		}
	})
	
	//비밀번호 길이체크
	$("#tpwd1").on('keyup', function(){
			var tpwd1 = $("#tpwd1").val();
			if(tpwd1.trim().length<4||tpwd1.trim().length>13){
				$("#pwdCheck").css("color", "red");
				$("#pwdCheck").text("비밀번호를 4~13 글자로 입력해주세요");
				return;
			}
			$("#pwdCheck").text('');
		})
	$("#formCheck").click(finalCheck);
})
function finalCheck() {
	
	var tpwd1= $("#tpwd1").val();
	var tpwd2= $("#tpwd2").val();
	var tname= $("#tname").val();
	var temail= $("#temail").val();
	var tddress= $("#tddress").val();
	
	
	if(tpwd1.trim().length<4||tpwd1.trim().length>13){
		alert("비밀번호를 4~13자 이내로 입력해주세요");
		return;
	}
	
	if(tpwd1 != tpwd2){
		alert("비밀번호 확인과 일치하지 않습니다");
		return;
	}
	if(tname.trim().length<1){
		alert("이름을 입력해주세요");
		return;
	}
	if(temail.trim().length<1){
		alert("이메일을 입력해주세요");
		return;
	}
	
	if(tddress.trim().length<1){
		alert("주소를 입력해주세요");
		return;
	}
	alert("수정되었습니다");
	$("#tUpdate").submit();
}
</script>
<script type="text/javascript">
function deleteT(tid) {
	var isReal = prompt("정말 탈퇴하시려면 '백수'를 입력하세요");
	if(isReal != '백수'){
		alert("잘못 입력하셨습니다");
		return;
	}
	location.href="deleteT?tid="+tid;
	alert("탈퇴되었습니다");
}
</script>

</head>
<body>
<div id="wrapper" class="container">
<h2>트레이너 정보 수정</h2>
<!-- 로고 클릭하면 메인화면으로 -->
					<c:url var="root" value="/" />
					<a href="${root}"><img src="resources/img/icons8-home-page-100.png"
						alt="home" style="width: 50px"></a>
<form id="tUpdate" action="tUpdate" method="POST" enctype="multipart/form-data">
	<table class="table table-dark table-striped">
		<tr>
			<th class="header">고객 ID</th>
			<td class="inputdata">
				<input class="form-control" type="text" id="tid" name="tid" readonly="readonly" value="${trainer.tid }"/>
			</td>
		</tr>
		<tr>
			<th>새로운 비밀번호</th>
			<td><input class="form-control" type="password" id="tpwd1" name="tpwd" value="${trainer.tpwd }"/><br>
			<span id="pwdCheck"></span></td>
		</tr>	
		<tr>
			<th>새로운 비밀번호 확인</th>
			<td><input class="form-control" type="password" id="tpwd2" value="${trainer.tpwd }" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input class="form-control" type="text" id="tname" name="tname" value="${trainer.tname }" /></td>
		</tr>		
		<tr>
			<th>EMail</th>
			<td><input class="form-control" type="text" id="temail" name="temail" value="${trainer.temail }" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input class="form-control" type="text" id="tddress" name="tddress" value="${trainer.tddress }" />
			</td>
		</tr>
		<tr>
			<th>프로필사진 업데이트</th>
			<td>
				<div class="filebox">
				<label for="upload">파일첨부</label>
				<input id="upload" type="file" value="파일첨부" name="upload"/>
				</div>
			</td>
		</tr>
		<tr>
			<th>자기 소개</th>
			<td>
				<textarea rows="10" cols="50" id="pr" name="pr" >${trainer.pr }</textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="btn btn-primary btn-block" type="button" value="수정" id="formCheck" />
				<br>
				<input class="btn btn-danger btn-block" type="button" value="탈퇴" onclick="deleteT('${trainer.tid}')"/>
			</th>
		</tr>					
	</table>
	</form>
</div>

<div class="container">
<!-- Button to Open the Modal -->
  <button id="modal_button" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  </button>
<!-- The Modal -->
<div class="modal" id="myModal" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호를 한번더 입력해주세요</h4>
        
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="password" id="pwd">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="footer">확인</button>
      </div>
      </div>
  </div>
</div>
</div>
</body>
</html>