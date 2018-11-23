<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/static/tags.css' />" />
<script>
	
</script>
<div class="card" style="margin-bottom: 20px;">
	<div class="render_content" style="display: block; padding: 10px;">
		<form  onsubmit="return false;" method="post" action="./main">
			<div class="form-horizontal">
				<h5 style="">Post</h5>
				<hr style="clear: both;">
				<div class="row">
					<div class="col-md-10" style="">
						<div class="form-group">
							<label class="col-md-2 control-label" for="CategoryId">Category</label>
							<div class="col-md-10">
								<select class="form-control" data-val="true"
									data-val-required="The CategoryId field is required."
									id="category" name="category">
									<option value="1">Undefined</option>
									<option value="2">Android</option>
									<option value="3">Java/JEE</option>
									<option value="4">.Net (Framework)</option>
									<option value="5">Web Dev.</option>
									<option value="6">HowTo</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="title">Title</label>
							<div class="col-md-10">
								<input class="form-control" type="text" id="title" name="title"
									value=""> <span
									class="text-danger field-validation-valid"
									data-valmsg-for="Title" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="Desc">Desc</label>
							<div class="col-md-10">
								<textarea rows="2" class="form-control" id="desc" name="desc"></textarea>
								<span class="text-danger field-validation-valid"
									data-valmsg-for="Desc" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">Tags</label>
							<div class="col-xs-8 col-md-6">
								<input type="text" id="tags" name="tags" class="form-control" value="Java" data-role="tagsinput" />
							</div>
						</div>
					</div>
					<div class="col-md-2" style="margin: 0px !important;">
						<button type="button" class="btn btn-sm btn-outline-primary"
							id="btn_image_open">
							<img src="<c:url value='/static/logo.png' />" id="img" class="img-avatar img-circle" style="width: 40px;" />
						</button>
						<input type="file" accept="image/*" name="file"	id="file_image_open" style="display: none;">
					</div>
				</div>
			</div>
			<div class="form-group pull-right">
				<div class="col-md-offset-2 col-md-10">
					<input type="button" name="create-post" id="btn_submit_post" value="Save!" class="btn btn-default">
				</div>
			</div>
			<span class="clearfix"></span>
			<div class="form-group">
				<div class="col-md-12" style="margin-top: 20px !important;">
					<!-- textarea name="editor" id="editor" > </textarea-->
					<textarea id="editor1" name="editor1" rows="12" cols="80">						
						<c:import url="template.jsp" />					
					</textarea>
					<hr>
					<div id="content" class="well"></div>
				</div>
			</div>
		</form>
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		$('#btn_submit_post').click(function(e) {
			
			$.ajax({
				  type: "POST",
				  url: "./main",
				  data: {
					  category: $('#category').val(),
					  title: $('#title').val(),
					  desc: $('#desc').val(),
					  tags: $('#tags').val(),
					  post : $('#content').html()			
				  },
				  success: function(data){
						console.log('create post : '+data.message)
				  },
				  error: function(err){
					  console.log('create post - error : '+err)
				  }
			});			
		});

	});
</script>