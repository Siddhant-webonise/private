<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
</head>
<body>
	<center>
		<br /> <br /> <br />
		<div align="right">
			<a href="/forum">Home</a>
		</div>
		<h1>Default Logged in User page !!!</h1>
		<c:url var="logoutUrl" value="/j_spring_security_logout" />
		<form action="${logoutUrl}" method="post">
			<input type="submit" value="Log out" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</center>

</body>
</html>