<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<% response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div>로그인 완료!</div>
	<div>${memberId}님 안녕하세요.</div>
<!-- 	등급이 관리자 등급이라면 파일업로드 가능. -->
	<c:if test="${levelcheck eq 'A' }">
	<a href="/getupload">파일 업로드</a>
	</c:if>
	<a href="/logout">로그아웃</a>
	<a href="/delete">회원 탈퇴</a>
</body>
</html>