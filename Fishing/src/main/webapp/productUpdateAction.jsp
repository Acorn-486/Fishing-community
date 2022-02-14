<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
	if (!userID.equals(product.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		if (request.getParameter("productName") == null || request.getParameter("productName").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품명을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("productPrice") == null || request.getParameter("productPrice").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품 가격을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("productDetail") == null || request.getParameter("productDetail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상세 정보를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("productCategory") == null || request.getParameter("productCategory").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('카테고리를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("productStock") == null || request.getParameter("productStock").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('재고 수량이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("productImage") == null || request.getParameter("productImage").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품 사진을 등록하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			ProductDAO productDAO = new ProductDAO();
			int result = productDAO.update(productID, request.getParameter("productName"), request.getParameter("productPrice"), request.getParameter("productDetail"), request.getParameter("productStock"), request.getParameter("productImage"));

			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('상품 등록에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else if (product.getProductCategory().equals("낚시대")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'rodlist.jsp'");
				script.println("</script>");
			} else if (product.getProductCategory().equals("릴")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'reellist.jsp'");
				script.println("</script>");
			}
		}	
	}
	%>
</body>
</html>