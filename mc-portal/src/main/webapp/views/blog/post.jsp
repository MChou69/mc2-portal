<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="mc.com.beans.Post" %>
<%
Post post=(Post)request.getAttribute("post");
String post_date = new SimpleDateFormat("MM-yyyy").format(post.getCreated());
%>

<h3>
	<strong><span style="color: rgb(41, 128, 185);">${post.getTitle()}</span></strong>
</h3>
<small>
	by <a href="#">${post.getAuthor()} - </a><span> <%=post_date %></span>  
	<a href="<%= request.getContextPath() %>/?category=blog&page=update&id=${post.getId()}"><i class="fa fa-pencil" aria-hidden="true"></i></a> 
</small>
 <div class="row">
   <!-- Post Content Column -->
   <div class="col-lg-8">
    <img class="img-fluid rounded" src="http://placehold.it/900x40" alt="">
	
	<hr>
	<c:import url="${post_url}" />
	
    <hr>
    <!-- Comments Form -->
    <div class="card my-4">
      <h5 class="card-header">Leave a Comment:</h5>
      <div class="card-body">
        <form>
          <div class="form-group">
            <textarea class="form-control" rows="3"></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>

     <!-- Single Comment -->
     <div class="media mb-4">
       <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
       <div class="media-body">
         <h5 class="mt-0">Name</h5>
         Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin...
       </div>
     </div>

     <!-- Comment with nested comments -->
<!--      <div class="media mb-4">
       <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
       <div class="media-body">
         <h5 class="mt-0">Commenter Name</h5>
         Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

         <div class="media mt-4">
           <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
           <div class="media-body">
             <h5 class="mt-0">Commenter Name</h5>
             Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
           </div>
         </div>

         <div class="media mt-4">
           <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
           <div class="media-body">
             <h5 class="mt-0">Commenter Name</h5>
             Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
           </div>
         </div>

       </div>
     </div> -->

   </div>

   <!-- Sidebar Widgets Column -->
   <div class="col-md-4">

     <!-- Search Widget -->
     <div class="card mb-4">
       <h5 class="card-header">Search</h5>
       <div class="card-body">
         <div class="input-group">
           <input type="text" class="form-control" placeholder="Search for...">
           <span class="input-group-btn">
             <button class="btn btn-secondary" type="button">Go!</button>
           </span>
         </div>
       </div>
     </div>

     <!-- Categories Widget -->
     <div class="card my-4">
       <h5 class="card-header">Categories</h5>
       <div class="card-body">
         <div class="row">
           <div class="col-lg-6">
             <ul class="list-unstyled mb-0">
               <li>
                 <a href="#">Web Design</a>
               </li>
               <li>
                 <a href="#">HTML</a>
               </li>
               <li>
                 <a href="#">Freebies</a>
               </li>
             </ul>
           </div>
           <div class="col-lg-6">
             <ul class="list-unstyled mb-0">
               <li>
                 <a href="#">JavaScript</a>
               </li>
               <li>
                 <a href="#">CSS</a>
               </li>
               <li>
                 <a href="#">Tutorials</a>
               </li>
             </ul>
           </div>
         </div>
       </div>
     </div>

     <!-- Side Widget -->
     <div class="card my-4">
       <h5 class="card-header">Side Widget</h5>
       <div class="card-body">
         You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
       </div>
     </div>

   </div>

 </div>
 <!-- /.row -->