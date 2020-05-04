<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateGinfo</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
#wrapper {
	width: 510px;
	margin: 0 auto;
	font-family: "가비아 솔미체";
}

#wrapper h2 {
	text-align: center;
}

.header {
	width: 150px;
}

.inputdata {
	width: 350px;
}

input[type="text"], input[type="password"] {
	width: 200px;
}

img {
	width: 20px;
}

pre {
	width: 400px;
	height: 300px;
}

</style>

</head>
<body>
	<div id="wrapper" class="container">
		<h2> 글 수정 </h2>
		<form action="updateGinfo" method="POST" enctype="multipart/form-data">
			<table class="table table-dark table-striped">
				<tr>
					<th>작성자</th>
					<td>${ginfo.writer}
					<input type="hidden" value="${ginfo.infono}" name="infono">
					<input type="hidden" value="${ginfo.tid}" name="tid">
					<input type="hidden" value="${ginfo.hitcount}" name="hitcount">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="form-control" type="text" id="title" name="title"
						value="${ginfo.title}"></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>${ginfo.originalfilename}<input type="file" value="파일변경" name="upload"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="form-control" cols="30" rows="10" id="content" name="content">${ginfo.content}</textarea>
					</td>
				</tr>


				<tr>
					<th colspan="2"><input class="btn btn-primary btn-block" type="submit" value="수정완료" /></th>
				</tr>


			</table>
		</form>
	</div>
</body>
</html>



