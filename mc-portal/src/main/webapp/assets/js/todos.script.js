$(function(){
	var tmp;

	// $('.note').each(function(){
	// 	tmp = $(this).css('z-index');
	// 	if(tmp>zIndex) zIndex = tmp;


	// });

	$('.btn').click(function(e){
		e.preventDefault();
	});

	$("#addButton").fancybox({
		'zoomSpeedIn'		: 600,
		'zoomSpeedOut'		: 500,
		'easingIn'			: 'easeOutBack',
		'easingOut'			: 'easeInBack',
		'hideOnContentClick': false,
		'autosize' : false
	});
	
	var zIndex=0;
	function make_draggable(elements)
	{
		elements.draggable({
		 	containment:'parent',
		 	start:function(e,ui){ ui.helper.css('z-index',++zIndex); },
		 	stop:function(e,ui){
		 		var id=parseInt(ui.helper.find('span.data').html());
		 		
		 		var cls = $('#note-'+id).attr("class").replace('note ','').replace(' ui-draggable ui-draggable-dragging','').replace(' ','');		
		 		var color = $.inArray( cls , [ "yellow", "green", "blue",  "red" ] );		 		
		 		var date_deadline = $('#note-'+id).attr("data-deadline");
				$.post('./main',{
					 item: 'todo',
					 action : 'update',
					  x		: ui.position.left,
					  y		: ui.position.top,
					  z		: zIndex,
					  important	: color ,
					  deadline: date_deadline,
					  id	: parseInt(ui.helper.find('span.data').html())
				});
		 	}
		 });
	}
	function load(){
		$('#busy-gif').css('display','block');
	  	$('#main').remove('.note');		
	  	 var data = {
	  		item: 'todo',
	    	action: 'load'
	    };
	  	$.post('./main',data,function(response){	  		
	  		$('#main').append(response.message);
	  		make_draggable($('.note'));
	  		add_actions();
	  		
	  		$('#busy-gif').css('display','none');
		});
	}
	
	function add_actions(){
			$('.note').each(function(){
				$(this).dblclick(function() {
					$("#updateButton").fancybox({
				        'scrolling'     : 'no',
				        'overlayOpacity': 0.1,
				        'showCloseButton'   : false,
				        'content' : '<p>your html here</p>'
				    }).trigger('click');
				});
			});
	
			$(".note-close").click(function(){
				var id_delete=$(this).attr('id');
			    var data = {
			    	item: 'todo',
			    	action: 'delete',
			    	id: id_delete
			    };
				$.post('./main',data,function(response){
					if(response.success)
						$('#note-'+id_delete).css('display','none');
				  	
				});
			});
	}
	
	load();
	
	
	// $("#open").fancybox({
	// 	'zoomSpeedIn'		: 600,
	// 	'zoomSpeedOut'		: 500,
	// 	'easingIn'			: 'easeOutBack',
	// 	'easingOut'			: 'easeInBack',
	// 	'width'  : 300,
	//    'height' : 250,
	//    'autosize' : false
	// });

//	$('.pr-body').live('keyup',function(e){
//	if(!this.preview)
//	this.preview=$('#fancy_ajax .note');
//	this.preview.find($(this).attr('class').replace('form-control pr-','.')).html($(this).val().replace(/<[^>]+>/ig,''));
//	});

//	$('.color').live('click',function(){
//	$('#fancy_ajax .note').removeClass('yellow green blue red').addClass($(this).attr('class').replace('color',''));
//	$('#fancy_ajax .note').attr('data-important',$(this).attr('data-value'));
//	});

//	$('#note-submit').click(function(e){
//	alert('ok..');

//	$(this).replaceWith('<img src="img/ajax_load.gif" style="margin:30px auto;display:block" />');
//	var data = {
//	'note'		: $('.pr-body').val(),
//	'important'	: $('#fancy_ajax .note').attr('data-important')
//	};

//	$.post('ajax/add.php',data,function(id){
//	if(parseInt(id))
//	{
//	var tmp = $('#fancy_ajax .note').clone();
//	tmp.css('max-width','80px').css('display','').css('height','auto');

//	tmp.find('span.data').text(id).end().css({'z-index':zIndex,top:0,left:0});
//	tmp.appendTo($('#main'));

//	make_draggable(tmp);
//	}

//	$("#addButton").fancybox.close();
//	});

//	e.preventDefault();
//	});

	//$('.note-form').live('submit',function(e){e.preventDefault();});
	
	//$('#loadButton').trigger('click');
});

//var zIndex = 0;

//load();

//function load(){
//$('#main').remove('.note');

////var args = {};
////$.post('ajax/list.php',args,function(data){
////$('#main').append(data);
////make_draggable($('.note'));
////add_actions();
////});
//}

//function add_actions(){
//$('.note').each(function(){
//$(this).dblclick(function() {
//$("#updateButton").fancybox({
//'scrolling'     : 'no',
//'overlayOpacity': 0.1,
//'showCloseButton'   : false,
//'content' : '<p>your html here</p>'
//}).trigger('click');
//// html='<p>xxxxxxxxxxxxxxx</p>';
//// jQuery.fancybox({'content' : html});
//});
//});

//$(".note-close").click(function(){
//var args = {id: $(this).attr('id')};
//$.post('ajax/delete.php',args,function(id){
//$('#note-'+id).css('display','none');
//});
//});
//}
//function make_draggable(elements)
//{
//alert('make_draggable..'+elements);
//elements.draggable({
//containment:'parent',
//start:function(e,ui){ ui.helper.css('z-index',++zIndex); },
//stop:function(e,ui){
//$.get('./main',{ //ajax/update.php
//x		: ui.position.left,
//y		: ui.position.top,
//z		: zIndex,
//id	: parseInt(ui.helper.find('span.data').html())
//});
//}
//});
//}
