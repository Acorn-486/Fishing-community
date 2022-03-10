<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mvboard.MvboardDAO"%>
<%@ page import="mvboard.Mvboard"%>
<%
request.setCharacterEncoding("UTF-8");
%>
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
	
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<br>
		<h1>낚시 강의</h1>
		<p>낚시에 관련된 강의 영상들이 등록된 곳입니다.</p>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						MvboardDAO mvboardDAO = new MvboardDAO();
						ArrayList<Mvboard> list = mvboardDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
						<tr>
							<td onClick="location.href='mvview.jsp?mvboardID=<%=list.get(i).getMvboardID() %>'" style="cursor:pointer;"><%= list.get(i).getMvboardTitle() %></td>
							<td><%= list.get(i).getMvboardDate().substring(0, 11) + list.get(i).getMvboardDate().substring(11, 13) + "시 " + list.get(i).getMvboardDate().substring(14, 16) + "분" %></td>
							<td><%= list.get(i).getMvboardCnt() %></td>
						</tr>
					<%
						}
					%>
				</tbody>
				
				<tr>
					<td colspan="6">
						<%
							if (pageNumber != 1) {
						%>
							<a href="mvboard.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
						<%
							} if (mvboardDAO.nextPage(pageNumber + 1)) {
						%>
							<a href="mvboard.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
						<%
							} if (userID != null && userID.equals("admin")) {
						%>
						<a href="mvwrite.jsp" class="btn btn-secondary">영상등록</a>
						<%
							}
						%>
					</td>
				</tr>
			</table>
			<form method="post" name="search" action="searchBoard.jsp" autocomplete="off">
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
							<option value="mvboardTitle">제목</option>
						</select></td>
						<td><input type="text" class="form-control" name="searchText"></td>
						<td><button type="submit" class="btn btn-primary">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>