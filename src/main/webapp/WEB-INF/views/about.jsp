<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<style type="text/css">
.service-process {
    background-color: #fafafa;
    position: relative;
}
.wshipping-content-block {
    padding: 80px 0px;
}
.service-process::before {
    display: block;
    content: "";
    position: absolute;
    left: 0px;
    top: 0px;
    border-top: 1px dashed #cccccc;
    border-bottom: 1px dashed #fff;
    width: 100%;
}
*::after, *::before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.section-title {
    text-align: center;
    padding-bottom: 30px;
}
.section-title h2 {
    margin-top: 0px;
    text-transform: uppercase;
    color: #444444;
}
h2 {
    font-size: 32px;
    font-weight: 400;
}
p {
    margin: 0 0 10px;
}
.process-row {
    padding-top: 40px;
}
.process-step::before {
    position: absolute;
    right: -123px;
    width: 110px;
    height: 2px;
    background-color: #eb0028;
    content: "";
    top: 80px;
    display: block;
}

.process-icon {
    width: 164px;
    text-align: center;
    height: 164px;
    float: left;
    border-radius: 100%;
    background-color: #fff;
    border: 2px solid #eb0028;
    position: relative;
    padding-top: 44px;
    margin-bottom: 10px;
}
.process-icon span {
    width: 56px;
    height: 56px;
    background-color: #eb0028;
    border: 2px solid #fff;
    color: #fff;
    line-height: 56px;
    font-size: 28px;
    position: absolute;
    left: -30px;
    top: 50%;
    margin-top: -30px;
    border-radius: 100%;
    font-weight: 700;
}
.process-step p {
    text-transform: uppercase;
    width: 100%;
    text-align: center;
    margin-top: 10px;
    clear: both;
}
.process-step p {
    margin-bottom: 0px;
}
p {
    margin: 0 0 10px;
}
.process-step {
    float: left;
    width: 164px;
    margin-right: 14%;
    position: relative;
}
.process-step:last-child {
    margin-right: 0px;
}
.process-step:last-child::before
 {
display:none;
}
</style>
</head>
<body>
<div class="wshipping-content-block service-process">
   <div class="container wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
            <div class="section-title">
               <h2>회 원</h2>
               <p>PT 신청 방법</p>
            </div>
         </div>
      </div>
      <div class="process-row">
         <div class="process-step">
            <div class="process-icon">
              <span>1</span>
              <img src="http://web24service.com/demo/w-shipping/assets/images/process-icon1.png" alt="">
            </div>
            <p>로그인-회원가입</p>
         </div>
         <div class="process-step">
            <div class="process-icon">
              <span>2</span>
              <img src="http://web24service.com/demo/w-shipping/assets/images/process-icon2.png" alt="">
            </div>
            <p>로그인-회원으로 로그인</p>
         </div>
         <div class="process-step">
            <div class="process-icon">
              <span>3</span>
              <img src="http://web24service.com/demo/w-shipping/assets/images/process-icon2.png" alt="">
            </div>
            <p>PT권 구매</p>
         </div>
         <div class="process-step">
            <div class="process-icon">
              <span>4</span>
              <img src="http://web24service.com/demo/w-shipping/assets/images/process-icon2.png" alt="">
            </div>
            <p>PT 등록</p>
         </div>
      </div>
    </div>
  </div>
  <div class="wshipping-content-block service-process">
   <div class="container wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
      <div class="row">
         <div class="col-md-6 col-md-offset-3">
            <div class="section-title">
               <h2>회 원</h2>
               <p>PT 취소 방법</p>
            </div>
         </div>
      </div>
      <div class="process-row">
         <div class="process-step">
            <div class="process-icon">
              <span>1</span>
              <img src="http://web24service.com/demo/w-shipping/assets/images/process-icon1.png" alt="">
            </div>
            <p>로그인</p>
         </div>
         <div class="process-step">
            <div class="process-icon">
              <span>2</span>
              <img src="http://web24service.com/demo/w-shipping/assets/images/process-icon2.png" alt="">
            </div>
            <p>메인화면</p>
         </div>
         <div class="process-step">
            <div class="process-icon">
              <span>3</span>
              <img src="http://web24service.com/demo/w-shipping/assets/images/process-icon2.png" alt="">
            </div>
            <p>나의선생님</p>
         </div>
         <div class="process-step">
            <div class="process-icon">
              <span>4</span>
              <img src="http://web24service.com/demo/w-shipping/assets/images/process-icon2.png" alt="">
            </div>
            <p>PT 취소 버튼 클릭</p>
         </div>
      </div>
    </div>
  </div>
</body>
</html>