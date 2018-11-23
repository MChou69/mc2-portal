  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    
    <div class="carousel-inner" role="listbox">
		<c:forEach begin="1" end="3" var="i">
			 <div class="carousel-item ${i==1?'active':''}" style="background-image: url('<c:url value='/static/carousel-img${i}.jpg' />')">
		         <%-- <div class="carousel-caption d-none d-md-block">
		           <h3>Slide ${i}</h3>
		           <p>This is a description for the slide ${i}.</p>
		         </div> --%>
		      </div>
		</c:forEach>	
    </div>
    
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
