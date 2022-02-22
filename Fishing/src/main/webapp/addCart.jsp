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
	
	Product product = new ProductDAO().getProduct(productID);
	ArrayList<Integer> cartList = new ArrayList<Integer>();
	
	cartList.add(productID);
	
	session.setAttribute("cartList", cartList);
	%>
	
	<script type="text/javascript">
		alert("<%= product.getProductName() %>가 추가 되었습니다.");
		history.go(-1);
	</script>
</body>
</html>