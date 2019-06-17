<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

<div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="tables">Board Read Page</h1>
            </div>
          
          <div class="row">
          <div class="col-lg-12">
            <div class="bs-component">
            <table class="table table-hover">
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

<script type="text/javascript">
$(document).ready(function() {  
	
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