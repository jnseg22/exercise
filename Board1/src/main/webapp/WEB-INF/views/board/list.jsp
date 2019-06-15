<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

      <!-- Tables
      ================================================== -->
      <div class="bs-docs-section">

        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="tables">Tables</h1>
            </div>
            
            <div class="row">
          <div class="col-lg-12">
          	<div class="table-active" style="font-size:1.5em">Board List Page
            <button id='regBtn' type="button" class="btn btn-secondary" style="float: right;">Register New Board</button></div>
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
                    <td><a href='/board/get?bno=<c:out value="${board.bno }"/>'>
                    <c:out value="${board.title}"/></a></td>
                    <td><c:out value="${board.writer}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                  </tr>
                  </c:forEach>
                
               </table>
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
              <pre contenteditable>처리가 완료되었습니다.</pre>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn-btn-info" data-dismiss="modal">Close</button>
            	<button type="button" class="btn-btn-default">Save changes</button>
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
	});
</script>

<%@include file="../includes/footer.jsp" %>
