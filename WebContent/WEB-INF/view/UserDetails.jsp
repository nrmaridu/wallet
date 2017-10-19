<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3 style="text-align: center;color:blue;"><c:out value="${requestScope.message}"/></h3>
	<br>
	<br>
	<table>
		<thead>
			<tr>
				<th scope="col" colspan="1">User Name</th>
				<th scope="col" colspan="1">Email</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><c:out value="${requestScope.user.username}"/></td>
				<td><c:out value="${requestScope.user.email}"/></td>
			</tr>
		</tbody>
	</table>
</body>
</html>