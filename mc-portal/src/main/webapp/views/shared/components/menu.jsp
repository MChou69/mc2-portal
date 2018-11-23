 <!-- Navigation -->
 <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
   <div class="container">
     <a class="navbar-brand" href="<%= request.getContextPath() %>/"><i class="fa fa-sort-amount-asc" aria-hidden="true"></i> MC.</a>
          
     <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarResponsive">
       <ul class="navbar-nav ml-auto">
        
         <li class="nav-item">
           <a class="nav-link" href="<%= request.getContextPath() %>/?category=main&page=services">Services</a>
         </li>
         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Blog
           </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">

             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=blog&page=list1">Blog Home 1</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=blog&page=list2">Blog Home 2</a>
            <%--  <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=blog&page=post">Blog Post</a> --%>
             
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=blog&page=create">Create Post</a>
           </div>
         </li>
         
         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Projets
           </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
           	 <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=list">Liste Projets</a>
           	 <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=upload">Upload Projet(s)</a>
           	 
             <%-- <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=project-detail">Single Portfolio Item</a>	 --%>
           	 
           	 <div class="dropdown-divider"></div>
           	 
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=portfolio-1">1 Column Portfolio</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=portfolio-2">2 Column Portfolio</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?category=projects&page=portfolio-3">3 Column Portfolio</a>
           </div>
         </li>
        
         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Other Pages
           </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
             <a class="dropdown-item" href="full-width.html">Full Width Page</a>
             <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
             <a class="dropdown-item" href="faq.html">FAQ</a>
             <a class="dropdown-item" href="404.html">404</a>
             <a class="dropdown-item" href="pricing.html">Pricing Table</a>
           </div>
         </li>
         
         
         <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             Admin
           </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?admin&action=restore">Posts Restore (Files)</a>
             <div class="dropdown-divider"></div>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?admin&page=categories">Categories (Admin)</a>
             <a class="dropdown-item" href="<%= request.getContextPath() %>/?admin&page=tags">Tags (Admin)</a>
           </div>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="<%= request.getContextPath() %>/?category=main&page=contact">Contact</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="<%= request.getContextPath() %>/?category=main&page=about">About</a>
         </li>
       </ul>
     </div>
   </div>
 </nav>