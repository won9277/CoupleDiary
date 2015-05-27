<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/CoupleDiary/assets/css/user.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<div id="content">
			<div id="edit">
				<form id="edit-form" name="editForm" method="post" action="/CoupleDiary/member/editform">
				<input type="hidden" name="no" value="${authMember.no }">			
				이름 : ${vo.name } <br>
	
				아이디 : ${vo.member_id } <br>
				
				<label class="block-label" for="couple_id">커플아이디 : </label>
				<input type="text" name = "couple_id" value ="${vo.couple_id }">
				
				<input type="submit" value="등록하기">
				 <br><a href ="/CoupleDiary/index">메인으로 돌아가기</a>
				</form>
			</div>
		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>