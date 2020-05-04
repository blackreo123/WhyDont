<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

function idValidatd(){
	var mid = $("#mid").val();
	if(mid.trim().length <4||mid.trim().length>13){
		alert("아이디를 4~13자로 입력해주세요");
		return;
	}
	var mpwd =  $("#mpwd").val();
	if(mpwd.trim().length <4||mpwd.trim().length>13){
		alert("비밀번호를 4~13자로 입력해주세요");
		return;
	}
	$("#login").submit();
}
</script>
<c:if test="${not empty fail}">
<script>
	alert('${fail}');
</script>
</c:if>

<style type="text/css">
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-body {
  padding: 2rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-google {
  color: white;
  background-color: #ea4335;
}

.btn-facebook {
  color: white;
  background-color: #3b5998;
}
</style>

</head>
<body>
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Login</h5>
            <form class="form-signin" id="login" action="login" method="POST">
              <div class="form-label-group">
                <input type="text" id="mid" name="mid" class="form-control" value="${cookie['savedId'].value}" placeholder="ID" required autofocus>
                <label for="inputEmail">ID</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="mpwd" name="mpwd" class="form-control" placeholder="Password" required>
                <label for="inputPassword">Password</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1" name="rememberMe">
                <label class="custom-control-label" for="customCheck1">Remember ID</label>
              </div>
              <div>
              <input type="radio" name="what" value="member" checked> 회원으로 로그인 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="what" value="trainer"> 트레이너로 로그인
              </div>
              <br>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" onclick="idValidatd()">Sign in</button>
              <hr class="my-4">
              <a href="join"><button class="btn btn-lg btn-google btn-block text-uppercase" type="button"><i class="fab fa-google mr-2"></i>회원가입</button></a><br>
            <a href="trainerJoin"><button class="btn btn-lg btn-facebook btn-block text-uppercase" type="button"><i class="fab fa-facebook-f mr-2"></i>트레이너등록</button></a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<%-- <body class="mobile-shift">
	<header>
		<div class="fixed-navbar">
			<div class="navbar-lockup">
				<div class="logo">
					<!-- 로고 클릭하면 메인화면으로 -->
					<c:url var="root" value="/" />
					<a href="${root}">JIHA's<img src="resources/img/logo.png"
						alt="Fitness"></a>
<form id="login" action="login" method="POST">
	<table border="1" >
		<tr>
			<th class="header">아이디</th>
			<td><input id="mid"  type="text" name="mid" value="${cookie['savedId'].value}" placeholder="4~13 글자 " />
				<input type="checkbox" name="rememberMe" /> 아이디 저장
			</td>		
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input id="mpwd"  type="password" name="mpwd" placeholder="4~13 글자 " />
			</td>		
		</tr>
		<tr>
			<th colspan="2" >
				<input type="radio" name="what" value="member" checked>회원으로 로그인 &nbsp;<input type="radio" name="what" value="trainer">트레이너로 로그인 
				<input type="button" value="로그인"  onclick="idValidatd()"><br>
				<p>아직 회원이 아니신가요? <a href="join">회원가입</a>하러가기<br>
				<a href="trainerJoin">트레이너 등록</a>
				
			</th>	
		</tr>				
	</table>
	</form>
				</div>
			</div>
		</div>
	</header> --%>
	
	
	

    
</body>
</html>