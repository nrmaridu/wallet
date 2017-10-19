<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<title>${param.title}</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<br>
	<br>
	<h1 style="text-align: center;">${param.title}</h1>
	<jsp:include page="/WEB-INF/view/${param.content}.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>