<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<fieldset>
		<input type="file" name="files"/><br/>
		 <img id="preview" style="width:300px;height:200px"/>
	</fieldset>
</div>
    <script>
    $('input[name=files]').change(function(e){
		var formData=new FormData();//AJAX로 파일 업로드시 사용
		console.log('e.target.files:',e.target.files);
		//첫번째 인자 파라미터명,두번째 인자 File객체
		formData.append("files",e.target.files[0]);
		
		$.ajax({
			url:"http://localhost:9191/restapi/files",
			processData:false,
			contentType:false,
			data:formData,
			type:'post'
			
		}).done(function(data){
			console.log('서버에서 받은 데이타(업로드):',data);
			var reader = new FileReader();//이미지파일을 Base64로 인코딩용
			
            reader.onload = function(e) {
            	//이미지 미리보기
                $("#preview").attr("src", e.target.result);
            	//Base64인코딩
                var base64=e.target.result;              
    	        console.log('base64:',base64.split(",")[1]);
    	        //여기서 Base64인코딩된 문자열을 스프링 REST API서버로 전송한다
    	        $.ajax({
    	        	url:"http://localhost:9090/restapi/google/vision/ocr",
    	        	type:'post',
    	        	data:"base64="+encodeURIComponent(base64.split(",")[1]),
    	        	dataType:'json'
    	        	
    	        }).done(function(data){
    	        	console.log('구글서버로부터 받은 데이타:',data);
    	        	console.log(data['responses'][0]['fullTextAnnotation']['text'])
    	        	
    	        });
            }
            console.log('e.target.files[0]:',e.target.files[0]);
            //미리보기용
	        reader.readAsDataURL(e.target.files[0]);
	       
		});
	});
    </script>