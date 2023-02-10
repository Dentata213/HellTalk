<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<link rel="stylesheet" href="${path}/resources/css/lightbox.css">
<script rel="stylesheet" href="${path}/resources/js/teachable.js">
	
	<div class="container mt-5">
		<div class="frame">
			<div class="center">
				<div class="headline">
					<div class="small">Squat</div>
					Counter
				</div>
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
		<h1>Squat</h1>
		<button class="btn btn-primary" type="button" onclick="init()">Start</button>
		<div>
			<canvas id="canvas"></canvas>
		</div>
		<div id="label-container"></div>

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
		    // More API functions here:
		    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/pose
		
		    // the link to your model provided by Teachable Machine export panel
		    const URL = "https://teachablemachine.withgoogle.com/models/vE2tyPUbZ/";
		    let model, webcam, ctx, labelContainer, maxPredictions;
		
		    async function init() {
		        const modelURL = URL + "model.json";
		        const metadataURL = URL + "metadata.json";
		
		        // load the model and metadata
		        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
		        // Note: the pose library adds a tmPose object to your window (window.tmPose)
		        model = await tmPose.load(modelURL, metadataURL);
		        maxPredictions = model.getTotalClasses();
		
		        // Convenience function to setup a webcam
		        const size = 200;
		        const flip = true; // whether to flip the webcam
		        webcam = new tmPose.Webcam(size, size, flip); // width, height, flip
		        await webcam.setup(); // request access to the webcam
		        await webcam.play();
		        window.requestAnimationFrame(loop);
		
		        // append/get elements to the DOM
		        const canvas = document.getElementById("canvas");
		        canvas.width = size; canvas.height = size;
		        ctx = canvas.getContext("2d");
		        labelContainer = document.getElementById("label-container");
		        for (let i = 0; i < maxPredictions; i++) { // and class labels
		            labelContainer.appendChild(document.createElement("div"));
		        }
		    }
		
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
	                    var audio = new Audio(count % 10 + '.mp3');
	                    audio.play();
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
	            }
		        
		        for (let i = 0; i < maxPredictions; i++) {
		            const classPrediction =
		                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
		            labelContainer.childNodes[i].innerHTML = classPrediction;
		        }
		
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
	</script>
	
	<script src="${path}/resources/js/plugin.js"></script>
	<script src="${path}/resources/js/lightbox.js"></script>
	<script src="${path}/resources/js/scripts.js"></script>