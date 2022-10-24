<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${ path }/resources/css/admin/admin.css?aft">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<body>
    <section class="admin">

      <br><br>
      <h1 class="h2"><span id="main">Pet</span>kage 관리자 페이지</h1>
      <br><br>

      <div style="border: #D6d6d6 1px solid; display: flex" >
        <div class="container-fluid" style="height: 100%; ">
          <div class="row">

            <nav id="sidebarMenu" class="col-md-3 col-lg-2 sidebar d-md-block collapse" style="padding-left: 0%; border: 0px;" >
              <a href="${ path }/admin/admMain" class="list-group-item list-group-item-action py-3 lh-tight h-10" aria-current="true">
                <strong class="mb-1">대시보드</strong>
              </a>
              <a href="${ path }/admin/memList" class="list-group-item list-group-item-action active py-3 lh-tight" aria-current="true">
                <strong class="mb-1">회원 관리</strong>
              </a>
              <a href="${ path }/admin/memXList" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
                <strong class="mb-1" style="padding-top: 10px;">탈퇴 관리</strong>
              </a>
              <a href="${ path }/admin/boardList" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
                <strong class="mb-1">게시글 관리</strong>
              </a>
              <a href="${ path }/admin/proList" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
                <strong class="mb-1">상품 관리</strong>
              </a>
              <a href="${ path }/admin/revList" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
                <strong class="mb-1">리뷰 관리</strong>
              </a>
              <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
                <strong class="mb-1">신고 관리</strong>
              </a>
            </nav>
            

            <div class="col-lg-10 col-9">
              <br><br>
              <h4 style="text-align: center;">
                회원 관리
              </h4>
              <br>
              <div class="container" style="width: 80%;">
              
                <!-- 검색바 -->
                <div class="input-group mb-3">
                  <div class="input-group mb-3 justify-content-center">
                    <div class="input-group-text p-0" style="width: 10%;">
                    	<form enctype="multipart/form-data">
                        <select name="memtype" class="form-select form-select-lg shadow-none border-0" style="margin-left: 5px">
                            <option value="all">회원타입</option>
                            <option value="seller">판매</option>
                            <option value="normal">일반</option>
                        </select>
                    </div>
                    <input type="text" class="search p-2 flex-fill bd-highlight" placeholder="&nbsp사용자 검색" name="search">
                      <button type="submit" class="input-group-btn" style="border: transparent; background-color: transparent; bottom: 15%;">
                          <img src="${ path }/resources/images/wherego/검색.png" width="20" height="20" alt="search">
                      </button>
                    	</form>
              	 </div>
                </div>
                
                <br>
               
	        	<c:if test="${ empty list }">
					<div style="text-align: center; font-size: 1.5em;">
						<br><br>
						조회된 멤버가 없습니다.	
						<br><br><br>		
					</div>
				</c:if>
				
				<c:if test="${ not empty list }">
					
                <!-- 테이블 -->
                <div class="table-responsive">
                  <table class="table table-sm align-middle">
                    <thead>
                      <tr style="text-align: center;">
                        <th scope="col">
                          <div class="form-check" style="bottom:24.5px; vertical-align: middle;">
                            <input class="form-check-input" type="checkbox" value="" id="check_all">
                            <label class="form-check-label" for="check_all"><span></span></label>
                          </div>
                        </th>
                        <th scope="col">닉네임</th>
                        <th scope="col">아이디</th>
                        <th scope="col">연락처</th>
                        <th scope="col">가입일</th>
                        <th scope="col">회원타입</th>
                        <th scope="col">이메일</th>
                        <th scope="col">탈퇴</th>
                      </tr>
                    </thead>
                    
                    <tbody style="text-align: center;">  
           
					<c:forEach var="member" items="${ list }" varStatus="status">  
                      <tr>
                        <td>
                          <div class="form-check" style="top: 10px; vertical-align: middle;">
                            <input class="form-check-input normal" type="checkbox" id="check_${ status.index }">
                            <label class="form-check-label" for="check_${ status.index }"><span></span></label>
                          </div>
                        </td>
                        <td style="vertical-align: middle;">${ member.userName }</td>
                        <td style="vertical-align: middle;">${ member.userId }</td>
                        <td style="vertical-align: middle;;">${ member.userPhone }</td>
                        <td style="vertical-align: middle;;"><fmt:formatDate type="date" dateStyle="short" value="${ member.enrolldate }"/></td>
                        <td style="vertical-align: middle;;">
                        	<c:if test="${ member.memberRole == 'ROLE_USER'}">
                        		일반
                        	</c:if>
                        	<c:if test="${ member.memberRole == 'ROLE_ADMIN'}">
                        		관리
                        	</c:if>
                        	<c:if test="${ member.memberRole == 'ROLE_SELLER'}">
                        		판매
                        	</c:if>
                        </td>
                        <td style="vertical-align: middle;">${ member.userEmail }</td>
                        <td>
                          <button type="button" class="btn adminbtn btn-sm" memberId="${ member.no }">탈퇴</button>
                        </td>
                      </tr>
 				    </c:forEach>
                    </tbody>
                    
                    
                  </table>
                  </div>
				  </c:if>
				  
				  <!-- 페이징 -->
                  <div style="text-align: center;">
                    <br>
                    <button class="btn btn-customlr btn-sm" onclick="location.href='${ path }/admin/memList?page=${ pageInfo.prevPage }'">&lt;</button>
                    &nbsp;&nbsp;
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                      <c:if test="${ status.current == pageInfo.currentPage }">
                        <button class="btn btn-custom btn-sm" disabled>${ status.current }</button>
                        &nbsp;&nbsp;
                      </c:if>
                      <c:if test="${ status.current != pageInfo.currentPage }">
                        <button class="btn btn-custom btn-sm" onclick="location.href='${ path }/admin/memList?page=${ status.current }'">${ status.current }</button>
                        &nbsp;&nbsp;
                      </c:if>
                    </c:forEach>
                    <button class="btn btn-customlr btn-sm" onclick="location.href='${ path }/admin/memList?page=${ pageInfo.nextPage }'">&gt;</button>   
                  </div>

                  <br>
              </div>
      
            </div>
            </div>
          </div>
        </div>
   
      </div>
                
    </section>
    
    <br><br><br><br><br><br>

	
    <script>
    	// 체크박스
    	$(".table-responsive").on("click", "#check_all", function () {
    	    $(this).parents(".table-responsive").find('input').prop("checked", $(this).is(":checked"));
    	});
    	
    	$(".table-responsive").on("click", ".normal", function() {
    	    var is_checked = true;

    	    $(".table-responsive .normal").each(function(){
    	        is_checked = is_checked && $(this).is(":checked");
    	    });

    	    $("#check_all").prop("checked", is_checked);
    	});
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />