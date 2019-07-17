<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>Member Join Form</h1>
		
		<form:form commandName="memberDTO" enctype="multipart/form-data" >
		 <div class="form-group">
		    <label for="id">ID:</label>
		    <form:input path="id" cssClass="form-control"/>
		    <form:errors path="id"></form:errors>
		  </div>
		  <div class="form-group">
		    <label for="password">PASSWORD:</label>
		    <form:password path="pw" cssClass="form-control"/>
		    <form:errors path="pw"></form:errors>
		  </div>
		  <div class="form-group">
		    <label for="password">PASSWORD Check:</label>
		    <form:password path="pw2" cssClass="form-control"/>
		    <form:errors path="pw2"></form:errors>
		  </div>
		  <div class="form-group">
		    <label for="name">NAME:</label>
		    <form:input path="name" cssClass="form-control"/>
		    <form:errors path="name"></form:errors>
		  </div>
		  <div class="form-group">
		    <label for="email">EMAIL:</label>
			<form:input path="email" cssClass="form-control"/>
			<form:errors path="email"></form:errors>
		  </div>
		  
		  
		  <div class="form-group">
		  	<input type="file" name="photo">
		  </div>
		  
		  <button type="submit" class="btn btn-default">Join</button>
		</form:form>
		
		 
		
	</div>

</body>
</html>