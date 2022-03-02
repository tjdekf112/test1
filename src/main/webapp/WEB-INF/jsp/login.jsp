<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://snippet.dhtmlx.com/codebase/assets/css/auxiliary_controls.css">
   <link rel="stylesheet" href="./codebase/suite.css?v=7.3.0">
   <script type="text/javascript" src="./codebase/suite.js"></script>
</head>
<body>

<form method="post" action="/login" style="margin: 20px;" id="form"><h1>로그인</h1></form>
<!-- <button id="button" style= "background-color: #87CEFA; margin: 20px">회원가입</button> -->
</body>

<script>
const form = new dhx.Form("form", {
    css: "dhx_layout-cell--bordered",
    padding: 40,
    rows: [
        {
        	id : "id",
            type: "input",
            label: "ID",
            value: ""
        },
        {	
        	id : "pwd",
            type: "input",
            label: "PWD",
            value: ""
        },
        {
        	id : "btn",
            type: "button",
            text: "Send",
            size: "medium",
            submit: true,
            view: "flat",
            color: "primary"
        },
        {
        	id : "btnon",
            type: "button",
            text: "signup",
            size: "medium",
            color: "primary"
        }
    ]
});
// 버튼 클릭 시 회원가입으로 
// $(function(){
// 	$('#button').click(function(){
// 		location.replace("/singup");
// 	});
// });

//버튼 클릭 시 회원가입으로 
form.getItem("btnon").events.on("click", function(events) {
	location.replace("/singup");
})

//버튼 이벤트 버튼 클릭시 검색필터에 적은 매개변수 값 출력.
form.getItem("btn").events.on("click", function(events) {
// 	alert('버튼 클릭 성공!');
	console.log();
	console.log(form.getValue());
	
	if($('#id').val() != '' && $('#pwd').val() != ''){
		try{
			$('#form').submit();
// 		 	form.send("singup", "POST", "user");
// 		 	location.replace("/login")
		}catch(e){
			alert('로그인을 실패 하셨습니다.');
		}
	}else{
		alert('입력하지 않은 input이 있습니다')
	}

//  	
	});
	
</script>
</html>