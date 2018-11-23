<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/static/tags.css' />" />
<style>
.card-post:hover {
	box-shadow: 0 2px 6px 0 #e0e4e7, inset -1px 0 0 0
		rgba(224, 227, 231, .3), inset 0 -1px 0 0 #e0e4e7, inset 1px 0 0 0
		rgba(224, 227, 231, .2);
}

.card-post {
	position: relative;
}

.card-post {
	/* display: -webkit-box; */
	display: -ms-flexbox;
	display: flex;
}

.card-post {
	background-color: #fff;
	padding: 14px;
	box-shadow: inset -1px 0 0 0 rgba(224, 227, 231, .6), inset 0 -1px 0 0
		#e0e4e7, inset 1px 0 0 0 rgba(224, 227, 231, .6);
}

* {
	box-sizing: border-box;
}

.icon {
	margin-right: 16px;
	color: transparent;
	width: 60px;
	height: 60px;
	border-radius: 2px;
}
/* .info {
    font-size: 13px;
    line-height: 18px;
    font-weight: 400;
    letter-spacing: normal;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-flow: column nowrap;
    flex-flow: column nowrap;
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    overflow: hidden;
}
.info-row{
   display: -webkit-box; 
    display: -ms-flexbox;
    display: flex;
}
.info-row {
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
}
.info-row {
    font-size: 14px;
    line-height: 20px;
    color: #27343b;
}

.info-description{
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-break: break-word;

    font-size: 14px;
    line-height: 20px;
    color: #27343b;
} */
.head img{
	width:40px;
	height:40px;
	float:left;
}
.title{
    font-size: 1.1rem;   
    font-weight: 600;
    line-height: 1.2;
    
    margin-top: 0;
    margin-bottom: .2rem;
	
	color: #3d7ced;
}
.desc{
	padding-left:50px;
}
</style>

<div class="row">
	<!-- Blog Entries Column -->
	<div class="col-md-8">
		<c:forEach items="${posts}" var="post">
			<div class="card card-post mb-4">			
				<div class="head">
					<img class="icon" alt="logo" src="https://d1q6f0aelx0por.cloudfront.net/icons/docker-edition-azure6.png">
					<span class="title">
					<a href="<%= request.getContextPath() %>/?category=blog&page=post&id=${post.getId()}">${post.getTitle()}</a>
					</span><br/>
					<small>updated ${post.getCreated()} by <a href="#">${post.getAuthor()}</a></small>
				</div>
				<div class="desc">	
					<p class="card-text">${post.getDescription()}</p>
					
					<c:forEach items="${post.getPostTags()}" var="pt">
						<a href="<%= request.getContextPath() %>/?category=blog&page=post&id=${post.getId()}" class="tag label label-info"> ${pt.getTag().getName()}</a>
					</c:forEach>
				</div> 
			</div>
		</c:forEach>

		<!-- Pagination -->
		<ul class="pagination justify-content-center mb-4">
			<li class="page-item"><a class="page-link" href="#">&larr;</a></li>
			<li class="page-item disabled"><a class="page-link" href="#">&rarr;</a>
			</li>
		</ul>
	</div>

	<!-- Sidebar Widgets Column -->
	<div class="col-md-4">
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
		<div class="card my-4">
			<h5 class="card-header">Categories</h5>
			<div class="card-body">
				<div class="row">
					<div class="col-lg-6">
						<ul class="list-unstyled mb-0">
							<li><a href="#">Web Design</a></li>
							<li><a href="#">HTML</a></li>
							<li><a href="#">Freebies</a></li>
						</ul>
					</div>
					<div class="col-lg-6">
						<ul class="list-unstyled mb-0">
							<li><a href="#">JavaScript</a></li>
							<li><a href="#">CSS</a></li>
							<li><a href="#">Tutorials</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="card my-4">
			<h5 class="card-header">Side Widget</h5>
			<div class="card-body">You can put anything you want inside of
				these side widgets. They are easy to use, and feature the new
				Bootstrap 4 card containers!</div>
		</div>

	</div>


</div>