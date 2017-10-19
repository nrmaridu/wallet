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
	<div style="float: left;">
		<table>
			<thead>
				<tr>
				<td colspan="3" style="color: blue;"><b>My Wallet details</b></td>
				</tr>
				<tr>
					<th scope="col" colspan="1">Wallet Id</th>
					<th scope="col" colspan="1">Wallet User</th>
					<th scope="col" colspan="1">Wallet Cash</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><c:out value="${wallet.id}" /></td>
					<td><c:out value="${user.username}" /></td>
					<td><c:out value="${wallet.cash}" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container" style="float: right">
		<h4 style="color: blue;">Load cash into my wallet.</h4>
		<c:if test="${message != ''}">
			<p style="color: red;">
				<c:out value="${message}"></c:out>
			</p>
		</c:if>
		<form action="addBalance" method="post">
			<input type="text" id="cash" name="cash" placeholder="Amount">

			<input type="submit" value="Add Money">
		</form>
	</div>
</body>
</html>