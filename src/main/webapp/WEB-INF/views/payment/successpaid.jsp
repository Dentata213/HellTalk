<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.3.slim.js"
	integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc="
	crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- main content -->

    <div class="app-wrap">
        <header>
            <input type="text" autocomplete="off" class="search-box" placeholder="Search for a city" />
        </header>
        <main>
            <section class="location">
                <div class="city">Where are you now?</div>
                <div class="date">How are you today?</div>
            </section>
            <div class="current">
                <div class="temp">? °C</div>
                <div class="weather">Weather</div>
                <div class="hi-low">Hi Temp °C / Low Temp °C</div>
            </div>
        </main>
    </div>

<!-- main content -->

<script>
const API = {
        key: "d2b2c5f06c9917777af462a1075caa96",
        url: "https://api.openweathermap.org/data/2.5/",
    };

    const searchbox = document.querySelector(".search-box");
    searchbox.addEventListener("keypress", setQuery);

    function setQuery(e) {
        if (e.keyCode == 13 || e.which == 13) {
            getResults(searchbox.value);
        }
    }
    function getResults(query) {
        fetch(`${API.url}weather?q=${query}&units=metric&APPID=${API.key}`)
            .then(function (weather) {
                return weather.json();
            })
            .then(displayResults);
    }

    function displayResults(weather) {
        var city = document.querySelector(".location .city");
        city.innerText = `${weather.name}, ${weather.sys.country}`;

        var today = new Date();
        var date = document.querySelector(".location .date");
        date.innerText = today.toLocaleDateString();

        var temp = document.querySelector(".current .temp");
        temp.innerHTML = `${Math.round(weather.main.temp)} <span>°C</span>`;

        var weatherC = document.querySelector(".current .weather");
        weatherC.innerText = weather.weather[0].description;

        var hiLow = document.querySelector(".hi-low");
        hiLow.innerText = `${weather.main.temp_min}°C / ${weather.main.temp_max}°C`;
    }
	
</script>
<script src="${path}/resources/js/plugin.js"></script>
<script src="${path}/resources/js/scripts.js"></script>