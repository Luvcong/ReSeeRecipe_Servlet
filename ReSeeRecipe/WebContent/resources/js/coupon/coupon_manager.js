//  couponListView

// 페이지 이동
	function page(element){
		this.location.href = "/ReSeeRecipe/jhselect.cp?page=" + element;
	}	// page
	
// 쿠폰 등록(추가)
	function showAddCouponModal(){
		
		$('#addCouponForm').modal('show');
		
	}	// showAddCouponModal