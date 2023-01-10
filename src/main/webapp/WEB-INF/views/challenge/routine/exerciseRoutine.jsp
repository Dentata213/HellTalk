<%@page import="com.helltalk.springapp.controller.challenge.ApiExamTranslate"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Scrapping.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  	/*점보트론 폭 줄이기*/
    .jumbotron{
      padding-top:1rem;
      padding-bottom:1rem;
      margin-bottom: .5rem;
    }
    
  </style>
</head>
<body>
	<!-- 1. https://jsoup.org/download에서 jsoup-1.15.3.jar다운로드
	     2. 다운로드한 jsoup-1.15.3.jar 파일을 WEB-INF/lib폴더에 추가
	 -->
  <div class="container">
    <div class="jumbotron bg-info">
      <h1>자바로 웹 스크래핑하기</h1>     
    </div>   
    <%-- <fieldset class="form-group border p-3">
    	<legend class="w-auto px-3">https://jsoup.org</legend>
    	<%
    	Document doc = Jsoup.connect("https://en.wikipedia.org/").get();
    	
    	out.println("<h3>"+doc.title()+"</h3>");
    	
    	Elements newsHeadlines = doc.select("#mp-itn b a");
    	out.println("<ul class='list-ubstyled'>");
    	for (Element headline : newsHeadlines) {
    	  out.println(String.format("<li><a href='%s'>%s</a></li>",headline.absUrl("href"),headline.attr("title"))); 
    	    
    	}
    	out.println("</ul>");
    	
    	%>
    </fieldset>
    <fieldset class="form-group border p-3">
    	<legend class="w-auto px-3">네이버 영화.랭킹 스크래핑하기(조회순)</legend>
    	<%
    		doc = Jsoup.connect("https://movie.naver.com/movie/sdb/rank/rmovie.naver?sel=cnt&date=20221204").get();
    		System.out.println(doc.html());
    		//영화 제목 스크래핑
    		//CSS Selector
    		//Elements movieTitles=doc.select("#old_content > table > tbody > tr > td.title > div > a");
    		Elements movieTitles=doc.selectXpath("//*[@id=\"old_content\"]/table/tbody/tr/td[2]/div/a");
    		out.println("<h3>스크래핑한 영화 제목 수:"+movieTitles.size()+"</h3>");
    		out.println("<ul class='list-ubstyled'>");
    		int rank=1;
    		for(Element movieTitle:movieTitles){
    			//out.println(String.format("<li>%s</li>",movieTitle.html()));
    			out.println(String.format("<li><span class=\"badge badge-danger\">%s</span> <a href='%s'>%s</a></li>",rank++,movieTitle.absUrl("href"),movieTitle.attr("title")));
    		}
    		
    		out.println("</ul>");
    	%>
    	
    </fieldset> --%>
    <fieldset class="form-group border p-3">
    	<legend class="w-auto px-3">운동 부위 스크래핑하기</legend>
    	<a class="btn btn-success" href="<c:url value='/exercise/Kind.do'/>">추천 운동 루틴</a>
    	<%
    		Document doc = Jsoup.connect("https://www.muscleandstrength.com/exercises/").get();
    		System.out.println(doc.html());
    		//운동 부위 스크래핑
    		//CSS Selector
    		
    		//Elements movieTitles=doc.select("#old_content > table > tbody > tr > td.title > div > a");
    		//Elements movieTitles=doc.selectXpath("//*[@id=\"old_content\"]/table/tbody/tr/td[2]/div/a");
    		//#block-system-main > div > div:nth-child(3) > div > div:nth-child(1) > a:nth-child(2) > div > font
    		//#block-system-main > div > div:nth-child(3) > div > div:nth-child(1) > a:nth-child(2) > div > font
    		//#block-system-main > div > div:nth-child(3) > div
    		/* Elements exerciseList=doc.select(".category-name");
    		out.println("<h3>운동:"+exerciseList+"</h3>");
    		out.println("<h3>운동:"+exerciseList.html()+"</h3>");
    		
    		System.out.println("여기여기:"+exerciseList);
    		System.out.println("여기여기:"+exerciseList.html());
    		
    		String args = exerciseList.html();
    		ApiExamTranslate api = new ApiExamTranslate();
    		String result= api.main(args);
    		System.out.println("result:"+result); */
    		
    		/* out.println("<ul class='list-ubstyled'>");
    		int rank=1;
    		for(Element movieTitle:movieTitles){
    			//out.println(String.format("<li>%s</li>",movieTitle.html()));
    			out.println(String.format("<li><span class=\"badge badge-danger\">%s</span> <a href='%s'>%s</a></li>",rank++,movieTitle.absUrl("href"),movieTitle.attr("title")));
    		}
    		
    		out.println("</ul>"); */
    	%>
    	
    </fieldset>
    
  </div>
</body>
</html>