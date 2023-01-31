<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  /* accordion */
  .accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}
  </style>
</head>
<body>

		<!-- <div class="container">
		  <h2>추천운동루틴</h2>
		  <p>Click on the button to toggle between showing and hiding content.</p>
		  <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo1">Simple collapsible</button>
		  <div id="demo1" class="collapse">
			<div id="demo" class="carousel slide" data-ride="carousel">
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
			  </ul>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="la.jpg" alt="Los Angeles" width="1100" height="500">
			      <div class="carousel-caption">
			        <h3>Los Angeles</h3>
			        <p>We had such a great time in LA!</p>
			      </div>   
			    </div>
			    <div class="carousel-item">
			      <img src="chicago.jpg" alt="Chicago" width="1100" height="500">
			      <div class="carousel-caption">
			        <h3>Chicago</h3>
			        <p>Thank you, Chicago!</p>
			      </div>   
			    </div>
			    <div class="carousel-item">
			      <img src="ny.jpg" alt="New York" width="1100" height="500">
			      <div class="carousel-caption">
			        <h3>New York</h3>
			        <p>We love the Big Apple!</p>
			      </div>   
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			</div>
		</div>
	</div> -->
	
	
<div class="container">
	<fieldset class="recommend-routine">
		<c:forEach var="record" items="${recommendRoutList }" >
			<button class="accordion">${record.ROUT_CONTENT }</button>
				
				<div class="panel">
				
				  <div id="demo" class="carousel slide" data-ride="carousel">
					  <ul class="carousel-indicators">
					    <li data-target="#demo" data-slide-to="0" class="active"></li>
					    <li data-target="#demo" data-slide-to="1"></li>
					    <li data-target="#demo" data-slide-to="2"></li>
					    <li data-target="#demo" data-slide-to="3"></li>
					    <li data-target="#demo" data-slide-to="4"></li>
					    <li data-target="#demo" data-slide-to="5"></li>
					    <li data-target="#demo" data-slide-to="6"></li>
					  </ul>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="la.jpg" alt="Los Angeles" width="1100" height="500">
					      <div class="carousel-caption">
					        <h3>Los Angeles</h3>
					        <p>We had such a great time in LA!</p>
					      </div>   
					    </div>
					    <div class="carousel-item">
					      <img src="chicago.jpg" alt="Chicago" width="1100" height="500">
					      <div class="carousel-caption">
					        <h3>Chicago</h3>
					        <p>Thank you, Chicago!</p>
					      </div>   
					    </div>
					    <div class="carousel-item">
					      <img src="ny.jpg" alt="New York" width="1100" height="500">
					      <div class="carousel-caption">
					        <h3>New York</h3>
					        <p>We love the Big Apple!</p>
					      </div>   
					    </div>
					  </div>
					  <a class="carousel-control-prev" href="#demo" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#demo" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
					</div>
				</div>
			</c:forEach>
				<!-- <button class="accordion">Section 2</button>
				<div class="panel">
				  <div id="demo2" class="carousel slide" data-ride="carousel">
					  <ul class="carousel-indicators">
					    <li data-target="#demo2" data-slide-to="0" class="active"></li>
					    <li data-target="#demo2" data-slide-to="1"></li>
					    <li data-target="#demo2" data-slide-to="2"></li>
					  </ul>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="la.jpg" alt="Los Angeles" width="1100" height="500">
					      <div class="carousel-caption">
					        <h3>Los Angeles</h3>
					        <p>We had such a great time in LA!</p>
					      </div>   
					    </div>
					    <div class="carousel-item">
					      <img src="chicago.jpg" alt="Chicago" width="1100" height="500">
					      <div class="carousel-caption">
					        <h3>Chicago</h3>
					        <p>Thank you, Chicago!</p>
					      </div>   
					    </div>
					    <div class="carousel-item">
					      <img src="ny.jpg" alt="New York" width="1100" height="500">
					      <div class="carousel-caption">
					        <h3>New York</h3>
					        <p>We love the Big Apple!</p>
					      </div>   
					    </div>
					  </div>
					  <a class="carousel-control-prev" href="#demo2" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#demo2" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
					</div>
				</div>
				
				<button class="accordion">Section 3</button>
				<div class="panel">
				  <div id="demo3" class="carousel slide" data-ride="carousel">
				  <ul class="carousel-indicators">
				    <li data-target="#demo3" data-slide-to="0" class="active"></li>
				    <li data-target="#demo3" data-slide-to="1"></li>
				    <li data-target="#demo3" data-slide-to="2"></li>
				  </ul>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="la.jpg" alt="Los Angeles" width="1100" height="500">
				      <div class="carousel-caption">
				        <h3>Los Angeles</h3>
				        <p>We had such a great time in LA!</p>
				      </div>   
				    </div>
				    <div class="carousel-item">
				      <img src="chicago.jpg" alt="Chicago" width="1100" height="500">
				      <div class="carousel-caption">
				        <h3>Chicago</h3>
				        <p>Thank you, Chicago!</p>
				      </div>   
				    </div>
				    <div class="carousel-item">
				      <img src="ny.jpg" alt="New York" width="1100" height="500">
				      <div class="carousel-caption">
				        <h3>New York</h3>
				        <p>We love the Big Apple!</p>
				      </div>   
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#demo3" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo3" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
				</div>
			</div> -->
	</fieldset>
</div>
</body>
</html>
<script>
var acc = document.getElementsByClassName("accordion");

for (var i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
