<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>
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
	DecimalFormat dFormat = new DecimalFormat("###,###");
	
	String cartId = session.getId();
	
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_email = "";
	String shipping_zipCode = "";
	String shipping_address = "";
	String shipping_detail = "";
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			if(n.equals("shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("shipping_email"))
				shipping_email = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("shipping_address"))
				shipping_address = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("shipping_detail"))
				shipping_detail = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	%>
	
	<div class="container">
		<br>
		<h1>주문 정보</h1>
	</div>
	
	<div class="container">
		<div class="text-center">
			<h3>영수증</h3>
		</div>
	</div>
	
	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송 주소</strong><br> 
			성명: <%out.println(shipping_name); %><br>
			우편번호: <%out.println(shipping_zipCode); %><br>
			주소: <%out.println(shipping_address); %>(<%out.println(shipping_detail); %>)<br>
		</div>
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
					<td><em><%= product.getProductName() %></em></td>
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
				<td><a href="shippinginfo.jsp?cartId=<%= cartId %>" class="btn btn-secondary">주문하기</a></td>
				</tr>
			</table>
		</div>
	</div>
	
	<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn-secondary" role="button">이전</a>
	<a href="./thankCustomer.jsp" class="btn btn-primary" role="button">주문 완료</a>
	
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>