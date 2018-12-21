<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value='/static/alertifyjs/css/alertify.min.css' />" />
<link rel="stylesheet" href="<c:url value='/static/alertifyjs/css/themes/default.min.css' />" />

<style type="text/css">
table.vmiddle>tbody>tr>td {
	vertical-align: middle;
}

.upload-drop-zone {
	height: 200px;
	border-width: 2px;
	margin-bottom: 20px;
}

.upload-drop-zone {
	color: #ccc;
	border-style: dashed;
	border-color: #ccc;
	/*  line-height: 200px;  */
	text-align: center;
	padding-top: 80px;
}

.upload-drop-zone.drop {
	color: #222;
	border-color: #222;
}

.list-group-item {
	padding: .3rem 1rem;
}

.list-group {
	margin-top: 5px;
}

#info {
	margin-left: 10px;
	font-weight: 600;
}
</style>

<div class="container">
	<div class="panel panel-default">
		<!-- <div class="panel-heading"><strong>Upload Files</strong> <small>Bootstrap files upload</small></div> -->
		<div class="panel-body">
			<form action="" method="post" enctype="multipart/form-data"
				id="js-upload-form">
				<div class="form-inline">
					<div class="form-group">
						<input type="file" name="files[]" id="js-upload-files" multiple
							style="display: none;">
					</div>
					<div class="form-group">
						<!-- <button type="button" class="btn btn-sm btn-primary" id="js-select-files">Pick file(s)</button>&nbsp; -->
						<!-- <button type="button" class="btn btn-sm btn-primary" id="js-upload-submit">Upload files</button> -->
					</div>
					<!-- 	<div class="form-group"> 
 				<span id="info"></span>   
 			</div>     -->
				</div>
			</form>

			<div class="row">
				<div class="col-md-6">
					<!-- Drop Zone -->
					<div class="upload-drop-zone" id="drop-zone">
						<button type="button" class="btn btn-sm btn-primary"
							id="js-select-files">Pick file(s)</button>
						<br /> drag and drop files here
					</div>

				</div>
				<div class="col-md-6">
					<!-- 	<div class="progress">
		          <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
		            <span class="sr-only">0% Complete</span>
		          </div>
		        </div>  -->
					<button type="button" class="btn btn-sm btn-primary"
						id="js-upload-submit">Upload files</button>
					<span id="info"></span>
					<div class="js-upload-finished">
						<div class="list-group">
							<!--  <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">Success</span>image-01.jpg</a>
		            <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">Success</span>image-02.jpg</a>  -->
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<p class="text-center well">...</p>
			</div>

		</div>
	</div>


</div>
<!-- /container -->
<div class="container-fluid">
	<!-- <div class="barra row">Administrador de archivos</div> -->
	<!-- <br>
<div class="row">
	<div class="col-md-8"></div>
	<div class="col-md-4">
		<a class="btn btn-primary btn-block">Volver a Javascript o CSS
			antes de BODY <span class="glyphicon glyphicon-chevron-up"></span>
		</a><br>
	</div>
</div>
<div class="row">
	<div class="col-md-9">
		<div class="archivo-ubicacion">
			<div class="col-md-2 archivo-ubicacion-label bg-primary">Ubicación
				actual</div>
			<div class="col-md-10 archivo-ubicacion-data">c:\tugaFiles//prueba</div>
		</div>
	</div>
	<div class="col-md-3">
		<a href="#" class="btn btn-primary btn-block">Ir a nivel
			superior <span class="glyphicon glyphicon-chevron-up"></span>
		</a>
	</div>
</div>
<br> -->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<!-- <div class="panel-heading text-center">
				<span><strong><span	class="glyphicon glyphicon-folder-open"> </span> Archivos</strong></span>
			</div> -->
				<table class="table table-bordered table-hover vmiddle">
					<!-- 						<thead>
							<tr>
								<th></th>
								<th></th>
								<th>Nombre</th>
								<th>Acciones</th>
								<th>Tamaño</th>
								<th>Fecha</th>
							</tr>
						</thead> -->
					<tbody>
						<tr>
							<td class="text-center">
								<div class="radio">
									<label> <input type="radio" name="optionsRadios"
										id="optionsRadios1" value="option1" checked></label>
								</div>
							</td>
							<td class="text-center"><i class="btn btn-sm fa fa-file"></i></td>
							<td>List..</td>
							<td class="text-center"><a href="#"><i
									class="btn btn-sm btn-danger fa fa-trash"></i></a> <a href="#"><i
									class="btn btn-sm btn-success fa fa-pencil"></i></a> <a href="#"><i
									class="btn btn-sm btn-warning fa fa-info-circle"></i></a></td>
							<td>523.0 KB</td>
							<td>16-sep-16 09:48:2</td>
						</tr>
						<tr>
							<td class="text-center">
								<div class="radio">
									<label> <input type="radio" name="optionsRadios"
										id="optionsRadios1" value="option1" checked>
									</label>
								</div>
							</td>
							<td class="text-center"><i class="btn btn-sm fa fa-folder"></i></td>
							<td>Folder..</td>
							<td class="text-center"><a href="#"><i
									class="btn btn-sm btn-danger fa fa-trash"></i></a> <a href="#"><i
									class="btn btn-sm btn-success fa fa-pencil"></i></a> <a href="#"><i
									class="btn btn-sm btn-warning fa fa-info-circle"></i></a></td>
							<td>523.0 KB</td>
							<td>16-sep-16 09:48:2</td>
						</tr>
						<tr>
							<td class="text-center">
								<div class="radio">
									<label> <input type="radio" name="optionsRadios"
										id="optionsRadios1" value="option1" checked>
									</label>
								</div>
							</td>
							<td class="text-center"><i
								class="btn btn-sm fa fa-file-archive-o"></i></td>
							<td>Zip..</td>
							<td class="text-center"><a href="#"><i
									class="btn btn-sm btn-danger fa fa-trash"></i></a> <a href="#"><i
									class="btn btn-sm btn-success fa fa-pencil"></i></a> <a href="#"><i
									class="btn btn-sm btn-warning fa fa-info-circle"></i></a></td>
							<td>523.0 KB</td>
							<td>16-sep-16 09:48:2</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<!-- <div class="panel panel-default">
			<div class="panel-heading text-center">
				<span><strong><span class="glyphicon glyphicon-hdd"></span> Manejo de archivos</strong> </span>
			</div>
			<div class="panel-body">
				<div class="col-md-6">
					<div class="form-group">
						<label>Nombre de archivo o carpeta</label> <input type="text"
							class="form-control"> <br>
						<div>
							<a class="btn btn-default">Renombrar</a> <a
								class="btn btn-default">Crear carpeta</a> <a
								class="btn btn-default">Crear archivo</a>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="form-group">
							<label>Mover a la carpeta</label> <select class="form-control"
								id="" name="">
								<option value="volvo">Volvo</option>
								<option value="saab">Saab</option>
								<option value="mercedes">Mercedes</option>
								<option value="audi">Audi</option>
							</select>
						</div>
						<a href="#" class="btn btn-primary">Mover</a>
					</div>
				</div>
				<div class="col-md-6 subir-archivos">
					<div class="form-group">
						<label>Subir archivos</label>
						<div class="input-group">
							<input placeholder="" type="text"
								class="form-control carga-archivo-filename"
								disabled="disabled">
							don't give a name === doesn't send on POST/GET
							<span class="input-group-btn"> image-preview-input
								<div class="btn btn-default carga-archivo-input">
									<span class="glyphicon glyphicon-folder-open"></span> <span
										class="carga-archivo-input-title">Seleccionar archivo</span>
									<input type="file" accept="image/png, image/jpeg, image/gif"
										name="input-file-preview" />
									rename it
								</div>
							</span>
						</div>
					</div>

					<div class="form-group">
						<div class="input-group image-preview">
							<input placeholder="" type="text"
								class="form-control carga-archivo-filename"
								disabled="disabled"> <span class="input-group-btn">
								<div class="btn btn-default carga-archivo-input">
									<span class="glyphicon glyphicon-folder-open"></span> <span
										class="carga-archivo-input-title">Seleccionar archivo</span>
									<input type="file" accept="image/png, image/jpeg, image/gif"
										name="input-file-preview" />
								</div>
							</span>
						</div>
					</div>

					<div class="form-group">
						<div class="input-group image-preview">
							<input placeholder="" type="text"
								class="form-control carga-archivo-filename"
								disabled="disabled"> <span class="input-group-btn">
								<div class="btn btn-default carga-archivo-input">
									<span class="glyphicon glyphicon-folder-open"></span> <span
										class="carga-archivo-input-title">Seleccionar archivo</span>
									<input type="file" accept="image/png, image/jpeg, image/gif"
										name="input-file-preview" />
								</div>
							</span>
						</div>
					</div>

					<div class="form-group">
						<div class="input-group image-preview">
							<input placeholder="" type="text"
								class="form-control carga-archivo-filename"
								disabled="disabled"> <span class="input-group-btn">
								<div class="btn btn-default carga-archivo-input">
									<span class="glyphicon glyphicon-folder-open"></span> <span
										class="carga-archivo-input-title">Seleccionar archivo</span>
									<input type="file" accept="image/png, image/jpeg, image/gif"
										name="input-file-preview" />
								</div>
							</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="col-md-6">Espacio utilizado</div>
							<div class="col-md-6">523.0 KB</div>
						</div>
						<div class="col-md-6">
							<a class="btn btn-primary btn-block" href="#">Subir archivo</a>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/static/alertifyjs/alertify.min.js' />"></script>
<script>
$(function(){
    'use strict';	
    var dropZone = document.getElementById('drop-zone');
    //var uploadForm = document.getElementById('js-upload-form');
    
    var toUploadFiles = [];

    
    var asyncUpload = function(){
    	var formdata = new FormData();

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
		});
		 
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

        asyncUpload();
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

    var displayUpload=function(){
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
    } 

});
</script>