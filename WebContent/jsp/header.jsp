<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<div>
		<ul class="navigation">
		
			<c:if test="${sessionScope.user == null}">
				<li><a class="navlink"
					href="${pageContext.request.contextPath}/signin">SignIn</a></li>
			</c:if>
			
			<li><a class="navlink"
				href="${pageContext.request.contextPath}/signup">SignUp</a></li>
				
			<li><a class="navlink"
				href="${pageContext.request.contextPath}/uwallet">Wallet</a></li>
				
			<li><a class="navlink" href="${pageContext.request.contextPath}/trans">My Transactions</a></li>
			
			<c:if test="${sessionScope.user != null}">
				<li><a class="navlink"
					href="${pageContext.request.contextPath}/logout"><b>Logout</b></a></li>
			</c:if>
			
		</ul>
	</div>
	<div>
		<c:if test="${sessionScope.user != null}">
			<div style="text-align: center;color: blueviolet;font-size: x-large;background-color: lightcyan;height: 41px;">Welcome <c:out value="${sessionScope.user.username}"></c:out></div>
		</c:if>
	</div>
</body>
</html>