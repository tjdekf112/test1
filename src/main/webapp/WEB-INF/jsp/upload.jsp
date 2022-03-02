<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dbfile upload form</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>데이터 업로드</h1>
	<form method="post" enctype="multipart/form-data"  action="/postupload" id="adduploadForm">
	<div>
	<input type="File" name="upfile" id="upfile">
	</div>
	<button type="button" id="addUpLoadBtn">upload</button>
	</form>

  <script>
  //변수 선언
  var fileName;
  var filename;
  $(function(){

	  $('#addUpLoadBtn').click(function(){
		  //업로드를 클릭한 파일의 이름
		  filename = $("#upfile").val()
			console.log(filename + " : filename");
//			fileName = filename.slice(filename.indexOf(".") + 1).toLowerCase();
			// 확장자만 구하기. '.' 마지막에 있는거만 추출 -> pop()
			fileName = filename.split('.').pop();
		  console.log(fileName + " : fileName");
	  			if($('#upfile').val() == '') {
			           alert('파일을 선택해주세요');
		        }
	  			//확장자가 'dbfile'일 경우에만 가능.
		        else if(fileName == "dbfile" ){
		        	$('#adduploadForm').submit();
	  				
	  			}
	  			//확장자가 'dbfile'이 아니라면
	  			else if(fileName != "dbfile" ){
	  				alert('dbfile확장자만 가능합니다.');
	  			}
	  
	     });
	  
	  });
 </script>
</body>
</html>