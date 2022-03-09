<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvboard.MvboardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.Timestamp,com.oreilly.servlet.MultipartRequest"%> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mvboard" class="mvboard.Mvboard" scope="page" />
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
			
	
		String mvboardTitle = multi.getParameter("mvboardTitle");
		String mvboardUrl = multi.getParameter("mvboardUrl");
		String mvboardContent = multi.getParameter("mvboardContent");
		
		mvboard.setMvboardTitle(mvboardTitle);
		mvboard.setMvboardUrl(mvboardUrl);
		mvboard.setMvboardContent(mvboardContent);
	%>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	if (!userID.equals("admin")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'mvboard.jsp'");
		script.println("</script>");
	} else {
		if (mvboard.getMvboardTitle() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (mvboard.getMvboardUrl() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('동영상 주소를 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (mvboard.getMvboardContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('동영상 설명을 등록하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			MvboardDAO mvboardDAO = new MvboardDAO();
			int result = mvboardDAO.write(mvboard.getMvboardTitle(), mvboard.getMvboardUrl(), mvboard.getMvboardContent());
			
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('영상 등록에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'mvboard.jsp'");
				script.println("</script>");
			}
		}	
	}
	%>
</body>
</html>