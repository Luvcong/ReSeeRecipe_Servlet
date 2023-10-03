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
	<button type="button" id="heartTest">0</button>
	
	<script>
		$(function(){
			
			/* 특정 대상의 좋아요 수 카운트 */
			$("#heartTest").click(function(){
				$.ajax({
					url : 'heartCount.ht',
					type : 'post',
					data : {
							htTargetNo : 2,
							htKind : 'recipe'
							},
					success : function(result){
						console.log('결과');
						if(result != '') {
							$('#heartTest').html(result);
						} else {
							$('#heartTest').html('님머함');
						}
					},
					error : function(result){
						console.log('실패');
						$('#heartTest').html('님머함');
					}
				})
			})
			
		})
	</script>
</body>
</html>