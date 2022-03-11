<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="mvboard.Mvboard"%>
<%@ page import="mvboard.MvboardDAO"%>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.util.ArrayList"%>
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
	int mvboardID = 0;
	if (request.getParameter("mvboardID") != null) {
		mvboardID = Integer.parseInt(request.getParameter("mvboardID"));
	}
	if (mvboardID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 글입니다.')");
		script.println("location.href = 'mvboard.jsp'");
		script.println("</script>");
	}
	Mvboard mvboard = new MvboardDAO().getMvboard(mvboardID);
	MvboardDAO mvboardDAO = new MvboardDAO();
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">강의보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">강의 제목</td>
						<td colspan="2"><%= mvboard.getMvboardTitle() %></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td colspan="2"><%= mvboard.getMvboardDate().substring(0, 11) + mvboard.getMvboardDate().substring(11, 13) + "시 " + mvboard.getMvboardDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td colspan="2"><%= mvboard.getMvboardCnt() + 1 %><% mvboardDAO.updateMvboardCnt(mvboardID); %></td>
					</tr>
				</tbody>
					<tr>
						<td>강의</td>
						<td><iframe width="900" height="506" src="https://www.youtube.com/embed/<%= mvboard.getMvboardUrl() %>" title="YouTube video player"></iframe></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= mvboard.getMvboardContent() %></td>
					</tr>
				<tr>
					<td colspan="6">
						<a onclick="history.back()" class="btn btn-secondary">목록</a>
						<%
							if (userID != null && userID.equals("admin")) {
						%>
						<a href="mvboardUpdate.jsp?mvboardID=<%= mvboardID %>" class="btn btn-warning">수정</a>
						<a onclick="return confirm('정말 삭제하시겠습니까?')" href="mvboarddeleteAction.jsp?mvboardID=<%= mvboardID %>" class="btn btn-danger">삭제</a>
						<%
							}
						%>
					</td>
				</tr>
			</table>
		</div>
	</div>
		
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>