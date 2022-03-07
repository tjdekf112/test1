<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="./codebase/suite.css?v=7.3.0">
   <link rel="stylesheet" href="./common/index.css?v=7.3.0">
   <link rel="stylesheet" href="https://snippet.dhtmlx.com/codebase/assets/css/auxiliary_controls.css">
   <link rel="shortcut icon" href="./common/favicon/favicon.ico" type="image/x-icon" />
   <link rel="icon" href="./common/favicon/icon-16.png" sizes="16x16" />
   <link rel="icon" href="./common/favicon/icon-32.png" sizes="32x32" />
   <link rel="icon" href="./common/favicon/icon-48.png" sizes="48x48" />
   <link rel="icon" href="./common/favicon/icon-96.png" sizes="96x96" />
   <link rel="icon" href="./common/favicon/icon-144.png" sizes="144x144" />
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script type="text/javascript" src="./codebase/suite.js"></script>
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
<table border="1" >
<!-- ajax에서 삽입한 데이터 출력. -->
 <tbody id="demo"></tbody>
</table>
<!-- 실패한 데이터 정보 출력 -->
<%-- <c:forEach var="data" items="${user1}"> --%>
<%-- 	${data.id} --%>
<%-- 	${data.pwd} --%>
<%-- 	${data.name} --%>
<%-- 	${data.level} --%>
<%-- 	${data.desc} --%>
<%-- 	${data.redDate} --%>
<!-- 	<br> -->
<%-- </c:forEach> --%>
<a href="/getupload">이전으로</a>
</body>
<script>
$(function(){
	//ajax를 활용한 데이터 출력.
	$.ajax({
		url:'/false',
		type : 'get',
		//json형태로 데이터를 받음
		success:function(data){
			alert('연결성공');
			console.log(data);

				for(var i =0; i< data.length; i++){
					//append를 활용하여 데이터의 값을 demo에 삽입 함.
					//id,pwd,name,level,desc, redDate 를 삽입 했음.
					$("#demo").append("<tr>"); 
					$("#demo").append("<td>"+data[i].id+"</td>");
					$("#demo").append("<td>"+data[i].pwd+"</td>");
					$("#demo").append("<td>"+data[i].name+"</td>");
					$("#demo").append("<td>"+data[i].level+"</td>");
					$("#demo").append("<td>"+data[i].desc+"</td>");
					$("#demo").append("<td>"+data[i].redDate+"</td>");
					$("#demo").append("</tr>"); 		
				}
		},
		//에러가 생긴다면....
		error : function() {
			alert('error');			
		}
 	})
 })


</script>
</html>