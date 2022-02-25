<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="resource/css/bootstrap.css">
<title>Fishing</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById("address").value = data.address;
                document.getElementById("zipCode").value = data.zonecode;
                document.querySelector("input[name=detail]").focus();
            }
        }).open();
    });
}
</script>
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

	<div class="container">
		<form method="post" action="./processShippingInfo.jsp" autocomplete="off">
		<h1 style="text-align: left;">배송정보</h1>
			<table style="width: 40%;">
				<tr>
					<td><input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" /></td>
				</tr>
				
				<tr>
					<td>성명</td>
					<td><input name="name" type="text" class="form-control" placeholder="성명" value="<%=user.getUserName()%>" /></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input name="email" type="email" class="form-control" placeholder="이메일" value="<%= user.getUserEmail() %>" /></td>
				</tr>

				<tr>
					<td>우편번호</td>
					<td><input name="zipCode" type="text" class="form-control" id="zipCode" placeholder="우편번호" value="<%= user.getUserZipCode() %>" readonly /></td>
				</tr>

				<tr>
					<td>주소</td>
					<td><input name="address" type="text" class="form-control" id="address" placeholder="주소" value="<%= user.getUserAddress() %>" readonly /></td>
				</tr>

				<tr>
					<td>상세주소</td>
					<td><input name="detail" type="text" class="form-control" placeholder="상세주소" value="<%= user.getUserDetail() %>" /></td>
				</tr>
			</table>
			<br>
			<a href="./cart.jsp?carId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button">이전</a>
			<input type="submit" class="btn btn-primary" value="등록" />
		</form>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>