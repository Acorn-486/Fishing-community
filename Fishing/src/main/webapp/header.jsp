<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="resource/css/bootstrap.css">
<title>Fishing</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">Fishing</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<%
					if (userID == null) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">로그인</a>
						<ul class="dropdown-menu dropdown-menu-dark"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
							<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
						</ul></li>
					<%
					} else {
					%>
					<li class="nav-item" style="padding-top: 7px; padding-right: 3px; color: white">[ <%= userID %>님 ]</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
						<ul class="dropdown-menu dropdown-menu-dark"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="userUpdate.jsp">회원수정</a></li>
							<li><a onclick="return confirm('정말 탈퇴하시겠습니까?')" class="dropdown-item" href="userDeleteAction.jsp">회원탈퇴</a></li>
							<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
						</ul></li>
					<%
					}
					%>
					<li class="nav-item"><a class="nav-link" href="point.jsp">낚시 포인트</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">낚시 용품</a>
						<ul class="dropdown-menu dropdown-menu-dark"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="rodlist.jsp">낚시대</a></li>
							<li><a class="dropdown-item" href="reellist.jsp">릴</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="board.jsp">자유 게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>