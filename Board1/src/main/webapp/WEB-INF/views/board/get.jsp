<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
              	             	  
              	  <button data-oper="modify" class="btn btn-primary">Modify</button>
              	  <button data-oper="list" class="btn btn-info">List</button>
              	  <button id='homeBtn' type="button" class="btn btn-warning" style="float: right;">Go Home</button>
              	  
              	  <br>
              	  <br>
              	  <!-- 댓글 목록 처리 -->
					<div class="row" style="height: auto; width: 102%; border:1px solid #c8c8c8; border-radius: 5px;">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading" style="font-size:1.3em">
									<i class="fa fa-comments fa-fw"></i> Reply
									<button id="addReplyBtn" class='btn btn-primary btn-sm'style="float: right;">
									New Reply</button>
								</div>
								<hr class="one">
	
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
              	<input class="form-control" name='replyer' value='replyer'>
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
	
	$("#addReplyBtn").on("click", function(e) {

		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();

		modalRegisterBtn.show();

		$("#myModal").modal("show");
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
		
	var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
	
	replyService.update(reply, function(result){
	        
   		alert(result);
   		modal.modal("hide");
   		showList(pageNum);
   
 	});
 
	});
	
	//댓글 삭제
	modalRemoveBtn.on("click", function(e) {
					
	var rno = modal.data("rno");
	
	replyService.remove(rno,  function(result){
	        
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

<%@include file="../includes/footer.jsp" %>