<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

#page-wrap{min-height:800px;}
figure,nav{display:block;}
a{background:0 0;}
a:active,a:hover{outline:0;}
h1{font-size:2em;margin:.67em 0;}
figure{margin:1em 40px;}
pre{overflow:auto;}
code,pre{font-family:monospace,monospace;font-size:1em;}
button{color:inherit;font:inherit;margin:0;}
button{overflow:visible;}
button{text-transform:none;}
button{-webkit-appearance:button;cursor:pointer;}
button::-moz-focus-inner{border:0;padding:0;}
@media print{
*{text-shadow:none!important;color:#000!important;background:transparent!important;box-shadow:none!important;}
a,a:visited{text-decoration:underline;}
a[href]:after{content:" (" attr(href) ")";}
a[href^="#"]:after{content:"";}
pre{border:1px solid #999;page-break-inside:avoid;}
p,h2{orphans:3;widows:3;}
h2{page-break-after:avoid;}
}
*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
:before,:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
button{font-family:inherit;font-size:inherit;line-height:inherit;}
a{color:#428bca;text-decoration:none;}
a:hover,a:focus{color:#2a6496;text-decoration:underline;}
a:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
figure{margin:0;}
h1,h2,h4{font-family:inherit;font-weight:500;line-height:1.1;color:inherit;}
h1,h2{margin-top:20px;margin-bottom:10px;}
h4{margin-top:10px;margin-bottom:10px;}
h1{font-size:36px;}
h2{font-size:30px;}
h4{font-size:18px;}
p{margin:0 0 10px;}
ul{margin-top:0;margin-bottom:10px;}
code,pre{font-family:Menlo,Monaco,Consolas,"Courier New",monospace;}
code{padding:2px 4px;font-size:90%;color:#c7254e;background-color:#f9f2f4;white-space:nowrap;border-radius:4px;}
pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:1.42857143;word-break:break-all;word-wrap:break-word;color:#333;background-color:#f5f5f5;border:1px solid #ccc;border-radius:4px;}
pre code{padding:0;font-size:inherit;color:inherit;white-space:pre-wrap;background-color:transparent;border-radius:0;}
.row{margin-left:-15px;margin-right:-15px;}
.col-md-3,.col-md-9{position:relative;min-height:1px;padding-left:15px;padding-right:15px;}
@media (min-width:992px){
.col-md-3,.col-md-9{float:left;}
.col-md-9{width:75%;}
.col-md-3{width:25%;}
}
.btn{display:inline-block;margin-bottom:0;font-weight:400;text-align:center;vertical-align:middle;cursor:pointer;background-image:none;border:1px solid transparent;white-space:nowrap;padding:6px 12px;font-size:14px;line-height:1.42857143;border-radius:4px;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;}
.btn:focus,.btn:active:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px;}
.btn:hover,.btn:focus{color:#333;text-decoration:none;}
.btn:active{outline:0;background-image:none;-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125);}
.btn-primary{color:#fff;background-color:#428bca;border-color:#357ebd;}
.btn-primary:hover,.btn-primary:focus,.btn-primary:active{color:#fff;background-color:#3276b1;border-color:#285e8e;}
.btn-primary:active{background-image:none;}
.nav{margin-bottom:0;padding-left:0;list-style:none;}
.nav>li{position:relative;display:block;}
.nav>li>a{position:relative;display:block;padding:10px 15px;}
.nav>li>a:hover,.nav>li>a:focus{text-decoration:none;background-color:#eee;}
.nav-tabs{border-bottom:1px solid #ddd;}
.nav-tabs>li{float:left;margin-bottom:-1px;}
.nav-tabs>li>a{margin-right:2px;line-height:1.42857143;border:1px solid transparent;border-radius:4px 4px 0 0;}
.nav-tabs>li>a:hover{border-color:#eee #eee #ddd;}
.nav-tabs>li.active>a,.nav-tabs>li.active>a:hover,.nav-tabs>li.active>a:focus{color:#555;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent;cursor:default;}
.tab-content>.tab-pane{display:none;}
.tab-content>.active{display:block;}
.row:before,.row:after,.nav:before,.nav:after{content:" ";display:table;}
.row:after,.nav:after{clear:both;}
/*! CSS Used from: https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css */
.btn-primary{text-shadow:0 -1px 0 rgba(0,0,0,.2);-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.15),0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 0 rgba(255,255,255,.15),0 1px 1px rgba(0,0,0,.075);}
.btn-primary:active{-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125);}
.btn:active{background-image:none;}
.btn-primary{background-image:-webkit-linear-gradient(top,#428bca 0,#2d6ca2 100%);background-image:linear-gradient(to bottom,#428bca 0,#2d6ca2 100%);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca', endColorstr='#ff2d6ca2', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);background-repeat:repeat-x;border-color:#2b669a;}
.btn-primary:hover,.btn-primary:focus{background-color:#2d6ca2;background-position:0 -15px;}
.btn-primary:active{background-color:#2d6ca2;border-color:#2b669a;}
/*! CSS Used from: https://stuk.github.io/jszip/documentation/css/pygments.css */
.err{border:1px solid #FF0000;}
.k{color:#008000;font-weight:bold;}
.o{color:#666666;}
.c1{color:#408080;font-style:italic;}
.kd{color:#008000;font-weight:bold;}
.s{color:#BA2121;}
.na{color:#7D9029;}
.nb{color:#008000;}
.ni{color:#999999;font-weight:bold;}
.nt{color:#008000;font-weight:bold;}
.s2{color:#BA2121;}
/*! CSS Used from: https://stuk.github.io/jszip/documentation/css/main.css */
.show-example{padding:10px;border:1px solid #ccc;border-radius:4px;margin:0 0 10px;}
.tab-pane > figure.highlight > pre,.tab-pane > .show-example{border-radius:0 0 4px 4px;border-top:0px;}
</style>


<%-- <link rel="stylesheet" type="text/css"	href="<c:url value='/static/login.css' />" /> --%>
<div id="page-wrap">
	<div class="row">
        <nav class="col-md-3">        
	        <h4>How to ...</h4>
	        <ul class="nav">
	              <li><a href="/jszip/documentation/examples.html">Use JSZip</a></li>
	              <li><a href="/jszip/documentation/howto/read_zip.html">Read a file</a></li>
	              <li><a href="/jszip/documentation/howto/write_zip.html">Write a file</a></li>
	        </ul>
	        <h4>Examples</h4>
	        <ul class="nav">
	              <li><a href="/jszip/documentation/examples/read-local-file-api.html">Read local file</a></li>
	              <li><a href="/jszip/documentation/examples/get-binary-files-ajax.html">Read remote file</a></li>
	              <li><a href="/jszip/documentation/examples/download-zip-file.html">Give the user its zip file</a></li>
	              <li><a href="/jszip/documentation/examples/downloader.html">Mini app : downloader</a></li>
	        </ul>
        </nav>
        
        <div class="col-md-9">
          <h1>Download the generated zip file</h1>

          <h2>The FileSaver API</h2>
			<ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active">
			        <a href="#file-saver-result" aria-controls="file-saver-result" role="tab" data-toggle="tab">
			            result
			        </a>
			    </li>
			    <li role="presentation" class="">
			        <a href="#file-saver-js" aria-controls="file-saver-js" role="tab" data-toggle="tab">
			            js code
			        </a>
			    </li>
			    <li role="presentation" class="">
			        <a href="#file-saver-html" aria-controls="file-saver-html" role="tab" data-toggle="tab">
			            html code
			        </a>
			    </li>
			</ul>
			<div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="file-saver-result">
			        <div class="show-example">
			            <p>Works on firefox, chrome , opera &gt;= 15 and IE &gt;= 10 (but NOT in compatibility view).</p>
			<button id="blob" class="btn btn-primary">click to download</button>
			
			        </div>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="file-saver-js">
			<figure class="highlight"><pre><code class="language-js" data-lang="js"><span class="kd">var</span> <span class="nx">zip</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">JSZip</span><span class="p">();</span>
			<span class="nx">zip</span><span class="p">.</span><span class="nx">file</span><span class="p">(</span><span class="s2">"Hello.txt"</span><span class="p">,</span> <span class="s2">"Hello world</span><span class="err">\</span><span class="s2">n"</span><span class="p">);</span>
			
			<span class="nx">jQuery</span><span class="p">(</span><span class="s2">"#blob"</span><span class="p">).</span><span class="nx">on</span><span class="p">(</span><span class="s2">"click"</span><span class="p">,</span> <span class="kd">function</span> <span class="p">()</span> <span class="p">{</span>
			    <span class="nx">zip</span><span class="p">.</span><span class="nx">generateAsync</span><span class="p">({</span><span class="na">type</span><span class="p">:</span><span class="s2">"blob"</span><span class="p">}).</span><span class="nx">then</span><span class="p">(</span><span class="kd">function</span> <span class="p">(</span><span class="nx">blob</span><span class="p">)</span> <span class="p">{</span> <span class="c1">// 1) generate the zip file</span>
			        <span class="nx">saveAs</span><span class="p">(</span><span class="nx">blob</span><span class="p">,</span> <span class="s2">"hello.zip"</span><span class="p">);</span>                          <span class="c1">// 2) trigger the download</span>
			    <span class="p">},</span> <span class="kd">function</span> <span class="p">(</span><span class="nx">err</span><span class="p">)</span> <span class="p">{</span>
			        <span class="nx">jQuery</span><span class="p">(</span><span class="s2">"#blob"</span><span class="p">).</span><span class="nx">text</span><span class="p">(</span><span class="nx">err</span><span class="p">);</span>
			    <span class="p">});</span>
			<span class="p">});</span></code></pre></figure>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="file-saver-html">
			<figure class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p&gt;</span>Works on firefox, chrome , opera <span class="ni">&amp;gt;</span>= 15 and IE <span class="ni">&amp;gt;</span>= 10 (but NOT in compatibility view).<span class="nt">&lt;/p&gt;</span>
			<span class="nt">&lt;button</span> <span class="na">id=</span><span class="s">"blob"</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span><span class="nt">&gt;</span>click to download<span class="nt">&lt;/button&gt;</span></code></pre></figure>
			    </div>
			</div>
			
			<h2>The data URL</h2>
			<ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active">
			        <a href="#data-uri-result" aria-controls="data-uri-result" role="tab" data-toggle="tab">
			            result
			        </a>
			    </li>
			    <li role="presentation" class="">
			        <a href="#data-uri-js" aria-controls="data-uri-js" role="tab" data-toggle="tab">
			            js code
			        </a>
			    </li>
			    <li role="presentation" class="">
			        <a href="#data-uri-html" aria-controls="data-uri-html" role="tab" data-toggle="tab">
			            html code
			        </a>
			    </li>
			</ul>
			<div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="data-uri-result">
			        <div class="show-example">
			            <p>Does not work in IE, has restrictions on the length.</p>
			<button id="data_uri" class="btn btn-primary">click to download</button>
			
			
			        </div>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="data-uri-js">
			<figure class="highlight"><pre><code class="language-js" data-lang="js"><span class="kd">var</span> <span class="nx">zip</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">JSZip</span><span class="p">();</span>
			<span class="nx">zip</span><span class="p">.</span><span class="nx">file</span><span class="p">(</span><span class="s2">"Hello.txt"</span><span class="p">,</span> <span class="s2">"Hello world</span><span class="err">\</span><span class="s2">n"</span><span class="p">);</span>
			
			<span class="nx">jQuery</span><span class="p">(</span><span class="s2">"#data_uri"</span><span class="p">).</span><span class="nx">on</span><span class="p">(</span><span class="s2">"click"</span><span class="p">,</span> <span class="kd">function</span> <span class="p">()</span> <span class="p">{</span>
			    <span class="nx">zip</span><span class="p">.</span><span class="nx">generateAsync</span><span class="p">({</span><span class="na">type</span><span class="p">:</span><span class="s2">"base64"</span><span class="p">}).</span><span class="nx">then</span><span class="p">(</span><span class="kd">function</span> <span class="p">(</span><span class="nx">base64</span><span class="p">)</span> <span class="p">{</span>
			        <span class="nb">window</span><span class="p">.</span><span class="nx">location</span> <span class="o">=</span> <span class="s2">"data:application/zip;base64,"</span> <span class="o">+</span> <span class="nx">base64</span><span class="p">;</span>
			    <span class="p">},</span> <span class="kd">function</span> <span class="p">(</span><span class="nx">err</span><span class="p">)</span> <span class="p">{</span>
			        <span class="nx">jQuery</span><span class="p">(</span><span class="s2">"#data_uri"</span><span class="p">).</span><span class="nx">text</span><span class="p">(</span><span class="nx">err</span><span class="p">);</span>
			    <span class="p">});</span>
			<span class="p">});</span></code></pre></figure>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="data-uri-html">
			<figure class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;p&gt;</span>Does not work in IE, has restrictions on the length.<span class="nt">&lt;/p&gt;</span>
			<span class="nt">&lt;button</span> <span class="na">id=</span><span class="s">"data_uri"</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span><span class="nt">&gt;</span>click to download<span class="nt">&lt;/button&gt;</span></code></pre></figure>
			    </div>
			</div>

		</div>
	</div>
</div>

