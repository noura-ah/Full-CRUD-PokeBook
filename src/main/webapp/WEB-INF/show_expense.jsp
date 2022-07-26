<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Show Expense</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body>
	<div class="container w-50 border border-3 p-4 border-dark">
		
		<h1>Expense Details</h1>
		<p>Expense Name: <c:out value="${expense.getName()}"/></p>
		<p>Expense Description: <c:out value="${expense.getDescription()}"/></p>
		<p>Vendor: <c:out value="${expense.getVendor()}"/></p>
		<p>Amount Spent: $<c:out value="${expense.getAmount()}"/></p>
		
		<a href="/expenses">Go Back</a>
	</div>
    
	
</body>
</html>