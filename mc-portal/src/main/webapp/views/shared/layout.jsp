<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="fr">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/static/jee.png' />" />
    <meta name="description" content="">
    <meta name="author" content="mc">

    <title>${title}</title>
	

	<link rel="stylesheet" type="text/css"	href="<c:url value='/static/bootstrap/bootstrap.min.css' />" />
	<script src="https://use.fontawesome.com/70a5c12bcd.js"></script>

    <link rel="stylesheet" type="text/css"	href="<c:url value='/static/template-style.css' />" />
	<link rel="stylesheet" type="text/css"	href="<c:url value='/static/style.css' />" />	 
	
  </head>
  <body> 	
	<c:import url="components/menu.jsp"></c:import>
    <header>
		<c:if test="${page=='main.jsp'}">
			<c:import url="components/slider.jsp"></c:import>
		</c:if>
    </header>

    <!-- Page Content -->
    <div class="container">
		<%-- <c:if test="${page=='main.jsp'}">
			<div class="row">
				<div class="col-sm-6 infos" style="background-color: lavender;">
					Web Application Context Path = ${pageContext.request.contextPath}<br />
					Request Context Path:
					<%=request.getContextPath()%><br /> Request URI:
					<%=request.getRequestURI()%><br /> Request URL:
					<%=request.getRequestURL()%><br />
				</div>
				<div class="col-sm-4 infos" style="background-color: lavenderblush;">
					Page : ${page}<br /> Error : ${error}<br />
				</div>
			</div>
		</c:if>
		<hr /> --%>
		
		<c:if test="${page!='main.jsp'}">
			<ol class="breadcrumb">
			  <li class="breadcrumb-item">
			    <a href="<%= request.getContextPath() %>/">Home</a>
			  </li>
			  <li class="breadcrumb-item active">${pageName}</li>
			</ol>
		</c:if>
		
		
		<c:set var="include_page" value='${error!=null?"error.jsp":page}' />
		<c:set var="prefix_dir" value='${error!=null?"":"../"}' />
		<c:import url="${prefix_dir}${include_page}" />

      
	  <!-- <hr/>
      <div class="row mb-4">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div>
      </div> -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; MC. 2018</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->	
	<script src="<c:url value='/static/jquery/jquery.min.js' />"></script>
	
	<script src="<c:url value='/static/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

	
	<script src="<c:url value='/static/highlighter/prettify.js' />"></script>
	<script>
		prettyPrint();
	</script>
		
	<!-- <script src="https://cdn.ckeditor.com/4.10.1/full-all/ckeditor.js"></script>
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
	</script> -->
	<%-- <script src="<c:url value='/static/cke/init.js' />"></script> --%>

	<script src="<c:url value='/static/bootstrap-tagsinput.min.js' />"></script>

  </body>
</html>
