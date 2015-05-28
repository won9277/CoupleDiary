<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♡couple diary 니캉내캉♡</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/CoupleDiary/assets/css/user.css" rel="stylesheet"
	type="text/css">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="/CoupleDiary/assets/js/jquery/jquery-1.9.0.js"></script>
<script>
	$(function() {

		$("#submit_couple_id").click(function() {
				alert("커플아이디가 등록되었습니다.");
		});
	});
</script>

</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<div id="content">
			<div id="edit">
				<form id="edit-form" name="editForm" method="post"
					action="/CoupleDiary/member/editform">
					<table class="tbl-ex">
						<input type="hidden" name="no" value="${authMember.no }">
						<tr>
							<td><img src="/CoupleDiary/assets/css/images/heart.png"></td>
							<td><h3>이름</h3></td>
							<td></td>
							<td><h3>:</h3></td>
							<td></td>
							<td></td>
							<td><h4>${vo.name }</h4></td>
							<td></td>
							<td></td>
							<td><img src="/CoupleDiary/assets/css/images/heart.png"></td>
						</tr>
						<tr>
							<td><img src="/CoupleDiary/assets/css/images/heart.png"></td>
							<th><h3>아이디</h3></th>
							<td></td>
							<td><h3>:</h3></td>
							<td></td>
							<td></td>
							<td><h4>${vo.member_id }</h4></td>
							<td></td>
							<td></td>
							<td><img src="/CoupleDiary/assets/css/images/heart.png"></td>
						</tr>
						<tr>
							<td><img src="/CoupleDiary/assets/css/images/heart.png"></td>
							<th><label class="block-label" for="couple_id"><h3>커플아이디</h3></label></th>
							<td></td>
							<td><h3>:</h3></td>
							<td></td>
							<td></td>
							<th><input type="text" name="couple_id"
								value="${vo.couple_id }"></th>
							<td></td>
							<td><input id="submit_couple_id" type="submit" value="등록하기"></td>
							<td><img src="/CoupleDiary/assets/css/images/heart.png"></td>
					</table>


					<br> <a href="/CoupleDiary/index">메인으로 돌아가기</a>
				</form>
			</div>
		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>