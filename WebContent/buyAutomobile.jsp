<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="styles/style.css" media="screen">
<link type="text/css" rel="stylesheet" href="styles/styleprint.css" media="print">
<title>Buy Automobile</title>
<style type="text/css">
.blended_grid{
			 display : block;
			 width : 900px;
			 overflow : auto;
			 margin : 30px auto 0 auto;
		}
.topBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 50px;
width : 900px;
}
.middleBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 100px;
width : 900px;
}
.leftBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 500px;
width : 900px;
}
.bottomBanner{
background-color : rgb(255, 255, 255);
float : left;
clear : none;
height : 100px;
width : 900px;
}
</style>
</head>
<body>
<div class="blended_grid">
<div class="topBanner">
<jsp:include page="/header.jsp"></jsp:include>
</div>
<div class="middleBanner">
<h1>Hello</h1>
</div>
<div class="leftBanner">
<h1>Hai</h1>
</div>
<div class="bottomBanner">
<jsp:include page="/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>