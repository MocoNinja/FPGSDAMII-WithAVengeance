<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Welcome page</title>
</head>
<body>
	<h1>Users</h1>
	<hr />
	<form:form action="/User/Add" method="POST">
		<label for="name">Name: </label>
		<form:input type="text" path="name" placeholder="New user's name..." required="required" />
		<br />
		<label for="surname">Surname: </label>
		<form:input type="text" path="surname" placeholder="New user's surname..." required="required" />
		<br/>
		<label for="id">Id: </label>
		<form:input type="number" path="id" placeholder="New user's id..." required="required" />
		<br />
		<form:button type="submit">Add user</form:button>
	</form:form>
	<c:choose>
	<c:when test="${not empty users }">
		<table>
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Surname</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users }">
					<tr>
						<td>${user.id }</td>
						<td>${user.name }</td>
						<td>${user.surname}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/User/Delete" style="text-align: center;">Delete these chums</a>
		<br />
		<br />
	</c:when>
	</c:choose>
	<a href="/" style="text-align: center;">Back to index </a>
</body>
</html>