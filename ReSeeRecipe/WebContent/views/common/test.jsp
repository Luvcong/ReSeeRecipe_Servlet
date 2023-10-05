<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
</head>
<body>

	<!-- http://localhost:8001/recipe/views/common/test.jsp 로 접속해 임시 테스트가능 -->
	레시피 : <button type="button" id="heartTest1">레시피</button>
	북마크 :<button type="button" id="heartTest2">0</button>
	노티스 :<button type="button" id="heartTest3">0</button>
	구독   :<button type="button" id="heartTest4">0</button>
	리플   :<button type="button" id="heartTest5">0</button>
	
	<script>
		$(function(){
			
			/* 좋아요하기 레시피 */
			$("#heartTest1").click(function(){
				$.ajax({
					url : 'htChangeRecipe.ht',
					type : 'post',
					data : { htTargetNo : 22 },
					success : function(result){
						console.log('결과');
						if(result > 0) {
							$('#heartTest1').html(result).css('background-color', 'red');
						}
						else {
							$('#heartTest1').html(result).css('background-color', 'white');
						}
					},
					error : function(result){
						$('#heartTest').html('실패');
					}
				})
			});
			/* 좋아요하기 북마크 */
			$("#heartTest2").click(function(){
				$.ajax({
					url : 'htChangeBookmark.ht',
					type : 'post',
					data : { htTargetNo : 22 },
					success : function(result){
						console.log('결과');
						if(result > 0) {
							$('#heartTest2').html(result).css('background-color', 'red');
						}
						else {
							$('#heartTest2').html(result).css('background-color', 'white');
						}
					},
					error : function(result){
						$('#heartTest2').html('실패');
					}
				})
			});
			/* 좋아요하기 노티스 */
			$("#heartTest3").click(function(){
				$.ajax({
					url : 'htChangeNotice.ht',
					type : 'post',
					data : { htTargetNo : 1 },
					success : function(result){
						console.log('결과');
						if(result > 0) {
							$('#heartTest3').html(result).css('background-color', 'red');
						}
						else {
							$('#heartTest3').html(result).css('background-color', 'white');
						}
					},
					error : function(result){
						$('#heartTest3').html('실패');
					}
				})
			});
			/* 좋아요하기 subsc */
			$("#heartTest4").click(function(){
				$.ajax({
					url : 'htChangeSubsc.ht',
					type : 'post',
					data : { htTargetNo : 3 },
					success : function(result){
						console.log('결과');
						if(result > 0) {
							$('#heartTest4').html(result).css('background-color', 'red');
						}
						else {
							$('#heartTest4').html(result).css('background-color', 'white');
						}
					},
					error : function(result){
						$('#heartTest4').html('실패');
					}
				})
			});
			/* 좋아요하기 리플 */
			$("#heartTest5").click(function(){
				$.ajax({
					url : 'htChangeReply.ht',
					type : 'post',
					data : { htTargetNo : 22 },
					success : function(result){
						console.log('결과');
						if(result > 0) {
							$('#heartTest5').html(result).css('background-color', 'red');
						}
						else {
							$('#heartTest5').html(result).css('background-color', 'white');
						}
					},
					error : function(result){
						$('#heartTest5').html('실패');
					}
				})
			})
			
		})
	</script>
</body>
</html>