<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
<link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
<title>Admin Login</title>
<style type="text/css">
	.login{
	margin-left: auto;
	margin-right: auto;
	margin-top:250px;
	margin-bottom:250px;
	}
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
		.menu{
	height:40px;
	margin:0 auto;
	font-size: 12px;
	text-transform:none;
	width:1000px;
	box-shadow: 0 3px 3px 3px #000;
	background-color:#eee;
	background-image: url(../images/bg.gif)!important;
	background-repeat: repeat-x;
	background-position: left top;
	border-radius:3px;
}
.menu a:hover{
border-bottom:none;
text-decoration:none;
background-color:#92CE6F;
font-size: 14px;
}
a{
text-decoration:none;
}
	 </style>
</head>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("user").focus();
	if(navigator.appName == 'Netscape'){
		document.getElementById("submit").innerHTML ='';
		document.getElementById("submit").innerHTML = '<input type="submit" value="Login" />';
	}
}
function doSubmit(action){
	document.getElementById("action").value=action;
	document.forms(0).submit();
}
</script>
</head>
<body bgcolor="LightBlue">
<div class="blended_grid">
<div class="pageHeader">
<table width="100%">
<tr>
<td width="50%"><img src="images/logo_ntu_car.png" alt="NTU car mart" width="446px" height="50px"/></td>
<td width="10%" align="center" class="menu"><a href="./homePage">Web Home</a></td>
<td width="40%" align="center" class="menu">Site Admin Login</td>
</tr>
</table>
</div>
<div class="pageContent">
<form action="adminLogin" method="post">
<input type="hidden" id="action" name="action">
<table border="0" cellpadding="1" cellspacing="2" width="264" align="center" class="login"  background='images/homebackground_image.gif'>
	<%
	String msg = (String)request.getAttribute("msg");
	if(msg!=null){
	%>
	<tr>
	<td colspan="2" align="center" style="font-size: 15px;font-family: calibri;font-style: bold;color: red">
		<strong><%=msg %></strong>
	</td>
	</tr>
	<%} %>
	<tr>
		<td width="60%"><strong>User Id</strong></td>
		<td width="40%"></td>
	</tr>
	<tr>
		<td colspan="2" valign="top"><input type="text" id="user" name="user" size="30" tabindex="0"></td>
	</tr>
	<tr>
		<td width="60%"><strong>Password</strong></td>
		<td width="40%"></td>
	</tr>
	<tr>
		<td colspan="2" valign="top"><input type="password" id="pwd" name="pwd" size="30"></td>
	</tr>
	<tr>
		<td width="60%" valign="center" align="left">&nbsp;</td>
		<td width="40%" valign="bottom" align="right">
		<div id="submit">
		<a href="#" onclick="doSubmit('login');"><img alt="Login" src="images/login_dk_regular.gif" onmouseover="this.src='images/login_dk_mouse_over.gif'" onmouseout="this.src='images/login_dk_regular.gif'"></a>
		</div>
		</td>
	</tr>
</table>
</form>
</div>
<div class="pageFooter">
<jsp:include page="/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>