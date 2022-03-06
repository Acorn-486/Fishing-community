<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.util.ArrayList"%>
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
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	
	int commentID = 0;
	if (request.getParameter("commentID") != null) {
		commentID = Integer.parseInt(request.getParameter("commentID"));
	}
	CommentDAO commentDAO = new CommentDAO();
	%>
	
	<div class="container" align="center">
		<div class="col-lg-10">
			<div class="jumbotron" style="padding-top: 1px;">				
				<h3><br>댓글수정창</h3>
				<form name = c_commentUpdate>
					<input type="text" id="update" style="width:400px;height:50px;" maxlength="500" value="<%= commentDAO.getComment(commentID).getCommentContent() %>">
					<input type="button" onclick="send(<%=boardID %>, <%=commentID %>)" value="수정">
				</form>
			</div>
		</div>
		<div class="col-lg-10"></div>
	</div>

	<script>
		function send(boardID, commentID){
			var sb;
			var commentText = document.c_commentUpdate.update.value;
			sb = "commentUpdateAction.jsp?boardID="+boardID+"&commentID="+commentID+"&commentText="+commentText;
			window.opener.location.href= sb;
			window.close();
		}
	</script>
	
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>