<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Addition Form</title>
</head>
<body>
<h1>Student Details </h1>
<form action="StudentServlet" method="post">
			<table style="with: 50%">
				<tr>
					<td>Student Id</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td>Student Name</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>Student Department</td>
					<td><input type="text" name="dept_name" /></td>
				</tr>
					<tr>
					<td>Student Total Credits</td>
					<td><input type="text" name="tot_cred" /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" /></form>
</body>
</html>
