<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="resource/css/bootstrap.css">
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
<title>Fishing</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
						<ul class="dropdown-menu dropdown-menu-dark"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
						</ul></li>
					<%
					}
					%>
					<li class="nav-item"><a class="nav-link" href="point.jsp">낚시 포인트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">낚시 용품</a></li>
					<li class="nav-item"><a class="nav-link" href="board.jsp">문의 게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> list = boardDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
						<tr>
							<td><%= list.get(i).getBoardID() %></td>
							<td><a href="view.jsp?boardID=<%=list.get(i).getBoardID()%>"><%= list.get(i).getBoardTitle().replace(" ", "&nbps;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시 " + list.get(i).getBoardDate().substring(14, 16) + "분" %></td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left" style="display: inline-block; width: 60px; height: 40px;">이전</a>
			<%
				} if (boardDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left" style="display: inline-block; width: 60px; height: 40px;">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-secondary" style="display: inline-block; width: 80px; height: 40px;">글쓰기</a>
		</div>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>