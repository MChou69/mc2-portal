
<textarea name="content" id="editor">This is some sample content (4)</textarea>
<div id="visu"></div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script src="https://cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>

<button class="btn btn-primary" id="btnSave">Save!</button>
<script>
	var editor = CKEDITOR.replace('editor', {
		filebrowserImageUploadUrl : '/main/UploadImage'
	});
	$('#btnSave').on('click', function(evt) {
		console.log('content : ' + editor.getData());
		$('#visu').html(editor.document.getBody().getHtml());
	});

</script>
