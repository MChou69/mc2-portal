 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container my-4">
    <label for="input-folder-3">Select files/folders</label>
    <div class="file-loading">
        <input id="input-folder-3" name="input-folder-3[]" type="file" multiple>
    </div>
    <hr/>
	
    <label for="input-folder">Select From Folder</label>
    <div class="file-loading">
       <input id="input-folder" name="input-folder[]" type="file" multiple webkitdirectory accept="image/*">
    </div>
    <div id="errorBlock" class="help-block"></div>
</div>

<script src="<c:url value='/static/jquery/jquery-3.3.1.min.js' />"></script>
<script src="<c:url value='/static/bootstrap/js/bootstrap.bundle.min.js' />"></script>
<script src="<c:url value='/static/fileinput.js' />"></script>

<script>

    $(function () {
		
        $("#input-folder-3").fileinput({
            uploadUrl: "/file-upload-batch/2",
            hideThumbnailContent: true // hide image, pdf, text or other content in the thumbnail preview
        });


        $("#input-folder").fileinput({
          browseLabel: 'Select Folder...',
          hideThumbnailContent: true,
      });

    });
</script>