<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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



<title>rest</title>
<body>
조회 성공!
<!-- dhtmls grid방식 -->
<div style="height: 500px; width: 100%" id="grid"></div>

<!-- ajax 데이터 불러오기 -->
<!-- <table border="1" > -->
<!--  <tbody id="demo"></tbody> -->
<!-- </table> -->

</body>

<script>

$(function(){
	//ajax를 활용한 데이터 출력.
	$.ajax({
		url:'/search',
		type : 'get',
			success:function(data){
			alert('연결성공');
			console.log(data);
			var demo1 = data
			const grid = new dhx.Grid("grid", {
			    columns: [
			        { width: 200, id: "id", header: [{ text: "id" }] },
			        { width: 150, id: "pwd", header: [{ text: "pwd" }] },
			        { width: 150, id: "name", header: [{ text: "name" }] },
			        { width: 150, id: "level", header: [{ text: "level" }] },
			        { width: 150, id: "desc", header: [{ text: "desc" }] },
			        { width: 150, id: "redDate", header: [{ text: "redDate" }] },
			    ],
			    data: demo1
			});
			
			
// 			ajax데이터 body에 출력.
// 				for(var i =0; i< data.length; i++){
// 					var demo =[
// 						{
// 							id : data[i].id,
// 							pwd : data[i].pwd,
// 							name : data[i].name,
// 							level : data[i].level,
// 							desc : data[i].desc,
// 							redDate : data[i].redDate
// 						}
						
						
						
// 					$("#demo").append("<tr>"); 

// 					$("#demo").append("<td>"+data[i].id+"</td>");
// 					$("#demo").append("<td>"+data[i].pwd+"</td>");
// 					$("#demo").append("<td>"+data[i].name+"</td>");
// 					$("#demo").append("<td>"+data[i].level+"</td>");
// 					$("#demo").append("<td>"+data[i].desc+"</td>");
// 					$("#demo").append("<td>"+data[i].redDate+"</td>");
// 					$("#demo").append("</tr>"); 
// 					]
// 				}
				  
		},
		error : function() {
			alert('error');			
		}
	})
// 	})
})


</script>
</html>