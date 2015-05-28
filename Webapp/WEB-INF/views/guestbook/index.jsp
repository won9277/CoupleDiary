<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/CoupleDiary/assets/css/guestbook.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
#content {
	background-image: url("assets/images/rilak.JPG");
	height: 600px;
}

#gbookinput {
	margin: 0 0 0 0;
	border: 1px solid black;
}

#gbooklist {
	
	border: none;
}

#message {
	width: 100%;
}


</style>

</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false" />
		</div>
		<div id="content">
			<div id="guestbook">
				<form action="insert" method="post">

					<table id="gbookinput">
						<tr>
							<td>아이디 : </td>
							<td><input type="text" name="member_id"
								value="${authMember.member_id }"></td>
							
						</tr>
						<tr>
							<td colspan=4><textarea name="message" id="message"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=center><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul>
					<li><c:forEach var="g" items="${list }">
							<table id="gbooklist">
								<tr>
									<td>${g.no }</td>
									<td>${g.member_id }</td>
									<td>${g.regDate}</td>
									
									<c:if test="${authMember.no==g.no}">
									<td><a href="/CoupleDiary/guestbook/delete/${g.no }">삭제임당dd</a></td>
									</c:if>
								
									
								</tr>
								<tr>
									<td colspan=4>${fn:replace(g.message, newLineChar, "<br>")
										}</td>
								</tr>
							</table>
						</c:forEach> <br></li>
				</ul>
			</div>
		</div>
	
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>