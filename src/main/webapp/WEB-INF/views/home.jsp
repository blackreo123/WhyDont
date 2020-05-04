<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>GYM</title>
<style type="text/css">
#nopt{
	color:white;
	background-color: #ff3e16;
	 border-radius: 10px;
	 border: solid 1px grey;
}
</style>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="description" content="Bootstrap 4 website template">
  <meta name="keywords" content="fitness, bootstrap, template, html, sass, jquery">
  <meta name="author" content="Bucky Maler">
  <link rel="stylesheet" href="resources/css/main.min.css">
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#nopt").click(nopt);
})
function nopt() {
	var mid = '${gm.mid}';
	$.ajax({
		type : "post"
		,url : "nopt"
		,data : {"mid":mid}
		,success: function(){
			alert("취소되었습니다");
		}
		,error: function() {
			alert("에러발생");
		}
	})
}
</script>

</head>
<body class="mobile-shift">

	<header>

		<div class="fixed-navbar">

			<div class="navbar-lockup">

				<div class="logo">
					<!-- 로고 클릭하면 메인화면으로 -->
					<c:url var="root" value="/" />
					<a href="${root}">JIHA's<img src="resources/img/logo.png"
						alt="Fitness"></a>

				</div>

				<ul class="nav">

					<li><a href="about">About</a></li>
					<c:if
						test="${sessionScope.loginId != null || sessionScope.tloginId != null  }">
						<li><a href="logout">로그아웃</a></li>
					</c:if>
					<c:if
						test="${sessionScope.loginId == null && sessionScope.tloginId == null }">
						<li><a href="login">로그인</a></li>
					</c:if>
					<c:if test="${sessionScope.loginId != null}">
						<li><a href="mUpdate">회원정보 수정</a></li>
					</c:if>
					<c:if test="${sessionScope.tloginId != null}">
						<li><a href="tUpdate">트레이너 정보 수정</a></li>
					</c:if>
					<li><a href="ginfo">공지사항</a></li>
					<c:if test="${sessionScope.loginId != null}">
						<li><a href="buy">PT권 구매</a></li>
					</c:if>
					<c:if test="${sessionScope.tloginId != null}">
						<li><a href="memberCare">담당 PT회원 보기</a></li>
					</c:if>
					<c:if test="${sessionScope.loginId != null}">
						<li><a href="trainerList">PT등록</a></li>
					</c:if>
					<c:if test="${sessionScope.loginId != null}">
						사용 가능한 쿠폰 <li>(${gm.cupon})장</li>
					</c:if>
				</ul>

			</div>

		</div>

		<div class="claim-lockup">

			<div class="claim">

				<p class="headline">
					SCIT 38TH<span>/</span>
				</p>
				<p class="kicker">
					B반 윤지하<span>/</span>
				</p>

			</div>

		</div>

		<div class="angled-overlay"></div>

		<div class="slide-out-nav">

			<ul class="mobile-nav">

				<li><a href="about">About</a></li>
				<c:if
					test="${sessionScope.loginId != null || sessionScope.tloginId != null  }">
					<li><a href="logout">로그아웃</a></li>
				</c:if>
				<c:if
					test="${sessionScope.loginId == null && sessionScope.tloginId == null }">
					<li><a href="login">로그인</a></li>
				</c:if>
				<c:if test="${sessionScope.loginId != null}">
					<li><a href="mUpdate">회원정보 수정</a></li>
				</c:if>
				<c:if test="${sessionScope.tloginId != null}">
					<li><a href="tUpdate">트레이너 정보 수정</a></li>
				</c:if>
				<li><a href="ginfo">공지사항</a></li>
				<c:if test="${sessionScope.loginId != null}">
					<li><a href="buy">PT권 구매</a></li>
				</c:if>
				<c:if test="${sessionScope.tloginId != null}">
					<li><a href="memberCare">담당 PT회원 보기</a></li>
				</c:if>
				<c:if test="${sessionScope.loginId != null}">
					<li><a href="trainerList">PT등록</a></li>
				</c:if>
				<c:if test="${sessionScope.loginId != null}">
						사용 가능한 쿠폰 <li>(${gm.cupon})장</li>
				</c:if>

			</ul>

			<div class="mobile-nav-slice"></div>

		</div>

		<div class="mobile-nav-toggle">

			<span></span> <span></span> <span></span>

		</div>

	</header>

	<section class="featured">

		<div class="container">

			<div class="row">

				<div class="col-lg-6 feature">

					<h2>회원님의 건강을 최우선으로 생각하겠습니다.</h2>

					<p>흔히들 Health라고 생각하는 운동은 주로 Gym과 같은 실내뿐만 아니라 야외에서 이루어지는 특정
						Physical Activity(신체활동)를 뜻하며 여기에는 Weight training (저항훈련), Aerobic
						training(유산소 훈련) 및 각종 Functional training(기능성 훈련) 등을 포함합니다. 누구나 같은
						형태와 강도로 트레이닝 할 수 없는 점을 고려하여 신중한 프로그램 설계가 필요하며 체계적인 운동 학습을 권장합니다.
						자마이카 휘트니스에서는 최고의 실력을 갖춘 퍼스널 트레이너 선생님들이 자신의 전문 분야를(크로스 핏, 코어 트레이닝,
						메디신 트레이닝, 실버 트레이닝, 머슬 트레이닝, 키즈 트레이닝, 그룹 트레이닝) 특화시켜 회원님들께 맞춤형 1:1
						운동 기법에서 한 발 더 나아가 신뢰가는 트레이너로 인식될 수 있도록 최선을 다하고 있습니다.</p>

					

				</div>
				<div class="col-lg-6 feature">

					<c:if test="${sessionScope.loginId != null}">
						<c:if test="${trainer != null }">
							<h2>나의 선생님</h2>
							<div class="card" style="width: 400px">
								<c:if test="${not empty trainer.originalfilename}">
									<c:if
										test="${trainer.originalfilename.endsWith('.jpg')||trainer.originalfilename.endsWith('.png')||trainer.originalfilename.endsWith('.gif')||trainer.originalfilename.endsWith('.jpeg')}">
										<img class="card-img-top"
											src="<c:url value='/img/${trainer.savedfilename}'/>"
											alt="Card image" style="width: 300px">
									</c:if>
								</c:if>
								<c:if test="${empty trainer.originalfilename}">
									<img class="card-img-top" src="resources/img/img_avatar1.png"
										alt="Card image" style="width: 300px">
								</c:if>
								<div class="card-body">
									<h4 class="card-title">${trainer.tname}선생님</h4>
									<pre class="card-text">${trainer.pr}</pre>
									<p class="card-text">남은 횟 수: ${gm.nokori}</p>
									<input type="button" id="nopt" value="PT취소" >
								</div>
							</div>
						</c:if>
					</c:if>
			
				</div>	
				<div class="col-lg-6 feature">						
				<p id="mu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;음악🎵</p>
		<audio src="" controls id="ap" >
		</audio>
		<ul id="pl">
		<li class="current-song"><a href="resources/music/akiasa.mp3">가을아침</a></li>
		<li><a href="resources/music/HYNN.mp3">시든꽃에 물을 주듯</a></li>
		<li><a href="resources/music/glut.mp3">글렀어</a></li>
		<li><a href="resources/music/zam.mp3">잠 못 드는 밤 비는 내리고</a></li>
		</ul>
		<script src="https://code.jquery.com/jquery-2.2.0.js"></script>
		<script src="resources/js/ap.js"></script>
		<script>
			audioPlayer();
		</script>
		</div>
				</div>
			</div>
		
	</section>
	<script src="resources/js/functions.js"></script>
</body>
</html>
