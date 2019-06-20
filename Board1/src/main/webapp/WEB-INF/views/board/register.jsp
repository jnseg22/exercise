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
          </div>
         </div>
        </div>

<script type="text/javascript">
$(document).ready(function() {  
	
	$("#homeBtn").on("click", function(){
			
		self.location ="/board/list";
			
	});
	
});
</script>

<%@include file="../includes/footer.jsp" %>