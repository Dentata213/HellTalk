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
<base href="https://www.w3.org/WAI/ARIA/apg/patterns/tabs/examples/tabs-manual/">
<title>Insert title here</title>
<style>

.tabs {
  font-family: "lucida grande", sans-serif;
}

[role="tablist"] {
  min-width: 550px;
}

[role="tab"],
[role="tab"]:focus,
[role="tab"]:hover {
  position: relative;
  z-index: 2;
  top: 2px;
  margin: 0;
  margin-top: 4px;
  padding: 3px 3px 4px;
  border: 1px solid hsl(219deg 1% 72%);
  border-bottom: 2px solid hsl(219deg 1% 72%);
  border-radius: 5px 5px 0 0;
  overflow: visible;
  background: hsl(220deg 20% 94%);
  outline: none;
  font-weight: bold;
}

[role="tab"][aria-selected="true"] {
  padding: 2px 2px 4px;
  margin-top: 0;
  border-width: 2px;
  border-top-width: 6px;
  border-top-color: rgb(36 116 214);
  border-bottom-color: hsl(220deg 43% 99%);
  background: hsl(220deg 43% 99%);
}

[role="tab"][aria-selected="false"] {
  border-bottom: 1px solid hsl(219deg 1% 72%);
}

[role="tab"] span.focus {
  display: inline-block;
  margin: 2px;
  padding: 4px 6px;
}

[role="tab"]:hover span.focus,
[role="tab"]:focus span.focus,
[role="tab"]:active span.focus {
  padding: 2px 4px;
  border: 2px solid rgb(36 116 214);
  border-radius: 3px;
}

[role="tabpanel"] {
  padding: 5px;
  border: 2px solid hsl(219deg 1% 72%);
  border-radius: 0 5px 5px;
  background: hsl(220deg 43% 99%);
  min-height: 10em;
  min-width: 550px;
  overflow: auto;
}

[role="tabpanel"].is-hidden {
  display: none;
}

[role="tabpanel"] p {
  margin: 0;
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
			    <div class="card-header" id="heading${record.ROUT_NO }">
			      <h5 class="mb-0">
			        <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapse${record.ROUT_NO }" aria-expanded="false" aria-controls="collapse${record.ROUT_NO }">
			          ${record.ROUT_NAME }
			        </button>
			      </h5>
			    </div>
			
			    <div id="collapse${record.ROUT_NO }" class="collapse in" aria-labelledby="heading${record.ROUT_NO }" data-parent="#accordion">
			      <div class="card-body">

			      	<!-- 루틴내용 -->
			      	<!--<p class="card-text">
			      		${record.ROUT_CONTENT } 
			      	</p>
			      	 <div class="btn-group">
			      		<a href="#" class="btn btn-primary">운동</a>
			      		<a href="#" class="btn btn-primary">운동</a>
			      	</div> -->
			      	
			      	<!-- day 운동 -->
			      	 <div class="tabs">
					  <h3 id="tablist-1">${record.ROUT_CONTENT } </h3>
					  <div role="tablist" aria-labelledby="tablist-1" class="manual">
					    <button id="tab-1" type="button" role="tab" aria-selected="true" aria-controls="tabpanel-1">
					      <span class="focus">Maria Ahlefeldt</span>
					    </button>
					    <button id="tab-2" type="button" role="tab" aria-selected="false" aria-controls="tabpanel-2" tabindex="-1">
					      <span class="focus">Carl Andersen</span>
					    </button>
					    <button id="tab-3" type="button" role="tab" aria-selected="false" aria-controls="tabpanel-3" tabindex="-1">
					      <span class="focus">Ida da Fonseca</span>
					    </button>
					    <button id="tab-4" type="button" role="tab" aria-selected="false" aria-controls="tabpanel-4" tabindex="-1">
					      <span class="focus">Peter Lange-Müller</span>
					    </button>
					  </div>
					
					  <div id="tabpanel-1" role="tabpanel" aria-labelledby="tab-1">
					    <p>
					      <a href="https://en.wikipedia.org/wiki/Maria_Theresia_Ahlefeldt">Maria Theresia Ahlefeldt</a>
					      (16 January 1755 – 20 December 1810) was a Danish, (originally German), composer.
					      She is known as the first female composer in Denmark.
					      Maria Theresia composed music for several ballets, operas, and plays of the royal theatre.
					      She was given good critic as a composer and described as a “<span lang="da">virkelig Tonekunstnerinde</span>” ('a True Artist of Music').
					    </p>
					  </div>
					  <div id="tabpanel-2" role="tabpanel" aria-labelledby="tab-2" class="is-hidden">
					    <p>
					      <a href="https://en.wikipedia.org/wiki/Joachim_Andersen_(composer)">Carl Joachim Andersen</a>
					      (29 April 1847 – 7 May 1909) was a Danish flutist, conductor and composer born in Copenhagen, son of the flutist Christian Joachim Andersen.
					      Both as a virtuoso and as composer of flute music, he is considered one of the best of his time.
					      He was considered to be a tough leader and teacher and demanded as such a lot from his orchestras but through that style he reached a high level.
					    </p>
					  </div>
					  <div id="tabpanel-3" role="tabpanel" aria-labelledby="tab-3" class="is-hidden">
					    <p>
					      <a href="https://en.wikipedia.org/wiki/Ida_Henriette_da_Fonseca">Ida Henriette da Fonseca</a>
					      (July 27, 1802 – July 6, 1858) was a Danish opera singer and composer.
					      Ida Henriette da Fonseca was the daughter of Abraham da Fonseca (1776–1849) and Marie Sofie Kiærskou (1784–1863).
					      She and her sister Emilie da Fonseca were students of Giuseppe Siboni, choir master of the Opera in Copenhagen.
					      She was given a place at the royal Opera alongside her sister the same year she debuted in 1827.
					    </p>
					  </div>
					  <div id="tabpanel-4" role="tabpanel" aria-labelledby="tab-4" class="is-hidden">
					    <p>
					      <a href="https://en.wikipedia.org/wiki/Peter_Lange-M%C3%BCller">Peter Erasmus Lange-Müller</a>
					      (1 December 1850 – 26 February 1926) was a Danish composer and pianist.
					      His compositional style was influenced by Danish folk music and by the work of Robert Schumann; Johannes Brahms; and his Danish countrymen, including J.P.E. Hartmann.
					    </p>
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

/*
 *   This content is licensed according to the W3C Software License at
 *   https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document
 *
 *   File:   tabs-manual.js
 *
 *   Desc:   Tablist widget that implements ARIA Authoring Practices
 */

//'use strict';

class TabsManual {
  constructor(groupNode) {
	  console.log("groupNode",groupNode)//<div role="tablist" aria-labelledby="tablist-1" class="manual">
    this.tablistNode = groupNode;
    this.tabs = [];

    this.firstTab = null;
    this.lastTab = null;

    this.tabs = Array.from(this.tablistNode.querySelectorAll('[role=tab]'));
    console.log("this.tabs",this.tabs)//[button#tab-1, button#tab-2, button#tab-3, button#tab-4]
    this.tabpanels = [];

    for (var i = 0; i < this.tabs.length; i += 1) {
      var tab = this.tabs[i];
      console.log("tab",tab)//<button id="tab-1" type="button" role="tab" aria-selected="true" aria-controls="tabpanel-1">
      var tabpanel = document.getElementById(tab.getAttribute('aria-controls'));
      console.log("tabpanel",tabpanel)//<div id="tabpanel-1" role="tabpanel" aria-labelledby="tab-1">

      tab.tabIndex = -1;
      tab.setAttribute('aria-selected', 'false');
      this.tabpanels.push(tabpanel);

      tab.addEventListener('keydown', this.onKeydown.bind(this));
      tab.addEventListener('click', this.onClick.bind(this));

      if (!this.firstTab) {
        this.firstTab = tab;
      }
      this.lastTab = tab;
    }

    this.setSelectedTab(this.firstTab);
  }

  setSelectedTab(currentTab) {
    for (var i = 0; i < this.tabs.length; i += 1) {
      var tab = this.tabs[i];
      if (currentTab === tab) {
        tab.setAttribute('aria-selected', 'true');
        tab.removeAttribute('tabindex');
        this.tabpanels[i].classList.remove('is-hidden');
      } else {
        tab.setAttribute('aria-selected', 'false');
        tab.tabIndex = -1;
        this.tabpanels[i].classList.add('is-hidden');
      }
    }
  }

  moveFocusToTab(currentTab) {
    currentTab.focus();
  }

  moveFocusToPreviousTab(currentTab) {
    var index;

    if (currentTab === this.firstTab) {
      this.moveFocusToTab(this.lastTab);
    } else {
      index = this.tabs.indexOf(currentTab);
      this.moveFocusToTab(this.tabs[index - 1]);
    }
  }

  moveFocusToNextTab(currentTab) {
    var index;

    if (currentTab === this.lastTab) {
      this.moveFocusToTab(this.firstTab);
    } else {
      index = this.tabs.indexOf(currentTab);
      this.moveFocusToTab(this.tabs[index + 1]);
    }
  }

  /* EVENT HANDLERS */

  onKeydown(event) {
    var tgt = event.currentTarget,
      flag = false;

    switch (event.key) {
      case 'ArrowLeft':
        this.moveFocusToPreviousTab(tgt);
        flag = true;
        break;

      case 'ArrowRight':
        this.moveFocusToNextTab(tgt);
        flag = true;
        break;

      case 'Home':
        this.moveFocusToTab(this.firstTab);
        flag = true;
        break;

      case 'End':
        this.moveFocusToTab(this.lastTab);
        flag = true;
        break;

      default:
        break;
    }

    if (flag) {
      event.stopPropagation();
      event.preventDefault();
    }
  }

  // Since this example uses buttons for the tabs, the click onr also is activated
  // with the space and enter keys
  onClick(event) {
    this.setSelectedTab(event.currentTarget);
  }
}

// Initialize tablist

window.addEventListener('load', function () {
  var tablists = document.querySelectorAll('[role=tablist].manual');
  console.log("tablists.length",tablists.length)
  for (var i = 0; i < tablists.length; i++) {
    new TabsManual(tablists[i]);
  }
});





</script>
