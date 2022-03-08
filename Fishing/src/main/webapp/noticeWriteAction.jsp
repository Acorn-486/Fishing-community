<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="boardTitle" />
<jsp:setProperty name="board" property="boardContent" />
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
	
	if (!userID.equals("admin")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 업습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	} else {
		if (board.getBoardTitle() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 제목을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (board.getBoardContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 내용을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.noticeWrite(board.getBoardTitle(), board.getBoardContent());

			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'notice.jsp'");
				script.println("</script>");
			}
		}	
	}
	%>
</body>
</html>