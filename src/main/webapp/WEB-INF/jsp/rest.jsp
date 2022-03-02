<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>rest</title>
<body>
조회 성공!

<table border="1" >
 <tbody id="demo"></tbody>
</table>

</body>

<script>
$(function(){

	$.ajax({
		url:'/search',
		type : 'get',
			success:function(data){
			alert('연결성공');
			console.log(data);

				for(var i =0; i< data.length; i++){
					
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
		error : function() {
			alert('error');			
		}
	})
// 	})
})
</script>
</html>