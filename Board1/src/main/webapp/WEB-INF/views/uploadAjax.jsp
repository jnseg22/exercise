<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
	<input type="file" name='uploadFile' multiple>
</div>

<button id='uploadBtn'>Upload</button>

<script src="http://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function(e){

	$("#uploadBtn").on("click", function(e) {

		var formData = new FormData();

		var inputFile = $("input[name='uploadFile']");

		var files = inputFile[0].files;

		console.log(files);

		//add filedate to formdata
		for (var i = 0; i < files.length; i++) {

			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
		formData.append("uploadFile", files[i]);
		}

		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			datatype : 'json',
			success : function(result) {
			console.log(result);
						
				showUploadedFile(result);

				$(".uploadDiv").html(cloneObj.html());
			}
		}); //$.ajax
	});
});		
</script>
</body>
</html>