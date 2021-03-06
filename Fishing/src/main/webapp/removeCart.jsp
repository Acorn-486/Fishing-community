<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
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
	int productID = 0;
	if (request.getParameter("productID") != null) {
		productID = Integer.parseInt(request.getParameter("productID"));
	}
	if (productID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 상품입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");
	Product product = new Product();
	
	for (int i = 0; i < cartList.size(); i++) {
		product = cartList.get(i);
		if (product.getProductID() == productID) {
			cartList.remove(product);
		}
	}
	
	response.sendRedirect("cart.jsp");
	%>
	
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>