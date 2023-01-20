<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- main content -->
        <div class="main-content">
            <div class="middle-sidebar-bottom">
                <!-- 개인 코드 작성 / 페이지 요청은 .helltalk 붙이기 -->
                <div class="container">
                  <!-- Nav tabs -->
				  <ul class="nav nav-tabs" role="tablist">
				    <li class="nav-item">
				      <a class="nav-link active" data-toggle="tab" href="#home">추천 리스트</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#menu1">운동 루틴 커스텀</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#menu2">Menu</a>
				    </li>
				  </ul>
				  <!-- Tab panes -->
				  <div class="tab-content">
				    <div id="home" class="container tab-pane active"><br>
				      <iframe src="<c:url value="#"/>" style="width: 100%; height: 83vh"></iframe>
				    </div>
				    <div id="menu1" class="container tab-pane fade"><br>
				      <iframe src="<c:url value='/exercise/iframe.do'/>" style="width: 100%; height: 83vh"></iframe>
				    </div>
				    <div id="menu2" class="container tab-pane fade"><br>
				      <h3>Menu 2</h3>
				      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
				    </div>
				  </div>
				  </div>
                <!-- 개인 코드 작성 / 페이지 요청은 .helltalk 붙이기 -->
            </div>            
        </div>
        <!-- main content -->



    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
  
