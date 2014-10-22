<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
//InputStream photo = (InputStream)request.getAttribute("photo");
String photoStr = request.getParameter("photo");

//byte[] bytes = IOUtils.toByteArray(photoStr); 
byte[] bytes = Base64.decodeBase64(request.getParameter("photo"));
System.out.println("REQUEST::::" +request.getParameter("photo"));
if(bytes != null){
	try{
	response.setContentType("image/jpg");
	response.setContentLength(bytes.length);
    response.getOutputStream().write(bytes);
    response.getOutputStream().flush();
    response.getOutputStream().close();
    //photo.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
</body>
</html>