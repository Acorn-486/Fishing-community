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
	
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	DecimalFormat dFormat = new DecimalFormat("###,###");
	%>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<br>
		<h1>릴 판매</h1>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">가격</th>
					</tr>
				</thead>
				<tbody>
					<%
						ProductDAO productDAO = new ProductDAO();
						ArrayList<Product> list = productDAO.getReelList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
						<tr>
							<td onClick="location.href='product.jsp?productID=<%=list.get(i).getProductID() %>'" style="cursor:pointer;"><%= list.get(i).getProductName() %></td>
							<td><%= dFormat.format(list.get(i).getProductPrice()) %></td>
					<%
						}
					%>
				</tbody>
				<tr>
					<td colspan="6">
						<%
							if (pageNumber != 1) {
						%>
							<a href="rodlist.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
						<%
							} if (productDAO.nextPage(pageNumber + 1)) {
						%>
							<a href="rodlist.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
						<%
							} if (userID != null && userID.equals("admin")) {
						%>
						<a href="addProduct.jsp" class="btn btn-secondary">상품 등록</a>
						<%
							}
						%>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>