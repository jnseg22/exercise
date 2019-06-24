<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/header.jsp" %>

<div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="tables">Board Read Page</h1>
              <hr>
            </div>
          
          <div class="row">
          <div class="col-lg-12">
            <div class="bs-component" >
            <table class="table table-hover" >
              <h4 class="table-active">Board Read Page</h4>
                       
              <div class="panel-body">	
              	  <div class="form-group">
                    <label>Bno</label>
                    <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
                    
                  </div>                  
              
                  <div class="form-group">
                    <label>Title</label>
                    <input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
                    
                  </div>
                  
                  <div class="form-group">
                    <label>Text area</label>
                    <textarea class="form-control" rows="3" name='content'
                     readonly="readonly"><c:out value="${board.content}"/></textarea>
                    
                  </div>
                  
                 <div class="form-group">
                    <label>Writer</label>
                    <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
                    
                  </div>
              	             	  
              	  <!-- 로그인한 사용자가 작성한 글에만 수정/삭제 버튼이 나오게 한다. -->
              	  <sec:authentication property="principal" var="pinfo" />

					<sec:authorize access="isAuthenticated()">

					<c:if test="${pinfo.username eq board.writer}">

					<button data-oper='modify' class="btn btn-secondary">Modify</button>

					</c:if>
				</sec:authorize>
				
              	  <button data-oper="list" class="btn btn-info">List</button>
              	  <button id='homeBtn' type="button" class="btn btn-warning" style="float: right;">Go Home</button>
              	  
              	  <br>
              	  <br>
              	  
              	  <!-- 첨부파일 영역 -->

				  <div class='bigPictureWrapper'>
					<div class='bigPicture'></div>
				  </div>
				  
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>

	<!-- 파일처리 영역 -->
       <div class="row" style="overflow:hidden; height: auto; width: 102%; border:1px solid #c8c8c8; border-radius: 5px;">
		<div class="col-lg-12">
          <div class="form-group">
      		<label for="exampleInputFile" style="font-size:1.3em">Files</label><hr>
      		
    	  <div class="uploadResult">
    	  	<ul>
					
			</ul>
    	  </div>
       </div>
      </div>
      </div><br>
      
              	  <!-- 댓글 목록 처리 -->
					<div class="row" style="overflow:hidden; height: auto; width: 102%; border:1px solid #c8c8c8; border-radius: 5px;">
						<div class="col-lg-12">
							
								<div class="form-group">
      							<label for="exampleInputFile" style="font-size:1.3em">&ensp;Reply</label>
      							<sec:authorize access="isAuthenticated()">
								<button id='addReplyBtn'
								class='btn btn-primary btn-sm' style="float: right;">New Reply</button>
								</sec:authorize>
								
								</div><hr>
				
	
					<div class="panel-body">
						<ul class="chat">
							<!--  start reply -->
							<li class="left clearfix" data-rno='8'>
								<div>
									<div class="header">
										<strong class="primary-font">user00</strong> 
										<small class="text-muted" style="float: right;">2018-01-01 13:13</small>
									</div>
									<p>Good job!</p>
									<hr class="one">
								</div>
							
							</li>
							
						</ul>
						
					</div>
					<!-- panel .chat-panel -->
					<!-- 댓글페이지번호 출력하는 곳 -->
					<div class="panel-footer">
					
					</div>
					
              	  </div>
              	</div>
              	
              	  <form id='operForm' action="/board/modify" method="get">
              	  
              	  	<input type='hidden' name='type' value='<c:out value="${cri.type}" />'/>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}" />'/>
              	  	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
              	  	<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
              	  	<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>'>
              	  	
              	  </form>
              </div>	<!--  /panel-body -->  
              	 
             </table>
            </div>     
           </div>
          </div>
         </div>
        </div>


<!-- 댓글 모달창 -->

	<div class="modal" id='myModal'>
  		<div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">REPLY MODAL</h4>
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
              <div class="form-group">
              	<label>Reply</label>
              	<input class="form-control" name='reply' value='New Reply!!!'>
              </div>
              
              <div class="form-group">
              	<label>Replyer</label>
              	<input class="form-control" name='replyer' value='replyer' readonly="readonly">
              </div>
              
              <div class="form-group">
              	<label>Reply Date</label>
              	<input class="form-control" name='replyDate' value=''>
              </div>
              
            </div>
            
            <div class="modal-footer">
            	<button type="button" class="btn btn-primary" id="modalModBtn">Modify</button>
            	<button type="button" class="btn btn-danger" id="modalRemoveBtn">Remove</button>
            	<button type="button" class="btn btn-secondary" id="modalRegisterBtn">Register</button>
            	<button type="button" class="btn btn-warning" id="modalCloseBtn" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
$(document).ready(function() {  
	
 var bnoValue = '<c:out value="${board.bno}"/>';
 var replyUL = $(".chat");
 
	showList(1);
 	
 	function showList(page){
 		
 		console.log("show list: " + page);
 		
 		replyService.getList({bno:bnoValue,page:page || 1}, function(replyCnt, list) {
 			
 			console.log("replyCnt: " + replyCnt);
			console.log("list: " + list);
			console.log(list);
 			
 			var str="";
 			
 			if(list == null || list.length == 0){
 				
 				return;
 			}
 			
 			//ajax에서 가져온 데이터로 html 만드는 부분
			for (var i = 0, len = list.length || 0; i< len; i++){
				console.log(list[i]);
				str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str +=" <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
				str +=" <small class='text-muted' style='float: right;'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
				str +=" <p>"+list[i].reply+"</p></div></li>";
				str +="<hr class='one'>";
			}
 			
 			replyUL.html(str);
 			
 			showReplyPage(replyCnt);
 			
 		});//end function
 	}//end showList
	
	var modal = $("#myModal");
	//사용자가 입력한 댓글데이터를 위에 댓글 input태그에서 name으로 구분하여 변수에 저장한다.
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");

	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	//댓글기능에서 ajax
	
	var replyer = null;
				
	<sec:authorize access="isAuthenticated()">
				
	replyer = '<sec:authentication property="principal.username" />'
				
	</sec:authorize>
				
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("#addReplyBtn").on("click", function(e) {

		modal.find("input").val("");
		modal.find("input[name='replyer']").val(replyer);
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();

		modalRegisterBtn.show();

		$("#myModal").modal("show");
	});
	
	//Ajax spring security header.............................
	$(document).ajaxSend(function(e, xhr, options) { 
			     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
			   });
	
	//모달 댓글 등록 버튼
	modalRegisterBtn.on("click", function(e){
		
		var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				bno : bnoValue
		};
					
	replyService.add(reply, function(result) {
					
		alert(result);
					
		modal.find("input").val("");
		modal.modal("hide");
					
		showList(1);
		//showList(-1);
	});
	});
	
	//댓글 조회 클릭 이벤트 처리
	$(".chat").on("click", "li", function(e) {
							
		var rno = $(this).data("rno");
					

		replyService.get(rno, function(reply) {
						
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
						
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
						
			$("#myModal").modal("show");
		});
					
	});
	
	//댓글 수정
	modalModBtn.on("click", function(e){	
		
	var originalReplyer = modalInputReplyer.val();	
		
	var reply = {rno:modal.data("rno"), 
	 	 		reply: modalInputReply.val(),
	 	 		replyer: originalReplyer};
	  
	if(!replyer){
		alert("로그인후 수정이 가능합니다.");
		modal.modal("hide");
		return;
	}
	  
	console.log("Original Replyer: " + originalReplyer);
	  
	if(replyer  != originalReplyer){
		  
		alert("자신이 작성한 댓글만 수정이 가능합니다.");
		modal.modal("hide");
		return;
		  
	}
	  
	replyService.update(reply, function(result){
	        
	    alert(result);
	    modal.modal("hide");
	    showList(pageNum);
	    
	});
	  
	});
	
	//댓글 삭제
	modalRemoveBtn.on("click", function(e) {
					
	var rno = modal.data("rno");
	
	console.log("RNO: " + rno);
 	console.log("REPLYER: " + replyer);
 	  
 	 if(!replyer){
 		 alert("로그인후 삭제가 가능합니다.");
 		 modal.modal("hide");
 		 return;
 	 }
 	  
 	 var originalReplyer = modalInputReplyer.val();
 	  
 	 console.log("Original Replyer: " + originalReplyer);
 	  
 	 if(replyer  != originalReplyer){
 		  
 		 alert("자신이 작성한 댓글만 삭제가 가능합니다.");
 		 modal.modal("hide");
 		 return;
 		  
 	 }
 	  
	replyService.remove(rno, originalReplyer, function(result){
	        
 	      alert(result);
 	      modal.modal("hide");
 	      showList(pageNum);
					
	});
	
	});
	
	//댓글 페이지 처리
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
				
	function showReplyPage(replyCnt) {
				
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
					
		if(endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt/10.0);	}
					
		if(endNum * 10 < replyCnt) {
			next = true;}
					
		var str = "<ul class='pagination' style='float: right;'>";
					
		if(prev) {
			str += "<li class='page-item previous'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
					
		for(var i = startNum; i<= endNum; i++) {
						
			var active = pageNum == i? "active":"";
						
			str += "<li class='page-item  "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
					
		if(next) {
			str += "<li class='page-item next'><a class='page-link' href='"+(endNum +1)+"'>Next</a></li>";
		}
					
		str += "</ul></div>";
					
		console.log(str);
					
		replyPageFooter.html(str);
	}
		
	//댓글 페이징 클릭 처리
	replyPageFooter.on("click", "li a", function(e) {
					
		e.preventDefault();
		console.log("page click");
					
		var targetPageNum = $(this).attr("href");
					
		console.log("targetPageNum: " + targetPageNum);
					
		pageNum = targetPageNum;
					
		showList(pageNum);
	});
	

	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		
		operForm.attr("action", "/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list")
		operForm.submit();
		
	});
	
	$("#homeBtn").on("click", function(){
		
		self.location ="/board/list";
			
	});
});
</script>

<!------------------------------- 첨부파일 데이터를 가져오는 코드 ---------------------------->

<script>
	$(document).ready(function(){
		
		(function(){
			
			var bno = '<c:out value="${board.bno}"/>';
			
			$.getJSON("/board/getAttachList", {bno:bno}, function(arr){
				
				console.log(arr);
				
				var str ="";
				
				$(arr).each(function(i, attach){
					
					//image type
					if(attach.fileType){
				          var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
				           
				          str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				          str += "<span> "+ attach.fileName+"</span><br/>";
				          str += "<img src='/display?fileName="+fileCallPath+"'>";
				          str += "</div>";
				          str +"</li>";
				        }else{
				             
				          str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				          str += "<span> "+ attach.fileName+"</span><br/>";
				          str += "<img src='/resources/img/attach.png'></a>";
				          str += "</div>";
				          str +"</li>";
				        }
				      });
				       
				      $(".uploadResult ul").html(str);
					
			
			});//end getJSON
		})();//end function
		
		$(".uploadResult").on("click","li", function(e){
		      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){
		      showImage(path.replace(new RegExp(/\\/g),"/"));
		    }else {
		      //download 
		      self.location ="/download?fileName="+path
		    }
		    
		    
		  });
		  
		  function showImage(fileCallPath){
			    
		    alert(fileCallPath);
		    
		    
		    $(".bigPictureWrapper").css("display","flex").show();
		    
		    
		    $(".bigPicture")
		    
		    .html("<img src='/display?fileName="+fileCallPath+"' ><button type= 'button' id='downBtn' class='btn btn-default pull-right'>Download</button>")
		    .animate({width:'100%', height: '100%'}, 1000);
		    
		  }

		  $(".bigPictureWrapper").on("click", function(e){
		    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		    setTimeout(function(){
		      $('.bigPictureWrapper').hide();
		    }, 1000);
		  });
		  
		  $("#downBtn").on("click", function(e){
			  e.preventDefault();	
			  self.location = "/download?fileName="+ fileCallPath;
		  });
		  
	});
	
	
	
</script>


<%@include file="../includes/footer.jsp" %>