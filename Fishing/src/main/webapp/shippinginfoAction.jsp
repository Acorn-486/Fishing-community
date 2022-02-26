<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder" %>
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
	
	Cookie cartId = new Cookie("shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie email = new Cookie("shipping_email", URLEncoder.encode(request.getParameter("email"), "utf-8"));
	Cookie zipCode = new Cookie("shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie address = new Cookie("shipping_address", URLEncoder.encode(request.getParameter("address"), "utf-8"));
	Cookie detail = new Cookie("shipping_detail", URLEncoder.encode(request.getParameter("detail"), "utf-8"));
	
	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	email.setMaxAge(24 * 60 * 60);
	zipCode.setMaxAge(24 * 60 * 60);
	address.setMaxAge(24 * 60 * 60);
	detail.setMaxAge(24 * 60 * 60);
	
	response.addCookie(cartId); 
	response.addCookie(name);
	response.addCookie(email);
	response.addCookie(zipCode);
	response.addCookie(address);
	response.addCookie(detail);
	
	response.sendRedirect("orderConfirm.jsp");
	%>
	
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>