<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            required: true,
            value: ""
        },
        {   
           id : "pwd",
            type: "input",
            label: "PWD",
            required: true,
            value: ""
        },
        {
            id : "btn",
            type: "button",
            text: "Send",
            size: "medium",
            submit: true,
            view: "flat",
            color: "primary",
            padding: 5,
        },
        {
           id : "btnon",
            type: "button",
            text: "signup",
            view: "flat",
            size: "medium",
            color: "primary"
        }
    ]
});

//버튼 클릭 시 회원가입으로 
form.getItem("btnon").events.on("click", function(events) {
   location.replace("/singup");
})

$(function (){   
//버튼 이벤트 버튼 클릭시 검색필터에 적은 매개변수 값 출력.
		form.getItem("btn").events.on("click", function(events) {
		//로그인 성공, 실패를 확인하는 ajax
		   $.ajax({
		      url : "/ajaxlogin",
		      type : "POST",
		      dataType : "json",
		      data : {
		    	  //입력한 id와 pwd의 값을 data에 삽입.
		         id : $("#id").val(),
		         pwd : $("#pwd").val()
		         },
		      success : function(data){
		         console.log(data + "test입니당!@!");
		         // 입력해야하는 input이 공백이라면
		         if( $('#id').val() == "" || $('#pwd').val() == ""){
		             alert("입력하지않은 input이 있습니다.");
		         // DB에 저장된 계정이 아니라면 
		         }else if (data == 1){
		             alert("로그인 실패!");
		         // DB에 저장된 id와 pwd라면
		          }else if(data == 0) {
		             $('#form').submit();
		          }
		      }
		   });
		});

   });
   
</script>
</html>