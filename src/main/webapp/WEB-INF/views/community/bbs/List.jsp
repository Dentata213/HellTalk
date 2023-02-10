<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/lightbox.css">
    
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
		
					<div id="bw"
						class="card w-100 shadow-xss rounded-xxl border-0 ps-4 pt-4 pe-4 pb-3 mb-3">
						<div class="card-body p-0">
							<a href="javascript:writeBoard()"
								class=" font-xssss fw-600 text-grey-500 card-body p-0 d-flex align-items-center"><i
								class="btn-round-sm font-xs text-primary feather-edit-3 me-2 bg-greylight"></i>게시글
								작성</a>
						</div>
						<div class="card-body p-0 mt-3 position-relative">
							<figure class="avatar position-absolute ms-2 mt-1 top-5">
							</figure>
							<textarea name="message"
								class="h100 bor-0 w-100 rounded-xxl p-2 ps-5 font-xssss text-grey-500 fw-500 border-light-md theme-dark-bg"
								cols="30" rows="10" placeholder="What's on your mind?"></textarea>
						</div>
						<div class="card-body d-flex p-0 mt-0">
							<a href="#"
								class="d-flex align-items-center font-xssss fw-600 ls-1 text-grey-700 text-dark pe-4"><i
								class="font-md text-danger feather-video me-2"></i><span
								class="d-none-xs">Live Video</span></a> <a href="#"
								class="d-flex align-items-center font-xssss fw-600 ls-1 text-grey-700 text-dark pe-4"><i
								class="font-md text-success feather-image me-2"></i><span
								class="d-none-xs">Photo/Video</span></a> <a href="#"
								class="d-flex align-items-center font-xssss fw-600 ls-1 text-grey-700 text-dark pe-4"><i
								class="font-md text-warning feather-camera me-2"></i><span
								class="d-none-xs">Feeling/Activity</span></a> <a href="#"
								class="ms-auto" id="dropdownMenu4" data-bs-toggle="dropdown"
								aria-expanded="false"><i
								class="ti-more-alt text-grey-900 btn-round-md bg-greylight font-xss"></i></a>
							<div
								class="dropdown-menu dropdown-menu-start p-4 rounded-xxl border-0 shadow-lg"
								aria-labelledby="dropdownMenu4">
								<div class="card-body p-0 d-flex">
									<i class="feather-save text-grey-500 me-3 font-lg"></i>
									<h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4">
										게시글 등록 <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Add this to your saved items</span>
									</h4>
								</div>
								<div class="card-body p-0 d-flex mt-2">
									<i class="feather-alert-circle text-grey-500 me-3 font-lg"></i>
									<h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4">
										Hide Post <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save to your saved items</span>
									</h4>
								</div>
								<div class="card-body p-0 d-flex mt-2">
									<i class="feather-alert-octagon text-grey-500 me-3 font-lg"></i>
									<h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4">
										Hide all from Group <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save to your saved items</span>
									</h4>
								</div>
								<div class="card-body p-0 d-flex mt-2">
									<i class="feather-lock text-grey-500 me-3 font-lg"></i>
									<h4 class="fw-600 mb-0 text-grey-900 font-xssss mt-0 me-4">
										Unfollow Group <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save to your saved items</span>
									</h4>
								</div>
							</div>
						</div>
					</div>
		
					<div class="row feed-body">
		
						<div class="col-xl-12 col-xxl-12 col-lg-12">
							<c:if test="${empty lists}" var="isEmpty">
								<tr>
									<td colspan="6">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not isEmpty}">
								<c:forEach var="list" items="${lists}" varStatus="loop">
									<div class="card w-100 shadow-xss rounded-xxl border-0 p-4 mb-3">
										<div class="card-body p-0 d-flex">
												<figure class="avatar me-3"><img src="https://via.placeholder.com/50x50.png" alt="image" class="shadow-sm rounded-circle w45"></figure>
												<h4 class="fw-700 text-grey-900 font-xssss mt-1">${list.u_nickname}</h4>
													<a href="#" class="ms-auto" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false"><i class="ti-more-alt text-grey-900 btn-round-md bg-greylight font-xss"></i></a>
		                                    <div class="dropdown-menu dropdown-menu-end p-4 rounded-xxl border-0 shadow-lg" aria-labelledby="dropdownMenu2">
		                                        
		                                        <div class="card-body p-0 d-flex mt-2">
		                                            <a href="#" class="edittag" data-toggle="modal" data-target="#basicModal" id="edit"><i class="feather-edit text-grey-500 me-3 font-lg"></i></a>
		                                            <h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4" >게시글 수정</a> <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save to your saved items</span></h4>
		                                        </div>
		                                        <div class="card-body p-0 d-flex mt-2">
		                                            <a href="#" ><i class="feather-trash-2 text-grey-500 me-3 font-lg"></i></a>
		                                            <h4 class="fw-600 text-grey-900 font-xssss mt-0 me-4">게시글 삭제 <span class="d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500">Save to your saved items</span></h4>
		                                        </div>
		                                        
		                                       </div>
										</div>
										<div class="card-body p-0 me-lg-5">
											<p class="fw-500 text-grey-500 lh-26 font-xssss w-100">${list.content}</p>
										</div>
										<c:if test="${isEmpty}">
										<div class="card-body d-block p-0">
											<div class="row ps-2 pe-2">
												<div class="col-xs-4 col-sm-4 p-1">
													<a href="https://via.placeholder.com/1200x800.png"
														data-lightbox="roadtrip"><img
														src="https://via.placeholder.com/1200x800.png"
														class="rounded-3 w-100" alt="image"></a>
												</div>
												<div class="col-xs-4 col-sm-4 p-1">
													<a href="https://via.placeholder.com/1200x800.png"
														data-lightbox="roadtrip"><img
														src="https://via.placeholder.com/1200x800.png"
														class="rounded-3 w-100" alt="image"></a>
												</div>
												<div class="col-xs-4 col-sm-4 p-1">
													<a href="https://via.placeholder.com/1200x800.png"
														data-lightbox="roadtrip" class="position-relative d-block"><img
														src="https://via.placeholder.com/1200x800.png"
														class="rounded-3 w-100" alt="image"><span
														class="img-count font-sm text-white ls-3 fw-600"><b>+3</b></span></a>
												</div>
											</div>
										</div>
										</c:if>
										<div class="card-body d-flex p-0 mt-3">
											<a href="javascript:like(${list.no})"
												class="emoji-bttn d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss me-2">
												<i class="feather-heart text-white bg-red-gradiant me-2 btn-round-xs font-xss"></i>${list.likeCount}</a>
											
											<a href="#"
												class="d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss"><i
												class="feather-message-circle text-dark text-grey-900 btn-round-sm font-lg"></i><span
												class="d-none-xss"> ${list.commentCount}</span></a>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 게시글 수정 -->
	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">게시글 수정</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <textarea name="message" id="editmodal"
				class="h100 bor-0 w-100 rounded-xxl p-2 ps-5 font-xssss text-grey-500 fw-500 border-light-md theme-dark-bg"
				cols="30" rows="10"></textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">저장</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- main content -->
	<script>
		$("#edit").click(function(){})
		function writeBoard(){
			var content=$("textarea[name=message]").val();
			
			//임시-임의의 값으로 설정 
			var user="KIM";
			var likeCount=0;
			var comentCount=0;
			
			//console.log(content);
			
			//ajax로 유저 정보도 넘겨서 판단, 위에서 임시로 설정한 해당글에 대한 정보도 뿌려줘야 됨
			$.ajax({
				url:'<c:url value="/community/bbs/write"/>',
				data:"content="+content,
				success:function(data){
					console.log(data);
					var sss="<div class=\"card w-100 shadow-xss rounded-xxl border-0 p-4 mb-3\">\r\n"
						+ "									<div class=\"card-body p-0 d-flex\">\r\n"
						+ "											<figure class=\"avatar me-3\"><img src=\"https://via.placeholder.com/50x50.png\" alt=\"image\" class=\"shadow-sm rounded-circle w45\"></figure>\r\n"
						+ "											<h4 class=\"fw-700 text-grey-900 font-xssss mt-1\">"+user+"</h4>\r\n"
						+ "												<a href=\"#\" class=\"ms-auto\" id=\"dropdownMenu2\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\"><i class=\"ti-more-alt text-grey-900 btn-round-md bg-greylight font-xss\"></i></a>\r\n"
						+ "	                                    <div class=\"dropdown-menu dropdown-menu-end p-4 rounded-xxl border-0 shadow-lg\" aria-labelledby=\"dropdownMenu2\">\r\n"
						+ "	                                        \r\n"
						+ "	                                        <div class=\"card-body p-0 d-flex mt-2\">\r\n"
						+ "	                                            <a href=\"#\" class=\"edittag\" data-toggle=\"modal\" data-target=\"#basicModal\" id=\"edit\"><i class=\"feather-edit text-grey-500 me-3 font-lg\"></i></a>\r\n"
						+ "	                                            <h4 class=\"fw-600 text-grey-900 font-xssss mt-0 me-4\">게시글 수정 <span class=\"d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500\">Save to your saved items</span></h4>\r\n"
						+ "	                                        </div>\r\n"
						+ "	                                        <div class=\"card-body p-0 d-flex mt-2\">\r\n"
						+ "	                                            <a href=\"#\" ><i class=\"feather-trash-2 text-grey-500 me-3 font-lg\"></i></a>\r\n"
						+ "	                                            <h4 class=\"fw-600 text-grey-900 font-xssss mt-0 me-4\">게시글 삭제 <span class=\"d-block font-xsssss fw-500 mt-1 lh-3 text-grey-500\">Save to your saved items</span></h4>\r\n"
						+ "	                                        </div>\r\n"
						+ "	                                        \r\n"
						+ "	                                       </div>\r\n"
						+ "									</div>\r\n"
						+ "									<div class=\"card-body p-0 me-lg-5\">\r\n"
						+ "										<p class=\"fw-500 text-grey-500 lh-26 font-xssss w-100\">"+content+"</p>\r\n"
						+ "									</div>\r\n"
						+ "									\r\n"
						/*
						+ "                                <div class=\"card-body d-block p-0 mb-3\">\r\n"
						+ "                                    <div class=\"row ps-2 pe-2\">\r\n"
						+ "                                        <div class=\"col-sm-12 p-1\"><a href=\"https://via.placeholder.com/615x350.png\" data-lightbox=\"roadtr\"><img src=\"https://via.placeholder.com/615x350.png\" class=\"rounded-3 w-100\" alt=\"image\"></a></div>                                        \r\n"
						+ "                                    </div>\r\n"
						+ "                                </div>"
						*/
						+ "									<div class=\"card-body d-flex p-0 mt-3\">\r\n"
						+ "										<a href=\"javascript:like(2)\"\r\n"
						+ "											class=\"emoji-bttn d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss me-2\">\r\n"
						+ "											<i class=\"feather-heart text-white bg-red-gradiant me-2 btn-round-xs font-xss\"></i>"+likeCount+"</a>\r\n"
						+ "										<div class=\"emoji-wrap\">\r\n"
						+ "											<ul class=\"emojis list-inline mb-0\">\r\n"
						+ "												<li class=\"emoji list-inline-item\"><i class=\"em em---1\"></i>\r\n"
						+ "												</li>\r\n"
						+ "												<li class=\"emoji list-inline-item\"><i\r\n"
						+ "													class=\"em em-angry\"></i></li>\r\n"
						+ "												<li class=\"emoji list-inline-item\"><i\r\n"
						+ "													class=\"em em-anguished\"></i></li>\r\n"
						+ "												<li class=\"emoji list-inline-item\"><i\r\n"
						+ "													class=\"em em-astonished\"></i></li>\r\n"
						+ "												<li class=\"emoji list-inline-item\"><i\r\n"
						+ "													class=\"em em-blush\"></i></li>\r\n"
						+ "												<li class=\"emoji list-inline-item\"><i class=\"em em-clap\"></i></li>\r\n"
						+ "												<li class=\"emoji list-inline-item\"><i class=\"em em-cry\"></i></li>\r\n"
						+ "												<li class=\"emoji list-inline-item\"><i\r\n"
						+ "													class=\"em em-full_moon_with_face\"></i></li>\r\n"
						+ "											</ul>\r\n"
						+ "										</div>\r\n"
						+ "										<a href=\"#\"\r\n"
						+ "											class=\"d-flex align-items-center fw-600 text-grey-900 text-dark lh-26 font-xssss\"><i\r\n"
						+ "											class=\"feather-message-circle text-dark text-grey-900 btn-round-sm font-lg\"></i><span\r\n"
						+ "											class=\"d-none-xss\">"+comentCount+"</span></a>\r\n"
						+ "									</div>\r\n"
						+ "								</div>";
					$("#bw").after(sss);
					$("textarea[name=message]").val("");
				}
			})			
			.fail(function(req,status,error){
				console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',req.status,req.responseText,error,status);
			})
		}
		
		function like(no) {
			$.ajax({
				url:'<c:url value="/community/bbs/"/>',
				data:"no="+no
			})
			.done(function(data){
				//console.log(data);			
			})			
			.fail(function(req,status,error){
				console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',req.status,req.responseText,error,status);
			})
		}
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
							$("#spin").remove();F
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

	<script>
	//댓글 - 수정버튼 클릭시
	function editBoard(comment_no) {	
	    $('#comment'+comment_no).css('display','none');
		    
	    $.ajax({
	        type: "GET",
	        url: "./comment.edit.ajax.html?comment_no="+comment_no,
	        dataType: "text",
	        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	        success: function(data) {
	            //console.log("통신데이터 값 : " + data);
	            $('#edit'+comment_no).html(data);
	            $('#edit'+comment_no).css('display','block');
	        }
	    });		    
	}
	
	$('.edittag').on('click',function(e){
		console.log(e.target)
		var text = this.parentElement.parentElement.parentElement.nextElementSibling.children[0].textContent
		$('#editmodal').html(text)
	})
	
	  
	</script>

	<script src="${path}/resources/js/plugin.js"></script>
	<script src="${path}/resources/js/lightbox.js"></script>
	<script src="${path}/resources/js/scripts.js"></script>