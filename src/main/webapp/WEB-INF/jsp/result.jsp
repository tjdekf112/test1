<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<title>result</title>
</head>
<body>
	
	레코드 : <p th:text="${result}"></p>건 입력 성공!
	
	<form method="post" action="/rest" id="addbutton">
	<input type="button" id="ajax-button" value="button">
	</form>

<script>
	//버튼 클릭 시 submit -> 성공한 레코드 조회.
	$("#ajax-button").click(function(){
		$('#addbutton').submit();
	
		})
	
</script>
</body>
</html>