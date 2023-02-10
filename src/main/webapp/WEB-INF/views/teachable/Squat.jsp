<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">
<title>AI Fitness Trainer</title>
<style>
body {
	font: 24px/30px 'Noto Sans CJK KR', Noto Sans KR, sans-serif
}
@import url(https://fonts.googleapis.com/css?family=Open+Sans:600,400,300);
 .frame {
	 position: absolute;
	 top: 50%;
	 left: 70%;
	 width: 400px;
	 height: 400px;
	 margin-top: -200px;
	 margin-left: -200px;
	 border-radius: 2px;
	 box-shadow: 1px 2px 10px 0px rgba(0, 0, 0, 0.3);
	 overflow: hidden;
	 background: #28404e;
	 background: -moz-linear-gradient(top, #28404e 0%, #1c2e38 100%);
	 background: -webkit-linear-gradient(top, #28404e 0%, #1c2e38 100%);
	 background: linear-gradient(to bottom, #28404e 0%, #1c2e38 100%);
	 filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#28404e', endColorstr='#1c2e38',GradientType=0);
	 color: #fff;
	 font-family: 'Open Sans', Helvetica, sans-serif !important;
	 -webkit-font-smoothing: antialiased !important;
	 -moz-osx-font-smoothing: grayscale !important;
}
 .center {
	 position: absolute;
	 top: 50%;
	 left: 50%;
	 transform: translate(-50%, -50%);
}
 .headline {
	 font-weight: 600;
	 font-size: 24px;
	 text-transform: uppercase;
	 text-align: center;
	 line-height: 22px;
}
 .headline .small {
	 font-weight: 300;
	 font-size: 16px;
}
 .circle-big {
	 position: relative;
	 width: 114px;
	 height: 114px;
	 margin: 30px auto 25px auto;
}
 .circle-big svg {
	 width: 114px;
	 height: 114px;
}
 .circle-big .bg {
	 fill: none;
	 stroke-width: 10px;
	 stroke: #1b2a33;
}
 .circle-big .progress {
	 fill: none;
	 stroke-width: 10px;
	 stroke: #27e1ae;
	 stroke-linecap: round;
	 stroke-dasharray: 326.56;
	 stroke-dashoffset: 327;
	 transform: rotate(-90deg);
	 transform-origin: 50% 50%;
	 animation: big 1.5s ease-out;
}
 .circle-big .text {
	 position: absolute;
	 width: 100%;
	 top: 37px;
	 font-size: 24px;
	 text-align: center;
	 font-weight: 400;
	 line-height: 22px;
}
 .circle-big .text .small {
	 font-size: 14px;
	 color: #648192;
}
 .circles-small {
	 margin: 0 auto;
	 width: 400px;
	 height: 80px;
	 text-align: center;
}
 .circle-small {
	 display: inline-block;
	 position: relative;
	 width: 80px;
	 height: 80px;
	 margin: 0 20px;
}
 .circle-small svg {
	 width: 80px;
	 height: 80px;
}
 .circle-small .bg {
	 fill: none;
	 stroke-width: 6px;
	 stroke: #1b2a33;
}
 .circle-small .progress {
	 fill: none;
	 stroke-width: 6px;
	 stroke: #5ce1ec;
	 stroke-linecap: round;
	 stroke-dasharray: 232.36;
	 transform: rotate(-90deg);
	 transform-origin: 50% 50%;
}
 .circle-small .progress.one {
	 stroke-dashoffset: 80;
	 animation: one 1.5s ease-out;
}
 .circle-small .progress.two {
	 stroke-dashoffset: 140;
	 animation: two 1.5s ease-out;
}
 .circle-small .text {
	 position: absolute;
	 width: 100%;
	 top: 26px;
	 font-size: 17px;
	 text-align: center;
	 font-weight: 400;
	 line-height: 16px;
}
 .circle-small .text .small {
	 font-size: 12px;
	 color: #648192;
}
</style>
</head>
<body>
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
		<h1>인공지능(AI) Fitness Trainer</h1>
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
</body>

</html>