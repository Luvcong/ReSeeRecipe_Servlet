<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReSee : Recipe</title>
</head>

<body>
	<div id="wrap">
		<%@ include file="views/common/header.jsp" %>
		
	
		
		<%--@ include file="views/common/nav.jsp" --%>
					
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
	
		<%--@ include file="views/common/footer.jsp" --%>
	
	</div>
</body>
</html>