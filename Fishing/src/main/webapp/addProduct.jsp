<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="resource/css/bootstrap.css">
<title>Fishing</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록 </h1>
		</div>
	</div>
	
	<div class="container">
		<form method="post" action="addProductAction.jsp" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="상품명" name="productName" maxlength="50">
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="상품 가격" name="productPrice" maxlength="30">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-5">
					<textarea class="form-control" placeholder="상세 정보" name="productDetail" maxlength="1000" style="height: 200px"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">카테고리</label>
				<div class="col-sm-5">
					<input type="radio" name="productCategory" value="낚시대">낚시대
					<input type="radio" name="productCategory" value="릴">릴
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">재고 수량</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="재고수량" name="productStock" maxlength="30">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 사진</label>
				<div class="col-sm-5">
					<input type="file" class="form-control" name="productImage">
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