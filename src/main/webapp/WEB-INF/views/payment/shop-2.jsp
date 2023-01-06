<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

        <!-- navigation left -->
        <nav class="navigation scroll-bar">
            <div class="container ps-0 pe-0">
                <div class="nav-content">
                    <div class="nav-wrap bg-white bg-transparent-card rounded-xxl shadow-xss pt-3 pb-1 mb-2 mt-2">
                        <div class="nav-caption fw-600 font-xssss text-grey-500"><span>New </span>Feeds</div>
                        <ul class="mb-1 top-content">
                            <li class="logo d-none d-xl-block d-lg-block"></li>
                            <li><a href="default.html" class="nav-content-bttn open-font" ><i class="feather-tv btn-round-md bg-blue-gradiant me-3"></i><span>Newsfeed</span></a></li>
                            <li><a href="default-badge.html" class="nav-content-bttn open-font" ><i class="feather-award btn-round-md bg-red-gradiant me-3"></i><span>Badges</span></a></li>
                            <li><a href="default-storie.html" class="nav-content-bttn open-font" ><i class="feather-globe btn-round-md bg-gold-gradiant me-3"></i><span>Explore Stories</span></a></li>
                            <li><a href="default-group.html" class="nav-content-bttn open-font" ><i class="feather-zap btn-round-md bg-mini-gradiant me-3"></i><span>Popular Groups</span></a></li>
                            <li><a href="user-page.html" class="nav-content-bttn open-font"><i class="feather-user btn-round-md bg-primary-gradiant me-3"></i><span>Author Profile </span></a></li>                        
                        </ul>
                    </div>

                    <div class="nav-wrap bg-white bg-transparent-card rounded-xxl shadow-xss pt-3 pb-1 mb-2">
                        <div class="nav-caption fw-600 font-xssss text-grey-500"><span>More </span>Pages</div>
                        <ul class="mb-3">
                            <li><a href="default-email-box.html" class="nav-content-bttn open-font"><i class="font-xl text-current feather-inbox me-3"></i><span>Email Box</span><span class="circle-count bg-warning mt-1">584</span></a></li>
                            <li><a href="default-hotel.html" class="nav-content-bttn open-font"><i class="font-xl text-current feather-home me-3"></i><span>Near Hotel</span></a></li>
                            <li><a href="default-event.html" class="nav-content-bttn open-font"><i class="font-xl text-current feather-map-pin me-3"></i><span>Latest Event</span></a></li>
                            <li><a href="default-live-stream.html" class="nav-content-bttn open-font"><i class="font-xl text-current feather-youtube me-3"></i><span>Live Stream</span></a></li>                        
                        </ul>
                    </div>
                    <div class="nav-wrap bg-white bg-transparent-card rounded-xxl shadow-xss pt-3 pb-1">
                        <div class="nav-caption fw-600 font-xssss text-grey-500"><span></span> Account</div>
                        <ul class="mb-1">
                            <li class="logo d-none d-xl-block d-lg-block"></li>
                            <li><a href="default-settings.html" class="nav-content-bttn open-font h-auto pt-2 pb-2"><i class="font-sm feather-settings me-3 text-grey-500"></i><span>Settings</span></a></li>
                            <li><a href="default-analytics.html" class="nav-content-bttn open-font h-auto pt-2 pb-2"><i class="font-sm feather-pie-chart me-3 text-grey-500"></i><span>Analytics</span></a></li>
                            <li><a href="default-message.html" class="nav-content-bttn open-font h-auto pt-2 pb-2"><i class="font-sm feather-message-square me-3 text-grey-500"></i><span>Chat</span><span class="circle-count bg-warning mt-0">23</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- navigation left -->
        <!-- main content -->
        <div class="main-content bg-white right-chat-active theme-dark-bg">
            
            <div class="middle-sidebar-bottom">
                <div class="middle-sidebar-left pe-0">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="row">
                                <div class="col-lg-12">
                                    
                                    <div class="banner-wrapper bg-greylight overflow-hidden rounded-3">
                                        <div class="banner-slider owl-carousel owl-theme dot-style2 owl-nav-link link-style3 overflow-hidden">
                                             <div class="owl-items style1 d-flex align-items-center bg-lightblue" >
                                                <div class="row">
                                                    <div class="col-lg-6 p-lg-5 ps-5 pe-5 pt-4" style="padding-right: 20px !important;">
                                                        <div class="card w-100 border-0 ps-lg-5 ps-0 bg-transparent bg-transparent-card">
                                                            <h4 class="font-xssss text-danger ls-3 fw-700 ms-0 mt-4 mb-3">TRENDING</h4>
                                                            <h2 class="fw-300 display2-size display2-md-size lh-2 text-grey-900">New Arrival Buds <br> <b class="fw-700">Collection</b></h2>
                                                            <p class="fw-500 text-grey-500 lh-26 font-xssss pe-lg-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla dolor, ornare at commodo non, feugiat non nisi. Phasellus faucibus mollis pharetra.</p>
                                                            <a href="<c:url value="/getToken.do"/>" class="fw-700 text-white rounded-xl bg-primary-gradiant font-xsssss text-uppercase ls-3 lh-30 mt-0 text-center d-inline-block p-2 w150">Shop Now</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6"><img src="https://via.placeholder.com/350x350.png" alt="image" class="img-fluid p-md-5 p-4"></div>
                                                </div>
                                            </div>
                                            <div class="owl-items style1 d-flex align-items-center bg-cyan" >
                                                <div class="row">
                                                    <div class="col-lg-6 p-lg-5 ps-5 pe-5 pt-4" style="padding-right: 20px !important;">
                                                        <div class="card w-100 border-0 ps-lg-5 ps-0 bg-transparent bg-transparent-card">
                                                            <h4 class="font-xssss text-white ls-3 fw-700 ms-0 mt-4 mb-3">TRENDING</h4>
                                                            <h2 class="fw-300 display2-size display2-md-size lh-2 text-white">New Arrival Buds <br> <b class="fw-700">Collection</b></h2>
                                                            <p class="fw-500 text-grey-100 lh-26 font-xssss pe-lg-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla dolor, ornare at commodo non, feugiat non nisi. Phasellus faucibus mollis pharetra.</p>
                                                            <a href="#" class="fw-700 text-grey-900 rounded-xl bg-white font-xsssss text-uppercase ls-3 lh-30 mt-0 text-center d-inline-block p-2 w150">Shop Now</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6"><img src="https://via.placeholder.com/350x350.png" alt="image" class="img-fluid p-md-5 p-4"></div>
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Textured Sleeveless Camisole</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Adjustable Shoulder Straps</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Neck Strappy Camisole</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Scoop-Neck Strappy</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Butler Stool Ladder</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Butler Stool Ladder</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Butler Stool Ladder</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Butler Stool Ladder</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Textured Sleeveless Camisole</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Adjustable Shoulder Straps</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Neck Strappy Camisole</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6">
                                    <div class="card w-100 border-0 mt-4">
                                        <div class="card-image w-100 p-0 text-center bg-greylight  rounded-3 mb-2">
                                            <a href="single-product.html"><img src="https://via.placeholder.com/300x300.png" alt="product-image" class="w-100 mt-0 mb-0 p-5 mt-4 mb-4"></a>
                                        </div>
                                        <div class="card-body w-100 p-0 text-center">
                                            <div class="star w-100 d-block text-left mt-0 text-center">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star.png" alt="star" class="w15">
                                                <img src="images/star-disable.png" alt="star" class="w15 me-1 me-2">
                                            </div>
                                            <h2 class="mt-1 mb-1"><a href="single-product.html" class="text-black fw-700 font-xsss text-dark lh-26">Scoop-Neck Strappy</a></h2>
                                            <h6 class="font-xsss fw-600 text-grey-500 ls-2">$449</h6>
                                        </div>                                
                                    </div>
                                </div>
                                <div class="col-lg-12 mt-3 mb-5 text-center"><a href="#" class="fw-700 text-white font-xssss text-uppercase ls-3 lh-32 rounded-3 mt-3 text-center d-inline-block p-2 bg-current w150">Load More</a></div>
                            </div>
                        </div>     
                    </div>
                </div>
                 
            </div>            
        </div>
        <!-- main content -->

        <!-- right chat -->
        <div class="right-chat nav-wrap mt-2 right-scroll-bar">
            <div class="middle-sidebar-right-content bg-white shadow-xss rounded-xxl">

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

                <div class="section full pe-3 ps-4 pt-4 position-relative feed-body">
                    <h4 class="font-xsssss text-grey-500 text-uppercase fw-700 ls-3">CONTACTS</h4>
                    <ul class="list-group list-group-flush">
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            <figure class="avatar float-left mb-0 me-2">
                                <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35">
                            </figure>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Hurin Seary</a>
                            </h3>
                            <span class="badge badge-primary text-white badge-pill fw-500 mt-0">2</span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            <figure class="avatar float-left mb-0 me-2">
                                <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35">
                            </figure>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Victor Exrixon</a>
                            </h3>
                            <span class="bg-success ms-auto btn-round-xss"></span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            <figure class="avatar float-left mb-0 me-2">
                                <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35">
                            </figure>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Surfiya Zakir</a>
                            </h3>
                            <span class="bg-warning ms-auto btn-round-xss"></span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            <figure class="avatar float-left mb-0 me-2">
                                <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35">
                            </figure>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Goria Coast</a>
                            </h3>
                            <span class="bg-success ms-auto btn-round-xss"></span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            <figure class="avatar float-left mb-0 me-2">
                                <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35">
                            </figure>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Hurin Seary</a>
                            </h3>
                            <span class="badge mt-0 text-grey-500 badge-pill pe-0 font-xsssss">4:09 pm</span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            <figure class="avatar float-left mb-0 me-2">
                                <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35">
                            </figure>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">David Goria</a>
                            </h3>
                            <span class="badge mt-0 text-grey-500 badge-pill pe-0 font-xsssss">2 days</span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            <figure class="avatar float-left mb-0 me-2">
                                <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35">
                            </figure>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Seary Victor</a>
                            </h3>
                            <span class="bg-success ms-auto btn-round-xss"></span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            <figure class="avatar float-left mb-0 me-2">
                                <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35">
                            </figure>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Ana Seary</a>
                            </h3>
                            <span class="bg-success ms-auto btn-round-xss"></span>
                        </li>
                        
                    </ul>
                </div>
                <div class="section full pe-3 ps-4 pt-4 pb-4 position-relative feed-body">
                    <h4 class="font-xsssss text-grey-500 text-uppercase fw-700 ls-3">GROUPS</h4>
                    <ul class="list-group list-group-flush">
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            
                            <span class="btn-round-sm bg-primary-gradiant me-3 ls-3 text-white font-xssss fw-700">UD</span>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Studio Express</a>
                            </h3>
                            <span class="badge mt-0 text-grey-500 badge-pill pe-0 font-xsssss">2 min</span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            
                            <span class="btn-round-sm bg-gold-gradiant me-3 ls-3 text-white font-xssss fw-700">UD</span>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Armany Design</a>
                            </h3>
                            <span class="bg-warning ms-auto btn-round-xss"></span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            
                            <span class="btn-round-sm bg-mini-gradiant me-3 ls-3 text-white font-xssss fw-700">UD</span>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">De fabous</a>
                            </h3>
                            <span class="bg-success ms-auto btn-round-xss"></span>
                        </li>
                    </ul>
                </div>
                <div class="section full pe-3 ps-4 pt-0 pb-4 position-relative feed-body">
                    <h4 class="font-xsssss text-grey-500 text-uppercase fw-700 ls-3">Pages</h4>
                    <ul class="list-group list-group-flush">
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            
                            <span class="btn-round-sm bg-primary-gradiant me-3 ls-3 text-white font-xssss fw-700">UD</span>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Armany Seary</a>
                            </h3>
                            <span class="bg-success ms-auto btn-round-xss"></span>
                        </li>
                        <li class="bg-transparent list-group-item no-icon pe-0 ps-0 pt-2 pb-2 border-0 d-flex align-items-center">
                            
                            <span class="btn-round-sm bg-gold-gradiant me-3 ls-3 text-white font-xssss fw-700">UD</span>
                            <h3 class="fw-700 mb-0 mt-0">
                                <a class="font-xssss text-grey-600 d-block text-dark model-popup-chat" href="#">Entropio Inc</a>
                            </h3>
                            <span class="bg-success ms-auto btn-round-xss"></span>
                        </li>
                        
                    </ul>
                </div>

            </div>
        </div>

        
        <!-- right chat -->
        
        <div class="app-footer border-0 shadow-lg bg-primary-gradiant">
            <a href="default.html" class="nav-content-bttn nav-center"><i class="feather-home"></i></a>
            <a href="default-video.html" class="nav-content-bttn"><i class="feather-package"></i></a>
            <a href="default-live-stream.html" class="nav-content-bttn" data-tab="chats"><i class="feather-layout"></i></a>            
            <a href="shop-2.html" class="nav-content-bttn"><i class="feather-layers"></i></a>
            <a href="default-settings.html" class="nav-content-bttn"><img src="https://via.placeholder.com/50x50.png" alt="user" class="w30 shadow-xss"></a>
        </div>

        <div class="app-header-search">
            <form class="search-form">
                <div class="form-group searchbox mb-0 border-0 p-1">
                    <input type="text" class="form-control border-0" placeholder="Search...">
                    <i class="input-icon">
                        <ion-icon name="search-outline" role="img" class="md hydrated" aria-label="search outline"></ion-icon>
                    </i>
                    <a href="#" class="ms-1 mt-1 d-inline-block close searchbox-close">
                        <i class="ti-close font-xs"></i>
                    </a>
                </div>
            </form>
        </div>

    </div> 

    

    <div class="modal-popup-chat">
        <div class="modal-popup-wrap bg-white p-0 shadow-lg rounded-3">
            <div class="modal-popup-header w-100 border-bottom">
                <div class="card p-3 d-block border-0 d-block">
                    <figure class="avatar mb-0 float-left me-2">
                        <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35 me-1">
                    </figure>
                    <h5 class="fw-700 text-primary font-xssss mt-1 mb-1">Hendrix Stamp</h5>
                    <h4 class="text-grey-500 font-xsssss mt-0 mb-0"><span class="d-inline-block bg-success btn-round-xss m-0"></span> Available</h4>
                    <a href="#" class="font-xssss position-absolute right-0 top-0 mt-3 me-4"><i class="ti-close text-grey-900 mt-2 d-inline-block"></i></a>
                </div>
            </div>
            <div class="modal-popup-body w-100 p-3 h-auto">
                <div class="message"><div class="message-content font-xssss lh-24 fw-500">Hi, how can I help you?</div></div>
                <div class="date-break font-xsssss lh-24 fw-500 text-grey-500 mt-2 mb-2">Mon 10:20am</div>
                <div class="message self text-right mt-2"><div class="message-content font-xssss lh-24 fw-500">I want those files for you. I want you to send 1 PDF and 1 image file.</div></div>
                <div class="snippet pt-3 ps-4 pb-2 pe-3 mt-2 bg-grey rounded-xl float-right" data-title=".dot-typing"><div class="stage"><div class="dot-typing"></div></div></div>
                <div class="clearfix"></div>
            </div>
            <div class="modal-popup-footer w-100 border-top">
                <div class="card p-3 d-block border-0 d-block">
                    <div class="form-group icon-right-input style1-input mb-0"><input type="text" placeholder="Start typing.." class="form-control rounded-xl bg-greylight border-0 font-xssss fw-500 ps-3"><i class="feather-send text-grey-500 font-md"></i></div>
                </div>
            </div>
        </div> 
    </div>
