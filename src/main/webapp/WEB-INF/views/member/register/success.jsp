<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- main content -->
<style>
    video{
        padding-top: 200px;
        width: 100%;
        height: 800px;
        object-fit: fill;
    }
    

</style>
        <div class="main-content pt-0 ps-0 pe-0 ">
            <div class="container ">
                <div class="row ">
	  					<video src="${path}/resources/images/pexels-mikhail-nilov-6740228.mp4" class="col-xl-6 d-xl-block" autoplay muted loop></video>
					
                    
                    <div class="col-xl-6 vh-100 align-items-center d-flex rounded-3 overflow-hidden" style="border: gray; border-width: medium;">
                        <div class="ps-lg--5 me-auto coming-soon-card">
                            <div class="text-left pt-md-5 mt-md-5 ps-0 pe-0 ">
                                <h2 class="fw-700 display3-size display4-md-size lh-2">축하합니다 
                                    <span class="text-primary">${nickname}님!!</span>
                                </h2>
                                <h4 class="fw-700">트레이너 분들의 개인지도,</h4>
                                <h4 class="fw-700">같은 취미를 가진 사람들과 대화하며</h4>
                                <h2 class="fw-900"><span class="text-primary">HellTalk</span>에서 맘껏 즐기세요</h2>
                                <h4 class="fw-700 mt-5">바로 로그인하러 가기</h4>
                                <div class="form-group p-1 p-2 bg-white border-0">
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <a href="<c:url value="/member/Login.do"/>" class="w-100 d-block btn bg-current text-white font-xssss fw-600 ls-3 style1-input p-0 border-0 text-uppercase ">로그인으로 이동</a>
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
<script src="${path}/resources/js/plugin.js"></script>
<script src="${path}/resources/js/scripts.js"></script>