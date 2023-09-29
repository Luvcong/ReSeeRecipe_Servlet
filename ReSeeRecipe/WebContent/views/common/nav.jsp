<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		border: 1px solid red;
		box-sizing: border-box;
	}
	
	#wrap {
		width: 1200px;
		height: 1200px;
		margin: auto;
	}
	
	#wrap>div {
		width: 100%;
	}
	
	#header, #footer {
		height: 15%;
	}
	
	#navigator {
		height: 5%;
	}
	
	#content {
		height: 65%;
	}
	
	#header>div, #footer>div {
		height: 100%;
		float: left;
	}
	
	#content>div {
		height: 25%;
	}
	
	#header_1, #header_3 {
		width: 30%;
	}
	
	#header_2 {
		width: 40%;
		text-align: center;
	}
	
	#footer_1 {
		width: 75%;
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	
	#footer_2 {
		width: 25%;
	}
	
	#header_3_1>div {
		height: 100%;
		float: left;
	}
	
	#header_3_1_1, #header_3_1_2, #header_3_1_3, #header_3_1_4 {
		width: 25%;
		text-align: center;
		padding: 6px;
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	
	#header_2 img {
		height: 100%;
	}
	
	#header_3_1 {
		height: 40%;
	}
	
	#header_3_2 {
		position: relative;
	}
	
	#search_form {
		width: 70%;
		height: 20%;
		position: absolute;
		text-align: center;
		left: 20px;
		margin-top: 25px;
	}
	
	#search_form>div {
		height: 100%;
		float: left;
	}
	
	#search_text {
		width: 90%;
	}
	
	#search_btn {
		width: 10%;
	}
	
	#search_form input {
		box-sizing: border-box;
		border: 1px solid rgb(255, 145, 77);
	}
	
	#search_form input[type=submit] {
		background-color: rgb(255, 145, 77);
	}
	
	/* 여기부터 navi CSS */
	#navi {
		list-style: none;
		margin: 0;
		padding: 0;
		height: 100%;
	}
	
	#navi>li {
		background-color: rgb(255, 222, 89);
		float: left;
		height: 100%;
		width: 200px;
		text-align: center;
	}
	
	#navi a {
		text-decoration: none;
		width: 100%;
		height: 100%;
		display: block;
		line-height: 40px;
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: 20px;
		padding: 5px;
	}
	
	#content_1>div {
		height: 100%;
		float: left;
	}
	
	#content1_1, #content1_3 {
		height: 100%;
		width: 30%;
	}
	
	#content1_2 {
		width: 40%;
		height: 100%;
		text-align: center;
	}
	
	#content1_2>img {
		height: 100%;
	}
	
	#arrowL {
		margin-left: 90%;
		margin-top: 25%;
	}
	
	/* Content_2, Content_3 영역 레시피 더보기 */
	#content_2, #content_3 {
		width: 100%;
		box-sizing: border-box;
		margin: auto;
	}
	
	.more_content_area1 {
		height: 25%;
	}
	
	.more_content_title_a {
		width: 85%;
		height: 100%;
		float: left;
		padding-left: 1%;
		padding-top: 1%;
	}
	
	.more_content_title_a p {
		margin: 0px;
	}
	
	.more_content_title_b {
		width: 15%;
		height: 100%;
		float: right;
		padding-right: 5.5%;
		padding-top: 1%;
		text-align: right;
		cursor: pointer;
	}
	
	.more_content_title_b p {
		margin: 0px;
	}
	
	.more_content_area2 {
		height: 75%;
	}
	
	.more_content_area2 div {
		display: inline-block;
		width: 33%;
		height: 100%;
	}
	
	#footer1_1 {
		font-size: 17px;
	}
	
	#footer1_2 {
		font-size: 15px;
	}
	
	#footer_2_1 {
		height: 30%;
		margin-left: 40%;
		margin-top: 5%;
	}
	
	#footer_2_2 {
		height: 70%;
	}
</style>
</head>

<nav>
	<div id="navigator">
 		<ul id="navi">
	        <li>
	            <a href="">레시피</a>
	        </li>
	        <li>
	            <a href="">셰프</a>
	        </li>
	        <li>
	            <a href="">마켓</a>
	        </li>
		</ul>
	</div>
</nav>

</html>