<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String alertMsg = (String)request.getAttribute("alertMsg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReSee : Recipe</title>
<!-- swiper.js 라이브러리추가 -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<style>
	/*****************************************/
	/* content 스타일 */
	div {
		
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
	
	/* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 1200px;
        height: 500px;
    }
​
    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }
​
    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
	
	
	
</style>

</head>

<body>
	<!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="views/common/header.jspf" %>
	
	<% if(alertMsg != null) { %>
		<script>
			alert(<%= alertMsg %>);
		</script>
		
	<% } %>
	
	
	<!-- content부분 (홈페이지 메인) -->	
	<div id="wrap_content">	
		<div id="content">
		<div id="content_1">
        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide"><img src="resources/css/common/제1회요리대회썸네일.png"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"></div>
            </div>
        
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- If we need scrollbar -->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>
		
		<!-- <div id="content_1">
				<div id="content1_1">
					<button type="button" id="arrowL"><i class="fa-solid fa-chevron-left"></i></button>
                </div>
                <div id="content1_2">
                    <img src="resources/img/제1회요리대회썸네일.png" alt="">
                </div>
                <div id="content1_3">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>  -->	
          
            <div id="content_2">
                <!-- 최신 레시피 더보기 -->
                <div id="content_2_1" class="more_content_area1">
                    <div id="content_2_1a" class="more_content_title_a"><p>최신레시피</p></div>
                    <div id="content_2_1b" class="more_content_title_b" onclick="location.href='<%=contextPath%>/selectRecipeList.re?currentPage=1'"><p>더보기</p></div>
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
                    <div id="content_3_1b" class="more_content_title_b" onclick="location.href='<%=contextPath%>/selectRecipeList.re?currentPage=1'"><p>더보기</p></div>
                </div>
                <!-- 사진 썸네일 영역 -->
                <div id="content_3_2" class="more_content_area2">
                    <div id="content3_2a"><a href="#"><img src="#">이미지1</a></div>
                    <div id="content3_2b"><a href="#"><img src="#">이미지2</a></div>
                    <div id="content3_2c"><a href="#"><img src="#">이미지3</a></div>
                </div>
            </div>

            <div id="content_4">
            	<!-- 지금HOT한 레시피 더보기 -->
                <div id="content_3_1" class="more_content_area1">
                    <div id="content_3_1a" class="more_content_title_a"><p>인기 Re See 템</p></div>
                    <div id="content_3_1b" class="more_content_title_b" onclick="location.href='<%=contextPath %>/main.po'"><p>더보기</p></div>
                </div>
                <!-- 사진 썸네일 영역 -->
                <div id="content_3_2" class="more_content_area2">
                    <div id="content3_2a"><a href="#"><img src="#">이미지1</a></div>
                    <div id="content3_2b"><a href="#"><img src="#">이미지2</a></div>
                    <div id="content3_2c"><a href="#"><img src="#">이미지3</a></div>
                </div>
            </div>
        </div>
	</div>
	
	<script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
    </script>
	
	<!-- footer 푸터영역 -->
	<%@ include file="views/common/footer.jspf" %>

</body>
</html>