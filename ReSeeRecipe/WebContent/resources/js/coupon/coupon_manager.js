//  couponListView

// 페이지 이동
	function page(element){
		this.location.href = "/ReSeeRecipe/jhselect.cp?page=" + element;
	}	// page
	
// 쿠폰 등록(추가)
	function showAddCouponModal(){
		
//		const day = new Date();
//		const offset = new Date().getTimezoneOffset() * 60000;
//		const today = new Date(Date.now() - offset);
//		console.log(day);
//		console.log(offset);
//		console.log(today);
		
		let toISOStringDate = new Date().toISOString();
		// console.log(toISOStringDate);
		let startDate = document.getElementById('startDate');
		let endDate = document.getElementById('endDate');
		
		let startVal = new Date().toISOString().substring(0, 10);
		let endVal = new Date().toISOString().substring(0, 10);
		
		startDate.value = startVal;
		endDate.value = endVal;
		startDate.setAttribute("min", startVal);
		endDate.setAttribute("min", endVal);
		
		// toISOString : 국제 표준시 기준 형식으로 반환
		// https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString
		
		let input = document.getElementById('couponPercent');
		console.log(input);
		input.value = '';
		
		$('#addCouponForm').modal('show');
		
	}	// showAddCouponModal
	
	
	
	