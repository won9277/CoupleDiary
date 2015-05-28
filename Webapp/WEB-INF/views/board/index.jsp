<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>♡couple diary 니캉내캉♡</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/CoupleDiary/assets/css/board.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<div id="content">
			<div id="board">
				<form id="search_form" action="/CoupleDiary/board/find"
					method="post">
					<input type="text" id="keyword" name="keyword" value=""> <input
						type="submit" value="찾기">
				</form>

				<table class="tbl-ex">
					<tr>
						<th></th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach var="g" items="${list }">
						<tr>
							<c:choose>
								<c:when
									test="${g.member_id==authMember.member_id 
								|| g.member_id == authMember.couple_id}">

									<td><img src="/CoupleDiary/assets/css/images/heart.png"></td>

									<td><a href="/CoupleDiary/board/view/${g.no }">${g.title
											}</a></td>
									<td>${g.member_id }</td>
									<td>${g.view_cnt }</td>
									<td>${g.reg_date }</td>
									<td><a href="/CoupleDiary/board/delete/${g.no }" id="del">삭제</a>
										<input type="hidden" name="authNum" value="${g.member_no }">
									</td>


								</c:when>
							</c:choose>
						</tr>
					</c:forEach>


				</table>
				<div class="bottom">
					<a href="/CoupleDiary/board/write" id="new-book"> new diary</a>
				</div>
			</div>
		</div>

		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>