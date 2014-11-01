<%@page import="com.ntu.auto.magazine.model.Package"%>
<%@page import="java.util.List"%>
<jsp:useBean id="pkg" class="com.ntu.auto.magazine.model.Package" scope="request"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
	 <link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
	 <title>Pacakge Management</title>
	 <style type="text/css">
		.blended_grid{
			 display : block;
			 width : 900px;
			 overflow : auto;
			 margin : 30px auto 0 auto;
		}
		.pageHeader{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 50px;
			 width : 900px;
		}
		.pageContent{
			 float : left;
			 clear : none;
			 height : 650px;
			 width : 900px;
			 background-color : BlanchedAlmond;
		}
		.pageFooter{
			 background-color : rgb(255, 255, 255);
			 float : left;
			 clear : none;
			 height : 25px;
			 width : 900px;
		}
		p{
		margin-left: 5px;
		}
	 </style>
	 </head>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("pkgId").value=<%=pkg.getPackageId() %>;
}
function validateForm(){
	var code = document.getElementById("code").value;
	code = code.replace(/\s/g, '');
	if(code == ''){
		alert('Code can not be empty');
		return false;
	}
	var name = document.getElementById("name").value;
	name = name.replace(/\s/g, '');
	if(code == ''){
		alert('Name can not be empty');
		return false;
	}
	var price = document.getElementById("price").value;
	price = price.replace(/\s/g, '');
	if(price == '' || price == '0.0'){
		alert('Please enter Price');
		return false;
	}
	return true;
}
</script>
<body bgcolor="LightBlue">
<div class="blended_grid">
<div class="topBanner">
<jsp:include page="/header.jsp"></jsp:include>
</div>
<div class="pageContent">
<div class="sectiontitle" align="center">
Package Management
</div>
<form action="adminPackage" method="post" onsubmit="return validateForm();">
<input type="hidden" id="pkgId" name="pkgId" />
<table id="inputform" align="center">
<%
	String msg = (String)request.getAttribute("msg");
	List<Package> pkgs = (List<Package>)request.getAttribute("pkgs");
	if(msg!=null){
	%>
	<tr>
	<td colspan="2" align="center" style="font-size: 15px;font-family: calibri;font-style: bold;color: green">
		<strong><%=msg %></strong>
	</td>
	</tr>
	<%} %>
	<tr>
		<td>Code*</td>
		<td><input type="text" id="code" name="code" value="<%=pkg.getCode() %>" /></td>
	</tr>
	<tr>
		<td>Name*</td>
		<td><input type="text" id="name" name="name" value="<%=pkg.getName() %>" /></td>
	</tr>
	<tr>
		<td>Price*</td>
		<td><input type="text" id="price" name="price" value="<%=pkg.getPrice() %>" /></td>
	</tr>
	<tr>
		<td>Notes</td>
		<td><textarea rows="5" cols="30" id="note" name="note"><%=pkg.getNote() %></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="Submit"/>
		<input type="reset" value="Reset"/>  
		</td>
	</tr>
</table>
</form>
<div class="sectiontitle">
Packages List
</div>
<table class="data" width="100%">
<thead>
	<tr>
		<th>Code</th>
		<th>Name</th>
		<th>Price(S$)</th>
		<th>Actions</th>
	</tr>
</thead> 
<%if(pkgs.size() > 0) {
	for(Package pk:pkgs){
		int i=1;
		%>
		<tr class="<%=(i%2==0)?"roweven":"rowodd" %>">
			<td><%=pk.getCode() %></td>
			<td><%=pk.getName() %></td>
			<td><%=pk.getPrice() %></td>
			<td>
				<table align="center" class="inputform" cellpadding="2px" cellspacing="2px">
					<tr>
						<td><a href="./adminPackage?action=edit&pkgId=<%=pk.getPackageId() %>"><img src="images/pencil.png" height="16" width="16" title="Edit Post"/></a></td>
						<td><a href="./adminPackage?action=delete&pkgId=<%=pk.getPackageId() %>"><img src="images/delete.png" height="16" width="16" title="Delete Post"/></a></td>
					</tr>
				</table>
			</td>
		</tr>
		<%
	i++;}
}
%>
</table>
</div>
<div class="pageFooter">
<jsp:include page="/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>