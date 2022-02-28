<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
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
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
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
	BoardDAO boardDAO = new BoardDAO();
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= board.getBoardTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= board.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td colspan="2"><%= board.getBoardDate().substring(0, 11) + board.getBoardDate().substring(11, 13) + "시 " + board.getBoardDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td colspan="2"><%= board.getBoardCnt() + 1 %><% boardDAO.updateBoardCnt(boardID); %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= board.getBoardContent() %></td>
					</tr>
				</tbody>
				<tr>
					<td colspan="6">
						<a href="board.jsp" class="btn btn-secondary">목록</a>
						<%
							if (userID != null) {
								if (userID.equals(board.getUserID()) || userID.equals("admin")) {
						%>
						<a href="update.jsp?boardID=<%= boardID %>" class="btn btn-warning">수정</a>
						<a onclick="return confirm('정말 삭제하시겠습니까?')" href="deleteAction.jsp?boardID=<%= boardID %>" class="btn btn-danger">삭제</a>
						<%
								}
							}
						%>
					</td>
				</tr>
			</table>
		</div>
	</div>

<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
					<tr>
						<td align="left" bgcolor="beige">댓글</td>
					</tr>
					<tr><td>
						<%
							CommentDAO commentDAO = new CommentDAO();
							ArrayList<Comment> list = commentDAO.getList(boardID);
							for(int i=0; i<list.size(); i++){
						%>
							<div class="container">
								<div class="row">
									<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
										<tbody>
										<tr>						
										<td align="left"><%= list.get(i).getUserID() %></td>
										<td align="right"><%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11, 13) + "시 " + list.get(i).getCommentDate().substring(14, 16) + "분" %></td>
										</tr>
										<tr>
										<td align="left"><%= list.get(i).getCommentContent() %></td>
										<td align="right">
											<%
												if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){
											%>
												<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?boardID=<%= boardID %>&commentID=<%= list.get(i).getCommentID() %>" class="btn btn-danger btn-sm">삭제</a>
																	
											<%
												}
											%>	
										</td>
										</tr>
									</tbody>
								</table>			
							</div>
						</div>
						<%
							}
						%>
					</td></tr>
				</table>
			</div>
		</div>
		<div class="container">
			<div class="form-group">
			<form method="post" action="commentAction.jsp?boardID=<%=boardID%>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td style="border-bottom:none;" valign="middle"><%=userID %></td>
							<td><input type="text" style="height: 80px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentContent" maxlength="100"></td>
							<td><br><input type="submit" class="btn btn-secondary" value="댓글 작성"></td>
						</tr>
					</table>
			</form>
			</div>
		</div>		
	<script src="resource/js/bootstrap.js"></script>
</body>
</html>