<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<a href="/logout">로그아웃</a>
</body>
</html>