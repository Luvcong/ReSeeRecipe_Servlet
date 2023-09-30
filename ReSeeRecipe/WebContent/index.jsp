<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReSee : Recipe</title>

<style>
	div {
		border: 1px solid red;
		box-sizing: border-box;
	}
	
	#wrap_content {
		width: 1200px;
		height: 900px;
		margin: auto;
	}
	
	#wrap_content > div {
		width: 100%;
	}
	
	#content {
		height: 100%;
	}
	
	#content > div {
		height: 25%;
	}
	
	#content_1 > div {
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
		float: right;
	}
	
</style>

</head>

<body>
	
	<%@ include file="views/common/header.jspf" %>
		
	<%@ include file="views/common/nav.jspf" %>
		
	<div id="wrap_content">	
		<div id="content">
			<div id="content_1">
				<div id="content1_1">
					<button type="button" id="arrowL"><i class="fa-solid fa-chevron-left"></i></button>
                </div>
                <div id="content1_2">
                    <img src="resources/img/제1회요리대회썸네일.png" alt="">
                </div>
                <div id="content1_3">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
          
            <div id="content_2">
                <!-- 최신 레시피 더보기 -->
                <div id="content_2_1" class="more_content_area1">
                    <div id="content_2_1a" class="more_content_title_a"><p>최신레시피</p></div>
                    <div id="content_2_1b" class="more_content_title_b" onclick="location.href='#';"><p>더보기</p></div>
                </div>
                <!-- 사진 썸네일 영역 -->
                <div id="content_2_2" class="more_content_area2">
                    <div id="content2_2a"><a href="#"><img src="#">이미지1</a></div>
                    <div id="content2_2b"><a href="#"><img src="#">이미지2</a></div>
                    <div id="content2_2c"><a href="#"><img src="#">이미지3</a></div>
                </div>
            </div>

            <div id="content_3">
                <!-- 지금HOT한 레시피 더보기 -->
                <div id="content_3_1" class="more_content_area1">
                    <div id="content_3_1a" class="more_content_title_a"><p>지금 HOT한 레시피</p></div>
                    <div id="content_3_1b" class="more_content_title_b" onclick="location.href='#';"><p>더보기</p></div>
                </div>
                <!-- 사진 썸네일 영역 -->
                <div id="content_3_2" class="more_content_area2">
                    <div id="content3_2a"><a href="#"><img src="#">이미지1</a></div>
                    <div id="content3_2b"><a href="#"><img src="#">이미지2</a></div>
                    <div id="content3_2c"><a href="#"><img src="#">이미지3</a></div>
                </div>
            </div>

            <div id="content_4">
                <p>인기 Re See 템</p><a href="">더보기</a>
            </div>
        </div>
	</div>
	
	<%@ include file="views/common/footer.jspf" %>

</body>
</html>