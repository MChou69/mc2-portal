  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <div>
  	<i class="fa fa-exclamation-triangle fa-3x" style="color:red;float:left;"></i>   	
  	<c:if test="${error=='404'}">
  		<c:import url="components/404.jsp"></c:import>
  	</c:if>	
  	<c:if test="${error!='404'}">
  		<h3>[${error}] ${message}</h3>
  	</c:if>
  	<a href="<c:url value='/' />">home</a>
  </div> 
  
  

 
  
 
    

 
  