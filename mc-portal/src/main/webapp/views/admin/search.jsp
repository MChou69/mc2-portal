<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <script src="http://www.google.com/jsapi?key=ABQIAAAAcBlCkeOPJin8k-qaQXzU7BT2yXp_ZAY8_ufC3CFXhHIE1NvwkxR2nqmQ7b9YsHQnrE5X5lt81xC_8A" type="text/javascript"></script>
<script type="text/javascript">
	google.load('search', '1');
</script> -->

<style>
	/*  input				{ font: normal 12px Calibri, Arial; }*/
	/* #page-wrap				{ width: 900px; text-align:left; height:90%; } */
		
	#searchbox 				{ border:3px solid #ffee99; font-size: 25px; width: 100%; -moz-border-radius: 5px; font-weight: bold;  padding-left:5px; }
	
	/* #search-content 		{ display: none; }
	#footer 				{ text-align:center; font:normal 12px verdana; color:#888; clear:both; }
	.text-label 			{ background-image: url(real-time-search.png);  background-repeat:no-repeat; background-position:80px 0px; }
	.content 				{ border:0px solid gray; float:left; margin: 10px; }
	.content .header 		{ background-color: #ffee99; font-size: 18px; height:30px; -moz-border-radius:5px;  font: bold 18px Cambria ; margin: 0 -5px 10px -5px; padding: 6px 0 0 10px; }
	.content .data 			{ margin-bottom:10px;  }
	.content a 				{ font:normal 13px sans-serif; }
	a						{ color: #0075CA; }
	#image-content img		{ border:1px solid #ddd; margin:1px; padding:1px; } */
	#page-wrap{width:800px; margin:auto;min-height:800px;}
	
	.gsc-search-box{
		 display:none; 
	}
	
	.gsc-control-cse{
	    width: 100%;
    	background: lightskyblue;
    	border-radius: 8px;
	}

	.gsc-tabHeader.gsc-tabhInactive, .gsc-tabHeader.gsc-tabhActive {
	   	padding: .2rem .7rem;
	    color: #fff;
    	background-color: #28a745;
    	border-color: #28a745;
    	border-radius: 6px;
	    margin: -10px 2px;
	    line-height: 1rem;
	}
	.gsc-tabHeader.gsc-tabhActive {
    	background-color: #fff;
    	color: #000;
	}
	.gsc-results .gsc-cursor-box .gsc-cursor-page {
	    background-color: lightskyblue; 
	    color: #fff;
	}
	
</style>


<div id="page-wrap">
		
   <input type="text" placeholder="Recherche personnalisée" id="searchbox" name="searchbox"/>
   
   <script>
	  (function() {
	    var cx = '011239061933036351522:dp6gtigie_y';
	    var gcse = document.createElement('script');
	    gcse.type = 'text/javascript';
	    gcse.async = true;
	    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
	    var s = document.getElementsByTagName('script')[0];
	    s.parentNode.insertBefore(gcse, s);
		
	  })();
	</script>
	<gcse:search></gcse:search>
		
	
	<!-- <div style="height:30px"></div>
	
	
		
	<div id="search-content">
		<div class="content" style="width:400px; display:inline">
			<div class="header">Web</div>
			<div class="data" id="web-content"></div>
		</div>
	
		<div class="content" style="width:400px; display:inline">
			<div class="header">News</div>
			<div class="data" id="news-content"></div>
		</div>
	
		<div class="content" style="width:800px">
			<div class="header">Images</div>
			<div class="data" id="image-content"></div>
		</div>
	</div> -->
	
</div>


<script>
function search(query) {

/* 	if(query.length > 0) {
		$("#search-content").show();
		document.title = query + " | Real Time Search.." ;
		window.location.hash = "q=" + query;
	} else {
		document.title = "Real Time Search.." ;
		$("#search-content").hide();
	}

	imageSearch.execute(query);
	webSearch.execute(query);
	newsSearch.execute(query); */

	$('input.gsc-input').val(query);
	$('.gsc-search-button').trigger('click');
}

$(function(){
    $('#searchbox').keyup(function(){
    	var query = $(this).val();
    	search(query);

    });
});

/* var imageSearch;
var webSearch;
var newsSearch;
var blogSearch;
var lastSearch = 0;
$(function(){

	imageSearch = new google.search.ImageSearch();
  	imageSearch.setSearchCompleteCallback(this, imgSearchComplete, null);


	webSearch = new google.search.WebSearch();
  	webSearch.setSearchCompleteCallback(this, webSearchComplete, [webSearch, lastSearch]);

	newsSearch = new google.search.NewsSearch();
  	newsSearch.setSearchCompleteCallback(this, newsSearchComplete, [newsSearch, lastSearch]);


	var hash = window.location.hash;
	if(hash != "" && hash.length > 0) {

		if(hash.substr(0,3) == '#q=') {
			var query = hash.substr(3, hash.length-3);
			$('#searchbox').removeClass('text-label').val(query);
			search(query);
		}
	}

	$('#searchbox').focus();
});

function imgSearchComplete() {

	if (imageSearch.results && imageSearch.results.length > 0) {

    var contentDiv = document.getElementById('image-content');
    contentDiv.innerHTML = '';

    var results = imageSearch.results;
    for (var i = 0; i < results.length; i++) {

      var result = results[i];

      var imgContainer = document.createElement('div');
	  imgContainer.setAttribute("align", "left");
      //var title = document.createElement('div');

      //title.innerHTML = result.titleNoFormatting;

		var newLink = document.createElement('a');
		newLink.href = result.unescapedUrl
		newLink.target = "_new";
		newLink.title = result.titleNoFormatting ;

      var newImg = document.createElement('img');
      newImg.src = result.tbUrl;
      newImg.setAttribute("align", "left");

      newLink.appendChild(newImg);

      //imgContainer.appendChild(title);
      imgContainer.appendChild(newLink);

      // Put our title + image in the content
      contentDiv.appendChild(imgContainer);
    }
}
}

function webSearchComplete (searcher, searchNum) {
	var contentDiv = document.getElementById('web-content');
	contentDiv.innerHTML = '';


    var results = searcher.results;


    var newResultsDiv = document.createElement('div');
    newResultsDiv.id = 'web-content';
    for (var i = 0; i < results.length; i++) {
      var result = results[i];

	  var resultHTML = '<div style="height:70px; margin-top:5px;">';
      resultHTML += '<a href="' + result.unescapedUrl + '" target="_blank"><b>' +
                        result.titleNoFormatting + '</b></a><br/>' +
                        result.content +
                        '<div/>';
      newResultsDiv.innerHTML += resultHTML;
    }
    contentDiv.appendChild(newResultsDiv);
}

function newsSearchComplete (searcher, searchNum) {
	var contentDiv = document.getElementById('news-content');
	contentDiv.innerHTML = '';

    var results = searcher.results;
    var newResultsDiv = document.createElement('div');
    newResultsDiv.id = 'news-content';
    for (var i = 0; i < results.length; i++) {
      var result = results[i];
		var resultHTML = '<div style="height:70px; margin-top:5px;">';

		if(result.image != undefined) {
			resultHTML = '<img align="right" src="'+result.image.tbUrl+'"/>';
		}

      resultHTML += '<a href="' + result.unescapedUrl + '" target="_blank"><b>' +
                        result.titleNoFormatting + '</b></a><br/>';


      resultHTML += result.content + '<br/></div>';
      newResultsDiv.innerHTML += resultHTML;
    }
    contentDiv.appendChild(newResultsDiv);
}

$('#searchbox').keyup(function(){
	var query = $(this).val();
	search(query);

});

function search(query) {

	if(query.length > 0) {
		$("#search-content").show();
		document.title = query + " | Real Time Search.." ;
		window.location.hash = "q=" + query;
	} else {
		document.title = "Real Time Search.." ;
		$("#search-content").hide();
	}

	imageSearch.execute(query);
	webSearch.execute(query);
	newsSearch.execute(query);

}

$('#searchbox').each(function(){

	$(this).addClass('text-label');

	$(this).keyup(function(){
		if(this.value.length == 1) {
			$(this).removeClass('text-label');
		}
		if(this.value == '') {
			$(this).addClass('text-label');
		}
	});

}); */


</script>
