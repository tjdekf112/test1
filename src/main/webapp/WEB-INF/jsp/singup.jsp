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
            required: true,
            placeholder: "ID",
            validation: function(value) {
                return value && value.length >= 6;
              },
              errorMessage: "너무 짧습니다",
              successMessage: "가능합니다.",
              preMessage: "6글자 이상 써주세요",  
        },
        {
        	id : "btnon",
            type: "button",
            text: "ID 중복검사",
            size: "medium",
            view: "flat",
            color: "primary"
        },
        {	
        	id : "pwd",
            type: "input",
            label: "PWD",
            required: true,
            placeholder: "PWD",
            value: "",
            validation: function(value) {
                return value && value.length >= 6;
              },
              errorMessage: "너무 짧습니다",
              successMessage: "가능합니다.",
              preMessage: "6글자 이상 써주세요",  
        },
        {
        	id : "name",
            type: "input",
            label: "NAME",
            required: true,
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
            required: true,
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

$(function (){	
	// btnon클릭 시 input의 값들이 controller로 전달되는 ajax
	$("#btnon").click(function() {
		//입력한 id값이 중복인지 아닌지 체크하는 ajax
		$.ajax({
			url : "/idcheck",
			type : "POST",
			dataType : "json",
			data : {
				id : $("#id").val()
				},
			success : function(data){
				if(form.getValue()['id'] == ""){
					alert("id를 입력해주세요");
				}else if(form.getValue()['id'].length < 6){
					alert("id를 6글자 이상 입력해주세요");
				}
				// 중복되지 않은 id라면
				else if (data == 0){
					alert("사용가능한 아이디입니다.");
					check = data;
				// 중복된 id라면
				}else if(data == 1){
					alert("중복된 아이디입니다.");
					form.getItem("id").clear();
				}
			}
		});
	});
	
	// input의 id값이 변경된다면 check 의 값을 1로 변경
	form.getItem("id").events.on("change", function(value) {
	    console.log("change", value);
	    check = 1;
	});
	
	// 버튼 이벤트 버튼 클릭시 검색필터에 적은 매개변수 값 출력.
	form.getItem("btn").events.on("click", function(events) {
//	 	alert('버튼 클릭 성공!');
		console.log();
		console.log(form.getValue());
		// 검사한 값이 중복된 id이고 id 의 값이 "" 라면
		if(check != 0){
			alert('중복검사를 해주세요.');
		}else if(form.getValue()['pwd'].length < 6){
			alert("pwd를 6글자 이상 입력해주세요");
		}
		//level의 값이 "선택"이라면...
		else if($('#level').val() == "선택"){
			alert('level을 선택해주세요');
		}
		// desc, name, pwd의 값이 "" 이라면
		else if(form.getValue()['desc'] != "" && form.getValue()['name'] != "" && form.getValue()['pwd'] != ""){
			try{
				// post방식의 /singup으로 user의 값을 전송하겠다.
				form.send("singup", "POST", "user");
				// get방식의 /login으로 이동하겟다.
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