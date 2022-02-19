<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.Timestamp,com.oreilly.servlet.MultipartRequest"%> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="product" class="product.Product" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Fishing</title>
</head>
<body>
	<%
		String savePath = request.getServletContext().getRealPath("/resource/images");
		int maxSize = 1024 * 1024 * 5;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
	
		String productName = multi.getParameter("productName");
		String productPrice = multi.getParameter("productPrice");
		String productDetail = multi.getParameter("productDetail");
		String productCategory = multi.getParameter("productCategory");
		String productStock = multi.getParameter("productStock");
		String productImage = multi.getFilesystemName("productImage");
		
		product.setProductName(productName);
		product.setProductPrice(productPrice);
		product.setProductDetail(productDetail);
		product.setProductCategory(productCategory);
		product.setProductStock(productStock);
		product.setProductImage(productImage);
	%>
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
	} else {
		if (product.getProductName() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품명을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (product.getProductPrice() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품 가격을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (product.getProductDetail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상세 정보를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (product.getProductCategory() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('카테고리를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (product.getProductStock() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('재고 수량이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (product.getProductImage() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품 사진을 등록하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			ProductDAO productDAO = new ProductDAO();
			int result = productDAO.add(product.getProductName(), product.getProductPrice(), product.getProductDetail(), product.getProductCategory(), product.getProductStock(), product.getProductImage(), userID);
			
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