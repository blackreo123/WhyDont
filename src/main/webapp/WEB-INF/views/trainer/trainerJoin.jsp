<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//아이디 중복 길이 체크
	$("#tid").on('keyup', function(){
		var tid = $("#tid").val();
		if(tid.trim().length<4||tid.trim().length>13){
			$("#tidCheck").css("color", "red");
			$("#tidCheck").text("아이디를 4~13글자로 입력해주세요");
			return;
		}
		$("#tidCheck").text('');
		//입력한 아이디가 사용가능한지 여부 체크 DB에서 비교
		$.ajax({
			type: "get"
			,url: "tidCheck"
			,data : {"tid":tid}
			,success: function(resp){
				//사용가능한경우: 'success'
				//불가능한경우: 'fail'
				if(resp=='success'){
					$("#tidCheck").css("color", "green")
					$("#tidCheck").text("사용 가능한 아이디입니다")
				}
				else{
					$("#tidCheck").css("color", "red")
					$("#tidCheck").text("사용 불가능한 아이디입니다")
				}
			}
		})
	})
	//비밀번호 길이체크
	$("#tpwd1").on('keyup', function(){
			var tpwd = $("#tpwd1").val();
			if(tpwd.trim().length<4||tpwd.trim().length>13){
				$("#pwdCheck").css("color", "red");
				$("#pwdCheck").text("비밀번호를 4~13 글자로 입력해주세요");
				return;
			}
			$("#pwdCheck").text('');
		})
	$("#tformCheck").click(finalCheck);
})
function finalCheck() {
	var tid= $("#tid").val();
	var tpwd1= $("#tpwd1").val();
	var tpwd2= $("#tpwd2").val();
	var tname= $("#tname").val();
	var temail= $("#temail").val();
	var tidno= $("#tidno").val();
	var tddress= $("#tddress").val();
	var tcode=$("#tcode").val();
	if(tid.trim().length<4||tid.trim().length>13){
		alert("아이디를 4~13자 이내로 입력해주세요");
		return;
	}
	if(tpwd1.trim().length<4||tpwd1.trim().length>13){
		alert("비밀번호를 4~13자 이내로 입력해주세요");
		return;
	}
	if($("#idCheck").text()=="사용 불가능한 아이디입니다"){
		alert("사용 불가능한 아이디입니다");
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
	if(tidno.trim().length<13){
		alert("주민번호를 입력해주세요");
		return;
	}
	if(tddress.trim().length<1){
		alert("주소를 입력해주세요");
		return;
	}
	if(tcode != "dbs3wl2gk1"){
		alert("코드가 맞지 않습니다");
		return;
	}
	alert("등록되셨습니다");
	$("#tjoin").submit();
}
</script>
</head>
<body>
	<div id="wrapper" class="container">
	<h2>트레이너 등록</h2>
	<form id="tjoin" action="tjoin" method="POST">
	<table class="table table-dark table-striped">
		
		<tr>
			<th class="header"><label for="usr">트레이너 ID</label></th>
			<td class="inputdata">
				<input class="form-control" type="text" id="tid" name="tid" placeholder="아이디를 4~13자 이내로 입력하세요" />
				<span id="tidCheck"></span>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input class="form-control" type="password" id="tpwd1" name="tpwd" placeholder="비밀번호를 4~13자 이내로 입력하세요"/>
			<span id="pwdCheck"></span>
			</td>
			
		</tr>	
		<tr>
			<th>비밀번호 확인</th>
			<td><input class="form-control" type="password" id="tpwd2" placeholder="비밀번호를 다시 한번 입력하세요" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input  class="form-control" type="text" id="tname" name="tname" placeholder="이름을 입력하세요" /></td>
		</tr>		
		<tr>
			<th>EMail</th>
			<td><input class="form-control" type="text" id="temail" name="temail" placeholder="Email을 입력하세요" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input  type="radio"  name="tsex" value="man" checked="checked"/>남성 &nbsp;&nbsp;&nbsp;<input  type="radio"  name="tsex" value="woman" />여성</td>
			
		</tr>
		<tr>
			<th>주민번호</th>
			<td>
				<input class="form-control" type="text" id="tidno" name="tidno" placeholder="주민번호 13자리를 '-' 없이 입력하세요" />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input class="form-control" type="text" id="tddress" name="tddress" placeholder="주소를 입력하세요" />
			</td>
		</tr>
		<tr>
			<th>코드</th>
			<td>
				<input class="form-control" type="text" id="tcode" placeholder="면접때 받으신 코드를 입력하세요" />
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="btn btn-primary btn-block" type="button" value="등록" id="tformCheck" />
				
			</th>
		</tr>					
	</table>
	</form>
	</div>
</body>
</html>