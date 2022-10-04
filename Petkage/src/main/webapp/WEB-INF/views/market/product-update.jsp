<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">    

    <!-- Product CSS-->
    <link rel="stylesheet" href="${path}/resources/css/market/product.css">

    <!-- Common CSS -->
    <link rel="stylesheet" href="/EUM/CSS/common/header.css"></link>
    <link rel="stylesheet" href="/EUM/CSS/common/footer.css"></link>
    
    <!-- jQuery JS -->  
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>   

    <!-- summernote CSS/JS -->
    <script src="${path}/resources/js/market/summernote/summernote-lite.js"></script>
    <script src="${path}/resources/js/market/summernote/lang/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="${path}/resources/css/market/summernote/summernote-lite.css">

	<style type="text/css">
		@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	</style>

    <title>Header</title>
</head>
<body>
    <section class="hd">
        <div class="header_container">
            <header class="d-flex flex-wrap mb-4">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                    <img src="/EUM/resources/images/Petkage_Logo2.png" alt="" class="headerLogo">
                </a>

                <ul class="nav nav-pills">
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">어디가지</a></li>
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">커뮤니티</a></li>
                    <li class="nav-item header_item"><a href="/CHOI/HTML/product_list.html" class="nav-link header_link">마켓</a></li>
                    <li class="nav-item header_item"><a href="#" class="nav-link header_link">OTHERS</a></li>
                    <input type="button" class="headerBtn" id="loginBtn" value="로그인">
                    <a href="/" class="d-flex align-items-center headercart">
                        <img src="/EUM/resources/images/Cart.png" alt="" class="cart">
                    </a>
                </ul>
            </header>
        </div>
    </section>
    <div id="wrap-all-prod">
        <div class="row">
            <div class="contents">
                <br><br>
                <div class="row justify-content-center"><h2>상품 등록 수정</h2></div>
                <br><br>
                <form action="${ path }/market/product-update" method="POST" enctype="multipart/form-data">
                	<input type="hidden" name="proNo" value="${ product.proNo }">
                    <table class="table">
                        <tr>
                            <td><b>상품명</b></td>
                            <td><input type="text" name="proName" size="80" placeholder="노출 상품명 입력(브랜드명 + 상품명)" value="${ product.proName }"></td>
                        </tr>
                        <tr>
                            <td><b>브랜드</b></td>
                            <td><input type="text" name="proBrand" size="80" placeholder="노출 브랜드명 입력" value="${ product.proBrand }"></td>
                        </tr>
                        <tr>
                            <td><b>카테고리</b></td>
                            <td>
                                <select name="proCategory1" required>
                                    <option>카테고리 선택 1</option>
                                    <option value="dog">강아지</option>
                                    <option value="cat">고양이</option>
                                </select>
                                <select name="proCategory2" required>
                                    <option>카테고리 선택 2</option>
                                    <option value="food">사료/간식</option>
                                    <option value="health">건강/관리</option>
                                    <option value="poo">배변용품</option>
                                    <option value="living">리빙용품</option>
                                    <option value="beauty">미용/목욕</option>
                                    <option value="outdoor">야외용품</option>
                                    <option value="toy">장난감</option>
                                    <option value="fashion">패션용품</option>
                                    <option value="etc">기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><b>태그</b></td>
                            <td><input type="text" name="proTag" size="80" placeholder="쉼표(,)로 구분하여 최대 10개까지 입력 가능" value="${ product.proTag }"></td>
                        </tr>
                        <tr>
                            <td><b>대표 이미지</b></td>
                            <td><input type="file" name="upfile" id="cit_file_1"/>
                            	<c:if test="${ not empty product.renamedFileName }">
                            		<span>${ product.renamedFileName }</span>
                            	</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 1/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 2/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 3/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 4/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                        <tr>
                            <td><b>추가 이미지 5/5</b></td>
                            <td><input type="file" name="cit_file_1" id="cit_file_1" /></td>
                        </tr>
                    </table>
                    <table class="prod-input-detail">
                        <tr>
                            <td><b>상품 수량(개)</b></td>
                            <td><b>정상가(원)</b></td>
                            <td><b>판매가(원)</b></td>
                            <td><b>배송비(원)</b></td>
                            <td><b>출고 소요 기간(일)</b></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="proQty" size="18" dir="rtl" value="${ product.proQty }"></td>
                            <td><input type="text" name="proOPrice" size="18" dir="rtl" value="${ product.proOPrice }"></td>
                            <td><input type="text" name="proSPrice" size="18" dir="rtl" value="${ product.proSPrice }"></td>
                            <td><input type="text" name="proDelFee" size="18" dir="rtl" value="${ product.proDelFee }"></td>
                            <td><input type="text" name="proLTime" size="18" dir="rtl" value="${ product.proLTime }"></td>
                        </tr>
                    </table>
                    <br><br>
                    <b>상품 상세 설명</b>
                    <textarea id="summernote" name="proContent" value="${ product.proContent }"></textarea>
                    <br>
                    <div class="align-btn-prod-write">
                        <button type="reset" class="btn btn-light text-nowrap">입력취소</button>
                        <button class="btn btn-light text-nowrap">미리보기</button>
                        <button class="btn btn-light text-nowrap">중간저장</button>
                        <button type="submit" class="btn btn-light text-nowrap">저장하기</button>
                    </div>
                </form>
            </div>
        </div>
        <section class="ft">
            <div class="footer_container">
                <footer class="footer_section1">
                        <p class="footerName">Petkage</p>
                        <ul class="nav footer_nav">
                            <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">이용약관</a></li>
                            <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">개인정보 취급방침</a></li>
                            <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">공지사항</a></li>
                            <li class="nav-item footer_item"><a href="#" class="nav-link footer_link">FAQ</a></li>
                        </ul>
                        <div class="footer_contents">
                            <p class="footer_content">회사명 : (주)펫키지 대표 : 문인수 / 전화 : 070-1234-5678 / 주소 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩</p>
                            <p class="footer_content">사업자 등록번호 안내 : 123-45-6789 / 통신판매업 신고 2022-서울강남-03472 <a href="">[사업자정보 확인]</a>  </p>
                            <p class="footer_content">&copy;펫키지. All Rights Reserved</p>
                        </div>
                        <div class="footer_icons">
                            <a href="/" class="">
                                <img src="/EUM/resources/images/Instagram.png" alt="" class="footericon">
                            </a>
                            <a href="/" class="">
                                <img src="/EUM/resources/images/Facebook.png" alt="" class="footericon">
                            </a>
                            <a href="/" class="">
                                <img src="/EUM/resources/images/youtube.png" alt="" class="footericon">
                            </a>
                            <a href="/" class="">
                                <img src="/EUM/resources/images/kakaotalk.png" alt="" class="footericon">
                            </a>
                        </div>
                        <img src="/EUM/resources/images/Pet2.png" alt="" class="footerLogo">
                </footer>
            </div>
        </section>
    </div>

    <script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 400,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '최대 2,048자까지 내용을 입력할 수 있습니다.'	//placeholder 설정
        });
    });    
    </script>
</body>
</html>