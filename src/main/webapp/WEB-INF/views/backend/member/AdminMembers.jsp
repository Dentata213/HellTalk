<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/"/>
<c:set var="userlength" value="${userlists}"/>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${path}assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Without menu - Layouts | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${path}assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${path}assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${path}assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${path}assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${path}assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${path}assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${path}assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${path}assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar layout-without-menu">
      <div class="layout-container">
        <!-- Layout container -->
        <div class="layout-page">
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
                
              <!-- Bootstrap Table with Header - Footer -->
              <div class="card" style="height: 100%">
                <h4 class="card-header">사용자 목록</h4>
                <div class="table-responsive text-nowrap"  style="height: 100%">
                  <table class="table text-center">
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th>사용자ID</th>
                        <th>이름</th>
                        <th>비번</th>
                        <th>성별</th>
                        <th>주소</th>
                        <th>전화번호</th>
                        <th>가입일</th>
                        <th>상태</th>
                        <th>메뉴</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty userlists}" var="flag">
                    	<tr>
                    		<td>사용자가 없습니다</td>
                    	</tr>
                    </c:if>
                    <c:if test="${not flag}">
                    <c:forEach var="userInfo" items="${userlists}" varStatus="loop">
                      <tr>
                        <td>${fn:length(userlength)-loop.count+1}</td>
                        <td style="text-align: left">${userInfo.u_id}</td>
                        <td>${userInfo.u_nickname}</td>
                      	<td>${userInfo.u_pw}</td>
                      	<td>${userInfo.u_gender eq 'M'?'남성':'여성'}</td>
                      	<td>User</td>
                      	<td>User</td>
                      	<td>${userInfo.u_enterdate}</td>
                      	<td>
                      		<c:if test="${userInfo.u_status eq 'Y'}" var="isY">
                      			<span class="badge bg-label-success me-1">정상</span>
                      		</c:if>
                      		<c:if test="${not isY}">
                      			<span class="badge bg-label-danger me-1">정지</span>
                      		</c:if>
                      	</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-horizontal-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                            	<a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-block me-1"></i> 차단</a>
	                            <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> 추방</a>
                          </div>
                        </td>
                      </tr>
                      </c:forEach>
                     </c:if>
                    </tbody>
                    <tfoot class="table-border-bottom-0">
                      <tr>
                        <th>번호</th>
                        <th>사용자ID</th>
                        <th>이름</th>
                        <th>비번</th>
                        <th>성별</th>
                        <th>주소</th>
                        <th>전화번호</th>
                        <th>가입일</th>
                        <th>상태</th>
                        <th>메뉴</th>
                      </tr>	
                    </tfoot>
                  </table>
                </div>
              </div>
              <!-- Bootstrap Table with Header - Footer -->
            </div>
            <!-- / Content -->
            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${path}assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${path}assets/vendor/libs/popper/popper.js"></script>
    <script src="${path}assets/vendor/js/bootstrap.js"></script>
    <script src="${path}assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${path}assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="${path}assets/js/main.js"></script>

    <!-- Page JS -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
  <script>
  	$('.dropdown-item').on('click',function(e){
  		var u_id = this.parentElement.parentElement.parentElement.parentElement.children[1].textContent;
  		
  		const swalWithBootstrapButtons = Swal.mixin({
  		  customClass: {
  		    confirmButton: 'btn btn-success',
  		    cancelButton: 'btn btn-danger'
  		  },
  		  buttonsStyling: false
  		})

  		swalWithBootstrapButtons.fire({
  		  title: '정말로 삭제하시겠습니까?',
  		  icon: 'warning',
  		  showCancelButton: true,
  		  confirmButtonText: '삭제', 
  		  cancelButtonText: '취소',
  		  reverseButtons: true,
  		  allowOutsideClick: false
  		}).then((result) => {
  		  if (result.isConfirmed) {
  			//console.log(u_id);
  			$.ajax
  			
  		    swalWithBootstrapButtons.fire(
  		      '삭제완료!',
  		      '삭제가 완료되었습니다',
  		      'success'
  		    )
  		  } else if (
  		    /* Read more about handling dismissals below */
  		    result.dismiss === Swal.DismissReason.cancel
  		  ) {
  		    swalWithBootstrapButtons.fire(
  		      '취소!',
  		      '요청이 취소되었습니다',
  		      'error'
  		    )
  		  }
  		})
  		//console.log(this.parentElement.parentElement.parentElement.parentElement.children[1].textContent);
  		/*
  		Swal.fire({
  		  title: 'Submit your Github username',
  		  input: 'text',
  		  inputAttributes: {
  		    autocapitalize: 'off'
  		  },
  		  showCancelButton: true,
  		  confirmButtonText: 'Look up',
  		  showLoaderOnConfirm: true,
  		  preConfirm: (login) => {
  		    return fetch(`//api.github.com/users/${login}`)
  		      .then(response => {
  		        if (!response.ok) {
  		          throw new Error(response.statusText)
  		        }
  		        return response.json()
  		      })
  		      .catch(error => {
  		        Swal.showValidationMessage(
  		          `Request failed: ${error}`
  		        )
  		      })
  		  },
  		  allowOutsideClick: () => !Swal.isLoading()
  		}).then((result) => {
  		  if (result.isConfirmed) {
  		    Swal.fire({
  		      title: `${result.value.login}'s avatar`,
  		      imageUrl: result.value.avatar_url
  		    })
  		  }
  		})
  		
  		*/
  	})
  </script>
</html>
