<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	User user = new UserDAO().getUser(userID);
	%>
	<jsp:include page="header.jsp"></jsp:include>
	
	<%
	request.setCharacterEncoding("UTF-8");
	
	String cartId = session.getId();
	
	String shipping_cartId = "";
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			if(n.equals("shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	String formateNow = now.format(formatter);
	%>
	
	<div class="container">
		<br>
		<h1>주문 완료</h1>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문접수 날짜는 <%out.println(formateNow); %>입니다.
		<p>주문번호: <%out.println(shipping_cartId); %>
	</div>
	
	
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>