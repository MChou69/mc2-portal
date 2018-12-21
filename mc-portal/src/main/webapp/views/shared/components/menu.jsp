<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"	href="<c:url value='/static/login.css' />" />	 
 
 
 <!-- Navigation -->
 <span style="display:none;" id="root_url"><%= request.getContextPath() %>/</span>
 <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
   <div class="container">
     <a class="navbar-brand" href="<%= request.getContextPath() %>/"><i class="fa fa-sort-amount-asc" aria-hidden="true"></i> MC. ${sessionScope.admin_mode?"[Admin]":""}</a>
          
     <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarResponsive">
       <ul class="navbar-nav ml-auto">
        
         <%-- <li class="nav-item">
           <a class="nav-link" href="<%= request.getContextPath() %>/?category=main&page=services">Services</a>
         </li> --%>
         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Blog
           </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
             <a class="dropdown-item" href="<%= request.getContextPath() %>/blog/list">Posts (liste)</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/blog/faq">FAQ</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/blog/create">Ajouter Post!</a>
           </div>
         </li>
         
         
         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Projets
           </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
           	 <a class="dropdown-item" href="<%= request.getContextPath() %>/projects/list">Projets (liste)</a>
           	 <a class="dropdown-item" href="<%= request.getContextPath() %>/projects/create">Ajouter Projet</a>
           	 
           	 <a class="dropdown-item" href="<%= request.getContextPath() %>/projects/upload">Upload(er) Projet(s)</a>
           </div>
         </li>
         
         <c:if test="${sessionScope.admin_mode}">
	         <li class="nav-item dropdown">
	           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	             Admin
	           </a>
	           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
	             <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/restore">Posts Restore (Files)</a>
	             <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/tests">Tests..</a>
	             <div class="dropdown-divider"></div>
	             <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/todos">Todo!</a>
	             <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/search">Search!</a>
	            <div class="dropdown-divider"></div>
	             <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/categories">Categories</a>
	             <a class="dropdown-item" href="<%= request.getContextPath() %>/admin/tags">Tags</a>
	           </div>
	         </li>
         </c:if>
         
         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="xxx" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Other Pages
           </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
             <a class="dropdown-item" href="full-width.html">Full Width Page</a>
             <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
             <a class="dropdown-item" href="faq.html">FAQ</a>
             <a class="dropdown-item" href="404.html">404</a>
             <a class="dropdown-item" href="pricing.html">Pricing Table</a>
             
             <div class="dropdown-divider"></div>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=project-detail">Single Portfolio Item</a>
			 <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=portfolio-1">1 Column Portfolio</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=portfolio-2">2 Column Portfolio</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=portfolio-3">3 Column Portfolio</a>
             
             <div class="dropdown-divider"></div>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=blog&page=list2">Blog Home 2</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=blog&page=post">Blog Post</a>
           </div>
         </li>
         
         <li class="nav-item">
           <a class="nav-link" href="<%= request.getContextPath() %>/main/contact">Contact</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="<%= request.getContextPath() %>/main/about">About</a>
         </li>
         <li>
         	<c:if test="${sessionScope.admin_mode}">
         		<a href="#" id="menu-login" data-toggle="modal" data-target="#login-Modal" style="line-height: 40px;color:white; font-weight:bolder;display:none;"><i class="fa fa-lock"></i></a>
         		<a href="#" id="menu-logout" style="line-height: 40px;color:white; font-weight:bolder; "><i class="fa fa-unlock-alt"></i></a>
         	</c:if>
         	<c:if test="${sessionScope.admin_mode==null || sessionScope.admin_mode==false}">
         		<a href="#" id="menu-login" data-toggle="modal" data-target="#login-Modal" style="line-height: 40px;color:white; font-weight:bolder;"><i class="fa fa-lock"></i></a>
         		<a href="#" id="menu-logout" style="line-height: 40px;color:white; font-weight:bolder;display:none;"><i class="fa fa-unlock-alt"></i></a>
         	</c:if>
         </li>
       </ul>
     </div>
   </div>
 </nav>
 
 
 <div class="modal fade" id="login-Modal" role="dialog">
 	<div class="modal-dialog">
		<div class="loginmodal-container">
		  <h4>Login</h4>
		  <span class="text-danger field-validation-valid login-message"></span>
		  <form onsubmit="return false;" method="post" action="./main">
				<div class="form-group">
				  	<input class="form-control" type="email" id="email" name="email" placeholder="email.." >
				  	<input class="form-control" type="password" id="password" name="password" placeholder="password.." >
				</div>
				<!-- <input class="btn btn-primary" type="submit" name="login" value="Login" id="btn-login-submit"> -->
				
				<input class="btn btn-primary" type="submit" name="login" value="Login" id="btn-login-modal">
          		<button type="button" class="close" data-dismiss="modal" style="display:none;">x</button>	
		  </form>
			
		  <div class="login-help">
			<a href="#">Register</a> - <a href="#">Forgot Password</a>
		  </div>
		</div>
	</div>
 </div>
 
<!--  <div class="container">
  <div class="modal fade" id="login-Modal" role="dialog">
    <div class="modal-dialog">
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Login</h4>
            <span class="text-danger field-validation-valid login-message"></span>
        </div>
        <div class="modal-body">
          	<div class="loginmodal-container">			
			  <form onsubmit="return false;" method="post" action="./main">
					<div class="form-group">
					  	<input class="form-control" type="email" id="email" name="email" placeholder="email.." >
					  	<input class="form-control" type="password" id="password" name="password" placeholder="password.." >
					</div>
					<input class="btn btn-primary" type="submit" name="login" value="Login" id="btn-login-modal">
          			<button type="button" class="close" data-dismiss="modal" style="display:none;">x</button>				
			  </form>
			</div>
        </div>
        <div class="modal-footer">
          <div class="login-help">
			<a href="#">Register</a> - <a href="#">Forgot Password</a>
		  </div>
        </div>
      </div>
    </div>
  </div>
</div> -->