<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                document.querySelector("input[name=userDetail]").focus();
            }
        }).open();
    });
}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="jumbotron" style="padding-top: 100px;">
			<form method="post" action="joinAction.jsp" autocomplete="off">
				<h1 style="text-align: center;">회원가입</h1>
				<table style="width: 60%; margin: auto;">
					<tr>
						<td>아이디</td>
						<td><input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="form-control"
							placeholder="비밀번호" name="userPassword" maxlength="20"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" class="form-control"
							placeholder="ex) 19950509" name="userBirth" maxlength="8"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							 <input type="radio" name="userGender" value="남자">남자
							 <input type="radio" name="userGender" value="여자">여자
						</td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td><input type="text" class="form-control"
							placeholder="ex) 010-1234-5678" name="userPhone" maxlength="20"></td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td><input type="text" class="form-control" id="zipCode" name="userZipCode" readonly></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" class="form-control" id="address" name="userAddress" placeholder="주소 입력은 여기를 클릭하세요" readonly></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" class="form-control" name="userDetail"></td>
					</tr>
				</table>
				<br> <input type="submit" class="btn btn-primary form-control"
					value="회원가입">
			</form>
		</div>
	</div>

	<script src="resource/js/bootstrap.js"></script>
</body>
</html>