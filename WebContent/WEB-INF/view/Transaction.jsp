<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	<div class="transTable" style="float: right;">
		<table>
		<thead>
			<tr><td colspan="5"><b style="color: blue;">My Last 5 transactions...</b></td></tr>
			<tr>
				<th scope="col" colspan="1">Transaction Id</th>
				<th scope="col" colspan="1">Transaction Amount</th>
				<th scope="col" colspan="1">Comments</th>
				<th scope="col" colspan="1">Time</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${transactions}" var="element">
			<tr>
				<td>${element.id}</td>
				<td>${element.amount}</td>
				<td>${element.comments}</td>
				<td>${element.time}</td>
			</tr>
		</c:forEach>
			
		</tbody>
		</table>
	</div>
	<div class="container">
		<h3>Do a fresh transaction.</h3>
		<c:if test="${requestScope.transError != ''}">
			<p style="color: red;"><c:out value="${requestScope.transError}"/></p>
		</c:if>
		<c:if test="${requestScope.transSuccess != ''}">
			<p style="color: green;"><c:out value="${requestScope.transSuccess}"/></p>
		</c:if>
		<br>
		<form action="doTrans" method="post">
			<label for="cash">Transaction Amount</label> 
			<input type="text" name="cash" placeholder="Enter Amount"/>
			<br>
			<br>
			<label for="comments">Transaction Comments</label> 
			<input type="text" name="comments" placeholder="Enter transaction comments"/>
			
			<input type="submit" value="Do Transaction">
		</form>
		
	</div>
</body>
</html>