<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
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
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	if (boardID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 글입니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
	
	Board board = new BoardDAO().getBoard(boardID);
	if (!userID.equals(board.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	} else {
		if (request.getParameter("boardTitle") == null || request.getParameter("boardTitle").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 제목을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (request.getParameter("boardContent") == null || request.getParameter("boardContent").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 내용을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.update(boardID, request.getParameter("boardTitle"), request.getParameter("boardContent"));

			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정하기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
		}	
	}
	%>
</body>
</html>