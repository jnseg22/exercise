<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인 페이지</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="/resources/docs/4/minty/bootstrap.css" media="screen">

<!-- Custom CSS -->
<link rel="stylesheet" href="/resources/docs/_assets/css/custom.min.css">

<!-- Custom Fonts -->
<link href="/resources/docs/_vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="container">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
				<button type="button" class="btn btn-info" id="goHomeBtn" style="float: right;">Go Home</button>
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form role="form" method='post' action="/login">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="userid"
										name="username" type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember-me" type="checkbox">Remember
										Me
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<a href="index.html" class="btn btn-lg btn btn-success btn-block">Login</a>
							</fieldset>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- jQuery -->
	<script src="/resources/docs/_vendor/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/docs/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>

	
	<script src="/resources/docs/_vendor/popper.js/dist/umd/popper.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/docs/_assets/js/custom.js"></script>
	
  <script>
  
  
  
  
  $(".btn-success").on("click", function(e){
    
    e.preventDefault();
    $("form").submit();
    
  });
  
  $("#goHomeBtn").on("click", function(){
		
		self.location ="/board/list";
			
  });
  
  </script>
  
	<c:if test="${param.logout != null}">
	
      <script>
      $(document).ready(function(){
      	alert("로그아웃하였습니다.");
      });
      </script>
      
	</c:if>  

</body>

</html>
