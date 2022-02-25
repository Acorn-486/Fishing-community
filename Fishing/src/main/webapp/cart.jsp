<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
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
	DecimalFormat dFormat = new DecimalFormat("###,###");
	
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
	
	<div class="container">
		<br>
		<h1>장바구니</h1>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">상품명</th>
					<th style="background-color: #eeeeee; text-align: center;">가격</th>
					<th style="background-color: #eeeeee; text-align: center;">비고</th>
				</tr>
	<%
	int total = 0;
	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");
	
	if (cartList == null) {
		cartList = new ArrayList<Product>();
	}
	
	for (int i = 0; i < cartList.size(); i++) {
		Product product = cartList.get(i);
		total += product.getProductPrice();
	%>
				<tr>
					<td><%= product.getProductName() %></td>
					<td><%= dFormat.format(product.getProductPrice()) %>원</td>
					<td><a href="removeCart.jsp?productID=<%= product.getProductID() %>" class="btn btn-danger">삭제</a></td>
				</tr>
	<%
	}
	%>
				<tr>
					<th></th>
					<th>총액</th>
					<th><%= dFormat.format(total) %>원</th>
				</tr>
				<tr>
				<td></td>
				<td></td>
				<td><a href="#" class="btn btn-secondary">결제하기</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>