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
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		<h1>PokeBook</h1>
		<table class="table">
			<thead>
				<tr>
					
					<th scope="col">Expense</th>
					<th scope="col">vendor</th>
					<th scope="col">Amount</th>
					<th scope="col" >Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${expenses}" var="expense">
					<tr>	
						<td ><a href='<c:url value="/expenses/${expense.getId()}"/>' ><c:out value="${expense.getName()}"/></a></td>
						<td ><c:out value="${expense.getVendor()}"/></td>
						<td >$<c:out value="${expense.getAmount()}"/></td>
						<td >
							<div class="row">
								<a href= '<c:url value="/expenses/${expense.getId()}/edit"/>' class="btn btn-light">Edit</a><span class="p-1">|</span>  
								<form action='/expenses/<c:out value="${expense.getId()}"/>/delete' method="post">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" class="btn btn-light" value="Delete">
								</form>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="container w-75">
			<h1>Track an expense:</h1>
			<form:form class="border border-3 p-4 border-dark" method="post" modelAttribute="expense" action="">
				
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
