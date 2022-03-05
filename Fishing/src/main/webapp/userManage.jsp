<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
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
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<br>
		<h1>회원관리</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">비밀번호</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">성별</th>
						<th style="background-color: #eeeeee; text-align: center;">휴대폰</th>
						<th style="background-color: #eeeeee; text-align: center;">비고</th>
					</tr>
				</thead>
				<tbody>
					<%
					UserDAO userDAO = new UserDAO();
					ArrayList<User> list = userDAO.getList();
					for (int i = 0; i < list.size(); i++) {
					%>
						<tr>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getUserPassword() %></td>
							<td><%= list.get(i).getUserName() %></td>
							<td><%= list.get(i).getUserGender() %></td>
							<td><%= list.get(i).getUserPhone() %></td>
							<td><a onclick="return confirm('정말 삭제하시겠습니까?')" class="btn btn-danger" href="userDeleteAction.jsp">회원삭제</a></td>
						</tr>
					<%
						}
					%>
				</tbody>
				
			</table>
		</div>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>