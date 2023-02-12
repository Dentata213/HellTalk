<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/"/>
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
        <!-- main content -->
        <div class="main-content right-chat-active">
            
            <div class="middle-sidebar-bottom">
                <div class="middle-sidebar-left">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card w-100 border-0 p-0 bg-white shadow-xss rounded-xxl">
                                <div class="card-body p-0 position-relative">
                                    <figure class="avatar position-absolute w100 z-index-1" style="top:-40px; left: 30px;"><img src="https://via.placeholder.com/50x50.png" alt="image" class="float-right p-1 bg-white rounded-circle w-100"></figure>
                                    <h4 class="fw-700 font-sm mt-2 mb-lg-5 mb-4 pl-15">${member.u_nickname}<span class="fw-500 font-xssss text-grey-500 mt-1 mb-3 d-block">${member.u_email}</span></h4>
                                    <div class="d-flex align-items-center justify-content-center position-absolute-md right-15 top-0 me-2">
                                        <a href="#" class="d-none d-lg-block bg-success p-3 z-index-1 rounded-3 text-white font-xsssss text-uppercase fw-700 ls-3">Add Friend</a>
                                        <a href="#" class="d-none d-lg-block bg-greylight btn-round-lg ms-2 rounded-3 text-grey-700"><i class="feather-mail font-md"></i></a>
                                        <a href="#" id="dropdownMenu4" class="d-none d-lg-block bg-greylight btn-round-lg ms-2 rounded-3 text-grey-700" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ti-more font-md tetx-dark"></i></a>
                                        <div class="dropdown-menu dropdown-menu-end p-4 rounded-xxl border-0 shadow-lg" aria-labelledby="dropdownMenu4">
                                            <div class="card-body p-0 d-flex">
                                                <i class="feather-bookmark text-grey-500 me-3 font-lg"></i>
                                                <h4 class="fw-600 text-grey-900 font-xssss mt-0 me-0">Save Link <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Add this to your saved items</span></h4>
                                            </div>
                                            <div class="card-body p-0 d-flex mt-2">
                                                <i class="feather-alert-circle text-grey-500 me-3 font-lg"></i>
                                                <h4 class="fw-600 text-grey-900 font-xssss mt-0 me-0">Hide Post <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save to your saved items</span></h4>
                                            </div>
                                            <div class="card-body p-0 d-flex mt-2">
                                                <i class="feather-alert-octagon text-grey-500 me-3 font-lg"></i>
                                                <h4 class="fw-600 text-grey-900 font-xssss mt-0 me-0">Hide all from Group <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save to your saved items</span></h4>
                                            </div>
                                            <div class="card-body p-0 d-flex mt-2">
                                                <i class="feather-lock text-grey-500 me-3 font-lg"></i>
                                                <h4 class="fw-600 mb-0 text-grey-900 font-xssss mt-0 me-0">Unfollow Group <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save to your saved items</span></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body d-block w-100 shadow-none mb-0 p-0 border-top-xs">
                                    
                                       <nav class="navbar navbar-expand-sm bg-dark navbar-dark">  
										  <ul class="navbar-nav nav nav-tabs h55 d-flex product-info-tab border-bottom-0 ps-4" id="pills-tab" role="tablist">
										    <li class="nav-item">
										      <a class="nav-link" href="#section1">Section 1</a>
										    </li>
										    <li class="nav-item">
										      <a class="nav-link" href="#section2">Section 2</a>
										    </li>
										    <li class="nav-item">
										      <a class="nav-link" href="#section3">Section 3</a>
										    </li>
										    <li class="nav-item">
										      <a class="nav-link" href="#section4">Section 4</a>
										    </li>
										  </ul>
										</nav>
                                </div>
                            </div>
                        </div>
                        <div class="middle-sidebar-bottom">
			                <div class="middle-sidebar-left">
			                    <div class="row">
			                        <div class="col-lg-12">
			                        	<div id="section1" class="container-fluid " >
  										<h1>Section 1</h1>
	                                       <div id='calendar-wrap'>
										  		<iframe id="iframe" style="width:100%; height:600px; overflow: hidden" frameborder="0" crolling="no" frameborder="none" allowfullscreen="" src="<c:url value="/cal/List.do"/>"></iframe>
										 	</div>   
										 </div>
										 <div id="section2" class="container-fluid bg-secondary" style="padding-top:70px;padding-bottom:70px">
										  <h1>Section 2</h1>
										  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
										  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
										</div>
										 <div id="section3" class="container-fluid" >
										  <h1>나의 QnA</h1>
										  <table class="table text-center">
										  
											  <thead>
							                      <tr>
							                        <th>글번호</th>
							                        <th>제목</th>
							                        <th>작성일</th>
							                        <th>응답</th>
							                      </tr>
							                   </thead>
							                   <c:if test="${empty QnAlist}" var="flag">
							                    	<tr>
							                    		<td colspan="7">글이 없습니다</td>
							                    	<tr>
							                    </c:if>
							                    <c:if test="${not flag}">
												  <c:forEach var="qnAlist" items="${QnAlist}">
												  	<tr>
													  	<td>${qnAlist.q_no}</td>
								                      	<td>${qnAlist.q_title}</td>
								                      	<td>${qnAlist.q_postdate}</td>
								                      	<td>${qnAlist.q_answer==null?"미응답":"답변완료"}</td>
							                      	</tr>		
												  </c:forEach>
												</c:if>
											</table>
										</div>
										
										
										<div id="section4" class="container-fluid bg-info" style="padding-top:70px;padding-bottom:70px">
										  <h1>Section 4 Submenu 2</h1>
										  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
										  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
										</div>
										 
                                    </div>
                                </div>
                            </div>
                        </div>                         
                    </div>
                </div>
                 
            </div>            
        </div>
        <!-- main content -->
    
    <script src="${path}js/plugin.js"></script>
    <script src="${path}js/lightbox.js"></script>
    <script src="${path}js/scripts.js"></script>

	
    <script>
    
        $('.chart').easyPieChart({
            easing: 'easeOutElastic',
            delay: 3000,
            barColor: '#3498db',
            trackColor: '#aaa',
            scaleColor: false,
            lineWidth: 5,
            trackWidth: 5,
            size: 50,
            lineCap: 'round',
            onStep: function(from, to, percent) {
                this.el.children[0].innerHTML = Math.round(percent);
            }
        });
    
    </script> 
	