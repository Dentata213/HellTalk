<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 <meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">


<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	
	 $(document).ajaxSend(function(e, xhr, options) {
		  xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	  }); 

		$(".enterroom").click(function(){		
			var roomNO = $(this).val();		
				console.log(roomNO)
			var obj={"roomno":roomNO}
				console.log(obj)				
	/*		var wsocket;	
			wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value='/chating.do?no="+roomNO+"'/>"); //wss 는 보안이 강화된것 얘는 443포트를 사용		
			console.log('wsocket:',wsocket);
			//서버와 연결된 웹 소켓에 이벤트 등록(함수들은 밑으로 다 빼놓음)
			wsocket.onopen = open;  //   open()들어가면 호출하는거여
		//	wsocket.onclose= close;

			wsocket.onerror=function(e){
				console.log('에러발생:',e)
			}	
	*/					
			$.ajax({
				url:"<c:url value="/viewMsg.do"/>",
				method:"POST",
				data:JSON.stringify(obj),
			//	type:'json',
				contentType:"application/json; charset=utf-8"
			})
			.done(function(){         
				  window.location.href="<c:url value='/chat.do?roomno="+roomNO+"'/>";
  			}).
  			fail(function(jqXHR, textStatus, errorThrown){
  				console.log(jqXHR)
  		        console.log(textStatus)
  		        console.log(errorThrown);
			}); 		
			
		});		
		
 });		
</script>



 <!-- main content -->
        <div class="main-content right-chat-active">
        
        <a href="<c:url value="/findfriend.do"/>" class="bg-primary-gradiant p-3 w-100 btn-block border-0 rounded-3 text-white text-center fw-500 font-xsss"><i class="feather-edit me-2"></i>친구찾기!!!(검색기능 진행중..)</a>
            
            <div class="middle-sidebar-bottom">
                <div class="middle-sidebar-left pe-0 ps-lg-3 ms-0 me-0" style="max-width: 100%;">
                    <div class="row">
                           
                       
                        <div class="col-lg-12">
                            <div class="chat-wrapper p-3 w-100 position-relative scroll-bar bg-white theme-dark-bg">
                                <ul class="email-message">
                                   
                                   
                                   <!-- 이거 지울꺼 -->
                                    <li class="enterroom"  name="enterroom" value="no">
                                  
                                        <a  class="rounded-3 bg-lightblue theme-light-bg">
  											<input name="roomNo" class="roomNo" value="no" hidden />
                                            <div class="email-user">
                                                <span class="btn-round-xss ms-0 bg-success me-2"></span>
                                                <img src="https://via.placeholder.com/50x50.png" alt="user" class="w35 me-2">  
                                                <h6 class="font-xs text-grey-900 text-grey-900 mb-0 mt-0 fw-700">여기 user2</h6>
                                            </div>
                                            <div class="email-subject text-grey-900 text-dark fw-600 font-xs">
                                                <i class="feather-star font-m text-warning me-2"></i>
                                               		채팅방이름(임시)
                                            </div>
                                            <div class="email-text text-grey-500 fw-600 font-xss">
                                              최신 메시지를여기다가 뿌려야하나
                                            </div>
                                            <span class="email-file">
                                                <i class="feather-paperclip font-s btn-round-sm text-grey-500 me-2 p-0"></i>
                                            </span>
                                            <div class="email-time text-grey-500 fw-600">뭘넣을까</div>
                                        </a>
                                    </li>
                                   
                                   
                                  
                                   
                                   
                                <c:forEach var="chatroom" items="${chatList}" varStatus="loop">	  
                                    <li class="enterroom"  name="enterroom" value="${chatroom.room_no}">
                                  
                                        <a  class="rounded-3 bg-lightblue theme-light-bg">
  											<input name="roomNo" class="roomNo" value="${chatroom.room_no}" hidden />
                                            <div class="email-user">
                                                <span class="btn-round-xss ms-0 bg-success me-2"></span>
                                                <img src="https://via.placeholder.com/50x50.png" alt="user" class="w35 me-2">  
                                                <h6 class="font-xs text-grey-900 text-grey-900 mb-0 mt-0 fw-700">${chatroom.room_name}</h6>
                                            </div>
                                            <div class="email-subject text-grey-900 text-dark fw-600 font-xs">
                                                <i class="feather-star font-m text-warning me-2"></i>
                                               		${chatroom.room_name}
                                            </div>
                                            <div class="email-text text-grey-500 fw-600 font-xss">
                                                 최신 메시지를여기다가 뿌려야하나
                                            </div>
                                            <span class="email-file">
                                                <i class="feather-paperclip font-s btn-round-sm text-grey-500 me-2 p-0"></i>
                                            </span>
                                            <div class="email-time text-grey-500 fw-600">뭘넣을까</div>
                                        </a>
                                    </li>
							</c:forEach>	
       
       
                                </ul>                                 
                            </div>
                        </div>
                    </div>
                </div>
                 
            </div>            
        </div>
 <!-- main content -->


    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    