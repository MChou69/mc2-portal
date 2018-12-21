<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<img id="busy-gif" src="<c:url value='/static/loading.gif' />" style="margin:30px auto;display:none;" />
<div class="container-fluid" style="min-height:600px;">
	<div class="row">
		<div id="main">
			<a id="addButton" class="btn btn-primary" href="<c:url value='/static/addnote.tpl' />">Add</a>
			<a id="updateButton" style="display:none;" href="<c:url value='/static/addnote.tpl' />"></a>	
			<!-- 
			<a id="loadButton" class="btn btn-primary" href="">Load</a>
			<a id="histoButton" class="btn btn-primary" href="">Histo.</a>
			-->
			<hr/> 
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	/* UpdateHeader("jquery-min14", "http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js", true ,"jquery-main" );	
	
	UpdateHeader("jquery-ui-min", "<c:url value='/static/jquery/jquery-ui.min.js' />", true ,"");
	UpdateHeader("jquery-fancybox126", "<c:url value='/static/fancybox/jquery.fancybox-1.2.6.js' />", true ,"");
	UpdateHeader("todos-script", "<c:url value='/static/todos.script.js' />", true,""); */
});
</script>
