<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자화면 틀</title>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- css파일 따로 뺴서 link -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manager.css">

<style>
#HL_boardList {
	display: none;
}

#HL_memberList {
	display: none;
}
</style>

</head>


<body>

	<!-- 관리자메뉴 title 상단 -->
	<div class="rs-title">관리자 메뉴</div>

	<!-- 카테고리 리스트 -->
	<div class="rs-main">
		<div class="rs-navbar">
			<div class="nav-item">
				<a href="#" id="HL_boardMange">게시판 관리</a>
			</div>
			<div id="HL_boardList">
				<ul>
					<li><a href="#" id="HL_NoticeManage">공지사항 게시판</a></li>
					<li><a href="#">레시피 게시판</a></li>
					<li><a href="#">셰프</a></li>
				</ul>
			</div>
			<div class="nav-item">
				<a href="#" id="HL_memberManage">회원 관리</a>
			</div>
			<div id="HL_memberList">
				<ul>
					<li><a href="#">회원 관리</a></li>
					<li><a href="#">블랙리스트 관리</a></li>
					<li><a href="#">탈퇴회원 관리</a></li>
				</ul>
			</div>
			<div class="nav-item">
				<a href="#">주문 관리</a>
			</div>
			<div class="nav-item active">
				<a href="#">문의 관리</a>
			</div>
			<div class="nav-item">
				<a href="#">메뉴 관리</a>
			</div>
			<div class="nav-item">
				<a href="#">리워드 관리</a>
			</div>
			<div class="nav-item">
				<a href="#">쿠폰 관리</a>
			</div>
		</div>
		<!-- rs-content추가 -->
	</div>
	<!-- rs-main -->

</body>

<!-- rs-content(자식요소)를 rs-main안으로 이동시킨다 -->
<script>
    $(function(){
        let main = document.querySelector('.rs-main');
        let content = document.querySelector('.rs-content');
        main.appendChild(content);
    });
    
    $(function(){
    	let $selectMenu = $('.nav-item').children();// a태그
    	$($selectMenu).click(function(){
    		let $thisele = $(this);// 다음 div
    		let $prevShowList = $(this).parent();// 다음 div
    		let $showList =  $prevShowList.next();// 다음 div
    		/*
			console.log('prev >> ', $prevShowList);    		
			console.log('list >> ', $showList);    		
			console.log('this >> ', $thisele);  
			*/
    		if($showList.css('display') == 'none'){
    			$showList.css('display', 'block');
    		} else {
    			$showList.css('display', 'none');
    		}
    	});
    	//console.log($selectMenu);
/*
		$('#HL_boardMange').click(function(){
    	let $Div = $(this).find('ul');
        if($Div.css('display') == 'none'){
    		$('#HL_boardList').css('display', 'block');
        }else{
    		$('#HL_boardList').css('display', 'none');
        } */
    	
    })
    
    
    
    $(function(){
    	
    	$('#HL_NoticeManage').on("click", gonotice);
    });
    function gonotice() {
        $.ajax({
            type: "GET",
            url: "noticeManager.jsp",
            dataType: "text",
            error: function () {
                alert('통신실패!!');
            },
            success: function (data) {
                $('.rs-content').jsp(data); // GSON 사용해야해서 내일 할게요 - 혜림
            }

        });
    }
    
</script>

</html>