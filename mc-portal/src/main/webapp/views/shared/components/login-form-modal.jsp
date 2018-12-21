<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"	href="<c:url value='/static/admin/login.css' />" />	 
<style>
.modal {
	display: block;
}
</style>
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	<div class="modal-dialog">
		<div class="loginmodal-container">
		  <h4>Login..</h4>
		  <a href="#" class="btn close" data-dismiss="modal" >x</a>
		  <span class="text-danger field-validation-valid login-message"></span>
		  <form onsubmit="return false;" method="post" action="./main">
				<div class="form-group">
				  	<input class="form-control" type="email" id="email" name="email" placeholder="email.." >
				  	<input class="form-control" type="password" id="password" name="password" placeholder="password.." >
				</div>
				<input class="btn btn-primary" type="submit" name="login" value="Login" id="btn-login-submit">
		  </form>
			
		  <div class="login-help">
			<a href="#">Register</a> - <a href="#">Forgot Password</a>
		  </div>
		</div>
	</div>
 </div>
 
 <script>
/*  	function jQueryLoadedTest() {
 		$('#btn-login-submit').click(function(e) {			
			
		});
	} */

/* 	if(typeof jQuery=='undefined') {
	    var head = document.getElementsByTagName("head")[0];
	    var jq = document.createElement('script');
	    
	    jq.type = 'text/javascript';
	    jq.src = 'https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js';

	    jq.onload = jQueryLoadedTest;    
	    head.appendChild(jq);

	    jq.type = 'text/javascript';
	    jq.src = 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js';	    
	    head.appendChild(jq);
	    
	} else {
		jQueryLoadedTest();
	} */
 </script>

