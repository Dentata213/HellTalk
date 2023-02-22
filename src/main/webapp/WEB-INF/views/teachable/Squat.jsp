<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">

<link rel="stylesheet" href="${path}/resources/css/teachable.css">
<link rel="stylesheet" href="${path}/resources/css/lightbox.css">


<style>
.center {
	left: 0%;
	transform: translate(0%, 0%);
}

#cameraCard1 {
	margin-top: 70px;
	margin-bottom: 30px;
}
#cameraCard2 {
	margin-top: 20px;
	padding: 20px 0px 20px 0px;
	
}

#squatH1 {
	text-align: center;
	font-weight: bold;
	margin: 20px 20px 20px 20px;
}

}
.card {
	align-items: center;
}

#countCard {
	width: 100%;
	border: 2px solid #1A2236;
	background-color: #f7f7f7 !important;
	padding: 80px 20px 80px 20px;
	align-items: center;
	margin-top: 15px;
}
.col-4 {
	flex: 0 0 20%;
}
#canvas {
	right: 20%;
	top: 20%;
	height: 500px;
	border: 2px solid #1A2236;
	border-radius: 20px;
	margin: 20px 20px 20px 20px;
	background-color: #1A2236;
}

input[type=button] {
	width: 20%;
	height: 20%;
	margin-bottom: 20px;
}

.container {
	align-items: center;
}

.webCamera {
	width: 90px;
	height: 90px;
	border-radius: 20px;
	margin-right: 5px;
}

.cam {
	width: 60%;
	height: 60%;
}
.item{
  background-color: black;
}
.active{
  background-color: #ff9500;
}

#control{
	background-color: #1A2236 !important;
	padding: 20px 20px 0px 20px;
	margin: 20px 20px 20px 0px;
}
#camspan{
	display: flex;
	justify-content: center;
}
.row{
	justify-content: center;
}
#canvasCard{
	padding: 0px 0px 0px 0px;
}
</style>

<div class="main-content">
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar layout-without-menu">
		<div class="layout-container">
			<!-- Layout container -->
			<div class="layout-page">
				<div class="container">

					<div class="card rounded-xl" id="cameraCard1">
						<h1 id="squatH1">스쿼트(Squat)</h1>
					</div>
					<div class="card rounded-xl" id="cameraCard2">
						<div class="row">
							<div class="col-9 card rounded-xl" id="canvasCard">
								<canvas id="canvas"></canvas>
							</div>

							<div class="col-4 card rounded-xl" id="control">
								<span id="camspan">
									<button type="button" onclick="init()" id="webcambutton"
										class="webCamera">
										<img class="cam" src="${path}/resources/images/teachable/cameraOn.png">
									</button>
									<button type="button" onclick="stop()" id="stopbutton"
										class="webCamera">
										<img class="cam" src="${path}/resources/images/teachable/out.png">
									</button>
								</span>
								<div class="card rounded-xl" id="countCard">
									<div class="headline">Counter</div>
									<div class="circle-big">
										<div class="text">
											<span id="counter">0</span>
											<div class="small">개</div>
										</div>
										<svg>
					                        <circle class="bg" cx="57" cy="57" r="52" />
					                        <circle class="progress" cx="57" cy="57" r="52" />
						               	</svg>
									</div>
								</div>
							</div>
							<!-- Card -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript">
			
			//버튼 이벤트
			$('#camspan .webCamera').on("click",function(){
				console.log('버튼 이벤트 발생');
			    $("#camspan .webCamera.active").removeClass('active');
			    $(this).addClass("active");
			});
			
		    // the link to your model provided by Teachable Machine export panel
		    const URL = "${path}/resources/teachableModel/squat/";
		    let model, webcam, ctx, maxPredictions;
		    //$(document).ready(function(){
			    async function init() {
			    	console.log("init함수 실행");
			        const modelURL = URL + "model.json";
			        const metadataURL = URL + "metadata.json";
			
			        // load the model and metadata
			        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
			        // Note: the pose library adds a tmPose object to your window (window.tmPose)
			        model = await tmPose.load(modelURL, metadataURL);
			        maxPredictions = model.getTotalClasses();
			
			        // Convenience function to setup a webcam
			        const size = 600;
			        const flip = true; // whether to flip the webcam
			        webcam = new tmPose.Webcam(size, size, flip); // width, height, flip
			        await webcam.setup(); // request access to the webcam
			        await webcam.play();
			        window.requestAnimationFrame(loop);
			
			        // append/get elements to the DOM
			        const canvas = document.getElementById("canvas");
			        canvas.width = size; canvas.height = size;
			        ctx = canvas.getContext("2d");
			        
			    }///init()
		    //});///////////////////
			
		
		    async function loop(timestamp) {
		        webcam.update(); // update the webcam frame
		        await predict();
		        window.requestAnimationFrame(loop);
		    }
		    
		    var progress = 327
	        var status = "stand"
	        var count = 0
		
		    async function predict() {
		        // Prediction #1: run input through posenet
		        // estimatePose can take in an image, video or canvas html element
		        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
		        // Prediction 2: run input through teachable machine classification model
		        const prediction = await model.predict(posenetOutput);
				
		        if (prediction[0].probability.toFixed(2) > 0.90) {
	                if (status == "squat") {
	                    count++
	                    //audio = new Audio(count % 10 + '.mp3');
	                    //audio.play();
	                    progress = progress-32.7
	                    if(progress <= 0) {
	                        progress = 327-32.7
	                    }
	                    $('.progress').css('stroke-dashoffset', progress);
	                    $('#counter').html(count);
	                }
	                status = "stand"
	            } else if (prediction[1].probability.toFixed(2) == 1.00) {
	                status = "squat"
	            } else if (prediction[2].probability.toFixed(2) == 1.00) {
	                if (status == "squat" || status == "stand") {
	                    //var audio = new Audio('bent.mp3');
	                    //audio.play();
	                    console.log("허리를 펴고 천천히 앉아야 합니다.");
	                }
	                status = "bent"
	            }
		        
		        /*
		        for (let i = 0; i < maxPredictions; i++) {
		            const classPrediction =
		                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
		            labelContainer.childNodes[i].innerHTML = classPrediction;
		        }*/
		
		        // finally draw the poses
		        drawPose(pose);
		    }
		
		    function drawPose(pose) {
		        if (webcam.canvas) {
		            ctx.drawImage(webcam.canvas, 0, 0);
		            // draw the keypoints and skeleton
		            if (pose) {
		                const minPartConfidence = 0.5;
		                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
		                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
		            }
		        }
		    }
		    
		    function stop(){
		    	window.location.href = '<c:url value="/teachable/result.do"/>'+count
		    }

	</script>

<script src="${path}/resources/js/plugin.js"></script>
<script src="${path}/resources/js/lightbox.js"></script>
<script src="${path}/resources/js/scripts.js"></script>