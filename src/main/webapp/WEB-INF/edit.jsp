<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    


<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Read Share</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div class="container w-75">
		<div class="container w-75">
			<h1>Track an expense:</h1>
			<form:form class="border border-3 p-4 border-dark" method="post" modelAttribute="expense" action="/expenses/${expense.id}">
				<input type="hidden" name="_method" value="put">
			<div class="mb-3"> 
				<form:label path="name" class="form-label">Expense name:</form:label>
				<form:input  path="name" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
				<form:errors path="name" cssClass="invalid-feedback"/>
			</div>
			<div class="mb-3">
				<form:label path="vendor" class="form-label">Vendor:</form:label>
				<form:input path="vendor" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
				<form:errors path="vendor" cssClass="invalid-feedback"/>
				
			</div>
			<div class="mb-3">
				<form:label path="amount" class="form-label">Amount: </form:label>
				<form:input type="number" path="amount" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
				<form:errors  path="amount" cssClass="invalid-feedback"/>
				
			</div>
			<div class="mb-3">
				<form:label path="description" class="form-label">Description: </form:label>
				<form:textarea path="description" class="form-control" cssErrorClass="form-control is-invalid" />
				<form:errors path="description" cssClass="invalid-feedback"/>
			</div>
			
			<input type="submit" value="Submit" class="btn btn-dark">
		</form:form>
		</div>
		
	</div>
    
	
</body>
</html>
