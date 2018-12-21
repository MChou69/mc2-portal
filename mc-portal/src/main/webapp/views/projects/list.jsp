<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String[] images= {"project-logo1.jpg","project-logo2.jpg","project-logo1.jpg","project-logo2.jpg","project-logo1.jpg","project-logo2.jpg","project-logo2.jpg","project-logo2.jpg","project-logo1.jpg"};
request.setAttribute("items", images);
%>
<div class="container">
  <div class="row">
  	<c:forEach items="${items}" var="image">
	    <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
		      <div class="card h-100">
			       <%--  <a href="<%= request.getContextPath() %>/?category=projects&page=project-detail">
			        	<img class="card-img-top" src="<c:url value='/static/${image}' />" alt="" style="min-height: 80px;">
			        </a> --%>
			        <div class="card-body">
			          <h5 class="card-title">
			            <img class="card-img-top" src="<c:url value='/static/${image}' />" alt="" style="height: 60px;"> <a href="#">Project One</a>
			          </h5>
			          <!-- <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p> -->
			        </div>
		      </div>
	    </div>
    </c:forEach>    
  </div>

  <!-- Pagination -->
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</div>
