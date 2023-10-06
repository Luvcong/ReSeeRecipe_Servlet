<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReSee:Recipe 관리자화면</title>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="<%= contextPath %>/resources/css/manager.css">
<!-- css파일 따로 뺴서 link -->
<style>
.category{
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
			<!-- 게시판 관리 카테고리 -->
			<div class="nav-item">
				<a href="#" id="HL_memberManage">게시판 관리</a>
			</div>
			<div class="category" id="HL_boardList">
				<ul>
					<li><a href="#" id="HL_NoticeManage">공지사항 게시판</a></li>
					<li><a href="#">레시피 게시판</a></li>
					<li><a href="#">셰프 게시판</a></li>
				</ul>
			</div>
			<!-- 회원 관리 카테고리 -->
			<div class="nav-item">
				<a href="#" id="HL_memberManage">회원 관리</a>
			</div>
			<div class="category" id="HL_memberList">
				<ul>
					<li><a href="#" id="HL_memberSetting" onclick="goMenu('/hlmembermanage.ma');">회원정보 관리</a></li>
					<li><a href="#">블랙리스트 관리</a></li>
					<li><a href="#">탈퇴회원 관리</a></li>
				</ul>
			</div>
			<!-- 주문 관리 카테고리 -->
			<div class="nav-item" >
				<a href="#">상품/주문 관리</a>
			</div>
			<div class="category">
				<ul>
					<li><a href="#">상품 등록</a></li>
					<li><a href="#">상품 조회/수정/삭제</a></li>
					<li><a href="#">주문 관리</a></li>
				</ul>
			</div>
			<!-- 문의 관리 카테고리 -->
			<div class="nav-item">
				<a href="#">문의 관리</a>
			</div>
			<div class="category">
				<ul>
					<li onclick="goMenu('/jhselect.dm')"><a href="#">쪽지함 관리</a></li>
					<li><a href="#">신고함 관리</a></li>
				</ul>
			</div>
			<!-- 메뉴 관리 카테고리 -->
			<div class="nav-item">
				<a href="#">메뉴 관리</a>
			</div>
			<div class="category">
				<ul>
					<li onclick="goMenu('/jhselect.ct')"><a href="#">카테고리 관리</a></li>
					<li><a href="#">해시태그 관리</a></li>
				</ul>
			</div>
			<!-- 리워드 관리 카테고리 -->
			<div class="nav-item">
				<a href="#">리워드 관리</a>
			</div>
			<div class="category">
				<ul>
					<li><a href="#">리워드 지급/차감</a></li>
					<li><a href="#">리워드 사용내역</a></li>
				</ul>
			</div>
			<!-- 쿠폰 관리 카테고리 -->
			<div class="nav-item">
				<a href="#">쿠폰 관리</a>
			</div>
			<div class="category">
				<ul>
					<li><a href="#">쿠폰 등록/삭제</a></li>
					<li><a href="#">쿠폰 발급</a></li>
					<li><a href="#">쿠폰 사용내역</a></li>
				</ul>
			</div>
		</div>	<!-- rs-navbar -->
			
		<!-- rs-content 추가된 영역 부분 -->
		
    </div>  <!-- rs-main -->
</body>

<script>
	<!-- rs-content(자식요소)를 rs-main안으로 이동시킨다 -->
	$(function(){
	    let main = document.querySelector('.rs-main');
	    let content = document.querySelector('.rs-content');
	    main.appendChild(content);
	});

    $(function(){
    	let $selectMenu = $('.nav-item').children();// a태그
    	$($selectMenu).click(function(){
    		//let $thisele = $(this);// 다음 div
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
    
    function goMenu(e){
		this.location.href = "<%=contextPath %>" + e;
	}

    
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
                $('.rs-content').jsp(data); // GSON 사용해야해서 내일 할게요 - 혜림 -- 넹♥
            }

        });
    }
    /*
    $(function(){
    	$('#HL_memberSetting').on("click", goMember);
    });
    function goMember(){
    	$.ajax({
    		type : "GET",
    		url : 'hlmembermanage.ma', //?cmpage=1
    		data : {cmpage : 1},
    		dataType : "html",
    		success : function(result){
    			//$('.rs-content').html(result);
    			console.log('회원 정보 조회 성공');
    			console.log(result);
    			//JSON.parse(result);
    			//console.log(result);
    			//selectMemberAll();
    			//$('.rs-content').text('회원번호' + result[0].memNo);
    			/* $('.rs-content').html(
    					'<'
    					'회원번호' + result[0].memNo); */
  /*  			//createMemTable(result);
    			$('.rs-content').html(result);
    			//$('.rs-content').load("${contextPath}/views/member/memberManager.jsp .rs-content");
    			//$('.rs-content').jsp(result);
    		},
    		error : function(result){
    			console.log(JSON.parse(result));
    			console.log('회원 정보 조회 실패');
    			$('.rs-content').text('조회된 회원이 없습니다');
    		}
    	
    	});
    }
    */
    
	/* 나중에 사용할 수 도 있을거 같아유 */
    function createMemTable(result){
    	 $newTable = $("<br><br><table class='table' id='memAll'><tbody id='memAllList'></tbody></table>");
    	 $('.rs-content').append($newTable);
    	 for(let i in result){
    		 let $newTbody = $("<tr>" + 
    			"<td>" + result[i].memNo + "</td>" +
    			"<td>" + result[i].memName + "</td>" +
    			"<td>" + result[i].memId + "</td>" +
    			"<td>" + result[i].memNickname + "</td>" +
    			"<td>" + result[i].memEmail + "</td>" +
    			"<td>" + result[i].enrollDate + "</td>" +
    			"<td>" + result[i].memReward + "</td>"
    			+ "</tr>");
    		$newTable.append($newTbody);
    	 }
    }

</script>

<!-- 문의관리 ajax -->
<!-- <script>
	$(function(){
		$('#dmManager').on('click', dmListView);	// 해당 id를 갖고 있는 요소에 onclick event 속성을 준다 (호출 함수명 : dmListView)
		});
	
	function dmListView(){
		$.ajax({
			url : 'jhselect.dm',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('.rs-content').html(result);		// 성공시 - 해당 ulr에 있는 .rs-content를 html로 뿌리기
			},
			error : function(result){
				$('.rs-content').text('Error 다시 시도해주세요');
			}
		});
	
	}	// 쪽지함리스트(dmListView)

</script> -->

<!-- 카테고리관리 ajax -->
<script>

	$(function(){
		$('#categoryManager').on('click', categoryListView);
	});
	
	function categoryListView(){
		$.ajax({
			url : 'jhselect.ct',
			type : 'get',
    		dataType : 'html',
			success : function(result){
				$('.rs-content').html(result);
				console.log("성공");
			},
			error : function(result){
				$('.rs-content').text('Error! 다시 시도해주세요');
				console.log("실패");
			}
		});
	}	// 카테고리리스트(categoryListView)

</script>

</html>