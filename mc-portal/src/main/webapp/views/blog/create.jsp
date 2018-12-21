<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/static/tags.css' />" />

<link rel="stylesheet" href="<c:url value='/static/alertifyjs/css/alertify.min.css' />" />
<link rel="stylesheet" href="<c:url value='/static/alertifyjs/css/themes/default.min.css' />" />

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
								<select class="form-control" data-val="true" data-val-required="The CategoryId field is required." id="category" name="category">									
									<c:forEach items="${categories}" var="category">
										<option value="${category.getId()}">${category.getTitle()}</option>
									</c:forEach>
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
								<span class="text-danger field-validation-valid" data-valmsg-for="Desc" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">Tags</label>
							<div class="col-xs-8 col-md-6">
								<input type="text" id="tags" name="tags" class="form-control" value="Java" data-role="tagsinput" /> 
								
								<!-- <input type="file" multiple="multiple" name="file"	id="project_file_open" style="display: none;">
								<input type="file" webkitdirectory=""  name="files" id="project_folder_open" style="display: none;" >
								
								<button type="button" id="btn-file-project" class="btn btn-sm btn-outline-primary"><i class="fa fa-file-code-o" aria-hidden="true"></i></button>
								<button type="button" id="btn-folder-project" class="btn btn-sm btn-outline-primary"><i class="fa fa-folder-open" aria-hidden="true"></i></button>
								 -->
								
								<%-- <c:import url="../shared/components/upload-comp.jsp"></c:import> --%>
								
							</div>
						</div>
					</div>
					<div class="col-md-2" style="margin: 0px !important;">
						<!-- <label for="input-folder-3">Select files/folders</label>
						<div class="file-loading">
						    <input id="input-folder-3" name="input-folder-3[]" type="file" multiple>
						</div>
						<script>
						$(document).on('ready', function() {
						    $("#input-folder-3").fileinput({
						        uploadUrl: "/file-upload-batch/2",
						        hideThumbnailContent: true // hide image, pdf, text or other content in the thumbnail preview
						    });
						});
						</script> -->
					
						<%-- <button type="button" class="btn btn-sm btn-outline-primary"
							id="btn_image_open">
							<img src="<c:url value='/static/logo.png' />" id="img" class="img-avatar img-circle" style="width: 40px;" />
						</button> --%>
						<!-- <input type="file" accept="image/*" name="file"	id="file_image_open" style="display: none;"> -->
					</div>
				</div>
			</div>
			
			<span class="clearfix"></span>
			
			<div class="form-group">
				<div class="col-md-12" style="margin-top: 20px !important;">
					<%-- <c:import url="../shared/uploads.jsp"></c:import> --%>
				</div>
			</div>
			
			<div class="form-group">
				<div class="row" style="margin-top: 20px !important;">
					<textarea id="editor1" name="editor1" rows="12" cols="80">						
						<c:import url="template.jsp" />					
					</textarea>
				</div>
			</div>
			<hr>
			<div class="form-group">
				<input type="button" name="create-post" id="btn_submit_post" value="Save!" class="btn btn-success" disabled="disabled">
			</div>
			<hr>
			<div class="form-group">			
				<div id="content" class="well"></div>
			</div>
			
		
		</form>
	</div>
</div>



<script src="<c:url value='/static/jquery/jquery-3.3.1.min.js' />"></script>
<script src="<c:url value='/static/bootstrap-tagsinput.min.js' />"></script>

<script src="<c:url value='/static/alertifyjs/alertify.min.js' />"></script>
<script src="https://cdn.ckeditor.com/4.10.1/full-all/ckeditor.js"></script>


<script>
	editor = CKEDITOR.replace('editor1'); 
	editor.addCommand("EditorSave", { 
	    exec: function(edt) {
	    	if($('#title').val()!=''){
		        $('#content').html(edt.document.getBody().getHtml());
		        $('#btn_submit_post').removeAttr("disabled");
	    	}else{
	    		alert('title!');
	    	}
	    }
	});
	editor.ui.addButton('SaveButton', { 
	    label: "Save",
	    command: 'EditorSave',
	    toolbar: 'insert',
	    icon: 'Save'
	});
</script>

<script>
	$(function() {
		$('#btn_submit_post').click(function(e) {	
			
			$.ajax({
				  type: "POST",
				  url: "./main",
				  data: {
					  item: 'post',
					  action: 'add',				  
					  category: $('#category').val(),
					  title: $('#title').val(),
					  desc: $('#desc').val(),
					  tags: $('#tags').val(),
					  post : $('#content').html()			
				  },
				  success: function(data){
						//console.log('create post : '+data.message);
						alertify.success(data.message);
						document.location.href="./?category=blog&page=list";
				  },
				  error: function(err){
					  console.log('create post - error : '+err);
					  alertify.error(err);
				  }
			});			
		});
 		
		/*  $("#input-folder-3").fileinput({
	            uploadUrl: "/file-upload-batch/2",
	            hideThumbnailContent: true // hide image, pdf, text or other content in the thumbnail preview
	        });


	        $("#input-folder").fileinput({
	          browseLabel: 'Select Folder...',
	          hideThumbnailContent: true,
	      }); */
		
/* 
		$('#btn-file-project').click(function(e) {
			$('#project_file_open').trigger("click");
		});

		$('#btn-folder-project').click(function(e) {
			$('#project_folder_open').trigger("click");
		});
		
		$("#project_folder_open").fileinput({
	        browseLabel: 'Select Folder...',
	        previewFileIcon: '<i class="fas fa-file"></i>',
	        allowedPreviewTypes: null, // set to empty, null or false to disable preview for all types
	        previewFileIconSettings: {
	            'doc': '<i class="fas fa-file-word text-primary"></i>',
	            'xls': '<i class="fas fa-file-excel text-success"></i>',
	            'ppt': '<i class="fas fa-file-powerpoint text-danger"></i>',
	            'jpg': '<i class="fas fa-file-image text-warning"></i>',
	            'pdf': '<i class="fas fa-file-pdf text-danger"></i>',
	            'zip': '<i class="fas fa-file-archive text-muted"></i>',
	            'htm': '<i class="fas fa-file-code text-info"></i>',
	            'txt': '<i class="fas fa-file-alt text-info"></i>',
	            'mov': '<i class="fas fa-file-video text-warning"></i>',
	            'mp3': '<i class="fas fa-file-audio text-warning"></i>',
	        },
	        previewFileExtSettings: {
	            'doc': function(ext) {
	                return ext.match(/(doc|docx)$/i);
	            },
	            'xls': function(ext) {
	                return ext.match(/(xls|xlsx)$/i);
	            },
	            'ppt': function(ext) {
	                return ext.match(/(ppt|pptx)$/i);
	            },
	            'jpg': function(ext) {
	                return ext.match(/(jp?g|png|gif|bmp)$/i);
	            },
	            'zip': function(ext) {
	                return ext.match(/(zip|rar|tar|gzip|gz|7z)$/i);
	            },
	            'htm': function(ext) {
	                return ext.match(/(php|js|css|htm|html)$/i);
	            },
	            'txt': function(ext) {
	                return ext.match(/(txt|ini|md)$/i);
	            },
	            'mov': function(ext) {
	                return ext.match(/(avi|mpg|mkv|mov|mp4|3gp|webm|wmv)$/i);
	            },
	            'mp3': function(ext) {
	                return ext.match(/(mp3|wav)$/i);
	            },
	        }
	    });

		$('#project_folder_open').change(function(e){
	    	alert(this.files.length);
	    });
		*/
		
	});
</script>