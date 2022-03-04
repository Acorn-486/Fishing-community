<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userBirth" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPhone" />
<jsp:setProperty name="user" property="userZipCode" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userDetail" />
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
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}

	if (user.getUserID() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디를 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserPassword() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호를 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserName() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이름을 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserBirth() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('생년월일을 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserEmail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일을 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserGender() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('성별을 선택하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserPhone() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('핸드폰번호를 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserZipCode() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('우편번호를 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserAddress() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('주소를 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getUserDetail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상세주소를 입력하지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);

		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>