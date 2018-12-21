<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="card" style="margin-bottom: 20px;">
	<div class="render_content" style="display: block; padding: 10px;">	
		<h5 style="">Project</h5>
		<form  onsubmit="return false;" method="post" action="./main" >
			<div class="form-group row">
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="title" id="title" placeholder="Project title.." required>
			    </div>
			    <button type="submit" class="btn btn-primary sm-2">Save!</button>
			</div>
			<div class="form-group row">
				<div class="col-md-6">
					  <!--   <label for="input-folder-3">Select files/folders</label> -->
					    <div class="file-loading">
					        <input id="input-folder-3" name="input-folder-3[]" type="file" multiple>
					    </div>
				</div>
				<div class="col-md-6">	
					    <!-- <label for="input-folder">Select From Folder</label> -->
					    <div class="file-loading">
					       <input id="input-folder" name="input-folder[]" type="file" multiple webkitdirectory accept="image/*">
					    </div>
				    <div id="errorBlock" class="help-block"></div>
				</div>	
			</div>			
		</form>
	</div>
</div>

<script>
$(function(){
    'use strict';	
    var dropZone = document.getElementById('drop-zone');
    //var uploadForm = document.getElementById('js-upload-form');    
    var toUploadFiles = [];
    
    var asyncUpload = function(){
    	/* var formdata = new FormData();

    	$(toUploadFiles).each(function( i, file ) {
    		formdata.append("file"+i, file);	   	
      	});
        
    	$.ajax({
			url: './',
			type: 'POST',
			data: formdata,
			processData: false,
			contentType: false
		}).done(function (data) {
			console.log(data.message);
        	alertify.success(data.message);
		}).fail(function (data) {
			console.log(data);
		}); */
		 
    	/* $.ajax({
            url: "./",
            type: 'POST',
            encType="multipart/form-data",      
            data: formdata, 
            processData: false,           
            success: function (data) {
            	      	
            },
            error: function(data,status,error) {
                           
            }
        }); */
    }    
    var startUpload = function() {

       // asyncUpload();
       
    	//console.log('start upload..');
    	//console.log(toUploadFiles); 
		
       /*  $.ajax({
            url: "./",
            type: 'POST', */
            //processData: false,
            //data: { upload: 'ok', files : fileData},
              
           /*  dataType: 'json',
            data: JSON.stringify(_data),
            contentType: 'application/json',
            mimeType: 'application/json',      */

           /*  contentType: "application/json", 
            data: JSON.stringify(fileData),  */
            
           /*  data: { name: "John", location: "Boston" }, */
			/*  processData: false,
            contentType: false,  */
            
/*             success: function (data) {
            	console.log('*********************************************');
            	console.log(data);
        		console.log('*********************************************');            	
            },
            error: function(data,status,error) {
               console.log(data);
            }
        }); */

    	/* var formData = new FormData(toUploadFiles);
    	formData.append('upload', 'ok');
    	
    	var msg_error = 'An error has occured. Please try again later.';
        var msg_timeout = 'The server is not responding';
        var message = '????'; */
        //var form = $('#my_form_id'); 
        /* $.ajax({
            data: {'upload':'ok'},
            async: true,
            cache: false,
            processData: false,
            contentType: false,
            url: './', 				
            type: 'POST',
            error: function(xhr, status, error) {
                if (status==="timeout") {
                    alert(msg_timeout);
                } else {
                    alert(msg_error);
                }
            },
            success: function(response) {
                alert(response);
            },
            timeout: 7000
        }); */
    	
    }

/*     var displayUpload=function(){
        console.log('display..');
    	$('.list-group').html('');       
     	$(toUploadFiles).each(function( index, file ) {
     		    		
     		var action='<span class="badge alert-danger pull-right remove-upload" data-index="'+index+'"><i class="fa fa-times" aria-hidden="true"></i></span>';
     		var file_line='<a href="#" class="list-group-item list-group-item-default">'+action+'('+index+') '+file.name+'</a>';
     		
     		$('.list-group').append(file_line);
     	});
    }
    var prepareUpload = function() {
    	$('#info').html(' selection : '+((toUploadFiles.length==1)?toUploadFiles[0].name:toUploadFiles.length+' files'));
        displayUpload();
    	$('.remove-upload').click(function(){
        	var i=$(this).data('index');
        	alert('remove..'+i);
        	
    		toUploadFiles.splice(i,1);
    		prepareUpload();
        });
    }

    $('#js-select-files').click(function(e){
		$('#js-upload-files').trigger('click');		
    });
    
    $('#js-upload-files').change(function(e){
    	$.merge(toUploadFiles, Array.from(this.files));
    	prepareUpload();
    });

    $('#js-upload-submit').click(function(e){   	 
    	  e.preventDefault();
    	  startUpload();
    });

    dropZone.ondrop = function(e) {
        e.preventDefault();       
        this.className = 'upload-drop-zone';
        
        $.merge(toUploadFiles, Array.from(e.dataTransfer.files));       
        prepareUpload();
    }

    dropZone.ondragover = function() {
        this.className = 'upload-drop-zone drop';
        return false;
    }

    dropZone.ondragleave = function() {
        this.className = 'upload-drop-zone';
        return false;
    }  */

});
</script>