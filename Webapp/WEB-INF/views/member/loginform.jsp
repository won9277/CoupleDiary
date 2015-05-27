<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%
	String result = request.getParameter( "result" );
%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/CoupleDiary/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<div id="content">
			<div id="user">
				<form id="login-form" name="loginform" method="post" action="/CoupleDiary/member/login">
					<input type="hidden" name="a" value="login">
					<label class="block-label" for="member_id">id</label>
					<input id="member_id" name="member_id" type="text" value="">
					<label class="block-label" >패스워드</label>
					<input name="password" type="password" value="">
					<c:if test="${ param.result == 'fail' }">
						<p>
							로그인이 실패 했습니다.
						</p>
					</c:if>
					<input type="submit" value="로그인">
				</form>
			</div>
		</div>
	
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
	</div>
</body>
</html>