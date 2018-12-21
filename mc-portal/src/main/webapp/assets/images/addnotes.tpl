<div id="noteData">
  <form action="" method="post" class="note-form">
    <label for="note-body">Note</label>
    <textarea name="note-body" id="note-body" class="form-control pr-body" cols="80" rows="8"></textarea>
    <input type="date" class="form-control" name="butoir" />
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
$('#note-submit').click(function(e){
		e.preventDefault();
		alert('ok..');
		
		$(this).replaceWith($('#busy-gif').css('display','block'));
		
/*		
		var data = {
			'note'		: $('.pr-body').val(),
			'important'	: $('#fancy_ajax .note').attr('data-important')
		};


		$.post('ajax/add.php',data,function(id){
			if(parseInt(id))
			{
				var tmp = $('#fancy_ajax .note').clone();
				tmp.css('max-width','80px').css('display','').css('height','auto');

				tmp.find('span.data').text(id).end().css({'z-index':zIndex,top:0,left:0});
				tmp.appendTo($('#main'));

				make_draggable(tmp);
			}

			$("#addButton").fancybox.close();
		});
*/
		
	});
	
	$('.pr-body').live('keyup',function(e){
		if(!this.preview)
			this.preview=$('#fancy_ajax .note');
		this.preview.find($(this).attr('class').replace('form-control pr-','.')).html($(this).val().replace(/<[^>]+>/ig,''));
	});

	$('.color').live('click',function(){
		$('#fancy_ajax .note').removeClass('yellow green blue red').addClass($(this).attr('class').replace('color',''));
		$('#fancy_ajax .note').attr('data-important',$(this).attr('data-value'));
	});
</script>