<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question</title>
</head>
<body>
	<div align="right">
		<a href="/forum">Home</a>
	</div>

	<c:choose>
		<c:when test="${userName=='anonymousUser'}">
			<a href="/forum/login">Login</a>
		</c:when>
		<c:otherwise>
			<h2>Logged In As : ${userName}</h2>
			<c:url var="logoutUrl" value="/j_spring_security_logout" />
			<form action="${logoutUrl}" method="post">
				<input type="submit" value="Log out" /> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</c:otherwise>
	</c:choose>
	<table border="1" align="center" style="width: 50%">
		<thead>
			<tr>
				<th>Question</th>

			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="/forum/question/${question.questionId}/answers">${question.question}
				</a> <form:form method="DELETE"
						action="/forum/question/${question.questionId}">
						<input type="submit" value="Delete Question">
					</form:form>
					<div>
						<b>Asked By</b>: ${question.user.username}
					</div>
			</tr>
		</tbody>
	</table>
</body>
</html>