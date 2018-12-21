<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String pdfFileName= request.getContextPath()+"/img/test.pdf";
	String pdfViewer=request.getContextPath()+"/views/admin/web/viewer.html";
	
%>

<img id="busy-gif" src="<c:url value='/static/loading.gif' />" style="margin:30px auto;display:none;" />
<div class="container-fluid" style="min-height:600px;">
	<div class="row">		
		<div id="main">
			<a data-fancybox data-src="#login-box" href="javascript:;" class="btn btn-primary">Login</a>&nbsp;
			<a data-fancybox data-type="iframe" data-src="<%=pdfViewer%>?file=<%=pdfFileName%>" href="javascript:;" class="btn btn-primary">View PDF!</a>
		
		</div>
	</div>
</div>

<div id="login-box" style="display:none;">
  <div class="loginmodal-container" >
      <h4>Log In</h4>
      <span class="text-danger field-validation-valid login-message"></span>
      <form onsubmit="return false;" method="post" action="./main">
        <div class="form-group">
            <input class="form-control" type="email" id="login" name="email" placeholder="email.." >
            <input class="form-control" type="password" id="pwd" name="password" placeholder="password.." >
        </div>
        <input class="btn btn-primary" type="submit" name="login" value="Login" id="btn-login-submit">
      </form>

      <div class="login-help">
          <a href="#">Sing Up</a> &nbsp; <a href="#">Forgot Password</a>
      </div>
  </div>
</div>


<script type="text/javascript">
$(function(){
	 $.fancybox.defaults.animationEffect = "slide";	
});
</script>