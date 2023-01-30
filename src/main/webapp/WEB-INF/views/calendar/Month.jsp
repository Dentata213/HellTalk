<%@page import="com.helltalk.springapp.models.CaldDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src=https://cdn.jsdelivr.net/npm/fullcalendar@6.0.3/index.global.min.js></script>
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  
  /*사이드추가*/
    body {
    margin-top: 40px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #external-events {
    position: fixed;
    left: 20px;
    top: 100px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: center;
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
    color: #666;
  }

  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }

  #calendar-wrap {
    margin-left: 100px;
  }

 .fc-event-time{
 	font-size: 0px;
 }
</style>                     

   <!-- 달력 -->
  <div id='calendar-wrap'>
  	<div id='calendar'></div>
 </div>  

 <!--일정추가 modal 추가 -->
  <div class="modal fade" id="addcalendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
     
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="addModalLabel">오늘하루를 기록하세요!</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="addclose">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
              <div class="modal-body">
                  <div class="form-group">    
                      <label for="taskId" class="col-form-label">title</label>
                      <c:set var="sessionId"><sec:authentication property="principal.username"/></c:set>
                      <input type="hidden" name="uemail" id="uemail" value="${sessionId}"/>
                      <input type="text" class="form-control" id="caldtitle" name="caldtitle">
                      <label for="taskId" class="col-form-label">내용</label>
                      <textarea class="form-control"  rows="10"  id="caldcontent" name="caldcontent"></textarea>
                      <label for="taskId" class="col-form-label">날짜</label>
                      <input type="date" class="form-control" id="caldstartdate" name="caldstartdate">
                  </div>
				  <div class="row">
                  <div class="col-xs-12">
                      <label class="col-xs-4" for="color" style="margin-left:20px;" >색상</label>
                      <select class="inputModal" name="caldcolor" id="caldcolor">
                          <option value="#D25565" style="color:#D25565;">빨간색</option>
                          <option value="#9775fa" style="color:#9775fa;">보라색</option>
                          <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                          <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                          <option value="#f06595" style="color:#f06595;">핑크색</option>
                          <option value="#63e6be" style="color:#63e6be;">연두색</option>
                          <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                          <option value="#4d638c" style="color:#4d638c;">남색</option>
                          <option value="#495057" style="color:#495057;">검정색</option>
                      </select>
                  </div>
                </div>                                        
              </div>
               
              <div class="modal-footer">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <button type="button" class="btn btn-warning" id="addCalendar" >추가</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal"
                      id="addModalClose">닫기</button>
                      
              </div>
  
          </div>
      </div>
  </div>
  <!--일정 상세보기 modal -->
  <div class="modal fade" id="calendarModalView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true" >
     
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">기록보기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                      
                  </button>
              </div>
              <div class="modal-body">
                  <div class="form-group">
                  	 <input type="hidden" class="form-control" id="viewno" name="viewno" />
                      <label for="taskId" class="col-form-label">title</label>
                      <input type="text" class="form-control" id="viewtitle" name="viewtitle" disabled />                  
                      <label for="taskId" class="col-form-label">내용</label>
                      <textarea class="form-control"  rows="10"  id="viewcontent" name="viewcontent" disabled></textarea>
                      <label for="taskId" class="col-form-label">날짜</label>
                      <input type="date" class="form-control" id="viewdate" name="viewdate" disabled  >                    
                  </div>                    
              
               <div class="row">
                  <div class="col-xs-12">
                      <label class="col-xs-4" for="color" style="margin-left:20px;"  id="editecolortitle" hidden>색상</label>
                      <select class="inputModal" name="editecaldcolor" id="editecaldcolor"  hidden>
                          <option value="#D25565" style="color:#D25565;">빨간색</option>
                          <option value="#9775fa" style="color:#9775fa;">보라색</option>
                          <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                          <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                          <option value="#f06595" style="color:#f06595;">핑크색</option>
                          <option value="#63e6be" style="color:#63e6be;">연두색</option>
                          <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                          <option value="#4d638c" style="color:#4d638c;">남색</option>
                          <option value="#495057" style="color:#495057;">검정색</option>
                      </select>
                  </div>
                </div> 
              </div>                                   
              <div class="modal-footer">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <button type="button" class="btn btn-warning" id="calEdit" >수정</button>
                  <button type="button" class="btn btn-warning" id="calEditok" hidden >등록</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal"
                      id="caldelete">삭제</button>
                  <button type="button" class="btn btn-warning" data-dismiss="modal"
                      id="viewModalClose" >닫기</button>
              
              </div>
   
          </div>
      </div>
      
  </div>
<!-- main content -->

<script src="${path}/resources/js/plugin.js"></script>
<script src="${path}/resources/js/scripts.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href='${path}/resources/fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
<script src='${path}/resources/fullcalendar-5.11.3/lib/main.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {

  $(document).ajaxSend(function(e, xhr, options) {
	  xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
  }); 
	  
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	nowIndicator: true,
    	initialView: 'dayGridMonth',
      locale: 'ko',
      initialDate: '${today}',
      headerToolbar: {
          left: 'addEventButton dayGridMonth',
          center: 'title',
          right: 'prev,next'//dayGridMonth,timeGridWeek,timeGridDay,listWeek
        },
 //   navLinks: true, //// 일자 클릭 시 list로 이동 
      businessHours: true, // display business hours
      editable: true,
      selectable: true,  
      
      
      eventClick: function() {

    	  //닫기 누르면 새로고침 해줘야 함...
    		$(document).on('click','#viewModalClose',function(){
    			location.reload();  			
    		}),
    		
    		$(document).on('click','#addModalClose',function(){
    			location.reload();
    		}),
    		
    		$(document).on('click','.close',function(){
    			location.reload();  			
    		}),   	  
    	 //※click이벤트걸 때 반드시  $(document).on('이벤트명','셀렉터',콜백함수)으로
    	//그래야 동적으로 추가된 요소에도 이벤트가 발생한다 	  
    	 $(document).on('click','.fc-event-title-container',function(){
    		//	console.log('댓글번호1:',this.viewno());
    			var this_= $(this).children(); //클릭한 제이쿼리 객체
    			var nos = this_.html().split("_")
    			var no = nos[0]
    			console.log("글번호:",no)   	  			       
       $.ajax({
   			url:"<c:url value="/cal/View.do"/>",
   			data:"caldno="+no,
   			dataType:'json'
			})		
			.done(function(data){         			
				$('#viewtitle').prop('value',data.cald_title)
				$('#viewcontent').prop('value',data.cald_content)	
				$('#viewdate').prop('value',data.cald_startdate)
				$('#viewno').prop('value',data.cald_no)
				console.log("data",data)				
			}).fail(function(error){
				console.log('글조회오류!!');
			});		   			
    })   	      	            	        
        	$('#calendarModalView').modal('show');    
    	  
        }, 
          
            
      events: [
    
    //calcked list 뿌리기 	 
    <c:forEach var="calc" items="${calcList}" varStatus="loop">
     	  { 
     		  title:'${calc.rout_name}' ,
               start:'${calc.rout_startdate}', 
               end:'${calc.rout_enddate}',  
               color:'#ff9f89' , 
           	   display:'background'         	 
	  	   },
	  	 </c:forEach> 
  	   
	//caldaily list 뿌리기
	<c:forEach var="cald" items="${caldList}" varStatus="loop"> 			
	  	{  		
          title:'${cald.cald_no}_${cald.cald_title}',
          start:'${cald.cald_startdate}',//T12:00붙이면 '.클래스값이 달라짐!!'
   //     end:'${cald.cald_enddate}T12:00',
        constraint:'availableForMeeting', // defined below
          color:'${cald.cald_color}' //'#257e4a'
        },
        </c:forEach>   
        
      ],
        
       customButtons: {
          addEventButton: { // 추가한 버튼 설정
              text : "기록하기",  // 버튼 내용
              click : function(){ // 버튼 클릭 시 이벤트 추가       	
            	  
                  $("#addcalendarModal").modal("show"); // modal 나타내기
			
                  //iframe후 닫기버튼이 안먹혀서 따로 지정
                  $("#addModalClose").on("click",function(){
                	  $("#addcalendarModal").modal("hide");    
                  });
                  $("#addclose").on("click",function(){
                	  $("#addcalendarModal").modal("hide");    
                  });
                  
                  $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                      var caldtitle = $("#caldtitle").val();
                	  var caldcontent = $("#caldcontent").val();
                      var caldstartdate = $("#caldstartdate").val();
                      var caldcolor = $("#caldcolor").val();
					  var uemail = "${uemail}"; // $("#uemail").val();
                      
					  console.log("이거!!!",uemail)
                      //내용 입력 여부 확인
                      if(caldtitle == null || caldtitle == ""){
                          alert("제목을 입력하세요.");
                          return;
                      }
                      else if(caldcontent == null || caldcontent == ""){
                          alert("내용을 입력하세요.");
                          return;
                      }
                      else if(caldstartdate == "" || caldstartdate ==""){
                          alert("날짜를 입력하세요.");
                          return;
                      }
      
                      else{ // 정상적인 입력 시
                          var obj = {
                    		  "caldtitle" : caldtitle,
                              "caldcontent" : caldcontent,
                              "caldstartdate" : caldstartdate,
                              "caldcolor" : caldcolor,   
                              "uemail" : uemail                       		  
                          }//전송할 객체 생성                                            
                        var test=JSON.stringify(obj);        
                     	 }
                      
                      $.ajax({
	              			url:"<c:url value="/cal/Write.do"/>",
	              			method: "POST",
	              			data: JSON.stringify(obj),
	            			type:'json',
	            			contentType:"application/json; charset=utf-8",
              			})
              			.done(function(data){         
              					alert('입력되었습니다.');
              					console.log(${caldno})
              					window.location.href ="List.do";
              				
              			}).
              			fail(function(jqXHR, textStatus, errorThrown){
              				console.log(jqXHR)
              		        console.log(textStatus)
              		        console.log(errorThrown);
            			});  

                  });////modal안
              }///
          }////추가버튼 밖
      }
    });
    calendar.render();
  });
  
  //팝업으로 운동목록 뿌리기!
  $(function(){  
	  $(document).on('click','.fc-daygrid-day-number',function(){//일자에 클릭 이벤트 걸기
	//  $('.fc-daygrid-day-number').click(function(){  
		var this_ = $(this).parent().parent().parent().attr("data-date")//클릭한 날짜 가져오기
		var this2 = $(this)
//		console.log(this_)
						
		  //그러면 일자를 넘겨주고 거기에 맞는 루틴을 가져와서 뿌려줘도 되겠다!!!
		   $.ajax({
   			url:"<c:url value="/calc/View.do"/>",
   			data:"calcStartD="+this_,
   			dataType:'json'
			})		
			.done(function(data){   
				//console.log('이게?',data["list"]["ROUT_GENDER"])	
				if(data["list"]==null){					
				   if(data["DAY"]==null){
					   this2.popover({placement:'top',content:'설정한 운동이 없습니다!'});	
				    }else{
					console.log('이거',data["DAY"])
				    }
				}
				else{
					console.log('아니면?',data["list"])
					this2.popover({title:data["list"]['ROUT_NAME'],placement:'top',
						content:'<Strong>운동내용:</Strong>'+data["list"]["ROUT_CONTENT"]+'<br/> <Strong>난이도:</Strong>'+data["list"]["ROUT_LEVEL"]+'<br/> <Strong>효과:</Strong>'+data["list"]["ROUT_EFFECT"]+'<br/> <Strong>시간:</Strong>'+data["list"]["ROUT_TIME"]+'<br/> <Strong>루틴모드:</Strong>'+data["list"]["ROUT_MODE"]+''
							,html:true,animation:true,delay:{show: 300, hide: 100}});				
				}
	
	}).fail(function(error){
				console.log('글조회오류!!');				 
			});		
		  
	  })
	  
  })
  
 
  //글 수정 
  $(function(){
	  $('#calEdit').click(function(){		
		  $('#viewtitle').prop("disabled",false)
		  $('#viewcontent').prop("disabled",false)
		  $('#viewdate').prop("disabled",false)			  
		  $('#calEdit').prop("hidden",true)
		  $('#calEditok').prop("hidden",false)
		  $('#caldelete').prop("hidden",true)	
		  $('#editecaldcolor').prop("hidden",false)
		  $('#editecolortitle').prop("hidden",false)
	  });	
	  $('#calEditok').on('click',function(){	
			 console.log($(this).html())		
			 console.log($("#viewtitle").val())
  
  			  var viewtitle = $("#viewtitle").val();
           	  var viewcontent = $("#viewcontent").val();
              var viewdate = $("#viewdate").val();
              var editecaldcolor = $("#editecaldcolor").val();                 
              var viewno =$("#viewno").val();
              
                 //내용 입력 여부 확인
                 if(viewtitle == null || viewtitle == ""){
                     alert("제목을 입력하세요.");
                     return;
                 }
                 else if(viewcontent == null || viewcontent == ""){
                     alert("내용을 입력하세요.");
                     return;
                 }
                 else if(viewdate == "" || viewdate ==""){
                     alert("날짜를 입력하세요.");
                     return;
                 }
 
                 else{ // 정상적인 입력 시
                     var obj = {
		              		 "viewtitle" : viewtitle,
		                     "viewcontent" : viewcontent,
		                     "viewdate" : viewdate,
		                     "editecaldcolor" : editecaldcolor,   
		                     "viewno" : viewno
                     }//전송할 객체 생성                                            
                   var test=JSON.stringify(obj);        
                	 }
                 
                      $.ajax({
	              			url:"<c:url value="/cal/Edit.do"/>",
	              			method: "POST",
	              			data:JSON.stringify(obj),
	            			type:'json',
	            			contentType:"application/json; charset=utf-8"
              			})
              			.done(function(data){         
              					alert('수정 되었습니다.');
              					console.log("수정",${caldno})
              					window.location.href ="List.do";
              				
              			}).
              			fail(function(jqXHR, textStatus, errorThrown){
              				console.log(jqXHR)
              		        console.log(textStatus)
              		        console.log(errorThrown);
            			});                      
				  });  

	  
 				 });
	  
	  //삭제
	  $(function(){
		  $('#caldelete').on("click",function(){
			if(confirm("정말로 삭제하시겠습니까?")){
			  var viewno = $("#viewno").val();
			  console.log("??",viewno)			  
			  $.ajax({
		   			url:"<c:url value="/cal/Delete.do"/>",
		   			data:{"viewno":viewno},
		   			dataType:'json',
		   			contentType:"application/json; charset=utf-8"
					})		
					.done(function(data){         			
						alert('삭제되었습니다.')	
						location.reload();
						
					}).fail(function(error){
						alert('삭제실패!')
					});		   			  
		  }
						
		 		 })
		  
	  });
	  
	  $(function(){
		  $('.fc-event-title').on("click",function(){
			console.log("dddd!!")
		  })
		  
	  });
	  
</script>

