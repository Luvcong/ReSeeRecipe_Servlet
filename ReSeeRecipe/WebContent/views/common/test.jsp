<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<style>
button {
	width: 30px;
	height: 30px;
}
button:hover {
	cursor: pointer;
	background-color: grey;
}
</style>


</head>
<body>

	

	특정레시피 : <button type="button" id="heartCount1"></button><br>
	특정북마크 : <button type="button" id="heartCount2"></button><br>
	특정노티스 : <button type="button" id="heartCount3"></button><br>
	특정구독 　: <button type="button" id="heartCount4"></button><br>
	특정리플 　: <button type="button" id="heartCount5"></button><br>
	
	<script>
		$(function(){
			$.ajax({
				url : 'htCountRecipe.ht',
				method : 'get',
				data : { htTargetNo : 22 },
				success : function(result){
					$('#heartCount1').append(result);
				}
			
				
			})
		})
	
	</script>
	<br><br><br><br><br>
	
	
	<!-- http://localhost:포트번호/recipe/views/common/test.jsp 로 접속해 임시 테스트가능 -->
	레시피 : <button type="button" id="heartTest1">레</button><br>
	북마크 : <button type="button" id="heartTest2">북</button><br>
	노티스 : <button type="button" id="heartTest3">노</button><br>
	구독 　: <button type="button" id="heartTest4">구</button><br>
	리플 　: <button type="button" id="heartTest5">리</button><br>
	
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
					data : { htTargetNo : 4 },
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
	<br><br>

	
	
	
	
</body>
</html>