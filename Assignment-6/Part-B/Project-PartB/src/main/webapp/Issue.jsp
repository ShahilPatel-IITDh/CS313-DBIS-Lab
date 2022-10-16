<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issue Form</title>
</head>
<body>
<h1>Issue Details </h1>
<form action="IssueServlet" method="post">
			<table style="with: 50%">
				<tr>
					<td>Student Id</td>
					<td><input type="text" name="student_id" /></td>
				</tr>
				<tr>
					<td>Book Id</td>
					<td><input type="text" name="book_id" /></td>
				</tr>
				<tr>
					<td>Issue Date</td>
					<td><input type="text" name="issue_date" /></td>
				</tr>
			</table>
			<input type="submit" value="Issue" /></form>
</body>
</html>