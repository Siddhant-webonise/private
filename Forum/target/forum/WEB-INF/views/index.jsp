<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.HashMap"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Forum</title>

</head>
<body>

	<h1 align="center">
		<a href="/forum">Home</a>
	</h1>
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
	<table align="center" style="width: 50%">
		<tbody>

			<tr>
				<td><form:form method="POST" action="/forum/addQuestion"
						modelAttribute="question">
						<form:input path="question" type="text" placeholder="Question"
							required="required" />
						<form:input type="submit" value="Add Question" path="" />
					</form:form></td>
			</tr>
			<tr>
				<td><form:form method="POST" action="/forum/searchQuestion"
						commandName="question">
						<form:input path="question" type="text" placeholder="Question"
							required="required" />
						<form:input type="submit" value="Search Question" path="" />
					</form:form>
					<div style="color: red">${message}</div>
				<td>
			</tr>
			<tr>
				<td><form:form method="POST" action="/forum/question"
						commandName="question">
						<form:input type="submit" value="Show All Questions" path="" />
					</form:form>
				<td>
			</tr>
		</tbody>
	</table>

	<div>
		<table border="1" align="center" style="width: 50%">
			<thead>
				<tr>
					<th>Question And Answer</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listOfQuestionAnswer}" var="entry">
					<tr>
						<td><a href="/forum/question/${entry.questionId}/answers">Question
								: ${entry.question}</a><br>
							<div><b>Asked By:</b> ${entry.user.username}</div> <a
							href="/forum/deleteQuestion/${entry.questionId}"><button
									name="delete">Delete Question</button></a> <br> <b>
								Answers </b>: <br> <c:forEach items="${entry.answers}"
								var="answer">${answer.answer}<br>
								<div><b>Posted By:</b> ${answer.user.username}</div>
								<a href="/forum/deleteAnswer/${answer.answerId}"><button
										name="delete">Delete Answer</button></a>
								<br>

							</c:forEach> 
							<form:form method="POST"
								action="/forum/question/${entry.questionId}/answers/addAnswer"
								commandName="answer">
								<form:input path="answer" type="text"
									placeholder="Enter Your Answer" required="required" />
								<form:input type="submit" value="Add Answer" path="" />
								<br>
							</form:form>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>





	</div>
</body>
</html>