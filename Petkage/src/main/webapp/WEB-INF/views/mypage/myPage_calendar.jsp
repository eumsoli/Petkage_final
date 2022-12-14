<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<!-- css 스타일 -->
	<!--<link rel="stylesheet" href="${ path }/css/mypage/myPage_calendar.css">-->
	<!-- fullcalender -->
	 <!-- <link href="${ path }/css/mypage/main.css" rel="stylesheet" />
    <script src="${ path }/js/mypage/main.js"></script>
    <script src="${ path }/js/mypage/ko.js"></script> -->
    <link href="${pageContext.request.contextPath}/js/fullcalendar-5.0.1/lib/main.css" rel="stylesheet" /> 
	<script src="${pageContext.request.contextPath}/js/fullcalendar-5.0.1/lib/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/fullcalendar-5.0.1/lib/locales/ko.js"></script>
	
	<!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet'/>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script> 
	<style>
	
	 body {
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
            textColor: #000000;
        }
 
        table {
            text-align: left;
            textColor: #000000;
        }
 
        .access_user {
            width: 300px;
            height: 100px;
            float: right;
            margin-right: 100px;
            padding-top: 50px;
        }
 
        #external-events {
            position: absolute;
            /*left: 100 px;*/
            /*top: 100px;*/
            width: 150px;
            overflow: hidden;
            padding: 0 10px;
            margin-top: 80px;
            border: 1px solid #ccc;
            background: #eee;
            text-align: left;
        }
 
        #external-events h4 {
            font-size: 16px;
            margin-top: 0;
            padding-top: 1em;
        }
 
        #external-events .fc-event {
            margin: 3px 0;
            cursor: move;
        }
 
        #external-events p {
            margin: 1.5em 0;
            font-size: 11px;
            color: #eee;
        }
 
        #external-events p input {
            margin: 0;
            vertical-align: middle;
        }
 
        #calendar-wrap {
            margin-left: 200px;
        }
 
        #calendar {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 10px;
        }
        
        /* 일요일 날짜 빨간색 */
		.fc-day-sun a {
		  color: red;
		  text-decoration: none;
		}
		
		/* 토요일 날짜 파란색 */
		.fc-day-sat a {
		  color: blue;
		  text-decoration: none;
		}
		
		.fc-day a {
			color: black;
			text-decoration: none;
		}

</style>
    <script>
    var calendar = null;
    var initialLocaleCode = 'ko';
    var localeSelectorEl = document.getElementById('locale-selector');

        $(document).ready(function (){

                var calendarEl = document.getElementById('calendar');
                calendar = new FullCalendar.Calendar(calendarEl, {
                    initialDate: '2022-02-07',
                    initialView: 'timeGridWeek',
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    },
                    navLinks: true,
                    editable: true,
                    selectable: true,
                    droppable: true, // this allows things to be dropped onto the calendar

                    // eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                    //     // console.log()
                    // },

                    /**
                     * 드래그로 이벤트 수정하기
                     */
                    eventDrop: function (info){
                        console.log(info);
                        if(confirm("'"+ info.event.title +"' 매니저의 일정을 수정하시겠습니까 ?")){
                        }
                        var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                        var obj = new Object();

                        obj.title = info.event._def.title;
                        obj.start = info.event._instance.range.start;
                        obj.end = info.event._instance.range.end;
                        events.push(obj);

                        console.log(events);
                        $(function deleteData() {
                            $.ajax({
                                url: "/full-calendar/calendar-admin-update",
                                method: "PATCH",
                                dataType: "json",
                                data: JSON.stringify(events),
                                contentType: 'application/json',
                            })
                        })
                    },

                    /**
                     * 드래그로 이벤트 추가하기
                     */
                    select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.

                        var title = prompt('일정을 입력해주세요.');
                        if (title) {
                            calendar.addEvent({
                                title: title,
                                start: arg.start,
                                end: arg.end,
                                allDay: arg.allDay,
                            })
                        }

                        var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)

                        var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                        for (var i = 0; i < allEvent.length; i++) {
                            var obj = new Object();     // Json 을 담기 위해 Object 선언
                            // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
                            obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                            obj.start = allEvent[i]._instance.range.start; // 시작
                            obj.end = allEvent[i]._instance.range.end; // 끝

                            events.push(obj);
                        }
                        var jsondata = JSON.stringify(events);
                        console.log(jsondata);
                        // saveData(jsondata);

                        $(function saveData(jsondata) {
                            $.ajax({
                                url: "/full-calendar/calendar-admin-update",
                                method: "POST",
                                dataType: "json",
                                data: JSON.stringify(events),
                                contentType: 'application/json',
                            })
                                .done(function (result) {
                                    // alert(result);
                                })
                                .fail(function (request, status, error) {
                                     // alert("에러 발생" + error);
                                });
                            calendar.unselect()
                        });
                    },

                    /**
                     * 이벤트 선택해서 삭제하기
                     */
                    eventClick: function (info){
                        if(confirm("'"+ info.event.title +"' 매니저의 일정을 삭제하시겠습니까 ?")){
                            // 확인 클릭 시
                            info.event.remove();
                        }

                        console.log(info.event);
                        var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                        var obj = new Object();
                            obj.title = info.event._def.title;
                            obj.start = info.event._instance.range.start;
                            events.push(obj);

                        console.log(events);
                        $(function deleteData(){
                            $.ajax({
                                url: "/full-calendar/calendar-admin-update",
                                method: "DELETE",
                                dataType: "json",
                                data: JSON.stringify(events),
                                contentType: 'application/json',
                            })
                        })
                    },
                    // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
                    //
                    // },
                    
                });
                calendar.render();
    });
    
   
  
    </script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/mypage/myPage_nav.jsp" />

	<div class="container">	
	      <p class="mypagept" style="width: 1110px; height: 50px; font-size: 32px; font-weight: 700; line-height: 100%; text-align: center; color: #803D3D;">캘린더</p>
		<div id='calendar'></div>
		</div>
			<br><br>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>