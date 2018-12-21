/*
 * Tools
 */

function UpdateHeader(id_item, resource_file, isScript, id_replace){ 
	if(document.getElementById(id_item))
		return;
		
	//alert('update : '+id_item+" "+resource_file+" "+isScript);

    var script_link = document.createElement(isScript?'script':'link');
    script_link.id = id_item;
    
    if(isScript)
    	script_link.src =  resource_file;
    else{
    	script_link.rel = 'stylesheet';
    	script_link.href = resource_file;
    }
    	    
	if(id_replace!=''){
		 var to_replace = document.getElementById(id_replace);
		 if(to_replace){
			 document.head.replaceChild(script_link, to_replace);
		 }
	}else{
		document.head.appendChild(script_link);
	}
}

$(function(){	
	$('#btn-login-modal').click(function(){
		$.ajax({
			  type: "POST",
			  url: "./main",
			  data: {
				  item: 'login',
				  action: 'login',				  
				  login: $('#email').val(),
				  password: $('#password').val()		
			  },
			  success: function(data){
				  	
					/* $("#menu-login").css('display',data.success?'none':'inline');
					$("#menu-logout").css('display',!data.success?'none':'inline');	 */
					if(data.success){
						$('.close').trigger( "click" );	
						document.location.href=$('#root_url').html()				
					}
					else
					  	$('.login-message').html(data.message);	
			  },
			  error: function(err){
				  alert(err);
			  }
		});			
		
	});
	$('#menu-logout').click(function(){
		$.ajax({
			  type: "POST",
			  url: "./main",
			  data: {
				  item: 'login',
				  action: 'logout'	
			  },
			  success: function(data){					  	
					/* $("#menu-login").css('display','inline');
					$("#menu-logout").css('display','none');	 */
					
					$("#password").val('');	
					$('.login-message').html('');	

					document.location.href=$('#root_url').html();										
			  },
			  error: function(err){
				  alert(err);
			  }
		});			
		
	});
 });