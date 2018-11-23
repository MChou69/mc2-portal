<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${title}</title>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<c:url value='/static/style.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/static/blog.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/static/prettify.css' />" />

</head>
<body>
	<c:import url="topmenu.jsp"></c:import>
	<div class="wrap">
		<div class="container">

			<c:if test="${page!='posts/create.jsp'}">
				<div class="row">
					<div class="col-sm-6 infos" style="background-color: lavender;">
						Web Application Context Path = ${pageContext.request.contextPath}<br />
						Request Context Path:
						<%=request.getContextPath()%><br /> Request URI:
						<%=request.getRequestURI()%><br /> Request URL:
						<%=request.getRequestURL()%><br />
					</div>
					<div class="col-sm-4 infos"
						style="background-color: lavenderblush;">
						Page : ${page}<br /> Error : ${error}<br />
					</div>
				</div>
			</c:if>
			<hr />

			<c:set var="include_page" value='${error!=null?"error.jsp":page}' />
			<c:set var="prefix_dir" value='${error!=null?"":"../"}' />
			<c:import url="${prefix_dir}${include_page}" />
		</div>
	</div>

	<c:import url="footer.jsp"></c:import>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<script src="<c:url value='/static/highlighter/prettify.js' />"></script>
	<script>
		prettyPrint();
	</script>

	<script src="https://cdn.ckeditor.com/4.10.1/full-all/ckeditor.js"></script>
	<script>
		editor = CKEDITOR.replace('editor1'); 
	
		editor.addCommand("EditorSave", { 
		    exec: function(edt) {		        
		        $('#content').html(edt.document.getBody().getHtml());
		    }
		});
	
		editor.ui.addButton('SaveButton', { 
		    label: "Enregistrer!",
		    command: 'EditorSave',
		    toolbar: 'insert' //,
		    //icon: 'https://avatars1.githubusercontent.com/u/5500999?v=2&s=16'
		});
	</script>
	<%-- <script src="<c:url value='/static/cke/init.js' />"></script> --%>

	<script src="<c:url value='/static/bootstrap-tagsinput.min.js' />"></script>


</body>
</html>