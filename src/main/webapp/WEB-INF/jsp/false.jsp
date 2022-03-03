<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>false</title>
</head>
<body>
조회 실패!
<br>
성공 횟수  ${result}
실패 횟수  ${falseCount}
<br>
실패한 라인 번호  ${list}
<br>

텍스트
<br>
<!-- 실패한 데이터 정보 출력 -->
<c:forEach var="data" items="${user1}">
	${data.id}
	${data.pwd}
	${data.name}
	${data.level}
	${data.desc}
	${data.redDate}
	<br>
</c:forEach>
<a href="/getupload">이전으로</a>
</body>
</html>