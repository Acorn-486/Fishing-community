<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
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
	
	User user = new UserDAO().getUser(userID);
	if (!userID.equals(user.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		if (request.getParameter("userPassword") == null || request.getParameter("userPassword").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userName") == null || request.getParameter("userName").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userBirth") == null || request.getParameter("userBirth").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('생일을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userEmail") == null || request.getParameter("userEmail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userGender") == null || request.getParameter("userGender").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('생일을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userPhone") == null || request.getParameter("userPhone").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('연락처를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userZipCode") == null || request.getParameter("userZipCode").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('우편번호를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userAddress") == null || request.getParameter("userAddress").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('주소를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("userDetail") == null || request.getParameter("userDetail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상세주소를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(userID, request.getParameter("userPassword"), request.getParameter("userName"), request.getParameter("userGender"), request.getParameter("userEmail"), request.getParameter("userBirth"), request.getParameter("userPhone"), request.getParameter("userZipCode"), request.getParameter("userDetail"), request.getParameter("userAddress"));

			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}	
	}
	%>
</body>
</html>