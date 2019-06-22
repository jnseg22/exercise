<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>


<!-- Tables ================================================== -->
<div class="bs-docs-section">

   <div class="row">
   	<div class="col-lg-12">
       <div class="page-header">
         <h1 id="tables">Tables</h1>
         <hr>
       </div>
            
       <div class="row">
     <div class="col-lg-12">
      <div class="table-active" style="font-size:1.5em">Board List Page
       <button id='regBtn' type="button" class="btn btn-secondary" style="float: right;">Register New Board</button>
       <button id='homeBtn' type="button" class="btn btn-warning" style="float: right;">Go Home</button></div>
       <div class="bs-component">
       <table class="table table-hover">
                        
           <thead>
             <tr class="table-info">
               <th scope="col">#번호</th>
               <th scope="col">제목</th>
               <th scope="col">작성자</th>
               <th scope="col">작성일</th>
               <th scope="col">수정일</th>
             </tr>
           </thead>
          
          <c:forEach items="${list}" var="board">
             <tr class="table-light">
               <td><c:out value="${board.bno}"/></td>
               <td><a class="move" href='<c:out value="${board.bno }"/>'>
               <c:out value="${board.title}"/><b> [ <c:out value="${board.replyCnt }"/> ] </b></a></td> 
               <td><c:out value="${board.writer}"/></td>
               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
             </tr>
          </c:forEach>
                
          </table>
             
         <form id="actionForm" role="listObj" action="/board/list" method="get">
         
			<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />'/>
			<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />'/>	
			<input type='hidden' name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type='hidden' name="amount" value="${pageMaker.cri.amount }">

		</form>
               
      <!-- 검색 처리 -->
            
       <div class="navbar-collapse collapse show" id="navbarColor01" style="">
        <form class="form-inline my-2 my-lg-0" id="searchForm" action="/board/list" method="get">
        	<select class="form-control mr-sm-2" name='type'>
				<option value=""
				<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="T"
				<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"
				<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
					<option value="W"
				<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
					<option value="TC"
				<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
					<option value="TW"
				<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
					<option value="TWC"
				<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>				
			</select>
			
      		<input class="form-control mr-sm-2" type="text" placeholder="Search" name='keyword'
      		value='<c:out value="${pageMaker.cri.keyword}"/>' />
      		<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}" />'/>
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}" />'/>
      		<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      		     		
   	 	</form>
       </div>
             
      
      
        <!--  페이지 번호 출력 -->
               
          <div>
  			<ul class="pagination" style="float: right;">
    				
    		<c:if test="${pageMaker.prev }">
    			<li class="page-item previous">
      			<a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
    			</li>
    		</c:if>
    				
    		<c:forEach var="num" begin="${pageMaker.startPage }"
    			end="${pageMaker.endPage }">
    			<li class="page-item  ${pageMaker.cri.pageNum == num ? 'active':''} ">
      			<a class="page-link" href="${num}">${num}</a>
    			</li>
    		</c:forEach>
    				
    		<c:if test="${pageMaker.next }">
    			<li class="page-item next">
      			<a class="page-link" href="${pageMaker.endPage +1}">Next</a>
    			</li>
    		</c:if>
    
  			</ul>
		</div><!-- /pagination -->
		
		
       </div><!-- /example -->
     </div>
   </div>
  </div>
 </div>
</div>
  
  <!-- modal -->
  <div id="source-modal" class="modal fade" tabindex='-1'>
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Modal title</h4>
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
              <p>처리가 완료되었습니다.</p>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            	<button type="button" class="btn btn-secondary">Save changes</button>
            </div>
          </div>
        </div>
      </div>
      
<script type="text/javascript">
	$(document).ready(function() {
		
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result){
			
			if(result === '' || history.state) {
				return;
			}
			if (parseInt(result) > 0){
				$(".modal-body").html("게시글" + parseInt(result) + "번이 등록되었습니다.");
			}
			
			$("#source-modal").modal("show");
		}
		
		$("#regBtn").on("click", function(){
			
			self.location ="/board/register";
			
		});
		
		//페이지 클릭 이벤트 처리
		var actionForm = $("#actionForm")
		
		$(".page-item a").on("click", function(e) {
			
			e.preventDefault();
			
			console.log("click");
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		//게시물 조회 이벤트 처리
		$(".move").on("click", function(e){
			
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='bno' value='" +$(this).attr("href")+ "'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		});
		
		//검색 버튼 이벤트 처리
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");//검색시 1페이지로 이동
			e.preventDefault();
			
			searchForm.submit();
		});
		
		$("#homeBtn").on("click", function(){
			
			self.location ="/board/list";
				
		});
	});
</script>

<%@include file="../includes/footer.jsp" %>
