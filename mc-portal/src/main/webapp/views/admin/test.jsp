<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.container p a {
    color: #333;
    text-decoration: none;
    border-bottom: 2px solid #ddd;
    padding-bottom: 2px;
    background-image: -webkit-linear-gradient(rgba(238, 187, 51, 1) 0%, rgba(238, 187, 51, 1) 100%);
    background-image: linear-gradient(rgba(238, 187, 51, 1) 0%, rgba(238, 187, 51, 1) 100%);
    background-repeat: repeat-y;
    background-size: 0% 0em;
    background-position: 0 65%;
    -webkit-transition: 600ms ease;
    transition: 600ms ease;
}
.container{
	background: -webkit-gradient(
		linear,
		left top, left bottom,
		from(royalblue),
		to(lightblue)
	);
	background: -webkit-linear-gradient(
		top,
		royalblue,
		lightblue
	);
	background: -moz-linear-gradient(
		top,
		royalblue,
		lightblue
	);
	background: -o-linear-gradient(
		top,
		royalblue,
		lightblue
	);
	background: linear-gradient(
		top,
		royalblue,
		lightblue
	);
}
</style>
<div class="container">

	<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. 
	<a title="Générateur de webfonts par FontSquirrel" href="http://www.fontsquirrel.com/tools/webfont-generator" target="_blank" rel="noopener">générateur de webfonts de FontSquirrel</a>Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> 
	in turpis pulvinar facilisis. Ut felis.</p>
</div>