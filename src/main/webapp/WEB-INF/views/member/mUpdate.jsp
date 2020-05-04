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
	/*  var pwCheck = prompt("비밀번호를 입력해주세요");
	if(pwCheck != '${sessionScope.loginPwd}'){
		alert("비밀번호가 일치하지 않습니다");
		location.href="/whydont/";
	} */
	$("#modal_button").hide();
	$("#modal_button").trigger('click');
	

	
	$("#footer").click(function(){
		var pwd= $("#pwd").val();
		if(pwd != '${sessionScope.loginPwd}'){
			alert("비밀번호가 일치하지 않습니다");
			location.href="/whydont/";
		}
	})
		
	
	//비밀번호 길이체크
	$("#mpwd1").on('keyup', function(){
			var mpwd1 = $("#mpwd1").val();
			if(mpwd1.trim().length<4||mpwd1.trim().length>13){
				$("#pwdCheck").css("color", "red");
				$("#pwdCheck").text("비밀번호를 4~13 글자로 입력해주세요");
				return;
			}
			$("#pwdCheck").text('');
		})
	$("#formCheck").click(finalCheck);
})
function finalCheck() {
	
	var mpwd1= $("#mpwd1").val();
	var mpwd2= $("#mpwd2").val();
	var mname= $("#mname").val();
	var memail= $("#memail").val();
	var mddress= $("#mddress").val();
	
	
	if(mpwd1.trim().length<4||mpwd1.trim().length>13){
		alert("비밀번호를 4~13자 이내로 입력해주세요");
		return;
	}
	
	if(mpwd1 != mpwd2){
		alert("비밀번호 확인과 일치하지 않습니다");
		return;
	}
	if(mname.trim().length<1){
		alert("이름을 입력해주세요");
		return;
	}
	if(memail.trim().length<1){
		alert("이메일을 입력해주세요");
		return;
	}
	
	if(mddress.trim().length<1){
		alert("주소를 입력해주세요");
		return;
	}
	alert("수정되었습니다");
	$("#mUpdate").submit();
}
</script>
<script type="text/javascript">
function deleteM(mid) {
	var isReal = prompt("정말 탈퇴하시려면 '나는이제살쪄도상관없다'를 입력하세요");
	if(isReal != '나는이제살쪄도상관없다'){
		alert("잘못 입력하셨습니다");
		return;
	}
	location.href="deleteM?mid="+mid;
 	alert("탈퇴되었습니다");
}
</script>
</head>
<body>
<div id="wrapper" class="container">
<h2>회원정보 수정</h2>
<!-- 로고 클릭하면 메인화면으로 -->
					<c:url var="root" value="/" />
					<a href="${root}"><img src="resources/img/icons8-home-page-100.png"
						alt="home" style="width: 50px"></a>
<form id="mUpdate" action="mUpdate" method="POST" enctype="multipart/form-data">
	<table class="table table-dark table-striped">
		<tr>
			<th class="header">고객 ID</th>
			<td class="inputdata">
				<input class="form-control" type="text" id="mid" name="mid" readonly="readonly" value="${member.mid }"/>
				
			</td>
		</tr>
		<tr>
			<th>새로운 비밀번호</th>
			<td><input class="form-control" type="password" id="mpwd1" name="mpwd" value="${member.mpwd }"/><br>
			<span id="pwdCheck"></span></td>
		</tr>	
		<tr>
			<th>새로운 비밀번호 확인</th>
			<td><input class="form-control" type="password" id="mpwd2" value="${member.mpwd }" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input class="form-control" type="text" id="mname" name="mname" value="${member.mname }" /></td>
		</tr>		
		<tr>
			<th>EMail</th>
			<td><input class="form-control" type="text" id="memail" name="memail" value="${member.memail }" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input class="form-control" type="text" id="mddress" name="mddress" value="${member.mddress }" />
				<input type="hidden" name="cupon" value="${member.cupon}">
				<input type="hidden" name="tid" value="${member.tid}">
				<input type="hidden" name="nokori" value="${member.nokori}">
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
			<th colspan="2">
				<input class="btn btn-primary btn-block" type="button" value="수정" id="formCheck" />
				<br>
				<input class="btn btn-danger btn-block" type="button" value="회원탈퇴" onclick="deleteM('${member.mid}')"/>
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