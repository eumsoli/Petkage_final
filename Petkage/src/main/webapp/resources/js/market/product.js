$(document).ready(() => {
    // 카테고리 버튼 클릭을 통한 상품 목록 조회
    
    var btn = document.getElementsByClassName("categoryBtn");

    btnIterator();

    function btnIterator() {
        for (var i = 0; i < btn.length; i++) {
            btn[i].addEventListener("click", btnChange);
        }
        for (var i = 0; i < btn.length; i++) {
            btn[i].addEventListener("click", btnClicked);
        }
    }

    function btnChange(event) {
        console.log(event.target);
        // console.log(this);
        console.log(event.target.classList);

        if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
        } else {
            for (var i = 0; i < btn.length; i++) {
                btn[i].classList.remove("clicked");
            }
            event.target.classList.add("clicked");
        }
    }

	function btnClicked(event) {
		
	}

    // 상품 상세 페이지 상단바

    var topBar = $("#topFix").offset();
    $(window).scroll(function(){
        var docScrollY = $(document).scrollTop()
        var barThis = $("#topFix")
        var fixNext = $("#belowFix")
        if( docScrollY > topBar.top ) {
            barThis.addClass("top_bar_fix");
            fixNext.addClass("pd_top_80");
        }else{
            barThis.removeClass("top_bar_fix");
            fixNext.removeClass("pd_top_80");
        }
    });

    const modal = document.querySelector(".modal");
    const img = document.querySelector(".img");
    const modal_img = document.querySelector(".modal_content");
    const span = document.querySelector(".close");

    img.addEventListener('click', () => {
        modalDisplay("block");
        modal_img.src = img.src;
    });
    span.addEventListener('click', () => {
        modalDisplay("none");
    });
    modal.addEventListener('click', () => {
        modalDisplay("none");
    });
    function modalDisplay(text){
        modal.style.display = text;
    }
    
    $("#btnDelProd").on("click", () => {
        if(confirm("정말로 게시글을 삭제하시겠습니까?")) {
            location.replace("${ path }/market/product-delete?proNo=${ product.proNo }");
        };
    });

	// 주문 수량 선택
	var quantity = $(".qty-input").val();
	$(".plus-btn").on("click", function(){
		$(".qty-input").val(++quantity);
		$("#totalPrice").text((${ product.proSPrice } * quantity).toLocaleString());
	});
	$(".minus-btn").on("click", function(){
		if(quantity > 1){
			$(".qty-input").val(--quantity);
    		$("#totalPrice").text((${ product.proSPrice } * quantity).toLocaleString());
		}
	});
});