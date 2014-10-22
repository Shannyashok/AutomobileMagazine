<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
<link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
<title>Image Upload Utility</title>
</head>
<body>
<div class="sectiontitle" align="center">
Image Upload Utility
</div>
<form action="photoUploadServlet" method="post" enctype="multipart/form-data">
<table id="inputform" align="center">
<%
	String msg = (String)request.getAttribute("msg");
	if(msg!=null){
	%>
	<tr>
	<td colspan="2" align="center" style="font-size: 15px;font-family: calibri;font-style: bold;color: green">
		<strong><%=msg %></strong>
	</td>
	</tr>
	<%} %>
	<tr>
		<td colspan="2">Please select photos</td>
	</tr>
	<tr>
		<td>Photo 1:</td>
		<td><input type="file" name="photo1" id="photo1" /></td>
	</tr>
	<tr>
		<td>Photo 2:</td>
		<td><input type="file" name="photo2" id="photo2" /></td>
	</tr>
	<tr>
		<td>Photo 3:</td>
		<td><input type="file" name="photo3" id="photo3" /></td>
	</tr>
	<tr>
		<td>Photo 4:</td>
		<td><input type="file" name="photo4" id="photo4" /></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="Done" />
		<input type="button" value="Close" onclick="javascript:window.close();"></td>
	</tr>
</table>
</form>
</body>
</html>