<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>
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
	DecimalFormat dFormat = new DecimalFormat("###,###");
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">상품 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">상품명</td>
						<td colspan="2"><%= product.getProductName() %></td>
					</tr>
					<tr>
						<td>가격</td>
						<td colspan="2"><%= dFormat.format(product.getProductPrice()) %></td>
					</tr>
					<tr>
						<td>상품 사진</td>
						<td colspan="2"><img src="resource/images/<%= product.getProductImage() %>" border="0" width="200" height="150"></td>
					</tr>
					<tr>
						<td>상세 설명</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= product.getProductDetail() %></td>
					</tr>
				</tbody>
				<tr>
					<td colspan="6">
						<%
							if (product.getProductCategory().equals("낚시대")) {
						%>
						<a href="rodlist.jsp" class="btn btn-secondary">상품 목록</a>
						<%
							} else if (product.getProductCategory().equals("릴")) {
						%>
						<a href="reellist.jsp" class="btn btn-secondary">상품 목록</a>
						<%
							} if (userID != null && userID.equals("admin")) {
						%>
						<a href="productUpdate.jsp?productID=<%= productID %>" class="btn btn-warning">수정</a>
						<a onclick="return confirm('정말 삭제하시겠습니까?')" href="productDeleteAction.jsp?productID=<%= productID %>" class="btn btn-danger">삭제</a>
						<%
							}
						%>
						<a href="addCart.jsp?productID=<%= productID %>" class="btn btn-primary">장바구니 담기</a>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>