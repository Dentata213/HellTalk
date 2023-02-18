<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/"/>
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
    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>
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


    <link rel="stylesheet" href="${path}assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${path}assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${path}assets/js/config.js"></script>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>

  <body>
    <div class="container-xxl flex-grow-1 container-p-y">
      <div class="row">
        <div class="col-lg-8 mb-4 order-0">
          <div class="card">
              <div id="chart_div"></div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 order-1">
          <div class="row">
            <div class="col-lg-6 col-md-12 col-6 mb-4">
              <div class="card">
                <div class="card-body">
                  <div class="card-title d-flex align-items-start justify-content-between">
                    <div class="avatar flex-shrink-0">
                      <img
                        src="${path}assets/img/icons/unicons/chart-success.png"
                        alt="chart success"
                        class="rounded"
                      />
                    </div>
                    <div class="dropdown">
                      <button
                        class="btn p-0"
                        type="button"
                        id="cardOpt3"
                        data-bs-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                      >
                        <i class="bx bx-dots-vertical-rounded"></i>
                      </button>
                      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt3">
                        <a class="dropdown-item" href="javascript:void(0);">View More</a>
                        <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                      </div>
                    </div>
                  </div>
                  <span class="fw-semibold d-block mb-1">Profit</span>
                  <h3 class="card-title mb-2">$12,628</h3>
                  <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +72.80%</small>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-12 col-6 mb-4">
              <div class="card">
                <div class="card-body">
                  <div class="card-title d-flex align-items-start justify-content-between">
                    <div class="avatar flex-shrink-0">
                      <img
                        src="${path}assets/img/icons/unicons/wallet-info.png"
                        alt="Credit Card"
                        class="rounded"
                      />
                    </div>
                    <div class="dropdown">
                      <button
                        class="btn p-0"
                        type="button"
                        id="cardOpt6"
                        data-bs-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                      >
                        <i class="bx bx-dots-vertical-rounded"></i>
                      </button>
                      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
                        <a class="dropdown-item" href="javascript:void(0);">View More</a>
                        <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                      </div>
                    </div>
                  </div>
                  <span>Sales</span>
                  <h3 class="card-title text-nowrap mb-1">$4,679</h3>
                  <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.42%</small>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Total Revenue -->
        <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
          <div class="card">
            <div class="row row-bordered g-0">
              <div class="col-md-8">
                <h5 class="card-header m-0 me-2 pb-3">Total Revenue</h5>
                <div id="totalRevenueChart" class="px-2"></div>
              </div>
              <div class="col-md-4">
                <div class="card-body">
                  <div class="text-center">
                    <div class="dropdown">
                      <button
                        class="btn btn-sm btn-outline-primary dropdown-toggle"
                        type="button"
                        id="growthReportId"
                        data-bs-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                      >
                        2022
                      </button>
                      <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
                        <a class="dropdown-item" href="javascript:void(0);">2021</a>
                        <a class="dropdown-item" href="javascript:void(0);">2020</a>
                        <a class="dropdown-item" href="javascript:void(0);">2019</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div id="growthChart"></div>
                <div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>

                <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                  <div class="d-flex">
                    <div class="me-2">
                      <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
                    </div>
                    <div class="d-flex flex-column">
                      <small>2022</small>
                      <h6 class="mb-0">$32.5k</h6>
                    </div>
                  </div>
                  <div class="d-flex">
                    <div class="me-2">
                      <span class="badge bg-label-info p-2"><i class="bx bx-wallet text-info"></i></span>
                    </div>
                    <div class="d-flex flex-column">
                      <small>2021</small>
                      <h6 class="mb-0">$41.2k</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--/ Total Revenue -->
        
      <div class="row">
        <!-- Order Statistics -->
        <div class="col-md-4 col-lg-8 col-xl-8 order-0 mb-4">
          <div class="card h-100">
            <div class="card-header d-flex align-items-center justify-content-between pb-0">
              
              <div id="piechart" style="width: 100%; height: 400px;"></div>
              
            </div>
          </div>
        </div>
        <!--/ Order Statistics -->

        
        <!--/ Expense Overview -->

        <!-- Transactions -->
        <div class="col-md-6 col-lg-4 order-2 mb-4">
          <div class="card h-100">
            <div class="card-header d-flex align-items-center justify-content-between">
              <h5 class="card-title m-0 me-2">Transactions</h5>
              <div class="dropdown">
                <button
                  class="btn p-0"
                  type="button"
                  id="transactionID"
                  data-bs-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="bx bx-dots-vertical-rounded"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="transactionID">
                  <a class="dropdown-item" href="javascript:void(0);">Last 28 Days</a>
                  <a class="dropdown-item" href="javascript:void(0);">Last Month</a>
                  <a class="dropdown-item" href="javascript:void(0);">Last Year</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <ul class="p-0 m-0">
                <li class="d-flex mb-4 pb-1">
                  <div class="avatar flex-shrink-0 me-3">
                    <img src="${path}assets/img/icons/unicons/paypal.png" alt="User" class="rounded" />
                  </div>
                  <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                    <div class="me-2">
                      <small class="text-muted d-block mb-1">Paypal</small>
                      <h6 class="mb-0">Send money</h6>
                    </div>
                    <div class="user-progress d-flex align-items-center gap-1">
                      <h6 class="mb-0">+82.6</h6>
                      <span class="text-muted">USD</span>
                    </div>
                  </div>
                </li>
                <li class="d-flex mb-4 pb-1">
                  <div class="avatar flex-shrink-0 me-3">
                    <img src="${path}assets/img/icons/unicons/wallet.png" alt="User" class="rounded" />
                  </div>
                  <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                    <div class="me-2">
                      <small class="text-muted d-block mb-1">Wallet</small>
                      <h6 class="mb-0">Mac'D</h6>
                    </div>
                    <div class="user-progress d-flex align-items-center gap-1">
                      <h6 class="mb-0">+270.69</h6>
                      <span class="text-muted">USD</span>
                    </div>
                  </div>
                </li>
                <li class="d-flex mb-4 pb-1">
                  <div class="avatar flex-shrink-0 me-3">
                    <img src="${path}assets/img/icons/unicons/chart.png" alt="User" class="rounded" />
                  </div>
                  <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                    <div class="me-2">
                      <small class="text-muted d-block mb-1">Transfer</small>
                      <h6 class="mb-0">Refund</h6>
                    </div>
                    <div class="user-progress d-flex align-items-center gap-1">
                      <h6 class="mb-0">+637.91</h6>
                      <span class="text-muted">USD</span>
                    </div>
                  </div>
                </li>
                <li class="d-flex mb-4 pb-1">
                  <div class="avatar flex-shrink-0 me-3">
                    <img src="${path}assets/img/icons/unicons/cc-success.png" alt="User" class="rounded" />
                  </div>
                  <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                    <div class="me-2">
                      <small class="text-muted d-block mb-1">Credit Card</small>
                      <h6 class="mb-0">Ordered Food</h6>
                    </div>
                    <div class="user-progress d-flex align-items-center gap-1">
                      <h6 class="mb-0">-838.71</h6>
                      <span class="text-muted">USD</span>
                    </div>
                  </div>
                </li>
                <li class="d-flex mb-4 pb-1">
                  <div class="avatar flex-shrink-0 me-3">
                    <img src="${path}assets/img/icons/unicons/wallet.png" alt="User" class="rounded" />
                  </div>
                  <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                    <div class="me-2">
                      <small class="text-muted d-block mb-1">Wallet</small>
                      <h6 class="mb-0">Starbucks</h6>
                    </div>
                    <div class="user-progress d-flex align-items-center gap-1">
                      <h6 class="mb-0">+203.33</h6>
                      <span class="text-muted">USD</span>
                    </div>
                  </div>
                </li>
                <li class="d-flex">
                  <div class="avatar flex-shrink-0 me-3">
                    <img src="${path}assets/img/icons/unicons/cc-warning.png" alt="User" class="rounded" />
                  </div>
                  <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                    <div class="me-2">
                      <small class="text-muted d-block mb-1">Mastercard</small>
                      <h6 class="mb-0">Ordered Food</h6>
                    </div>
                    <div class="user-progress d-flex align-items-center gap-1">
                      <h6 class="mb-0">-92.45</h6>
                      <span class="text-muted">USD</span>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!--/ Transactions -->
      </div>
    </div>
    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${path}assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${path}assets/vendor/libs/popper/popper.js"></script>
    <script src="${path}assets/vendor/js/bootstrap.js"></script>


    <script src="${path}assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="${path}assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="${path}assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${path}assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script type="text/javascript">
    	var esdata;
    	var esdata2;
	    $.ajax({
			url:'<c:url value="/backend/selectJoinMember"/>',
			method:'get',
			dataType:'json',
		  }).done(function(e){
			  esdata=[e[0].U_ENTERDATE,e[0].ENTER,e[1].U_ENTERDATE,e[1].ENTER,e[2].U_ENTERDATE,e[2].ENTER,e[3].U_ENTERDATE,e[3].ENTER,e[4].U_ENTERDATE,e[4].ENTER]; 
		  });
	    $.ajax({
			url:'<c:url value="/backend/selectGenderMember"/>',
			method:'get',
			dataType:'json',
		  }).done(function(e){
			  esdata2=[e.user,e.tn]
			  
		  });
	    google.charts.load('current', {packages: ['corechart', 'bar']});
	    google.charts.setOnLoadCallback(drawBasic);
	    
	   

	    function drawBasic() {

	    	console.log(esdata);
	    	var data = google.visualization.arrayToDataTable([
		          ['명', '한주 가입자수',],
		          [esdata[8], esdata[9]],
		          [esdata[6], esdata[7]],
		          [esdata[4], esdata[5]],
		          [esdata[2], esdata[3]],
		          [esdata[0], esdata[1]]
		       ]);
	        var options = {
	          title: '최근 가입자수',
	          chartArea: {width: '50%'},
	          hAxis: {
	            title: 'Total Population',
	            minValue: 0
	          },
	          vAxis: {
	            title: '날짜'
	          }
	        };

	        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

	        chart.draw(data, options);
	      }
    
	    
	   
	    google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawChart2);
	
	    function drawChart2() {
	
	      var data2 = google.visualization.arrayToDataTable([
	    	['Task', '사용자 트레이너 비율'],
	        ['USER', esdata2[0]],
	        ['TRAINER', esdata2[1]]
	      ]);
	
	      var options2 = {
	        title: 'My Daily Activities'
	      };
	
	      var chart2 = new google.visualization.PieChart(document.getElementById('piechart'));
	
	      chart2.draw(data2, options2);
	    }
    </script>
  </body>
</html>
