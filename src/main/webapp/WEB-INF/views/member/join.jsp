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
	$("#mid").on('keyup', function(){
		var mid = $("#mid").val();
		if(mid.trim().length<4||mid.trim().length>13){
			$("#idCheck").css("color", "red");
			$("#idCheck").text("아이디를 3~5글자로 입력해주세요");
			return;
		}
		$("#idCheck").text('');
		//입력한 아이디가 사용가능한지 여부 체크 DB에서 비교
		$.ajax({
			type: "get"
			,url: "idCheck"
			,data : {"mid":mid}
			,success: function(resp){
				//사용가능한경우: 'success'
				//불가능한경우: 'fail'
				if(resp=='success'){
					$("#idCheck").css("color", "green")
					$("#idCheck").text("사용 가능한 아이디입니다")
				}
				else{
					$("#idCheck").css("color", "red")
					$("#idCheck").text("사용 불가능한 아이디입니다")
				}
			}
		})
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
	var mid= $("#mid").val();
	var mpwd1= $("#mpwd1").val();
	var mpwd2= $("#mpwd2").val();
	var mname= $("#mname").val();
	var memail= $("#memail").val();
	var midno= $("#midno").val();
	var mddress= $("#mddress").val();
	
	if(mid.trim().length<4||mid.trim().length>13){
		alert("아이디를 4~13자 이내로 입력해주세요");
		return;
	}
	if(mpwd1.trim().length<4||mpwd1.trim().length>13){
		alert("비밀번호를 4~13자 이내로 입력해주세요");
		return;
	}
	if($("#idCheck").text()=="사용 불가능한 아이디입니다"){
		alert("사용 불가능한 아이디입니다");
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
	if(midno.trim().length<13){
		alert("주민번호를 입력해주세요");
		return;
	}
	if(mddress.trim().length<1){
		alert("주소를 입력해주세요");
		return;
	}
	alert("가입되셨습니다");
	$("#join").submit();
}
</script>
</head>
<body>
	<div id="wrapper" class="container">
	<h2>회원가입</h2>
	<form id="join" action="join" method="POST">
	<table class="table table-dark table-striped">
		
		<tr>
			<th class="header"><label for="usr">고객 ID</label></th>
			<td class="inputdata">
				<input class="form-control" type="text" id="mid" name="mid" placeholder="아이디를 4~13자 이내로 입력하세요" />
				<span id="idCheck"></span>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input class="form-control" type="password" id="mpwd1" name="mpwd" placeholder="비밀번호를 4~13자 이내로 입력하세요"/>
			<span id="pwdCheck"></span>
			</td>
			
		</tr>	
		<tr>
			<th>비밀번호 확인</th>
			<td><input class="form-control" type="password" id="mpwd2" placeholder="비밀번호를 다시 한번 입력하세요" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input  class="form-control" type="text" id="mname" name="mname" placeholder="이름을 입력하세요" /></td>
		</tr>		
		<tr>
			<th>EMail</th>
			<td><input class="form-control" type="text" id="memail" name="memail" placeholder="Email을 입력하세요" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input  type="radio"  name="msex" value="male" checked/>남성 &nbsp;&nbsp;&nbsp;<input  type="radio"  name="msex" value="female" />여성</td>
			
		</tr>
		<tr>
			<th>주민번호</th>
			<td>
				<input class="form-control" type="text" id="midno" name="midno" placeholder="주민번호 13자리를 '-' 없이 입력하세요" />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input class="form-control" type="text" id="mddress" name="mddress" placeholder="주소를 입력하세요" />
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="btn btn-primary btn-block" type="button" value="가입" id="formCheck" />
				
			</th>
		</tr>					
	</table>
	</form>
	</div>
</body>
</html>