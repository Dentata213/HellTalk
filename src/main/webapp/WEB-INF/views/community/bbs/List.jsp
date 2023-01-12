<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>

   <!-- main content -->
   <div class="main-content right-chat-active">
       
       <div class="middle-sidebar-bottom">
           <div class="middle-sidebar-left">
               <!-- loader wrapper -->
               <div class="preloader-wrap p-3">
                   <div class="box shimmer">
                       <div class="lines">
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                       </div>
                   </div>
                   <div class="box shimmer mb-3">
                       <div class="lines">
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                       </div>
                   </div>
                   <div class="box shimmer">
                       <div class="lines">
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                           <div class="line s_shimmer"></div>
                       </div>
                   </div>
               </div>
               <!-- loader wrapper -->
               <div class="row feed-body">
                   <div class="col-xl-8 col-xxl-9 col-lg-8">

                       <div class="card w-100 shadow-xss rounded-xxl border-0 p-4 mb-3">
                           <div class="card-body p-0 d-flex">
                           
	                           	<tbody class="table-sm down-file-body" id="scroll">
									<c:if test="${empty lists}" var="isEmpty">
									<tr>
										<td colspan="6">등록된 글이 없습니다.</td>
									</tr>	
									</c:if>
									<c:if test="${not isEmpty}">
									<c:forEach var="list" items="${lists}" varStatus="loop">
		                               <figure class="avatar me-3"><img src="https://via.placeholder.com/50x50.png" alt="image" class="shadow-sm rounded-circle w45"></figure>
		                               <h4 class="fw-700 text-grey-900 font-xssss mt-1">${list.id}, ${list.title}</h4>
		                            </div>
		                            <div class="card-body p-0 me-lg-5">
		                                <p class="fw-500 text-grey-500 lh-26 font-xssss w-100">${list.content}</p>
		                            </div>
		                            <div class="card-body d-block p-0">
		                                <div class="row ps-2 pe-2">
		                                    <div class="col-xs-4 col-sm-4 p-1"><a href="https://via.placeholder.com/1200x800.png" data-lightbox="roadtrip"><img src="https://via.placeholder.com/1200x800.png" class="rounded-3 w-100" alt="image"></a></div>
		                                    <div class="col-xs-4 col-sm-4 p-1"><a href="https://via.placeholder.com/1200x800.png" data-lightbox="roadtrip"><img src="https://via.placeholder.com/1200x800.png" class="rounded-3 w-100" alt="image"></a></div>
		                                    <div class="col-xs-4 col-sm-4 p-1"><a href="https://via.placeholder.com/1200x800.png" data-lightbox="roadtrip" class="position-relative d-block"><img src="https://via.placeholder.com/1200x800.png" class="rounded-3 w-100" alt="image"><span class="img-count font-sm text-white ls-3 fw-600"><b>+2</b></span></a></div>
		                                </div>
		                            </div>
	                           	
                           <div class="card-body d-flex p-0 mt-3">
                               <a href="#" class="emoji-bttn d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss me-2"><i class="feather-thumbs-up text-white bg-primary-gradiant me-1 btn-round-xs font-xss"></i> <i class="feather-heart text-white bg-red-gradiant me-2 btn-round-xs font-xss"></i> ${list.likeCount}</a>
                               <div class="emoji-wrap">
                                   <ul class="emojis list-inline mb-0">
                                       <li class="emoji list-inline-item"><i class="em em---1"></i> </li>
                                       <li class="emoji list-inline-item"><i class="em em-angry"></i></li>
                                       <li class="emoji list-inline-item"><i class="em em-anguished"></i> </li>
                                       <li class="emoji list-inline-item"><i class="em em-astonished"></i> </li>
                                       <li class="emoji list-inline-item"><i class="em em-blush"></i></li>
                                       <li class="emoji list-inline-item"><i class="em em-clap"></i></li>
                                       <li class="emoji list-inline-item"><i class="em em-cry"></i></li>
                                       <li class="emoji list-inline-item"><i class="em em-full_moon_with_face"></i></li>
                                   </ul>
                               </div>
                               <a href="#" class="d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss"><i class="feather-message-circle text-dark text-grey-900 btn-round-sm font-lg"></i><span class="d-none-xss"><!-- ${list.commentCount} --></span></a>
								</c:forEach>
								</c:if>
                                   </div>
                               </div>
                           </div>
                       </div>
                      
   <!-- main content -->
	<script>
	/*
	var count=parseInt(${maxlength})-10;
	
	$(window).scroll(function() {
		 if(count>0){
		     if ( 50 > $(document).height() - $(window).height() - $(window).scrollTop()) {
		    	$("#box").append('<div class="spinner-border" id="spin"></div>');
		    	
				$.ajax({
					url:'<c:url value="/bbs/GetNewContent.do"/>',
					method:'post',
					data:'rno='+count,
					success:function(data){
						var arr = data.split(",");
						$("#spin").remove();
						sleep(500);
						$("#scroll").append('<tr id="added" display="none" style="height:100px"><td class="align-middle">'+arr[0]+'</td><td class="text-left align-middle"><a id="list" href="<c:url value="/bbs/View.do?no='+arr[0]+'"/>">'+arr[1]+'</a></td><td class="align-middle">'+arr[2]+'</td><td class="align-middle">'+arr[3]+'</td><td class="align-middle">'+arr[4]+'</td><td class="align-middle">'+arr[5]+'</td></tr>');
					}
				});
				count--;
		    }
		}else if(count--==0){
			$("#scroll").append('<tr><td colspan="6" class="align-middle">이전글이 없습니다</td></tr>');
		}
	});
	function sleep (delay) {
		   var start = new Date().getTime();
		   while (new Date().getTime() < start + delay);
	}
	
	*/
</script>




    <script src="${path}/resources/js/lightbox.js"></script>
    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
