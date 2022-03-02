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

<form method="post" action="/singup" style="margin: 20px;" id="form"><h1>회원 가입</h1></form>
</body>
<script>
var check = 1;

const form = new dhx.Form("form", {
    css: "dhx_layout-cell--bordered",
    padding: 40,
    rows: [
        {
        	id : "id",
            type: "input",
            label: "ID",
            placeholder: "ID",
            value: "",
            
        },
        {
        	id : "btnon",
            type: "button",
            text: "ID 중복검사",
            size: "medium",
            submit: true,
            view: "flat",
            color: "primary"
        },
        {	
        	id : "pwd",
            type: "input",
            label: "PWD",
            placeholder: "PWD",
            value: ""
        },
        {
        	id : "name",
            type: "input",
            label: "NAME",
            placeholder: "Name",
            value: ""
        },
        {
        	id : "level",
            name: "level",
            type: "select",
            label: "level",
            labelPosition: "top",
            labelWidth: 140,
            value: "",
            required: true,
            options: [
                {
                	
                    value: "level",
                    content: "선택",
                    value : "선택"
                },
                {
                	id : "level",
                    value: "A",
                    content: "A"
                },
                {
                	id : "level",
                    value: "B",
                    content: "B"
                },
                {
                	id : "level",
                    value: "C",
                    content: "C"
                },
                {
                	id : "level",
                    value: "F",
                    content: "F"
                }
            ]
        },
        {
        	id : "desc",
            type: "input",
            label: "DESC",
            placeholder: "desc",
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
        }
    ]
});
// form.getItem("btnon").events.on("click", function(events) {

$(function (){	

	$("#btnon").click(function() {
	console.log( $("#id").val())
		$.ajax({
			url : "/idcheck",
			type : "POST",
			dataType : "json",
			data : {
				id : $("#id").val()
				},
			success : function(data){
				if (data == 0){
					alert("사용가능한 아이디입니다.");
					check = data;
				}else if(data == 1){
					alert("중복된 아이디입니다.");
					form.getItem("id").clear();
				}
			}
			
		});
	});

	// 버튼 이벤트 버튼 클릭시 검색필터에 적은 매개변수 값 출력.
	form.getItem("btn").events.on("click", function(events) {
//	 	alert('버튼 클릭 성공!');
		console.log();
		console.log(form.getValue());
		if(check != 0){
			alert('중복검사를 해주세요.');
		}
		else if($('#level').val() == "선택"){
			alert('level을 선택해주세요');
		}
		else if($('#desc').val() != '' && $('#id').val() != '' && $('#pwd').val() != '' && $('#name').val() != '' && $('#level').val() != ''){
			try{
			 	form.send("singup", "POST", "user");
			 	location.replace("/login")
			}catch(e){
				alert('회원가입에 실패하셨습니다.');
			}
		}else{
			alert('입력하지 않은 input이 있습니다')
		}
		});
});


	
</script>
</html>