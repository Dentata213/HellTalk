<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script crossorigin  src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<base href="https://www.w3.org/WAI/ARIA/apg/patterns/tabs/examples/tabs-manual/">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>


body {
  
  padding: 0 1rem;
  font-size: 125%;
  line-height: 1.5;
  margin: 1.5rem auto;
  font-family: Arial, sans-serif;
}

* {
  color: inherit;
  margin: 0;
}

[role="tablist"] {
  padding: 0;
}

[role="tablist"] li, [role="tablist"] a {
  display: inline-block;
}

[role="tablist"] a {
  text-decoration: none;
  padding: 0.5rem 1em;
}

[role="tablist"] [aria-selected] {
  border: 2px solid;
  background: #fff;
  border-bottom: 0;
  position: relative;
  top: 2px;
}

[role="tabpanel"] {
  border: 2px solid;
  padding: 1.5rem;
}

[role="tabpanel"] * + * {
  margin-top: 0.75rem;
}

*:focus {
  outline: none;
  box-shadow: inset 0 0 0 4px lightBlue;
}

@media (max-width: 550px) {
  
  [role="tablist"] li, [role="tablist"] a {
    display: block;
    position: static;
  }
  
  [role="tablist"] a {
    border: 2px solid #222 !important;
  }
  
  [role="tablist"] li + li a {
    border-top: 0 !important;
  }
  
  [role="tablist"] [aria-selected] {
    position: static;
  }
  
  [role="tablist"] [aria-selected]::after {
    content: '\0020⬅';
  }
  
  [role="tabpanel"] {
    border-top: 0;
  }
  
}

</style>
</head>
<body>

	<div class="container">
	<h2>추천운동루틴</h2>
		<!-- 아코디언2 -->
		<div id="accordion">
			<c:forEach var="record" items="${recommendRoutList }" >
			  <div class="card">
			  
			    <div class="card-header" id="heading${record.ROUT_NO }" title="${record.ROUT_NO }">
			      
			      <h5 class="mb-0">
			        <button type="button"  class="btn btn-link" data-toggle="collapse" data-target="#collapse${record.ROUT_NO }" aria-expanded="false" aria-controls="collapse${record.ROUT_NO }">
			          ${record.ROUT_NAME }
			          <form action="<c:url value="#"/>" method="post">
			          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			          </form>
			        </button>
			        
			      </h5>
			    </div>
				
			    <div id="collapse${record.ROUT_NO }" class="collapse in" aria-labelledby="heading${record.ROUT_NO }" data-parent="#accordion">
			      <div class="card-body">
			      
			      
			      <!-- day 운동 -->
					<div class="tabbed" id="tabbed${record.ROUT_NO }" >
					  <ul id="ul${record.ROUT_NO }">

					  </ul>
					  
					  <div id="tab_div${record.ROUT_NO }">

					  </div>
					</div>
					<!-- day 운동 -->
					
			      	
			      </div>
			    </div>
			  </div>
		  </c:forEach>
		 </div>
	</div>


</body>
</html>
<script>
/* 운동루티 버튼 이벤트 */
 $('.card-header').click(function(){
 
	var rout_no=$(this).attr('title');
	console.log("rout_no",rout_no)
	
	
	new Promise( (succ, fail)=>{
	
		$.ajax({
				url:'http://localhost:8080<c:url value="/dayroutine.do"/>',
				data:{"rout_no": rout_no,"${_csrf.parameterName}":"${_csrf.token}"},
				dataType:'json',
				type:'post'
		,success:function(data){
			
			console.log('서버로부터 받은 데이타:',data);	
			console.log($('#ul'+rout_no).has("li").length)
			
			if($('#ul'+rout_no).has("li").length !=0){
				
				 $('#ul'+rout_no).children().remove();
			} 
			
			var li=''
			$.each(data,function(i,item){
				li+="<li value="+item.dr_no+">\r\n"
				+ "		<a href=\"#section"+item.day+"\">Day "+item.day+"</a>\r\n"
				+ "	</li>";
			})
			//console.log("$('#ul'+rout_no)",$('#ul'+rout_no))
			$('#ul'+rout_no).append(li);
			
			var section=''
	    	$.each(data,function(i,item){
	    		section+="<section id=\"section"+item.day+"\">\r\n"
	    			+ "	</section>"
	    	})
	    	//console.log("$('#tab_div'+rout_no)",$('#tab_div'+rout_no))
	    	$('#tab_div'+rout_no).append(section);
			
			
			// Get relevant elements and collections
			var tabbed=document.querySelector('#tabbed'+rout_no);
			//console.log("tabbed",tabbed)
			var tablist = tabbed.querySelector('ul');
			//console.log("tablist",tablist)
			var tabs = tablist.querySelectorAll('a');
			//console.log("tabs",tabs)
			var panels = tabbed.querySelectorAll('[id^="section"]');
			//console.log("panels",panels)
			//console.log($('#ul'+rout_no))
			
			/* tabbed 이벤트 */
			(function() {
	
				  // The tab switching function
				  const switchTab = (oldTab, newTab) => {
				    newTab.focus();
				    // Make the active tab focusable by the user (Tab key)
				    newTab.removeAttribute('tabindex');
				    // Set the selected state
				    newTab.setAttribute('aria-selected', 'true');
				    oldTab.removeAttribute('aria-selected');
				    oldTab.setAttribute('tabindex', '-1');
				    // Get the indices of the new and old tabs to find the correct
				    // tab panels to show and hide
				    let index = Array.prototype.indexOf.call(tabs, newTab);
				    let oldIndex = Array.prototype.indexOf.call(tabs, oldTab);
				    panels[oldIndex].hidden = true;
				    panels[index].hidden = false;
				  }
				  
				  // Add the tablist role to the first <ul> in the .tabbed container
				  tablist.setAttribute('role', 'tablist');
				  
				  // Add semantics are remove user focusability for each tab
				  Array.prototype.forEach.call(tabs, (tab, i) => {
				    tab.setAttribute('role', 'tab');
				    tab.setAttribute('id', 'tab' + (i + 1));
				    tab.setAttribute('tabindex', '-1');
				    tab.parentNode.setAttribute('role', 'presentation');
				    
				    // Handle clicking of tabs for mouse users
				    tab.addEventListener('click', e => {
				      e.preventDefault();
				      let currentTab = tablist.querySelector('[aria-selected]');
				      if (e.currentTarget !== currentTab) {
				        switchTab(currentTab, e.currentTarget);
				      }
				    });
				    
				    // Handle keydown events for keyboard users
				    tab.addEventListener('keydown', e => {
				      // Get the index of the current tab in the tabs node list
				      let index = Array.prototype.indexOf.call(tabs, e.currentTarget);
				      // Work out which key the user is pressing and
				      // Calculate the new tab's index where appropriate
				      let dir = e.which === 37 ? index - 1 : e.which === 39 ? index + 1 : e.which === 40 ? 'down' : null;
				      if (dir !== null) {
				        e.preventDefault();
				        // If the down key is pressed, move focus to the open panel,
				        // otherwise switch to the adjacent tab
				        dir === 'down' ? panels[i].focus() : tabs[dir] ? switchTab(e.currentTarget, tabs[dir]) : void 0;
				      }
				    });
				  });
				  
				  // Add tab panel semantics and hide them all
				  Array.prototype.forEach.call(panels, (panel, i) => {
				    panel.setAttribute('role', 'tabpanel');
				    panel.setAttribute('tabindex', '-1');
				    let id = panel.getAttribute('id');
				    panel.setAttribute('aria-labelledby', tabs[i].id);
				    panel.hidden = true; 
				  });
				  
				  // Initially activate the first tab and reveal the first tab panel
				  tabs[0].removeAttribute('tabindex');
				  tabs[0].setAttribute('aria-selected', 'true');
				  panels[0].hidden = false;
				})();
			
			
		}
		,fail:function( request, status, error ){
			console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		}
	})
	.then((arg) =>{    // 두번째 ajax를 실행한다.
		console.log("arg",arg)
		console.log('arg[0].dr_no:',arg[0].dr_no);	
		
		var dr_no=arg[0].dr_no

        $.ajax({
            url: "http://localhost:8080<c:url value='/dayExercise.do'/>",
            data:{"dr_no": dr_no,"${_csrf.parameterName}":"${_csrf.token}"},
			dataType:'json',
            type: 'post'
        })
        .done(function(data){
        	console.log('서버로부터 받은 데이타:',data);	
        	
        	var ul=""
        	$.each(data,function(i,item){
        		ul+="<ul >\r\n"
        		+ "		<li><h2>운동 "+item.el_dayno+" : "+item.e_name+"</h2></li>\r\n"
        		+ "		<li style='list-style: none;'>운동시간 : "+item.el_time+"</li>\r\n"
        		+ "		<li style='list-style: none;'>소모칼로리 : "+item.el_totalkcal+"</li>\r\n"
        		+ "		<li style='list-style: none;'>운동방법 : "+item.e_description+"</li>\r\n"
        		+ "		<li style='list-style: none;'><iframe src='"+item.e_url+"'></iframe></li>\r\n"
        		+ "	</ul>"
        	})
        	$('#section'+data[0].day).append(ul);
        	
        	
        	$('li').click(function(){
        		console.log($(this).val())
        		
        		var dr_no=$(this).val()
		
		        $.ajax({
		            url: "http://localhost:8080<c:url value='/dayExercise.do'/>",
		            data:{"dr_no": dr_no,"${_csrf.parameterName}":"${_csrf.token}"},
					dataType:'json',
		            type: 'post'
		        })
		        .done(function(data){
		        	console.log('서버로부터 받은 데이타:',data);	
		        	
		        	var ul=""
		        	$.each(data,function(i,item){
		        		ul+="<ul >\r\n"
		        		+ "		<li><h2>운동 "+item.el_dayno+" : "+item.e_name+"</h2></li>\r\n"
		        		+ "		<li style='list-style: none;'>운동시간 : "+item.el_time+"</li>\r\n"
		        		+ "		<li style='list-style: none;'>소모칼로리 : "+item.el_totalkcal+"</li>\r\n"
		        		+ "		<li style='list-style: none;'>운동방법 : "+item.e_description+"</li>\r\n"
		        		+ "		<li style='list-style: none;'><iframe src='"+item.e_url+"'></iframe></li>\r\n"
		        		+ "	</ul>"
		        	})
		        	$('#section'+data[0].day).append(ul);
		        })
		        .fail(function( request, status, error ){
					console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
				});
        		
        		
        	})//$('li').click 이벤트	
        	 
        	
        	
        })
        .fail(function( request, status, error ){
			console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		});

		});//두번째 ajax
		
	});	//Promise
	

}); //$('.card-header').click 이벤트








</script>
