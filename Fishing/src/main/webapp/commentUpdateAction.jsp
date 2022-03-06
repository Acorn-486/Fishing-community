<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="comment.Comment"%>
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
	
	int commentID = 0;
	if (request.getParameter("commentID") != null){
		commentID = Integer.parseInt(request.getParameter("commentID"));
	}
	
	String commentText = null;
	if (request.getParameter("commentText")!=null){
		commentText = request.getParameter("commentText");
	} 
	
	Comment comment = new CommentDAO().getComment(commentID);
	
	if (!userID.equals(comment.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");				
	} else {
 		if (commentText.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글 내용을 입력하지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			CommentDAO commentDAO = new CommentDAO();
			int result = commentDAO.update(commentID, commentText);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글수정에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href= 'view.jsp?boardID="+boardID+"'");
				script.println("</script>");
			}
		}	
	}
	%>
</body>
</html>