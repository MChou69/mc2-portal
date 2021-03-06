<div id="noteData">
	  <h5>Add Note..</h5>	
	  <form action="" method="post" class="note-form">
	    <label for="note-body">Note</label>
	    <textarea name="note-body" id="note-body" class="form-control pr-body" cols="80" rows="8"></textarea>
	    <input type="date" class="form-control" name="butoir" id="note-deadline" />
	    <hr/>
	    <label>Importance!</label>
	    <div class="color yellow" data-value="0"></div>
	    <div class="color green" data-value="1"></div>
	    <div class="color blue" data-value="2"></div>
	    <div class="color red" data-value="3"></div>
	    <br/>
	
	    <a id="note-submit" class="btn btn-primary" href="" style="width:80%;margin: auto;">Add</a>
	  </form>
</div>

<div id="previewNote" class="note yellow" data-important="0" style="display: none;">
    <div class="body"></div>
    <span class="data"></span>
</div>

<script>
	function make_draggable(elements)
	{
		elements.draggable({
		 	containment:'parent',
		 	start:function(e,ui){ ui.helper.css('z-index',++zIndex); },
		 	stop:function(e,ui){
		 		var id=parseInt(ui.helper.find('span.data').html());
		 		
		 		var cls = $('#note-'+id).attr("class").replace('note ','').replace(' ui-draggable ui-draggable-dragging','').replace(' ','');		
		 		var color = $.inArray( cls , [ "yellow", "green", "blue",  "red" ] );
		 		
						 		
				$.post('./main',{
					 item: 'todo',
					 action : 'update',
					  x		: ui.position.left,
					  y		: ui.position.top,
					  z		: zIndex,
					  important	: color ,
					  id	: parseInt(ui.helper.find('span.data').html())
				});
		 	}
		 });
	}
	
	var zIndex=0;
	$('#note-submit').click(function(e){
		e.preventDefault();
				
		$(this).replaceWith($('#busy-gif').css('display','block'));
		var color = $('#fancy_ajax .note').attr('data-important');
	
		var data = {
			item: 'todo',
			action: 'add',
			note	: $('.pr-body').val(),
			deadline	: $('#note-deadline').val(),
			important	: (color<0)?0:color
		};
		
		$.post('./main',data,function(response){
			if(response.success)
			{				
				var id=parseInt(response.id);				
				var tmp = $('#fancy_ajax .note').clone();
				tmp.css('max-width','80px').css('display','').css('height','auto');
				tmp.attr('id','note-'+id);

				tmp.find('span.data').text(id).end().css({'z-index':zIndex,top:55,left:5});
				tmp.appendTo($('#main'));

				make_draggable(tmp);
			}else{
				alert(response.message);
			}
			
			$("#addButton").fancybox.close();
		});

		
	});
	
	$('.pr-body').keyup(function(e){
		if(!this.preview)
			this.preview=$('#fancy_ajax .note');
		this.preview.find($(this).attr('class').replace('form-control pr-','.')).html($(this).val().replace(/<[^>]+>/ig,''));
	});

	$('.color').click(function(){
				
		$('#fancy_ajax .note').removeClass('yellow green blue red').addClass($(this).attr('class').replace('color',''));
		$('#fancy_ajax .note').attr('data-important', $(this).attr('data-value'));
	});
	
	
	

</script>