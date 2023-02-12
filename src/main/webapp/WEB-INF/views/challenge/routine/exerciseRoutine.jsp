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

  <div class="container">
    <div class="jumbotron bg-info">
      <h1>운동 챌린지</h1>     
    </div>   
   
    <fieldset class="form-group border p-3">
    	<legend class="w-auto px-3">운동 챌린지</legend>
    	<a class="btn btn-success" href="<c:url value='/routine/List.do'/>">추천 운동 루틴</a>
    	<a class="btn btn-success" href="<c:url value='/exercise/Kind.do'/>">사용자 커스텀 루틴</a>
    	
    	
    </fieldset>
    
  </div>
</body>
</html>