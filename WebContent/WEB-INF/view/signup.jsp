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
	<c:set var="userExists" value="${requestScope.userExists}" />
	<c:if test="${userExists}">
		<p style="color: red;">
			User <b><c:out value="${requestScope.currentUser}" /></b> already
			exists. Please try with different user name.
		</p>
	</c:if>
	<div class="container" style="margin: auto;border: 3px solid green; padding: 40px;">
		<form action="signup" method="post">
			<label for="username">User Name</label> 
			<input type="text" name="username" placeholder="User Name"/>
			
			<label for="email">Email</label> 
			<input type="text" name="email" placeholder="Email"/>
			
			<label for="password">Password</label> 
			<input type="password" name="password" placeholder="Password"/>
			
			<label for="cpassword">Confirm Password</label> 
			<input type="password" name="cpassword" placeholder="Re-Enter Password"/>
			
			
			<input type="submit" value="Sign Up">
		</form>
	</div>
</body>
</html>