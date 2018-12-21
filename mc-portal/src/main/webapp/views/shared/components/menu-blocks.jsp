<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>

</style>
<div id="menu-banner" role="banner">
     <div class="fit-wide no-height-padding">
        <div class="menu-banner-content">
           <div class="menu-banner-logo">
				<a class="navbar-brand" href="<%= request.getContextPath() %>/" style="color:white">
	          		<i class="fa fa-sort-amount-asc" aria-hidden="true"></i> MC. ${sessionScope.admin_mode?"[Admin]":""}
	          	</a>
           </div>
           <nav class="main-nav" role="navigation" >
              <ul class="main-dropdown">
                 <li class="first-list">
                    <span>Home</span>
                    <a href="/" title="SiteGround">
                       <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="15.419px" height="14.168px" viewBox="0 0 15.419 14.168" enable-background="new 0 0 15.419 14.168" xml:space="preserve">
                          <path fill="#231F20" d="M12.505 3.76V0.168h-2V2.23L7.68 0 0 5.899l1.444 1.592 1.061-0.635v7.312h11V6.856l0.808 0.635L15.419 5.9 12.505 3.76zM9.505 13.168h-4v-5h5V13.168z"></path>
                       </svg>
                       <span>Home</span>
                    </a>
                 </li>
                 <li>
                    <span>Hosting</span>
                    <a href="javascript:void(0)">Hosting</a>
                    <div class="webhosting">
                       <div class="webhosting-dropdown">
                          <ul class="standard-dropdown">
                             <li>
                                <a href="/web-hosting.htm" title="Web Hosting">
                                   <span class="icon-size">
                                      <img src="<c:url value='/static/icon_1.png' />" />
                                   </span>
                                   <h5>Web hosting</h5>
                                   <p>Great Hosting Plans</p>
                                </a>
                             </li>
                             <li>
                                <a href="/wordpress-hosting.htm" title="Wordpress Hosting">
                                   <span class="icon-size">
                                      <img src="<c:url value='/static/icon_2.png' />" />
                                   </span>
                                   <h5>WordPress hosting</h5>
                                   <p>Managed WP Solution</p>
                                </a>
                             </li>
                             <li class="mobile-woohosting">
                                <a href="/woocommerce-hosting.htm" title="WooCommerce Hosting">
                                   <span class="icon-size">
                                      <img src="<c:url value='/static/icon_3.png' />" />
                                   </span>
                                   <h5>WooCommerce hosting</h5>
                                   <p>Managed Woo Solution</p>
                                </a>
                             </li>
                             <li>
                                <a href="/cloud-hosting.htm" title="Cloud Hosting">
                                   <span class="desktop-icon icon-size">
                                      <img src="<c:url value='/static/icon_4.png' />" />
                                   </span>
                                   <span class="mobile-icon">
                                       <img src="<c:url value='/static/icon_5.png' />" />
                                   </span>
                                   <h5>Cloud Hosting</h5>
                                   <p>Scalable Cloud</p>
                                </a>
                             </li>
                             <li hidden="">
                                <a href="#" title="Website Builder">
                                    <img src="<c:url value='/static/icon_6.png' />" />
                                   <h5>Website Builder</h5>
                                   <p>Easy &amp; Fast Website</p>
                                </a>
                             </li>
                          </ul>
                       </div>
                       <div class="addservices">
                          <strong>Other Services:</strong>
                          <ul class="root-dropdown">
                             <li>
                                <a href="/reseller_hosting.htm">
                                   
                                   <span>Reseller Hosting</span>
                                </a>
                             </li>
                             <li>
                                <a href="/enterprise-hosting">
                                   <span class="mobile-icon">
                                     
                                   </span>
                                   <span>Enterprise Hosting</span>
                                </a>
                             </li>
                             <li>
                                <a href="/dedicated-hosting.htm">
                                  
                                   <span>Dedicated Servers</span>
                                </a>
                             </li>
                          </ul>
                       </div>
                    </div>
                 </li>
                 <li>
                    <span>Technology</span>
                    <a href="javascript:void(0)">Technology</a>
                    <div class="ourtechnologies">
                       <div class="ourtechnologies-dropdown">
                          <ul class="standard-dropdown">
                             <li>
                                <a href="/datacenters" title="Our Datacenters">
                                   <span class="desktop-icon icon-size">
                                      <img src="<c:url value='/static/icon_8.png' />" />
                                   </span>
                                   <span class="mobile-icon">
                                      <img src="<c:url value='/static/icon_9.png' />" />
                                   </span>
                                   <h5>Data Centers</h5>
                                   <p>On 3 Continents</p>
                                </a>
                             </li>
                             <li>
                                <a href="/speed" title="Our Servers Setup">
                                   <span class="desktop-icon icon-size">
                                      <img src="<c:url value='/static/icon_10.png' />" />
                                   </span>
                                   <span class="mobile-icon">
                                       <img src="<c:url value='/static/icon_11.png' />" />
                                   </span>
                                   <h5>Speed</h5>
                                   <p>Top Technologies</p>
                                </a>
                             </li>
                             <li>
                                <a href="/uptime" title="Our Servers Uptime">
                                   <span class="desktop-icon icon-size">
                                      <img src="<c:url value='/static/icon_12.png' />" />
                                   </span>
                                   <span class="mobile-icon">
                                      <img src="<c:url value='/static/icon_1.png' />" />
                                   </span>
                                   <h5>Uptime</h5>
                                   <p>99.9% Uptime</p>
                                </a>
                             </li>
                          </ul>
                       </div>
                    </div>
                 </li>
                 <li>
                    <span>About Us</span>
                    <a href="javascript:void(0)">About Us</a>
                    <div class="aboutus">
                       <div class="aboutus-dropdown">
                          <ul class="standard-dropdown">
                             <li>
                                <a href="/people" title="About Us">
                                   <span class="desktop-icon icon-size">
                                       <img src="<c:url value='/static/icon_5.png' />" />
                                   </span>
                                   <span class="mobile-icon">
                                      <img src="<c:url value='/static/icon_3.png' />" />
                                   </span>
                                   <h5>Company</h5>
                                   <p>Get to know us better</p>
                                </a>
                             </li>
                             <li>
                                <a href="/support" title="Our Support">
                                   <span class="desktop-icon icon-size">
                                       <img src="<c:url value='/static/icon_1.png' />" />
                                   </span>
                                   <span class="mobile-icon">
                                       <img src="<c:url value='/static/icon_2.png' />" />
                                   </span>
                                   <h5>Support</h5>
                                   <p>Always Fast and Helpful</p>
                                </a>
                             </li>
                             <li>
                                <a href="/siteground_reviews.htm" title="Our Clients">
                                   <span class="desktop-icon icon-size">
                                       <img src="<c:url value='/static/icon_10.png' />" />
                                   </span>
                                   <span class="mobile-icon">
                                       <img src="<c:url value='/static/icon_12.png' />" />
                                   </span>
                                   <h5>Clients</h5>
                                   <p>99.7% Happiness rate</p>
                                </a>
                             </li>
                             <li>
                                <a href="https://www.siteground.com/blog/" title="Our Blog">
                                   <span class="desktop-icon icon-size">
                                     <img src="<c:url value='/static/icon_6.png' />" />
                                   </span>
                                   <span class="mobile-icon">
                                      <img src="<c:url value='/static/icon_7.png' />" />
                                   </span>
                                   <h5>Blog</h5>
                                   <p>Learn What's Cooking</p>
                                </a>
                             </li>
                          </ul>
                       </div>
                    </div>
                 </li>
                 <li>
                    <span>Affiliates</span>
                    <a href="/affiliates" class="reallink">
                      
                       <span>Affiliates</span>
                    </a>
                 </li>
              </ul>
           </nav>
           <div class="right-nav">
              <div class="nav-buttons nari">
                 <div class="set context">
                    <a>
                       <img src="<c:url value='/static/question.png' />" />&nbsp;
                       <span>Help</span>
                    </a>
                    <form autocomplete="off">
                       <div class="main-call">
                          <a href="https://ua.siteground.com/support/index.htm" class="big_button borange">Log in for Support</a>
                       </div>
                       <div class="js-phone-chat-wrapper second-call">
                          <div class="need">Need an account?</div>
                          <div>
                             <a href="" onclick="Live.launch( 'chat', 1, '' ); return false;">
                               
                                <span>Start a Sales Chat</span>
                             </a>
                          </div>
                          <div id="phoneLiContainer" style="">
                             <div id="phone_holder">
                                <a href="tel:+33.805.080522">
                                   
                                   <span>33.805.080522</span>
                                </a>
                             </div>
                          </div>
                       </div>
                    </form>
                 </div>
                 <div class="set">                                       
                    <c:if test="${sessionScope.admin_mode}">
		         		<!-- <a href="#" id="menu-login" data-toggle="modal" data-target="#login-Modal" style="line-height: 40px;color:white; font-weight:bolder;display:none;">
		         				
		         		</a>-->
		         		<a href="#" id="menu-logout" style="line-height: 40px;color:white; font-weight:bolder; "><i class="fa fa-unlock-alt"></i></a> 
		         	</c:if>
		         	<c:if test="${sessionScope.admin_mode==null || sessionScope.admin_mode==false}">
		         	
		         	    <a href="#" data-toggle="modal" data-target="#login-modal">
		                   <img src="<c:url value='/static/user.png' />" />&nbsp;	                       
	                       <span>Login</span>
	                    </a>
		         	</c:if>
                 </div>
                                  
                  <nav class="navbar-dark bg-dark">				        
				     <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				       <span class="navbar-toggler-icon"></span>
				     </button>
					 <div class="collapse navbar-collapse" id="navbarResponsive">
				       <ul class="navbar-nav ml-auto">
				        
				         <li class="nav-item">
				           <a class="nav-link" href="<%= request.getContextPath() %>">Services</a>
				         </li>
				          <li class="nav-item">
				           <a class="nav-link" href="<%= request.getContextPath() %>/?category=admin&page=todos">Todos</a>
				         </li>
	
				       </ul>
				     </div>				     
       			  </nav>	
              </div>
           </div>
        </div>
     </div>
 </div>
 
 <div class="modal fade login-modal" id="login-modal" role="dialog">
 	<div class="modal-dialog">
          <h3>		
          	<a class="navbar-brand" href="<%= request.getContextPath() %>/" style="color:white">
          		<i class="fa fa-sort-amount-asc" aria-hidden="true"></i> MC. ${sessionScope.admin_mode?"[Admin]":""}
          	</a>
          </h3>	
          <form method="post" id="login_form" class="form-content">
                  <div id="message_box_server_down" style="display: none;"></div>
                  <div id="message_box" style="display: none;"></div>

                  <div class="fields">
                      <div class="row">
                          <div class="icon">
                              <img src="<c:url value='/static/user.png' />" />
                          </div>
                          <input id="ua_username" name="ua_username" type="text" placeholder="login..">
                      </div>
                      <div class="row">
                          <div class="icon">
                              <img src="<c:url value='/static/password.png' />" />
                          </div>
                          <input id="ua_password" name="ua_password" type="password" placeholder="password..">
                      </div>
                  </div>

                 
                  <a href="javascript:;" onclick="submitIt();" class="large_button">Sign In</a>
				  <a href="#" class="forgot-pass">Forgot Password?</a>
	     </form>
	</div>
</div>
<script type="text/javascript">
$(function(){
	UpdateHeader("menu2", "<c:url value='/static/menu-blocks.css' />", false,""); //main.jsp!
});

function submitIt(){
	 $('#login-modal form input:text, #login-modal form input:password').val('');
	 $('#login-modal').modal('toggle');
}
/* function showError( error, timeout )
{
    if( !timeout )
        timeout = false;

    showMessage( error, 'error', timeout );
}
function showMessage( msg, type, timeout )
{
    var el = $('message_box');
    el.classNames().each(function(className){
        el.removeClassName(className);
    });
    el.addClassName('message');

    if( type == 'message' )
        el.addClassName('green');
    else if( type == 'error' )
        el.addClassName('red');
    else if( type == 'notice' )
        el.addClassName('yellow');

    el.update('<div><p>' + msg + '</p></div>');
    el.show();
    el.scrollTo();

    if( timeout )
        setTimeout("$('message_box').hide()",timeout);
}
function hideMessage()
{
    $('message_box').hide();
} */
 </script>
