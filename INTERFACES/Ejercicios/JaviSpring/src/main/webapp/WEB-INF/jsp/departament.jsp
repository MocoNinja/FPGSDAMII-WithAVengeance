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
	<h1>Departaments</h1>
	<hr />
	<form:form action="/Departament/Add" method="POST">
		<label for="name">Name: </label>
		<form:input type="text" path="name" placeholder="New departament's name..." required="required" />
		<br />
		<label for="id">Id: </label>
		<form:input type="number" path="id" placeholder="New departament's id..." required="required" />
		<br />
		<form:button type="submit">Add departament</form:button>
	</form:form>
	<c:choose>
	<c:when test="${not empty departaments }">
		<table>
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="departament" items="${departaments }">
					<tr>
						<td>${departament.id }</td>
						<td>${departament.name }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
	</c:choose>
	<a href="/" style="text-align: center;">Back to index </a>
</body>
</html>