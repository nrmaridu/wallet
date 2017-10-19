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

	<div class="container" style="margin: auto;border: 3px solid green; padding: 40px;">
		<p style="color: red;"><c:out value="${requestScope.message}" /></p>
		<form action="/wallet/signin" method="post" >

			<label for="uname">User Name</label> 
			<input type="text" id="uname"
				name="uName" placeholder="User Name"> 
			
			<label for="pword">PassWord</label> 
			<input type="password" id="pword"
				name="pWord" placeholder="Password"> 

			<input type="submit" value="Log In">

		</form>
	</div>
</body>
</html>