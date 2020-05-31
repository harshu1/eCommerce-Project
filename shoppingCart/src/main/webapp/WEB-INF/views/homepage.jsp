<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home1</title>
</head>
<body>
<form action="login" align ="center">
	Enter Username<input type="text" name="username"><br>
	Enter Password<input type="text" name="password">
	<input type="submit" value="Login">
</form>
<br>
<h2>Category</h2>
${category}
<br>


	<a href="addForm">Add Category </a><br>
	<a href="updateForm">Update Category</a><br>
	<a href="deleteForm">Delete Book</a> <br>category


</body>
</html>
