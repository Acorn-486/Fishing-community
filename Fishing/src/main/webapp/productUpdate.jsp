<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
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
	}
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	
	<div class="container">
		<form method="post" action="productUpdateAction.jsp?productID=<%= productID %>" enctype="multipart/form-data" autocomplete="off">
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="상품명" name="productName" maxlength="50"  value="<%= product.getProductName() %>">
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="상품 가격" name="productPrice" maxlength="30" value="<%= product.getProductPrice() %>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-5">
					<textarea class="form-control" placeholder="상세 정보" name="productDetail" maxlength="1000" style="height: 200px"><%= product.getProductDetail() %></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">카테고리</label>
				<div class="col-sm-5">
					<%
						if (product.getProductCategory().equals("낚시대")) {
					%>
					<input type="radio" name="productCategory" value="낚시대" checked>낚시대
					<input type="radio" name="productCategory" value="릴">릴
					<%
						} else {
					%>
					<input type="radio" name="productCategory" value="낚시대">낚시대
					<input type="radio" name="productCategory" value="릴" checked>릴
					<%
						}
					%>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">재고 수량</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="재고수량" name="productStock" maxlength="30" value="<%= product.getProductStock() %>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 사진</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="productImage" value="<%= product.getProductImage() %>">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" >
				</div>
			</div>
		</form>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>