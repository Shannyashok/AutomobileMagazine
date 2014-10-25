<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="LightBlue">
<form action="testFileUpload" method="post" enctype="multipart/form-data">
<input type="file" id="photo" name="photo"/>
<input type="file" id="photo1" name="photo1"/>
<input type="submit" />
</form>
<%
String dir = "C:\\AutoImages\\6";
if(dir != null){
File file = new File(dir);
File [] list = file.listFiles();
for(File fi:file.listFiles()){
	out.write(fi.getName());
	out.write(fi.getAbsolutePath());
	out.write(fi.getCanonicalPath());
	out.write(fi.getPath());
}
}
%>
<table>
<tr>
<td><%=request.getServletContext().getRealPath("/") %></td>
</tr>
<tr>
<td><%=request.getServletContext().getRealPath("/NTUAutoMag") %></td>
</tr>
<tr>
<td><%=application.getContextPath() %></td>
</tr>
<tr>
<td><%=application.getRealPath("/") %></td>
</tr>
</table>
</body>
</html>