<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>♡couple diary 니캉내캉♡</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/CoupleDiary/assets/css/user.css" rel="stylesheet"
	type="text/css">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="/CoupleDiary/assets/js/jquery/jquery-1.9.0.js"></script>
<script>
	$("#member_id").change(function() {
		$("#check-member_id").show();
		$("#email-checked").hide();
	});

	$(function() {

		$("#check-member_id").click(function() {
			var member_id = $("#member_id").val();
			if (member_id == null || member_id == "") {
				alert("이메일이 비어 있습니다.");
				return;
			}

			$.ajax({
				url : "/CoupleDiary/member/checkid",
				type : "post",
				data : {
					"member_id" : member_id
				},
				//contentType : "application/json",
				success : function(response) {
					if (response.result == false) {
						// 사용가능
						$("#check-member_id").hide();
						$("#email-checked").show();
					} else {
						alert(response.data);
					}

				},
				error : function(jqXHR, status, e) {
					console.error(status + " : " + e);
				},
				dataType : "json"
			});
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
			<div id="user">

				<form id="join-form" name="joinForm" method="post"
					action="/CoupleDiary/member/join">
					<input type="hidden" name="a" value="join"> <label
						class="block-label" for="name">이름</label> <input id="name"
						name="name" type="text" value=""> <label
						class="block-label" for="member_id">ID</label> <input
						id="member_id" name="id" type="text" value=""> <img
						src="/CoupleDiary/assets/images/check.png" id="email-checked"
						style="width: 18px; display: none" /> <input id="check-member_id"
						type="button" value="id 중복체크"> <label class="block-label">패스워드</label>
					<input name="password" type="password" value="">

					<fieldset>
						<legend>성별</legend>
						<label>여</label> <input type="radio" name="gender" value="female"
							checked="checked"> <label>남</label> <input type="radio"
							name="gender" value="male">
					</fieldset>

					<fieldset>
						<legend>약관동의</legend>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
						<label>서비스 약관에 동의합니다.</label>
					</fieldset>

					<input type="submit" value="가입하기">

				</form>
			</div>
		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>