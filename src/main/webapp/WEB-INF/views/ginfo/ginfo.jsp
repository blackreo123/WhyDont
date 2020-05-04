<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<style>
	#wrapper{
		font-family: "가비아 솔미체";
		margin-top: 50px;
	}
	#wrapper h2 {
		text-align : center;
	}
</style>
<!-- 검색창 꾸미기 드롭다운 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  

</head>
<body>
<div class="container" id="wrapper">
	
	<!-- 로고 클릭하면 메인화면으로 -->
					<c:url var="root" value="/" />
					<a href="${root}"><img src="resources/img/icons8-home-page-100.png"
						alt="home" style="width: 50px"></a>

	<!-- 게시글 검색 -->
	<div class="container">
	<form id="search" action="ginfo" method="GET" style="text-align: right;">
		<select name="searchItem" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			<option value="title" ${searchItem == 'title'? 'selected'  : ''}>제목</option>
			<option value="writer" ${searchItem == 'writer'? 'selected'  : ''}>글쓴이</option>
			<option value="content" ${searchItem == 'content'? 'selected'  : ''}>글 내용</option>
		</select>
		<input  type="text" name="searchWord" value="${searchWord}"/>
		<button type="submit" class="btn btn-primary">검색</button>
	</form>
	</div>
	<!-- 게시글 목록 출력 -->
	<table class="table table-dark table-striped">
		<tr>
			<th>번호</th>
			<th>글제목</th>
			<th>글쓴날</th>
			<th>글쓴이</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="ginfo" items="${ginfoList}" varStatus="stat">
		<tr>
			<td>${stat.count + navi.startRecord}</td>
			
			<td>
			<c:if test="${not empty ginfo.originalfilename}">
			<img alt="" src="resources/img/clip.png" width="20px">
			</c:if>
			<a href="ginfoDetail?infono=${ginfo.infono}&searchItem=${searchItem}&searchWord=${searchWord}&currentPage=${navi.currentPage}">
			${ginfo.title}&nbsp; [${ginfo.greplycount}]</a>
			</td>
			
			<td>${ginfo.regdate}</td>
			<td>${ginfo.writer}</td>
			<td>${ginfo.hitcount }</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 글쓰기 버튼 -->
	<div style="text-align: right;">
		<p></p>
		<c:if test="${sessionScope.tloginId != null}">
		<a href="ginfoWrite" ><input class="btn btn-primary" type="button" value="글쓰기" /></a>
		</c:if>
	</div>
	
	
	<!-- 페이징 -->
	<div class="container" >
	<p></p>
	<ul class="pagination justify-content-center" style="margin:20px 0" >
    <li class="page-item"><a class="page-link" href="ginfo?searchItem=${searchItem}&searchWord=${searchWord}&currentPage=${navi.currentPage-navi.pagePerGroup}">⇤</a></li>
    <li class="page-item"><a class="page-link" href="ginfo?searchItem=${searchItem}&searchWord=${searchWord}&currentPage=${navi.currentPage-1}">←</a></li>
    <c:forEach var="currentPage" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
    
    <li class="page-item ${currentPage==navi.currentPage?'active':''}" ><a class="page-link" href="ginfo?searchItem=${searchItem}&searchWord=${searchWord}&currentPage=${currentPage}">${currentPage}</a></li>
    
    </c:forEach>
    <li class="page-item"><a class="page-link" href="ginfo?searchItem=${searchItem}&searchWord=${searchWord}&currentPage=${navi.currentPage+1}">→</a></li>
    <li class="page-item"><a class="page-link" href="ginfo?searchItem=${searchItem}&searchWord=${searchWord}&currentPage=${navi.currentPage+navi.pagePerGroup}">⇥</a></li>
  </ul>
	</div>
</div>
</body>
</html>