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
	<h1>Fields</h1>
	<hr />
	<form:form action="/Field/Add" method="POST">
		<label for="name">Name: </label>
		<form:input type="text" path="name" placeholder="New field's name..." required="required" />
		<br />
		<label for="id">Id: </label>
		<form:input type="number" path="id" placeholder="New field's id..." required="required" />
		<br />
		<c:choose>
			<c:when test="${not empty departaments }">
				<form:select path="idDepartament">
					<c:forEach var="departament" items="${departaments }">
						<form:option value="${departament.id }">${departament.name }</form:option>
					</c:forEach>
				</form:select>
			</c:when>
			<c:otherwise>
				<form:input type="number" path="idDepartament" placeholder="New field's idDepartament..." required="required" />
			</c:otherwise>
		</c:choose>
		<br />
		<form:button type="submit">Add Field</form:button>
	</form:form>
	<c:choose>
	<c:when test="${not empty fields }">
		<table>
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>idDepartament</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="field" items="${fields }">
					<tr>
						<td>${field.id }</td>
						<td>${field.name }</td>
						<td>${field.idDepartament }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
	</c:choose>
	<a href="/" style="text-align: center;">Back to index </a>
</body>
</html>