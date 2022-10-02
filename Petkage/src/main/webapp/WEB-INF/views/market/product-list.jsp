<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <link rel="stylesheet" href="${ path }/resources/css/market/product.css">

    <!-- Common CSS -->
    <link rel="stylesheet" href="/EUM/CSS/common/header.css"></link>
    <link rel="stylesheet" href="/EUM/CSS/common/footer.css"></link>

    <!-- jQuery js -->  
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>   

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
                <form action="">
                <div class="row justify-content-center">
                    <div class="wrap-category">
                        <div class="category-info-top"><h3>마켓</h3></div>
                        <div class="wrap-search-bar">
                            <input type="text" name="searchVal" id="searchInput" class="form-control" size="60">
                            <span class="input-group-btn">
                                <button id="searchBtn">
                                    <img src="${ path }/resources/images/market/search.png" width="23" height="23" alt="search">
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                </form>
                <div class="row justify-content-center">
                    <input type="button" id="dogOn" class="categoryBtn clicked" value="강아지">
                    <input type="button" id="catOn" class="categoryBtn" value="고양이">
                </div>
                <div class="row justify-content-center">
                    <div class="col-xs-1">
                        <ul class="wrap-subcategory">
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/best-icon.png" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">베스트</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon1.png" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">사료/간식</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon3.png"" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">건강관리</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon4.png"" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">배변용품</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon5.png"" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">리빙용품</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon7.png" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">미용/목욕</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon8.png" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">야외용품</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon9.png" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">장난감</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon10.png" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">패션용품</div>
                                    </span>
                                </button>
                            </li>
                            <li class="subcategory">
                                <button class="btn-subcategory">
                                    <span class="span-subcategory-img">
                                        <img src="${ path }/resources/images/market/category/dog-icon11.png" width="60" height="60" alt="">
                                    </span>
                                    <span class="span-subcategory">
                                        <div class="">기타</div>
                                    </span>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
                <hr>
                <div class="row filter-list">
                    <a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                    <a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                    <a href="javascript:pricelistdesc();">높은가격</a>
                </div>
                <div class="row">
	                <c:if test="${ empty list }">
	                	조회된 게시글이 없습니다.
	                </c:if>
	                <c:if test="${ not empty list }">
                    	<div class="row row-cols-2 row-cols-md-4">
	                    	<c:forEach var="product" items="${ list }">
		                        <div class="col mb-4">
		                            <a class="page-link" href="${ path }/market/product-view?proNo=${ product.proNo }" style="border: 0; height: 400px;">
		                            <div class="card h-100" style="border: 0;">
		                                    <img src="${ path }/resources/images/market/dogfood.jpg" class="card-img-top" alt="...">
		                                    <div class="card-body">
		                                        <p class="card-text">${ product.proName }</p>
		                                        <p class="rating">★★★★★ (후기 : 99건)</p>
		                                    </div>
		                            </div>
		                            </a>
		                        </div>
		                   	</c:forEach>
                   		</div>
                   	</c:if>
                </div>
                <div>
                    <ul class="pagination justify-content-center">
	                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=1">&lt;&lt;</a></li>
	                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.prevPage }">&lt;</a></li>
						<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
							<c:if test="${ status.current == pageInfo.currentPage }">
			                    <li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
							</c:if>
							<c:if test="${ status.current != pageInfo.currentPage }">
			                    <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ status.current }">${ status.current }</a></li>
							</c:if>
						</c:forEach>
                        <li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.nextPage }">&gt;</a></li>
                    	<li class="page-item"><a class="page-link" href="${ path }/market/product-list?page=${ pageInfo.maxPage }">&gt;&gt;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="ft">
        <!-- <div id='wrapper'>
            <div>
                CONTENT 
            </div>
        </div> -->

        <div class="footer_container">
            <footer class="footer_section1">
                <!-- <div class="footer"> -->
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
                <!-- </div> -->
            </footer>
        </div>
    </section>

    <script src="${path}/resources/js/market/product.js"></script>

</body>
</html>