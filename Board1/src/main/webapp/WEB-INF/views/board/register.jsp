<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

<div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="tables">Board register</h1>
              <hr>
            </div>
          
          <div class="row">
          <div class="col-lg-12">
            <div class="bs-component">
            <table class="table table-hover">
              <h4 class="table-active">Board register</h4>
                       
              	<form role="form" action ="/board/register" method="post">
              		<div class="form-group">
                    <label>Title</label>
                    <input class="form-control" aria-describedby="titleHelp" placeholder="Enter title" name="title">
                    <small id="titleHelp" class="form-text text-muted">제목을 입력해 주십시오.</small>
                  </div>                  
              
                  <div class="form-group">
                    <label>Textarea</label>
                    <textarea class="form-control" rows="3" placeholder="Enter text" name="content"></textarea>
                    <small id="titleHelp" class="form-text text-muted">글내용을 입력해 주십시오.</small>
                  </div>
                  
                  <div class="form-group">
                    <label>Writer</label>
                    <input class="form-control" name="writer">
                  </div>
              	             	  
              	  <button type="submit" class="btn btn-primary">Submit Button</button>
              	  <button type="reset" class="btn btn-warning">Reset Button</button>
              	  <button id='homeBtn' type="button" class="btn btn-warning" style="float: right;">Go Home</button>
              	</form>  
             </table>
            </div>     
           </div>
          </div><!-- /row -->
          
        <!-- 파일처리 영역 -->
       <div class="row" style="height: auto; width: 102%; border:1px solid #c8c8c8; border-radius: 5px;">
		<div class="col-lg-12">
          <div class="form-group uploadDiv">
      		<label for="exampleInputFile" style="font-size:1.3em">File input</label><hr>
      		<input type="file" class="form-control-file" name="uploadFile" aria-describedby="fileHelp" multiple>
      		<small id="fileHelp" class="form-text text-muted" style="font-size:1.1em">
      		This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
    	  </div>
    	  <div class="uploadResult">
    	  	<ul>
					
			</ul>
    	  </div>
       </div>
      </div>
          	
  </div>
</div><!-- </row -->

<style>
	.uploadResult {
			
		width:100%;
		background-color:gray;
	}
	
	.uploadResult ul{
		display:flex;
		flex-flow: row;
		justify-content:center;
		align-items:center;
	}
	
	.uploadResult ul li {
		list-style:none;
		padding:10px;
		align-content: center;
		text-align: center;
	}
	
	.uploadResult ul li img{
		width:100px;
	}
	
	.uploadResult ul li span{
		color: white;
	}
	
	.bigPictureWrapper{
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top:0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255,255,255,0.5);
	}
	
	.bigPicture{
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img{
		width:600px;
	}
		
</style>


<script type="text/javascript">
$(document).ready(function() {  
	
	$(document).ready(function(e){
		var formObj = $("form[role='form']");
		
		$("button[type='submit']").on("click", function(e){
			
			e.preventDefault();
			
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				
				var jobj  = $(obj);
				
				console.log(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				
			});
			
			formObj.append(str).submit();
		});
		
		function showUploadResult(uploadResultArr) {
			
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";

			$(uploadResultArr).each(function(i, obj) {
				
				if(obj.image){
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_" 
							+obj.uuid+"_"+obj.fileName);
					
					str += "<li data-path='"+obj.uploadPath+"'";
					str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
					str += "><div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
					
				}else{
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+ "/" 
							+ obj.uuid + "_" + obj.fileName);
					
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div>";
					str += "</li>";
					
					/*str += "<li"
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
					str += "<img src ='/resources/img/attach.png'></a>";
					str += "</div>";
					str += "</li>";*/
					
				}

			});

			uploadUL.append(str);
		}
		
		//x 아이콘 클릭시 서버에서 파일 삭제 처리
		$(".uploadResult").on("click", "button", function(e){
			
			console.log("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType: 'text',
				type: 'POST',
				success: function(result){
					alert(result);
					targetLi.remove();
				}
				
			});// ajax
		});
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");

		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("input[type='file']").change(function(e){
			
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
				
				showUploadResult(result); //업로드 결과 처리 함수

			
			}
		}); //$.ajax
		
	});
	
	$("#homeBtn").on("click", function(){
			
		self.location ="/board/list";
			
	});
	
});
	
});
</script>

<%@include file="../includes/footer.jsp" %>