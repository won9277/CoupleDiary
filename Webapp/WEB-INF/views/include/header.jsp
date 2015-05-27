<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<table id = "title">
	<tr>
	<th><a href="/CoupleDiary/index">
		<img src = "/CoupleDiary/assets/css/images/heart.png" ></a></th>
	<th><p>Couple Diary</p></th>
	</tr>
	<tr>
	<th colspan="2">
	</th>
	</tr>
	
		</table>
	

		<c:choose>
			<c:when test="${empty authMember  }">
			<div>
			<table id ="navigation" >
				<tr >
					<th><a href="/CoupleDiary/guestbook/index">hotplace</a></th>
					<th><a href="/CoupleDiary/board/index">diary</a></th>
					<th><a href="/CoupleDiary/member/join">join</a></th>
					<th><a href="/CoupleDiary/member/login">login</a></th>
				</tr>
			</table>
			</div>
			</c:when>	
			<c:otherwise>
				<div>
					<table id ="navigation">
				<tr>
					<th><a href="/CoupleDiary/guestbook/index">hotplace</a></th>
					<th><a href="/CoupleDiary/board/index">diary</a></th>
					<th><a href="/CoupleDiary/member/editform/${authMember.no }">edit</a></th>
					<th><a href="/CoupleDiary/member/logout">${authMember.name } logout</a></th>
				</tr>
				</table>
			</div>
			</c:otherwise>
		</c:choose>
	
	


	