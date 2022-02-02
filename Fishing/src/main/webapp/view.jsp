<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
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
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	if (boardID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 글입니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
	Board board = new BoardDAO().getBoard(boardID);
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
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">로그인</a>
						<ul class="dropdown-menu dropdown-menu-dark"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
							<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
						</ul></li>
					<%
					} else {
					%>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
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
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= board.getBoardTitle().replace(" ", "&nbps;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= board.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td colspan="2"><%= board.getBoardDate().substring(0, 11) + board.getBoardDate().substring(11, 13) + "시 " + board.getBoardDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= board.getBoardContent().replace(" ", "&nbps;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="board.jsp" class="btn btn-secondary" style="display: inline-block; width: 60px; height: 40px;">목록</a>
			<%
				if (userID != null && userID.equals(board.getUserID())) {
			%>
				<a href="update.jsp?boardID=<%= boardID %>" class="btn btn-warning" style="display: inline-block; width: 60px; height: 40px;">수정</a>
				<a onclick="return confirm('정말 삭제하시겠습니까?')" href="deleteAction.jsp?boardID=<%= boardID %>" class="btn btn-danger" style="display: inline-block; width: 60px; height: 40px;">삭제</a>
			<%
				}
			%>
		</div>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>