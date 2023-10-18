// 선택된 옵션값 초기화
var $selected = 'recentSort';
var $memNo = $('#memNo').text();
console.log($memNo);

// 정렬 선택 시, 선택된 옵션값 대입        
function selected(){
    console.log("엥?");
    var $selected = $('#couponSort').val();
    console.log($selected);
    $.ajax({
        url : 'yrmemberCouponListSort.me',
        data : {selected : $selected,
                memNo : $memNo},
        success : function(result) {
            console.log("아악");
            // console.log(result);
            console.log(result);
            console.log(result[0].couponName);
            console.log(result[0].couponRatio);
            
            var container = $('.container'); // 기존의 container 요소 선택
            $('[name="coupon-div"]').remove();
            // 반환된 데이터를 반복하며 쿠폰 정보를 추가
            for (var i = 0; i < result.length; i++) {
                var newDiv = $('<div class="devide" name="coupon-div">');
                newDiv.html('<div class="coupon" name="coupon1">' +
                    '<p name="couponName">' + result[i].couponName + '</p>' +
                    '<p name="couponExpire">' + result[i].couponExpire + '일 남음</p>' +
                    '</div>' +
                    '<div class="coupon" name="coupon2">' +
                    '<p name="percent">' + result[i].couponRatio + '%</p>' +
                    '<button>적용상품 보러가기</button>' +
                    '</div>');

                container.append(newDiv); // 새로운 데이터가 들어있는 div를 기존 container에 추가
            }

            
        },
        error : function(result) {
            console.log("통신실패");
        }
    })
}