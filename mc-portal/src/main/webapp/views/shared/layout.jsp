<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="fr">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/static/jee.png' />" />
    <meta name="description" content="my website..">
    <meta name="author" content="mc">

    <title>${title}</title>
	
	<link rel="stylesheet" type="text/css"	href="<c:url value='/static/bootstrap/bootstrap.min.css' />" />
	<script src="https://use.fontawesome.com/70a5c12bcd.js"></script>

	<link rel="stylesheet" type="text/css"	href="<c:url value='/static/main-style.css' />" />	 
			
	<c:if test="${page=='admin/todos.jsp' || page=='admin/admin.jsp' }">
		<link rel="stylesheet" type="text/css"	href="<c:url value='/static/fancybox/jquery.fancybox.min.css' />" />
		<link rel="stylesheet" type="text/css"	href="<c:url value='/static/admin/login.css' />" />	
	</c:if>
	<c:if test="${page=='admin/todos.jsp'}">				
		<link rel="stylesheet" type="text/css"	href="<c:url value='/static/admin/todo.css' />" />		
		<%-- 	<link rel="stylesheet" type="text/css"	href="<c:url value='/static/fancybox/jquery.fancybox-1.2.6.css' />" />	 	
		<link rel="stylesheet" type="text/css"	href="<c:url value='/static/fancybox/jquery-ui.css' />" /> --%>	 
	</c:if>	
	
	<c:if test="${page=='projects/create.jsp'}">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
		<link href="<c:url value='/static/fileinput.css' />" media="all" rel="stylesheet" type="text/css"/>	
	</c:if>	
	
	<!--************************************************************************************-->
    <!--************************************************************************************-->	
    
    <c:if test="${page!='admin/todos.jsp'}">
	    <script id="jquery-main" src="<c:url value='/static/jquery/jquery.min.js' />"></script> 
	    <script id="bootstrap-bundle-main" src="<c:url value='/static/bootstrap/js/bootstrap.bundle.min.js' />"></script>
    </c:if>
    
	<%-- <c:if test="${page!='blog/uploads.jsp' && page!='projects/create.jsp' && page!='admin/todos.jsp' }">
		<!--  delete block 'jquery-main' from header!!! -->
		
	</c:if> --%>
		
	<c:if test="${page=='admin/admin.jsp' }">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="<c:url value='/static/fancybox/jquery.fancybox.min.js' />"></script>
	</c:if>
	<c:if test="${page=='admin/todos.jsp'}">	
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script> 		
		<script src="<c:url value='/static/jquery/jquery-ui.min.js' />"></script>	
		<script src="<c:url value='/static/fancybox/jquery.fancybox-1.2.6.js' />"></script>
		<script src="<c:url value='/static/todos.script.js' />"></script>  			
	</c:if>
		
	<c:if test="${page!='admin/todos.jsp'}">
<%-- 		<script src="<c:url value='/static/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
	</c:if>
	
	<c:if test="${page=='?????'}">
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>	
		<script src="<c:url value='/static/highlighter/prettify.js' />"></script>
		<script>
			prettyPrint();
		</script>
	</c:if>
	
	
	<c:if test="${page=='projects/create.jsp'}">
		<script src="<c:url value='/static/jquery/jquery-3.3.1.min.js' />"></script>
		<script src="<c:url value='/static/bootstrap/js/bootstrap.bundle.min.js' />"></script>	

		<script src="<c:url value='/static/fileinput.js' />" type="text/javascript"></script>		
		<script>
			 $(function(){
				 $("#input-folder-3").fileinput({
			            uploadUrl: "./main",
			            browseLabel: '',
			            uploadExtraData: {title:'hello!'},
			            hideThumbnailContent: true // hide image, pdf, text or other content in the thumbnail preview
			        });

			        $("#input-folder").fileinput({
			          browseLabel: '',
			          uploadUrl: "./main",
			          hideThumbnailContent: true
			      });
			 });	
		</script>  
	</c:if>
	
	<c:if test="${page=='admin/tests.jsp'}">
		<script src="<c:url value='/static/jquery/jquery-3.3.1.min.js' />"></script>
		<script src="<c:url value='/static/jszip/jszip.min.js' />"></script>
		<script src="<c:url value='/static/jszip/FileSaver.min.js' />"></script>	
				
		<script>
			 /* function zipIt(){
				 var zip = new JSZip();
				 zip.file("Hello.txt", "Hello World\n");
				 var img = zip.folder("images");
				 img.file("smile.gif", imgData, {base64: true});
				 zip.generateAsync({type:"blob"})
				 .then(function(content) {
				     // see FileSaver.js
				     saveAs(content, "example.zip");
				 });
			 } */

		    // Blob
		    if (JSZip.support.blob) {
			       /*  var zip = new JSZip();

					//zip.file("Hello.txt", "Hello world\n");

					//var imgData = "../../img/loading.gif";
					//var img = zip.folder("images");
					//img.file("loading.gif", imgData, {base64: true})
					
					zip.folder("images");
					zip.folder("css").file("style.css", "body {background: #FF0000}");
					// or specify an absolute path (using forward slashes)
					zip.file("css/font.css", "body {font-family: sans-serif}") */
					 
					 
					jQuery("#blob").on("click", function () {
						var zip = new JSZip();
						zip.folder("images");
						zip.folder("css").file("style.css", "body {background: #FF0000}");
						zip.file("css/font.css", "body {font-family: sans-serif}")
						
					    zip.generateAsync({type:"blob"}).then(function (blob) { // 1) generate the zip file
					        saveAs(blob, "myzip.zip");                          // 2) trigger the download
					    }, function (err) {
					        jQuery("#blob").text(err);
					    });
					});		
		    } else {
		        blobLink.innerHTML += " (not supported on this browser)";
		    }

				

		    // data URI
		    var zip = new JSZip();
			zip.file("Hello.txt", "Hello world\n");
			
			jQuery("#data_uri").on("click", function () {
			    zip.generateAsync({type:"base64"}).then(function (base64) {
			        window.location = "data:application/zip;base64," + base64;
			    }, function (err) {
			        jQuery("#data_uri").text(err);
			    });
			});

		</script> 
	</c:if>

	<!--************************************************************************************-->
    <!--************************************************************************************-->	

	
	<script  id="main-script" src="<c:url value='/static/main.js' />"></script> 
  
  	<style>
  		footer {
		    background-color: #1a2529 !important;
		    color: #dfdfdf;
		}
		
		footer p {
		    color: #eb840e;
		}
  	</style>
  </head>
  <body> 	
  
  	<c:set var="menu" value="${theme==0?'menu-blocks':'menu'}" />
  	<c:import url="components/${menu}.jsp"></c:import>	
  	
  	<header>
  		<div class="row"></div> 
  	
		<c:if test="${page=='main.jsp'}">		
			<c:import url="components/slider.jsp"></c:import>
		</c:if>
		<c:if test="${checkConnection==false}">
			<div style="margin-top:20px;"><i class="fa fa-exclamation-triangle" style="color:red;float:left;"></i></div>  
		</c:if>
    </header>
	
    <div class="container" style="margin-top:60px;">
			<c:if test="${page!='main.jsp'}">
				<ol class="breadcrumb">
				  <li class="breadcrumb-item">
				    <a href="<%= request.getContextPath() %>/">Home</a>
				  </li>
				  <li class="breadcrumb-item active">${pageName} [${page}]</li>
				</ol>
			</c:if>		
			
			<c:set var="include_page" value='${error!=null?"error.jsp":page}' />
			<c:set var="prefix_dir" value='${error!=null?"":"../"}' />
			
			<c:import url="${prefix_dir}${include_page}" />
    </div>

    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center">Copyright &copy; MC. 2018</p>
      </div>
    </footer>
    
  </body>
</html>
