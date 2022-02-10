<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="resource/css/bootstrap.css">
<title>Fishing</title>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">Fishing</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">로그인</a>
						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
							<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
						</ul>
					</li>
					<li class="nav-item"><a class="nav-link" href="point.jsp">낚시 포인트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">낚시 용품</a></li>
					<li class="nav-item"><a class="nav-link" href="board.jsp">자유 게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="jumbotron" style="padding-top: 100px;">
			<form method="post" action="joinAction.jsp" autocomplete="off">
				<h1 style="text-align: center;">Fishing</h1>
				<table style="width: 60%; margin: auto;">
					<tr>
						<td>아이디</td>
						<td><input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="form-control"
							placeholder="비밀번호" name="userPassword" maxlength="20"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" class="form-control"
							placeholder="ex) 19950509" name="userBirth" maxlength="8"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" class="form-control"
							placeholder="이메일" name="userEmail" maxlength="20"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							 <input type="radio" name="userGender" value="남자">남자
							 <input type="radio" name="userGender" value="여자">여자
						</td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td><input type="text" class="form-control"
							placeholder="ex) 010-1234-5678" name="userPhone" maxlength="20"></td>
					</tr>
				</table>
				<br> <input type="submit" class="btn btn-primary form-control"
					value="회원가입">
			</form>
		</div>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>